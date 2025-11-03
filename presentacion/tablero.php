<?php
session_start();
require_once __DIR__ . '/../Datos/conexion.php';

// si no hay partida activa, volver al inicio
if (!isset($_SESSION["partida_id"])) { header("Location: index.php"); exit; }

$partida_id = $_SESSION["partida_id"];

// si no hay jugadores en sesión, traer de la BD
if (!isset($_SESSION["jugadores_ids"]) || !is_array($_SESSION["jugadores_ids"]) || count($_SESSION["jugadores_ids"]) === 0) {
  $_SESSION["jugadores_ids"] = [];
  $stmt = $conn->prepare("SELECT usuario_id FROM jugadores WHERE partida_id=? ORDER BY usuario_id");
  $stmt->bind_param("i", $partida_id);
  $stmt->execute();
  $res = $stmt->get_result();
  while ($r = $res->fetch_assoc()) { $_SESSION["jugadores_ids"][] = $r["usuario_id"]; }
  $stmt->close();
  $_SESSION["turno_idx"] = 0;
}

$jugadores_ids = $_SESSION["jugadores_ids"];
$turno_idx     = $_SESSION["turno_idx"] ?? 0;

// jugador actual
$jugador_id = $jugadores_ids[$turno_idx] ?? $jugadores_ids[0];

// nombre del jugador
$stmt = $conn->prepare("SELECT nombre FROM usuarios WHERE usuario_id=?");
$stmt->bind_param("i", $jugador_id);
$stmt->execute();
$res = $stmt->get_result();
$nombre_jugador = ($row = $res->fetch_assoc()) ? $row["nombre"] : ("Jugador ".($turno_idx+1));
$stmt->close();

// jugadas previas del jugador
$jugadas = [];
$sql = "SELECT recinto_nombre, dino_nombre FROM jugadas WHERE partida_id=? AND usuario_id=?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("ii", $partida_id, $jugador_id);
$stmt->execute();
$res = $stmt->get_result();
while ($row = $res->fetch_assoc()) { $jugadas[] = $row; }
$stmt->close();

// dinos en mano del jugador
$dinos_mano = [];
$sql = "SELECT dino_nombre FROM manos WHERE partida_id=? AND usuario_id=?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("ii", $partida_id, $jugador_id);
$stmt->execute();
$res = $stmt->get_result();
while ($row = $res->fetch_assoc()) { $dinos_mano[] = $row['dino_nombre']; }
$stmt->close();

// imágenes x dino
$IMG_MAP = [
  "T-Rex"        => "rojo.png",
  "Triceratops"  => "verde.png",
  "Velociraptor" => "naranja.png",
  "Parasaurio"   => "amarillo.png",
  "Diplodocus"   => "azul.png",
  "Estegosaurio" => "rosa.png"
];
?>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Draftosaurus - Tablero</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
  <link rel="stylesheet" href="css/tablero.css" />
  <link rel="icon" href="imagenes/logo de la empresa.png" type="image/png" />
  <base href="/draftosaurus/">
</head>
<body>

<header>
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <section class="container">
      <a class="navbar-brand" href="index.php">Draftosaurus</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#menu">
        <span class="navbar-toggler-icon"></span>
      </button>
      <article class="collapse navbar-collapse" id="menu">
        <ul class="navbar-nav ms-auto">
          <li class="nav-item"><a class="nav-link active" href="index.php">Inicio</a></li>
          <li class="nav-item"><a class="nav-link" href="presentacion/modo_juego.php">Crear Partida</a></li>
          <li class="nav-item"><a class="nav-link" href="presentacion/resultados.php">Resultados</a></li>
          <li class="nav-item"><a class="nav-link" href="presentacion/login.php">Login</a></li>
          <li class="nav-item"><a class="nav-link" href="presentacion/registro.php">Registro</a></li>
        </ul>
      </article>
    </section>
  </nav>
</header>

<main class="container my-5">
  <h1 class="text-white text-center mb-2">Tablero del Parque</h1>
  <h4 class="text-warning text-center mb-4">
    Turno de: <?php echo htmlspecialchars($nombre_jugador); ?> (Jugador <?php echo $turno_idx+1; ?>)
  </h4>

  <div class="row">
    <!-- tablero -->
    <div class="col-md-8 text-center">
      <section class="tablero-wrap">
        <img src="imagenes/tablero.jpg" alt="Tablero de Draftosaurus" class="img img-fluid rounded shadow" />

        <!-- recintos con capacidad -->
        <div class="recinto" style="left:5%; top:10%; width:32%; height:20%;" data-zone="Bosque Izq 1" data-side="izq" data-has-trex="false" data-capacity="10"></div>
        <div class="recinto" style="left:5%; top:37%; width:25%; height:20%;" data-zone="Bosque Izq 2" data-side="izq" data-has-trex="false" data-capacity="10"></div>
        <div class="recinto" style="left:10%; top:60%; width:25%; height:23%;" data-zone="Roca Izq" data-side="izq" data-has-trex="false" data-capacity="10"></div>
        <div class="recinto" style="left:65%; top:11%; width:15%; height:15%;" data-zone="Bosque Der T-Rex" data-side="der" data-has-trex="true" data-capacity="10"></div>
        <div class="recinto" style="left:60%; top:35%; width:35%; height:20%;" data-zone="Roca Der 1" data-side="der" data-has-trex="false" data-capacity="10"></div>
        <div class="recinto" style="left:70%; top:60%; width:25%; height:20%;" data-zone="Roca Der 2" data-side="der" data-has-trex="false" data-capacity="10"></div>
        <div class="recinto" style="left:40%; top:5%; width:20%; height:90%;" data-zone="Río" data-side="centro" data-has-trex="false" data-capacity="10"></div>
      </section>

      <!-- dado -->
      <section class="mt-4">
        <h2 class="text-white">Dado</h2>
        <img id="dado-img" src="imagenes/huella.png" alt="Dado" class="img-dado" />
        <br />
        <button class="btn btn-dark mt-3" onclick="girarDado()">Girar Dado</button>
      </section>
    </div>

    <!-- dinos en mano -->
    <div class="col-md-4">
      <section class="mt-3 text-white text-center">
        <h5>Dinosaurios disponibles</h5>
        <article class="d-flex flex-wrap justify-content-center gap-2">
          <?php foreach ($dinos_mano as $d): 
                $src = isset($IMG_MAP[$d]) ? $IMG_MAP[$d] : (strtolower($d).".png"); ?>
            <img src="imagenes/<?php echo $src; ?>"
                 alt="<?php echo htmlspecialchars($d); ?>"
                 class="dino m-2"
                 draggable="true" />
          <?php endforeach; ?>
        </article>
      </section>
    </div>
  </div>

  <div class="mt-4">
    <button class="btn btn-primary" onclick="location.href='index.php'">Volver al Inicio</button>
  </div>
</main>

<footer class="bg-dark text-white text-center py-3 mt-auto">
  <small>&copy; 2025 SydneyCorp - UTU Informática</small>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
  window.INIT = {
    IMG_MAP: <?php echo json_encode($IMG_MAP); ?>,
    jugadas: <?php echo json_encode($jugadas); ?>
  };
</script>
<script src="presentacion/js/tablero.js"></script>

</body>
</html>
