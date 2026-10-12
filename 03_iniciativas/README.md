# 03_iniciativas — Iniciativas y proyectos

Todo lo que está en ejecución vive aquí, en una de tres formas según su tamaño:

| Forma | Cuándo | Plantilla |
|---|---|---|
| **Ficha simple** `Nombre.md` | Iniciativa pequeña: un responsable, pocas fases, sin presupuesto propio | [iniciativa.md](../08_conocimiento/plantillas/iniciativa.md) |
| **Carpeta de proyecto** `<slug>/` | Proyecto con sponsor, presupuesto, cronograma y control de cambios — **módulo Proyectos / PMO** (opt-in) | [plantillas/proyecto/](../08_conocimiento/plantillas/proyecto/) |
| **Carpeta de startup** `<Startup>/` | Un negocio que estás construyendo con GoSmartUp | [plantillas/gosmartup/](../08_conocimiento/plantillas/gosmartup/) |

Estados (`estado` en el frontmatter, común a las tres formas): `idea` · `activo` · `en_riesgo` · `pausado` · `cerrado`.

> Copitori revisa esta carpeta en `/resumen-dia` y `/revision-semanal` para marcar riesgos y entregables próximos a vencer.
> Si el módulo Proyectos / PMO está activo, además incluye los proyectos en 🔴 o 🟡 y los hitos de la semana.

## Carpeta de proyecto (módulo Proyectos / PMO)

Se crea con `/kickoff <nombre>`. Convención de carpeta: minúsculas, sin tildes, guiones bajos (`ampliacion_planta_norte`).

```
03_iniciativas/<slug>/
├── acta_constitucion.md     ← ficha madre: su frontmatter es el estado vivo del proyecto
├── interesados.md           ← poder/interés y plan de comunicación
├── edt.md                   ← estructura de desglose del trabajo (línea base de alcance)
├── cronograma.md            ← hitos, paquetes con costo y avance, ruta crítica
├── riesgos.md               ← los del proyecto; los altos/críticos se espejan en 07_equipo/riesgos.md
├── cambios.md               ← control de cambios (nada se ejecuta sin fila aquí)
├── lecciones_aprendidas.md  ← durante el proyecto y en la sesión de cierre
├── acta_cierre.md           ← lo escribe /cierre
├── marco_logico.md          ← opcional: proyectos públicos o con cooperación
├── estado/AAAA-MM-DD.md     ← un informe por corte semanal (/estado-semanal)
└── reuniones/               ← actas con /guardar-reunion (plantilla reunion.md)
```

**Frontmatter del acta** (lo leen `/portafolio`, `/resumen-dia` y las búsquedas del [PANEL](../PANEL.md)):

| Campo | Valores | Quién lo actualiza |
|---|---|---|
| `aliases` | El nombre del proyecto — permite enlazarlo como `[[Nombre del proyecto]]` | `/kickoff` |
| `estado` | `idea` · `activo` · `en_riesgo` · `pausado` · `cerrado` | `/estado-semanal` (rojo ⇒ `en_riesgo`), `/cierre` |
| `fase` | `inicio` · `planificacion` · `ejecucion` · `cierre` · `cerrado` | Al cambiar de fase |
| `semaforo` | `verde` · `ambar` · `rojo` — criterios en el [SOP](../08_conocimiento/sops/gestion_proyectos.md) | `/estado-semanal` |
| `sponsor`, `pm` | Nombres | `/kickoff` |
| `relacion`, `objetivo` | Wikilinks a la relación de [02_relaciones/](../02_relaciones/) y al objetivo de [01_objetivos/](../01_objetivos/) | `/kickoff` |
| `inicio`, `fin_objetivo` | Fechas de la línea base | `/kickoff`; `fin_objetivo` solo cambia por un cambio aprobado |
| `presupuesto` | Presupuesto base sin reservas (BAC), número | `/kickoff`; cambia solo por un cambio aprobado |
| `spi`, `cpi`, `ultimo_corte` | Del último corte | `/estado-semanal` |

El cuerpo del acta no se reescribe después de la firma: lo que cambia pasa por `cambios.md`.
Las capturas rápidas (`/captura`) de un proyecto van a la sección «Novedades de la semana» del informe de estado en curso.

Ciclo: `/kickoff` → planificación (agente `planificador-proyectos`) → `/estado-semanal` cada corte → `/cambio` cuando algo se mueve → `/portafolio` para verlos todos → `/cierre`.
Reglas: [SOP de gestión de proyectos](../08_conocimiento/sops/gestion_proyectos.md). Diseño del módulo: [modulo_proyectos.md](../08_conocimiento/modulo_proyectos.md). Vista de todos los proyectos: [portafolio.md](portafolio.md).

Un proyecto cerrado **no se mueve de carpeta** (movería los enlaces): queda con `estado: cerrado` y sale de la tabla de activos del portafolio. Si quieres archivarlo, renómbralo desde Obsidian.

El módulo viene **desactivado**: se enciende en `/configurar` (Etapa 4) y, mientras esté `[ ]` en [config_copiloto.md](../00_perfil/config_copiloto.md), ni los comandos ni los briefings hablan de proyectos. Sus umbrales se ajustan con `/configurar proyectos`. La plantilla no trae proyectos de muestra: el primero lo creas con `/kickoff`.

## Negocios en desarrollo (GoSmartUp)

Si la iniciativa es un negocio que estás construyendo, usa `/playbook`: crea una carpeta
`<Startup>/` con el panel de los 8 KeyPoints, sus documentos y la carpeta `validaciones/`.
Método y criterios: [08_conocimiento/sops/metodologia_gosmartup.md](../08_conocimiento/sops/metodologia_gosmartup.md).
