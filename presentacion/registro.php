<?php
session_start();
require_once __DIR__ . '/../Datos/conexion.php';


$msg = "";
if ($_SERVER["REQUEST_METHOD"] === "POST") {
  $nombre = trim($_POST["nombre"] ?? "");
  $email  = trim($_POST["email"] ?? "");
  $pass   = $_POST["contrasena"] ?? "";

  // validación backend
  if ($nombre === "" || $email === "" || $pass === "") {
    $msg = "Completá todos los campos.";
  } elseif (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
    $msg = "Email inválido.";
  } else {
    // verificar email existente 
    $stmt = $conn->prepare("SELECT 1 FROM usuarios WHERE email=? LIMIT 1");
    $stmt->bind_param("s", $email);
    $stmt->execute();
    $existe = $stmt->get_result()->num_rows === 1;
    $stmt->close();

    if ($existe) {
      $msg = "Ese email ya está registrado.";
    } else {
      // insertar 
      $stmt = $conn->prepare("INSERT INTO usuarios (nombre, email, contrasena) VALUES (?, ?, ?)");
      $stmt->bind_param("sss", $nombre, $email, $pass); 
      if ($stmt->execute()) {
        $msg = "Registro OK. Ahora iniciá sesión.";
      } else {
        $msg = "Error al registrar: " . $conn->error;
      }
      $stmt->close();
    }
  }
}
?>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title>Registro</title>
  <link rel="icon" href="imagenes/logo de la empresa.png" type="image/png" />
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="css/registro.css">
  <link rel="icon" href="favicon.png" type="image/png" />
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
          <li class="nav-item"><a class="nav-link " href="index.php">Inicio</a></li>
          <li class="nav-item"><a class="nav-link" href="presentacion/modo_juego.php">Crear Partida</a></li>
          <li class="nav-item"><a class="nav-link" href="presentacion/resultados.php">Resultados</a></li>
          <li class="nav-item"><a class="nav-link" href="presentacion/login.php">Login</a></li>
          <li class="nav-item"><a class="nav-link active" href="presentacion/registro.php">Registro</a></li>
        </ul>
      </article>
  </section>
</nav>

<main>
  <div class="card">
    <h2>Registro</h2>
    <?php if($msg !== ""): ?>
      <div class="alert"><?php echo htmlspecialchars($msg); ?></div>
    <?php endif; ?>
    <form method="POST" action="presentacion/registro.php" novalidate>
      <input type="text" name="nombre" placeholder="Nombre" required>
      <input type="email" name="email" placeholder="Email" required>
      <input type="password" name="contrasena" placeholder="Contraseña" required>
      <button type="submit">Registrarse</button>
    </form>
    <p><a href="presentacion/login.php">Ya tengo cuenta</a></p>
  </div>
</main>

<footer class="bg-dark text-white text-center py-3 mt-auto">
  <small>&copy; 2025 SydneyCorp - UTU Informática</small>
</footer>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
