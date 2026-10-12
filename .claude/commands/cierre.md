---
description: (módulo Proyectos / PMO) Cierra un proyecto — checklist de cierre, sesión de lecciones aprendidas, acta de cierre y archivo
argument-hint: "<proyecto>  [cancelado]  (ej: Nueva sede · ej: Portal de clientes cancelado)"
---

Cierra el proyecto `$ARGUMENTS`. Por entrega o por cancelación: el checklist es el mismo.

## 0. Módulo activo
Comprueba en [00_perfil/config_copiloto.md](../../00_perfil/config_copiloto.md) que **Proyectos / PMO** esté marcado `[x]`. Si no, responde solo esto y no sigas: «El módulo Proyectos / PMO está desactivado. Actívalo con `/configurar` (Etapa 4).»

Criterios de cierre y lecciones: [08_conocimiento/sops/gestion_proyectos.md](../../08_conocimiento/sops/gestion_proyectos.md) §7 y §8.
Plantillas: [acta_cierre.md](../../08_conocimiento/plantillas/proyecto/acta_cierre.md), [lecciones_aprendidas.md](../../08_conocimiento/plantillas/proyecto/lecciones_aprendidas.md).

## 1. Checklist
Recorre los siete criterios del SOP §7 contra los archivos del proyecto (`cambios.md`, `riesgos.md`, `cronograma.md`, el último `estado/`, [02_relaciones/](../../02_relaciones/), [05_finanzas/](../../05_finanzas/) si el módulo está activo). Para cada uno: ✅ cumplido con la evidencia, o ❌ qué falta y quién lo cierra.

**Si falta algo, no cierres**: deja el acta de cierre en borrador, las tareas en [TASKS.md](../../TASKS.md) con fecha, y dime qué destraba el cierre. Un proyecto "cerrado" con cambios abiertos vuelve en tres meses como reclamo.

## 2. Cifras finales
Con la skill `valor-ganado` al último corte: fecha fin plan vs. real, BAC vs. costo final, contingencia usada, cambios aprobados (número y monto). Con la skill `presentar-numeros`: desvío absoluto y relativo, y una lectura por fila. Si el módulo Finanzas está activo, confirma el costo final con el agente `analista-financiero`.

## 3. Lecciones aprendidas
Aplica la skill `lecciones-aprendidas`: lee los informes de `estado/`, los cambios, los riesgos materializados y las líneas «Durante el proyecto» ya escritas; hazme las preguntas de la sesión en dos bloques, no de golpe. Escribe la tabla en `lecciones_aprendidas.md` (3–10 lecciones, al menos una de lo que salió bien) con dueño y destino.
- Las permanentes → skill `crear-sop` (actualiza el SOP existente si ya hay dueño; nunca uno paralelo).
- Las de plantilla → propón la edición concreta en [plantillas/proyecto/](../../08_conocimiento/plantillas/proyecto/).
- Las de riesgo recurrente → agente `analista-riesgos`.
Si hubo un fracaso con costo real (hito perdido, sobrecosto material, cliente molesto), propón además un `postmortem` aparte.

## 4. Acta de cierre
Escribe `acta_cierre.md` con el checklist, las cifras, los entregables aceptados (con evidencia enlazada), lo que queda abierto (garantías, transición a operación — con dueño y fecha) y las 3 lecciones que importan. Motivo: entrega o cancelación; si es cancelación, la causa va también a [07_equipo/decisiones.md](../../07_equipo/decisiones.md).

## 5. Archiva
- Frontmatter del acta de constitución: `estado: cerrado` · `fase: cerrado`.
- [03_iniciativas/portafolio.md](../../03_iniciativas/portafolio.md): sale de activos, entra en «Cerrados» con el desvío final.
- Riesgos espejados en [07_equipo/riesgos.md](../../07_equipo/riesgos.md): cerrados o transferidos a operación con dueño.
- Ficha de la relación: resultado y siguiente paso (garantía, siguiente fase, nada). Si el módulo Comercial está activo y hay una siguiente fase, propón la oportunidad en [04_comercial/pipeline.md](../../04_comercial/pipeline.md).
- Borrador del mensaje de cierre al sponsor o cliente en mi voz ([voz_y_estilo.md](../../08_conocimiento/voz_y_estilo.md)): resultado, cifras, lo que queda abierto, agradecimiento concreto. Muéstramelo; no lo envíes.
- **No muevas ni renombres la carpeta**: rompería los enlaces entrantes. Si quiero archivarla, me lo recuerdas para hacerlo desde Obsidian.

## Cierre
Cuatro líneas: cerrado sí/no y qué falta · desvío final de fecha y costo · las 3 lecciones · qué se convirtió en regla.

**No hagas**: cerrar con criterios pendientes, borrar archivos, mover la carpeta, enviar el mensaje de cierre, convertir en SOP una lección que pasó una sola vez.
