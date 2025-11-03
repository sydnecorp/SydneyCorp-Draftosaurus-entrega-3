// presentacion/js/tablero.js

const { IMG_MAP, jugadas } = window.INIT || { IMG_MAP: {}, jugadas: [] };

// --- Caras del dado ---
const CARAS = [
  { id: "trex",   img: "imagenes/trex.png",   nombre: "T-Rex" },
  { id: "huella", img: "imagenes/huella.png", nombre: "Huella (vacío)" },
  { id: "bosque", img: "imagenes/bosque.png", nombre: "Bosque" },
  { id: "roca",   img: "imagenes/piedra.png", nombre: "Roca" },
  { id: "banos",  img: "imagenes/baños.png",  nombre: "Derecha del río" },
  { id: "taza",   img: "imagenes/taza.png",   nombre: "Izquierda del río" }
];

let currentRule;
let turnoActivo = false;

// --- Dado ---
function girarDado() {
  const dado = document.getElementById("dado-img");
  dado.classList.add("girando");
  setTimeout(() => {
    const i = Math.floor(Math.random() * CARAS.length);
    currentRule = CARAS[i];
    dado.src = currentRule.img;
    dado.alt = "Dado: " + currentRule.nombre;
    dado.classList.remove("girando");
    turnoActivo = true;
    alert("Tiraste el dado. Ahora colocá un dinosaurio.");
  }, 300);
}
window.girarDado = girarDado;

// --- Helpers ---
const normalize = (s) => s.toLowerCase().normalize("NFD").replace(/[\u0300-\u036f]/g, "");
function dinosEn(recinto) { return recinto.querySelectorAll("img.dino").length; }
function hayEspacio(recinto) {
  const cap = parseInt(recinto.dataset.capacity || "1", 10);
  return dinosEn(recinto) < cap;
}

function puedeColocar(recinto, regla) {
  const zone = recinto.dataset.zone;
  const side = recinto.dataset.side;
  const hasTrex = recinto.dataset.hasTrex === "true";
  const nz = normalize(zone);

  if (regla?.id === "trex")   return !hasTrex && hayEspacio(recinto);
  if (regla?.id === "huella") return hayEspacio(recinto);
  if (regla?.id === "bosque") return nz.includes("bosque") && hayEspacio(recinto);
  if (regla?.id === "roca")   return nz.includes("roca")   && hayEspacio(recinto);
  if (regla?.id === "banos")  return side === "der"        && hayEspacio(recinto);
  if (regla?.id === "taza")   return side === "izq"        && hayEspacio(recinto);
  if (regla?.id === "rio")    return nz === "rio"          && hayEspacio(recinto);
  return hayEspacio(recinto);
}

// --- Guardar jugada ---
async function guardarJugada(recinto, dino) {
  try {
    const params = new URLSearchParams();
    params.append("recinto", recinto.dataset.zone);
    params.append("dino", dino.alt);

    const r1 = await fetch("negocio/guardar_jugada.php", {
      method: "POST",
      headers: { "Content-Type": "application/x-www-form-urlencoded" },
      body: params.toString()
    });
    if (!r1.ok) throw new Error("Error al guardar jugada.");

    const r2 = await fetch("negocio/siguiente_turno.php");
    if (!r2.ok) throw new Error("Error al avanzar turno.");

    turnoActivo = false;
    dino.remove();
    alert("Turno terminado. Ahora juega el siguiente jugador.");

    const jugadorTurno = document.querySelector("h4.text-warning");
    if (jugadorTurno) jugadorTurno.textContent = "Actualizando turno...";
    setTimeout(() => (window.location.href = "presentacion/tablero.php"), 800);
  } catch (err) {
    console.error(err);
    alert("Ocurrió un problema al guardar la jugada.");
  }
}

// --- Inicialización ---
document.addEventListener("DOMContentLoaded", () => {
  jugadas.forEach(j => {
    const recinto = document.querySelector(`[data-zone='${CSS.escape(j.recinto_nombre)}']`);
    if (recinto) {
      const img = document.createElement("img");
      const file = IMG_MAP[j.dino_nombre] || (j.dino_nombre.toLowerCase() + ".png");
      img.src = "imagenes/" + file;
      img.className = "dino m-1";
      recinto.appendChild(img);
    }
  });

  const recintos = document.querySelectorAll(".recinto");
  recintos.forEach(r => {
    r.addEventListener("dragover", e => e.preventDefault());
    r.addEventListener("drop", e => {
      e.preventDefault();
      if (!turnoActivo) {
        alert("Ya colocaste un dinosaurio. Tirar el dado para el siguiente turno.");
        return;
      }
      if (!puedeColocar(r, currentRule)) {
        alert("No podés poner acá (regla o capacidad).");
        return;
      }
      const dino = document.querySelector(".dragging");
      if (dino) {
        r.appendChild(dino);
        dino.classList.remove("dragging");
        guardarJugada(r, dino);
      }
    });
  });

  const dinos = document.querySelectorAll(".dino");
  dinos.forEach(dino => {
    dino.addEventListener("dragstart", () => dino.classList.add("dragging"));
    dino.addEventListener("dragend",   () => dino.classList.remove("dragging"));
  });
});
