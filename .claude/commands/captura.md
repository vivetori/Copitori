---
description: Captura rápida — suelta lo que sea (nota, compromiso, dato, idea) y lo archivo donde corresponde
argument-hint: "<lo que sea>  (ej: llamó Ana de Acme, quieren mover el kickoff a septiembre)"
---

Captura esto: `$ARGUMENTS`

Modo captura: **rápido y silencioso**. Yo estoy en movimiento, no quiero una conversación.
Archiva y responde en 3 líneas máximo. Si algo es ambiguo, decide con el criterio más probable
y márcalo `[ASUMIDO: ...]` — ya lo corrijo después.

## Clasifica y archiva

| Si es… | Va a |
|---|---|
| Tarea o compromiso mío | [TASKS.md](../../TASKS.md), con prioridad y fecha absoluta |
| Novedad sobre una persona u organización | Su ficha en [02_relaciones/](../../02_relaciones/): historia + próximos pasos |
| Avance, traba o cambio de alcance de un proyecto | Bitácora de su ficha en [03_iniciativas/](../../03_iniciativas/) |
| Algo que se decidió | [07_equipo/decisiones.md](../../07_equipo/decisiones.md), con la plantilla [decision.md](../../08_conocimiento/plantillas/decision.md) |
| Algo que puede salir mal | [07_equipo/riesgos.md](../../07_equipo/riesgos.md) — evalúa según [sops/riesgos.md](../../08_conocimiento/sops/riesgos.md) |
| Cifra o dato de negocio | El archivo del módulo que corresponda ([05_finanzas/](../../05_finanzas/), [04_comercial/pipeline.md](../../04_comercial/pipeline.md)) |
| Idea suelta, observación, cita | Bitácora de hoy en [09_bitacora/](../../09_bitacora/) |
| Varias cosas a la vez | Sepáralas y archiva cada una en su sitio |

## Reglas
- **Fechas absolutas siempre.** "La próxima semana" se guarda como `YYYY-MM-DD`.
- **Enlaza con wikilinks** cada persona, organización e iniciativa (`[[Nombre]]`). Si no tiene ficha, enlázala igual y dímelo — el enlace sin destino es el recordatorio de crearla.
- **No inventes contexto.** Guarda lo que dije, no lo que supones que quise decir.
- **Nunca sobrescribas**: agrega al final de la sección que corresponda.
- Si lo capturado contradice algo ya registrado (una fecha que cambió, un estado distinto), **actualiza y avísame qué cambió**.

## Respuesta
Tres líneas:
1. Qué archivaste y dónde (con el enlace).
2. Lo que asumiste, si asumiste algo.
3. Un solo próximo paso, si es evidente. Si no lo es, no propongas nada.
