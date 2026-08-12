---
description: Briefing matutino — agenda del día, correos prioritarios, pendientes y lo que importa hoy
---

Hazme el briefing ejecutivo de hoy. Sé directo, sin relleno. Usa solo las herramientas que figuren conectadas en [00_perfil/config_copiloto.md](../../00_perfil/config_copiloto.md); si una no está, trabaja con los archivos locales y dilo.

**1. Agenda de hoy** (si hay calendario conectado):
- Lista cada reunión con hora y asistentes; enlaza al archivo de la relación en [02_relaciones/](../../02_relaciones/) si existe.
- Para cada reunión externa, dime en 1 frase qué deberíamos lograr.

**2. Inbox prioritario** (si hay correo conectado — no leídos de los últimos 2 días):
- Filtra solo lo que requiere mi acción.
- Para cada uno: remitente, asunto, qué responder (borrador en 1 línea).
- Si hay más de 5 que requieren acción, lista los 5 más críticos y sugiere correr `/triage`.

**3. Seguimientos pendientes**:
- Detecta relaciones, compromisos o correos sin movimiento según los umbrales de [08_conocimiento/sops/seguimiento.md](../../08_conocimiento/sops/seguimiento.md).
- Si el módulo Comercial está activo, incluye el pipeline ([04_comercial/pipeline.md](../../04_comercial/pipeline.md)).
- Sugiere 3 acciones concretas para hoy.

**4. Iniciativas y riesgos** (revisa [03_iniciativas/](../../03_iniciativas/) y [07_equipo/riesgos.md](../../07_equipo/riesgos.md)):
- Marca entregables que vencen en los próximos 7 días.
- Escala los riesgos **críticos y altos**, y cualquiera cuya revisión esté vencida según [08_conocimiento/sops/riesgos.md](../../08_conocimiento/sops/riesgos.md). Una línea cada uno: qué amenaza y qué toca hacer.

**5. Finanzas** (solo si el módulo está activo): cobros o pagos vencidos en [05_finanzas/](../../05_finanzas/), con borrador de recordatorio.

**6. Tareas** (lee [TASKS.md](../../TASKS.md)):
- Lista las P1 abiertas y las bloqueadas cuyo recordatorio vence hoy.
- Si detectaste tareas nuevas en los puntos anteriores, agrégalas a TASKS.md.

Cierra con **"Las 3 cosas que importan hoy"** — solo 3, las que mueven más la aguja, filtradas por [01_objetivos/okrs.md](../../01_objetivos/okrs.md).

---

**7. Archiva el briefing** en `09_bitacora/YYYY-MM-DD.md` (fecha de hoy), con la plantilla [08_conocimiento/plantillas/dia.md](../../08_conocimiento/plantillas/dia.md). Es también la nota diaria de Obsidian.
- Si el archivo ya existe, **actualízalo** — no crees un duplicado ni sobrescribas lo que yo haya escrito a mano.
- Enlaza con wikilinks cada relación, iniciativa y persona que menciones (`[[Nombre]]`), para que el día quede conectado en el grafo.
- Deja el bloque «Cierre del día» vacío: lo lleno yo al terminar.
