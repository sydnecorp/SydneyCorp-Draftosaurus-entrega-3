🦕 Draftosaurus – Entrega 3

Este proyecto corresponde a la tercera entrega de Programación Full Stack del Bachillerato Tecnológico en Informática (UTU, 2025).
El equipo SydneyCorp desarrolló la versión digital del juego de mesa Draftosaurus, implementando una aplicación web completamente funcional con base de datos, turnos automáticos, puntajes y arquitectura en capas.

👥 Integrantes (SydneyCorp)

Juan Fantoni – Coordinador

Lázaro Fernández – Subcoordinador

Franco Di Pietro – Integrante 1

Lucía Ramírez – Integrante 2

⚙️ Tecnologías utilizadas

Frontend: HTML5, CSS3, Bootstrap 5, JavaScript (DOM, eventos, Fetch API)

Backend: PHP (estructurado en capas: Datos, Negocio, Presentación)

Base de datos: MySQL (gestión con phpMyAdmin, normalización hasta 3FN)

Entorno local: XAMPP (Apache + PHP + MySQL)

Control de versiones: Git y GitHub

Modelado: draw.io (DER y diagramas de clases)

🚀 Funcionalidades implementadas

Login y Registro de usuarios: manejo de sesiones con PHP y MySQL.

Creación de partidas: modo solitario o multijugador (2 a 5 jugadores).

Bolsa de dinosaurios: reparto aleatorio y rotación de manos.

Tablero digital interactivo: con drag & drop y restricciones según el dado.

Sistema de puntos: suma automática según recinto y tipo de dinosaurio.

Turnos automáticos: control del flujo de juego y rotación entre jugadores.

Diseño responsive: todas las pantallas adaptadas a dispositivos móviles.

Separación por capas:

Datos: conexión y scripts SQL.

Negocio: reglas del juego y lógica de servidor.

Presentación: interfaz, CSS y JS (tablero.js separado).

🛠️ Cómo instalar y ejecutar

Instalar XAMPP.

Clonar este repositorio dentro de la carpeta htdocs/:

git clone https://github.com/sydnecorp/SydneyCorp-Draftosaurus-entrega-3.git

despues de clonar cambiar el nombre de la carpeta a draftosaurus


Importar la base de datos en phpMyAdmin usando el archivo:

Datos/draftosaurus.sql


Encender Apache y MySQL desde XAMPP.

Abrir el navegador en:

http://localhost/draftosaurus

🧠 Nota final

Este proyecto integra todos los conceptos vistos en clase:

Manipulación del DOM y eventos (JS)

Peticiones HTTP y Fetch API

Programación en PHP con sesiones

CRUD y consultas SQL

Diseño responsive y navegación consistente

Estructura modular en capas

Desarrollado con fines educativos por el equipo SydneyCorp, UTU Informática 2025.
