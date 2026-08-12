---
description: Archiva una reunión (transcripción o Fireflies) en el expediente de la relación
argument-hint: "<día/hora o nombre de la reunión>  (o pega la transcripción)"
---

Archiva la reunión `$ARGUMENTS` en el expediente correspondiente.

## Pasos

1. **Consigue la reunión**:
   - Si hay herramienta de transcripción conectada (Fireflies, etc.), localízala por día/hora o título.
   - Si no, pídeme que pegue la transcripción o mis notas.

2. **Identifica la relación**: por los asistentes o el título, ubica el archivo en [02_relaciones/](../../02_relaciones/). Si es interna, usa [07_equipo/reuniones/](../../07_equipo/reuniones/). Si no existe la relación, propón crearla con la plantilla [08_conocimiento/plantillas/relacion.md](../../08_conocimiento/plantillas/relacion.md).

3. **Genera el archivo** en la carpeta `reuniones/` correspondiente, con nombre `YYYY-MM-DD_Titulo.md`, usando la plantilla [08_conocimiento/plantillas/reunion.md](../../08_conocimiento/plantillas/reunion.md):
   - **Digest**: decisiones, acuerdos, próximos pasos con responsable y fecha.
   - **Transcripción literal** al final (si la hay), para búsqueda posterior.
   - **Enlaza con wikilinks**: en el frontmatter, `relacion` e `iniciativa` como lista de `"[[Nombre]]"`; en el cuerpo, cada persona y proyecto que menciones. Así el acta aparece sola en los backlinks de la relación.

4. **Sincroniza lo accionable**:
   - Actualiza la historia y los próximos pasos en el archivo de la relación.
   - Agrega las tareas detectadas a [TASKS.md](../../TASKS.md) con fecha.
   - Si se tomó una decisión clave, regístrala en [07_equipo/decisiones.md](../../07_equipo/decisiones.md).

5. Cierra con un resumen de 3 líneas y la lista de pendientes que generó la reunión.
