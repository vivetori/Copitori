---
description: (módulo Proyectos / PMO) Registra y evalúa una solicitud de cambio — impacto en alcance, tiempo, costo y riesgo, nivel de autoridad y decisión
argument-hint: "<proyecto>: <qué se pide y quién lo pide>  (ej: Planta Norte: el cliente quiere una segunda línea de empaque)"
---

Registra y evalúa este cambio: `$ARGUMENTS`

Niveles de autoridad, umbrales y acumulados: [08_conocimiento/sops/gestion_proyectos.md](../../08_conocimiento/sops/gestion_proyectos.md) §4 — no uses otros.
Flujo de evaluación: skill `control-de-cambios`. Registro: `cambios.md` del proyecto ([plantilla](../../08_conocimiento/plantillas/proyecto/cambios.md)).

## 1. Ubica
Identifica el proyecto en [03_iniciativas/](../../03_iniciativas/). Si no lo dije y hay más de uno activo, pregunta. Si el proyecto no tiene línea base aprobada (sin `cronograma.md` o sin acta firmada), dímelo: sin línea base no hay cambio, hay planificación.

## 2. Registra primero
Fila `CC-NN` en `cambios.md` con estado `solicitado`, fecha de hoy, quién lo pide y qué pide. **Antes de evaluar.**

## 3. Evalúa
Lee `edt.md`, `cronograma.md` (ruta crítica y holguras), `riesgos.md` y el acumulado de cambios. Devuélveme la tabla de impacto (alcance · tiempo · costo · calidad · riesgos · interesados), en días hábiles y en dinero con % del presupuesto base. Si un impacto no se puede estimar con lo que hay, estado `en_evaluacion` y qué falta.

Alternativas: mínimo dos, siempre con "no hacerlo" y su consecuencia, y la versión más pequeña que resuelve el problema.

## 4. Nivel y recomendación
Clasifica el nivel con el SOP (incluidos los acumulados). Tu recomendación en una línea: `aprobar` · `aprobar con condición` · `rechazar` · `diferir` · `pedir más información`.
- **Nivel 1**: puedo decidir yo. Pregúntame.
- **Nivel 2 o 3**: redacta la solicitud al sponsor o al comité en mi voz ([voz_y_estilo.md](../../08_conocimiento/voz_y_estilo.md)), con qué se pide, cuánto cuesta, qué pasa si no y para cuándo se necesita la respuesta. Muéstramela; no la envíes.
Si el cambio es grande o irreversible, pásalo por el agente `contradictor` antes de recomendar.

## 5. Si se decide
- Escribe la decisión en la fila (quién, fecha, condición) y en el detalle.
- `aprobado` → actualiza la línea base en el mismo cambio: EDT (nueva versión), cronograma (`fecha estimada` e historial — la comprometida original se conserva), `presupuesto` y `fin_objetivo` en el acta si los mueve, acumulado en la cabecera de `cambios.md`. Nivel 2–3 además a [07_equipo/decisiones.md](../../07_equipo/decisiones.md).
- Riesgos que cambian de nivel → agente `analista-riesgos`.
- Lo que espera decisión → [TASKS.md](../../TASKS.md) con dueño y la fecha límite del SOP §2.

## Cierre
Tres líneas: ID y nivel · impacto resumido · qué decido yo o qué se pide a quién. Luego el enlace al registro.

**No hagas**: ejecutar o "ir avanzando" sin decisión registrada, cambiar la línea base con estado `solicitado`, borrar la fecha comprometida original, inventar costos (van `[ASUMIDO]`).
