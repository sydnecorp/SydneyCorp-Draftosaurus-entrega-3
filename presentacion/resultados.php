<?php
session_start();
require_once __DIR__ . '/../Datos/conexion.php';


if (!isset($_SESSION["partida_id"])) { header("Location: index.php"); exit; }
$partida_id = $_SESSION["partida_id"];

/* Traer ranking */
$sql = "SELECT u.nombre, j.puntos_totales
        FROM jugadores j
        JOIN usuarios u ON u.usuario_id = j.usuario_id
        WHERE j.partida_id=?
        ORDER BY j.puntos_totales DESC, u.nombre ASC";
$stmt = $conn->prepare($sql);
$stmt->bind_param("i", $partida_id);
$stmt->execute();
$res = $stmt->get_result();

$rows = [];
while ($r = $res->fetch_assoc()) { $rows[] = $r; }
$stmt->close();
?>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8" />
  <title>Resultados</title>
  <link rel="icon" href="imagenes/logo de la empresa.png" type="image/png" />
  <link rel="stylesheet" href="css/resultados.css" />
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
  <base href="/draftosaurus/">
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <section class="container">
      <a class="navbar-brand" href="index.php">Draftosaurus</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#menu">
        <span class="navbar-toggler-icon"></span>
      </button>
      <article class="collapse navbar-collapse" id="menu">
        <ul class="navbar-nav ms-auto">
          <li class="nav-item"><a class="nav-link" href="index.php">Inicio</a></li>
          <li class="nav-item"><a class="nav-link" href="presentacion/modo_juego.php">Crear Partida</a></li>
          <li class="nav-item"><a class="nav-link active" href="presentacion/resultados.php">Resultados</a></li>
          <li class="nav-item"><a class="nav-link" href="presentacion/login.php">Login</a></li>
          <li class="nav-item"><a class="nav-link" href="presentacion/registro.php">Registro</a></li>
        </ul>
      </article>
    </section>
  </nav>

<main class="container my-5">
  <h1 class="mb-4">Resultados de la Partida</h1>
  <?php if (empty($rows)): ?>
    <div class="alert alert-info">Todavía no hay jugadas registradas.</div>
  <?php else: ?>
    <div class="table-responsive">
      <table class="table table-striped table-dark">
        <thead>
          <tr>
            <th>#</th>
            <th>Jugador</th>
            <th>Puntos</th>
          </tr>
        </thead>
        <tbody>
          <?php $pos=1; foreach ($rows as $r): ?>
          <tr>
            <td><?php echo $pos++; ?></td>
            <td><?php echo htmlspecialchars($r["nombre"]); ?></td>
            <td><?php echo (int)$r["puntos_totales"]; ?></td>
          </tr>
          <?php endforeach; ?>
        </tbody>
      </table>
    </div>
  <?php endif; ?>

  <a href="index.php" class="btn btn-secondary mt-3">Volver al inicio</a>
</main>

<footer class="bg-dark text-white text-center py-3 mt-auto">
  <small>&copy; 2025 SydneyCorp - UTU Informática</small>
</footer>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
