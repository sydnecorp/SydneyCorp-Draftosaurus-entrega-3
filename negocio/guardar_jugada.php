<?php
session_start();
require_once __DIR__ . '/../Datos/conexion.php';


if (!isset($_SESSION["partida_id"]) || !isset($_SESSION["jugadores_ids"]) || !isset($_SESSION["turno_idx"])) {
    die("Error: partida no iniciada.");
}

$partida_id = $_SESSION["partida_id"];
$jugadores  = $_SESSION["jugadores_ids"];
$turno_idx  = $_SESSION["turno_idx"];
$jugador_id = $jugadores[$turno_idx];

$recinto = $_POST["recinto"] ?? "";
$dino    = $_POST["dino"] ?? "";

if ($recinto === "" || $dino === "") {
    die("Error: datos incompletos.");
}

/* 1) Guardar la jugada */
$stmt = $conn->prepare("INSERT INTO jugadas (partida_id, usuario_id, recinto_nombre, dino_nombre, turno) 
                        VALUES (?, ?, ?, ?, ?)");
$turno = $turno_idx + 1;
$stmt->bind_param("iissi", $partida_id, $jugador_id, $recinto, $dino, $turno);
if (!$stmt->execute()) {
    die("Error al guardar jugada: " . $stmt->error);
}
$stmt->close();

/* 2) Sacar el dinosaurio de la mano actual */
$stmt = $conn->prepare("DELETE FROM manos 
                        WHERE partida_id=? AND usuario_id=? AND dino_nombre=?
                        LIMIT 1");
$stmt->bind_param("iis", $partida_id, $jugador_id, $dino);
if (!$stmt->execute()) {
    die("Error al actualizar mano: " . $stmt->error);
}
$stmt->close();

/* 3) Calcular puntos: recinto.puntos_base + dinosaurios.puntos */
$puntos_base = 0;
$puntos_dino = 0;

$stmt = $conn->prepare("SELECT puntos_base FROM recintos WHERE nombre=? LIMIT 1");
$stmt->bind_param("s", $recinto);
$stmt->execute();
$res = $stmt->get_result();
if ($row = $res->fetch_assoc()) { $puntos_base = (int)$row["puntos_base"]; }
$stmt->close();

$stmt = $conn->prepare("SELECT puntos FROM dinosaurios WHERE nombre=? LIMIT 1");
$stmt->bind_param("s", $dino);
$stmt->execute();
$res = $stmt->get_result();
if ($row = $res->fetch_assoc()) { $puntos_dino = (int)$row["puntos"]; }
$stmt->close();

$puntos = $puntos_base + $puntos_dino;

/* 4) Acumular en jugadores.puntos_totales */
$stmt = $conn->prepare("UPDATE jugadores 
                        SET puntos_totales = COALESCE(puntos_totales,0) + ?
                        WHERE partida_id=? AND usuario_id=?");
$stmt->bind_param("iii", $puntos, $partida_id, $jugador_id);
if (!$stmt->execute()) {
    die("Error al sumar puntos: " . $stmt->error);
}
$stmt->close();

echo "ok";
