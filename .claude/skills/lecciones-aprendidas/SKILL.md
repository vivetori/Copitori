---
name: lecciones-aprendidas
description: Actívala al cumplirse un hito o al cerrar un proyecto (/cierre), al terminar una fase, o cuando el usuario diga "qué aprendimos", "qué haríamos distinto", "no quiero que esto vuelva a pasar", "esto salió muy bien, cómo lo repetimos". Captura lo que salió bien y lo que salió mal y lo convierte en regla, plantilla o checklist. Para un fracaso con costo real usa además postmortem.
---

# Lecciones aprendidas

Un proyecto que termina sin lecciones escritas se repite entero: los mismos atrasos, los mismos proveedores, las mismas sorpresas. Y lo que salió bien se pierde igual que lo que salió mal, porque nadie anotó por qué funcionó.

Destino: [lecciones_aprendidas.md](../../../08_conocimiento/plantillas/proyecto/lecciones_aprendidas.md) del proyecto. Cuándo y qué lleva cada lección: [SOP de gestión de proyectos §8](../../../08_conocimiento/sops/gestion_proyectos.md).

> **No confundir con `postmortem`**: aquello reconstruye *un* fracaso con cronología y cinco porqués. Esto recorre *todo* el proyecto —incluido lo que salió bien— y termina en reglas. Un proyecto puede tener las dos cosas: el postmortem de la licencia que se atrasó y las lecciones del cierre.

## 1. Durante el proyecto — una línea por hito

Al cumplirse un hito (o fallar), una fila en la tabla «Durante el proyecto»: fecha, hito, qué haríamos distinto la próxima vez. Treinta segundos. Si no hay nada, no se inventa.

Esto es lo que hace posible la sesión de cierre: sin estas líneas, al final solo se recuerda el último mes.

## 2. Sesión de cierre

**Fuentes antes de preguntar**: los informes en `estado/` (sobre todo los cambios de semáforo), `cambios.md` (cada cambio aprobado es una lección sobre el alcance original), los riesgos materializados en `riesgos.md`, las actas en `reuniones/`, el postmortem si lo hubo, y las cifras finales (plan vs. real).

**Las preguntas de la sesión** (al usuario y, si participa, al equipo):
1. ¿Qué salió **mejor** de lo esperado y por qué? — primero, para que no se vuelva un juicio.
2. ¿Qué estimamos mal: alcance, duración, costo, riesgo? ¿Con qué información lo habríamos estimado bien?
3. ¿Qué señal estaba ahí y no leímos a tiempo?
4. ¿Qué cambio no debió aprobarse, o qué cambio debió pedirse y no se pidió?
5. ¿Qué proveedor, persona o decisión repetiríamos sin dudar? ¿Cuál no?
6. Si arrancáramos el mismo proyecto mañana, ¿qué sería distinto desde el día uno?

**Cada lección**, en la tabla: categoría · qué pasó (hecho, no interpretación) · qué haríamos distinto o igual · regla candidata · dueño · destino.

## 3. Convertir en regla

Una lección tiene tres destinos posibles; si no cabe en ninguno, es una anécdota:

| Destino | Cuándo | Cómo |
|---|---|---|
| **SOP** | Es un umbral, un plazo o un criterio que aplica a todos los proyectos | Skill `crear-sop`; si ya existe el SOP, se actualiza, nunca uno paralelo |
| **Plantilla** | Faltó una pregunta en el acta, una columna en el cronograma, un campo en el registro | Edita la plantilla en [plantillas/proyecto/](../../../08_conocimiento/plantillas/proyecto/) |
| **Checklist de riesgos** | Es un riesgo que volverá a aparecer en proyectos parecidos | Agente `analista-riesgos`: riesgo tipo con su mitigación conocida |

El agente `planificador-proyectos` lee las lecciones de proyectos anteriores al estimar: una lección escrita aquí cambia el siguiente plan sin que nadie tenga que acordarse.

## Reglas

- **Sin culpables, con hechos.** "El proveedor entregó 3 semanas tarde" es un hecho; "el proveedor es informal" es un juicio. Aplican las reglas del agente `gestor-de-equipo` cuando la lección involucra a una persona.
- **Lo bueno es obligatorio.** Mínimo una lección de lo que funcionó. Un documento solo de errores desmotiva y, peor, no enseña a repetir el acierto.
- **Entre 3 y 10 lecciones.** Más de diez no se leen; menos de tres es que no se miró.
- **Cada una accionable.** "Comunicar mejor" no es una lección; "incluir a operaciones en la aprobación de diseños" sí.
- **Con dueño y destino.** Una lección sin dueño se queda en el archivo. Las acciones van a [TASKS.md](../../../TASKS.md).
- **Proporción**: la sesión de cierre dura una hora, no un día. Las tres lecciones que importan van al acta de cierre.
