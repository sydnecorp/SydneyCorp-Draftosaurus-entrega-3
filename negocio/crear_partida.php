<?php
session_start();
require_once __DIR__ . '/../Datos/conexion.php';


// validar origen y cantidad
if ($_SERVER["REQUEST_METHOD"] !== "POST" || !isset($_POST["cantidad"])) {
    echo "<h2>Error: Debes iniciar la partida desde el formulario.</h2>";
    echo "<a href='index.php'>Volver</a>";
    exit;
}
$cantidad = intval($_POST["cantidad"]);
if ($cantidad < 1 || $cantidad > 5) {
    echo "<h2>Error: cantidad de jugadores inválida (1 a 5).</h2>";
    echo "<a href='index.php'>Volver</a>";
    exit;
}

// crear partida (sin fk_creador_id en la BD)
$stmt = $conn->prepare("INSERT INTO partidas (cantidad_jugadores) VALUES (?)");
$stmt->bind_param("i", $cantidad);
if (!$stmt->execute()) { die("Error al crear partida: " . $stmt->error); }
$partida_id = $stmt->insert_id;
$stmt->close();

// preparar sesión
$_SESSION["partida_id"]   = $partida_id;
$_SESSION["cantidad"]     = $cantidad;
$_SESSION["turno_idx"]    = 0;
$_SESSION["jugadores_ids"] = [];

$jugadores = [];

// si hay usuario logueado, lo vinculamos como Jugador 1
if (isset($_SESSION["usuario_id"]) && is_numeric($_SESSION["usuario_id"])) {
    $hostId = (int)$_SESSION["usuario_id"];

    // agregar a jugadores (no creamos usuario nuevo)
    $stmt = $conn->prepare("INSERT INTO jugadores (partida_id, usuario_id) VALUES (?, ?)");
    $stmt->bind_param("ii", $partida_id, $hostId);
    if (!$stmt->execute()) { die("Error al insertar host en partida: " . $stmt->error); }
    $stmt->close();

    $jugadores[] = $hostId;
    $desde = 2; // si hay host, faltan Jugador2..JugadorN
} else {
    $desde = 1; // si no hay login, creamos todos los jugadores temporales
}

// crear jugadores temporales que falten
for ($i = $desde; $i <= $cantidad; $i++) {
    $nombre = "Jugador$i";
    $email  = "jugador{$i}_partida{$partida_id}@draftosaurus.com"; // único por partida
    $pass   = "1234";

    // crear usuario temporal
    $stmt = $conn->prepare("INSERT INTO usuarios (nombre, email, contrasena) VALUES (?, ?, ?)");
    $stmt->bind_param("sss", $nombre, $email, $pass);
    if (!$stmt->execute()) { die("Error al insertar usuario: " . $stmt->error); }
    $usuario_id = $stmt->insert_id;
    $stmt->close();

    $jugadores[] = $usuario_id;

    // vincular a la partida
    $stmt = $conn->prepare("INSERT INTO jugadores (partida_id, usuario_id) VALUES (?, ?)");
    $stmt->bind_param("ii", $partida_id, $usuario_id);
    if (!$stmt->execute()) { die("Error al insertar jugador en partida: " . $stmt->error); }
    $stmt->close();
}

$_SESSION["jugadores_ids"] = $jugadores;

// armar bolsa de dinosaurios (10 de cada tipo)
$bolsa = [];
$tipos = ["T-Rex", "Triceratops", "Velociraptor", "Parasaurio", "Diplodocus", "Estegosaurio"];
foreach ($tipos as $t) {
    for ($i = 0; $i < 10; $i++) { $bolsa[] = $t; }
}
shuffle($bolsa);

// repartir 6 dinos a cada jugador
foreach ($jugadores as $jugador_id) {
    for ($j = 0; $j < 6; $j++) {
        $dino = array_pop($bolsa);
        $stmt = $conn->prepare("INSERT INTO manos (partida_id, usuario_id, dino_nombre) VALUES (?, ?, ?)");
        $stmt->bind_param("iis", $partida_id, $jugador_id, $dino);
        if (!$stmt->execute()) { die("Error en INSERT manos: " . $stmt->error); }
        $stmt->close();
    }
}

// ir al tablero
// ir al tablero
header("Location: /draftosaurus/presentacion/tablero.php");
exit;

exit;
