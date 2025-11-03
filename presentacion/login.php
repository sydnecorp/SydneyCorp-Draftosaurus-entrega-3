<?php
session_start();
require_once __DIR__ . '/../Datos/conexion.php';

$msg = "";
if ($_SERVER["REQUEST_METHOD"] === "POST") {
  $email = trim($_POST["email"] ?? "");
  $pass  = $_POST["contrasena"] ?? "";

  // validación backend
  if ($email === "" || $pass === "") {
    $msg = "Completá todos los campos.";
  } elseif (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
    $msg = "Email inválido.";
  } else {
    // consulta preparada
    $stmt = $conn->prepare("SELECT usuario_id, nombre, contrasena FROM usuarios WHERE email=? LIMIT 1");
    $stmt->bind_param("s", $email);
    $stmt->execute();
    $res = $stmt->get_result();

    if ($res->num_rows === 1) {
      $u = $res->fetch_assoc();
      if ($pass === $u["contrasena"]) { // sin hash (simple)
        $_SESSION["usuario_id"] = (int)$u["usuario_id"];
        $_SESSION["nombre"]     = $u["nombre"];

        // 🔹 Redirección absoluta al index principal
        header("Location: /draftosaurus/index.php");
        exit;
      } else {
        $msg = "Contraseña incorrecta.";
      }
    } else {
      $msg = "Usuario no encontrado.";
    }
    $stmt->close();
  }
}
?>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title>Login</title>
  <link rel="icon" href="/draftosaurus/imagenes/logo de la empresa.png" type="image/png" />
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="/draftosaurus/presentacion/css/login.css">
  <base href="/draftosaurus/">
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <section class="container">
    <a class="navbar-brand" href="/draftosaurus/index.php">Draftosaurus</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#menu">
      <span class="navbar-toggler-icon"></span>
    </button>
    <article class="collapse navbar-collapse" id="menu">
        <ul class="navbar-nav ms-auto">
          <li class="nav-item"><a class="nav-link" href="/draftosaurus/index.php">Inicio</a></li>
          <li class="nav-item"><a class="nav-link" href="/draftosaurus/presentacion/modo_juego.php">Crear Partida</a></li>
          <li class="nav-item"><a class="nav-link" href="/draftosaurus/presentacion/resultados.php">Resultados</a></li>
          <li class="nav-item"><a class="nav-link active" href="/draftosaurus/presentacion/login.php">Login</a></li>
          <li class="nav-item"><a class="nav-link" href="/draftosaurus/presentacion/registro.php">Registro</a></li>
        </ul>
      </article>
  </section>
</nav>

<main>
  <div class="card">
    <h2>Iniciar Sesión</h2>
    <?php if($msg !== ""): ?>
      <div class="alert"><?php echo htmlspecialchars($msg); ?></div>
    <?php endif; ?>
    <form method="POST" action="/draftosaurus/presentacion/login.php" novalidate>
      <input type="email" name="email" placeholder="Email" required>
      <input type="password" name="contrasena" placeholder="Contraseña" required>
      <button type="submit">Entrar</button>
    </form>
    <p><a href="/draftosaurus/presentacion/registro.php">Crear cuenta</a></p>
  </div>
</main>

<footer class="bg-dark text-white text-center py-3 mt-auto">
  <small>&copy; 2025 SydneyCorp - UTU Informática</small>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
