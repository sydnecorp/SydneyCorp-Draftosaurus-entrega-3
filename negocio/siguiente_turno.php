<?php
session_start();
require_once __DIR__ . '/../Datos/conexion.php';


if (!isset($_SESSION["jugadores_ids"]) || !isset($_SESSION["turno_idx"]) || !isset($_SESSION["partida_id"])) {
    http_response_code(400);
    echo "Sesión inválida";
    exit;
}

$partida_id = $_SESSION["partida_id"];
$jugadores  = $_SESSION["jugadores_ids"];
$idx        = $_SESSION["turno_idx"];

// avanzar turno
$idx++;

// si terminó la ronda, rotar manos
if ($idx >= count($jugadores)) {
    $idx = 0;
    include "rotar_manos.php";
}

// guardar nuevo índice
$_SESSION["turno_idx"] = $idx;

// ✅ ¿quedan cartas en manos?
$cnt = 0;
$stmt = $conn->prepare("SELECT COUNT(*) AS c FROM manos WHERE partida_id=?");
$stmt->bind_param("i", $partida_id);
$stmt->execute();
$res = $stmt->get_result();
if ($row = $res->fetch_assoc()) { $cnt = (int)$row['c']; }
$stmt->close();

// si no quedan cartas, finalizar partida
if ($cnt === 0) {
    $stmt = $conn->prepare("UPDATE partidas SET estado='finalizada' WHERE partida_id=?");
    $stmt->bind_param("i", $partida_id);
    $stmt->execute();
    $stmt->close();
    echo "finalizada"; // le avisamos al frontend si querés usarlo
    exit;
}

echo "ok";
exit;
?>

