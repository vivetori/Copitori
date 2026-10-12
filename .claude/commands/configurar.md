---
description: (Re)ejecuta el asistente de configuración de Copitori — perfil, organización, objetivos, módulos, herramientas y voz
argument-hint: "[etapa]  (opcional: 'proyectos' = umbrales del módulo Proyectos / PMO · vacío = asistente completo o resumen para ajustar)"
---

Ejecuta el **Asistente de configuración** descrito en [CLAUDE.md](../../CLAUDE.md) (sección "🚀 Asistente de configuración"). Argumento: `$ARGUMENTS`.

Reglas para esta corrida:

1. Si `00_perfil/identidad.md` ya está `CONFIGURADO`, no empieces de cero: muéstrame un resumen de la configuración actual y pregúntame **qué quiero ajustar** (puedo querer solo cambiar objetivos, o activar un módulo nuevo). Ve directo a esa etapa.
2. Si está `SIN_CONFIGURAR`, corre las 6 etapas en orden.
3. Trabaja por etapas, 2–4 preguntas por bloque, con borradores y supuestos `[ASUMIDO: ...]`. No me abrumes.
   - **Preset de rol (propuesta, no activación automática)**: si en la Etapa 1 digo que soy gestor/director de proyectos, PM o líder de PMO, en la Etapa 4 **propón** encender **Proyectos / PMO**, Relaciones y Equipo y decisiones en una sola pregunta y marca `[x]` solo lo que yo confirme. Si acepto Proyectos / PMO: pregúntame en la Etapa 5 por mi herramienta de gestión de tareas/proyectos (Jira, Asana, ClickUp, Planner…), corre la mini-etapa de umbrales (punto 6) y, al cerrar, propón como primer paso cargar mi proyecto más importante con `/kickoff`. Si no lo acepto, el módulo queda `[ ]` y no vuelves a ofrecer `/kickoff` ni a mencionar proyectos en briefings.
4. Escribe los cambios en los archivos correspondientes a medida que avanzas (no esperes al final).
5. Al terminar, deja `estado_configuracion: CONFIGURADO` con fecha y propón mis 3 primeros pasos.
6. **Mini-etapa «Umbrales del módulo Proyectos / PMO»** — se corre al activar el módulo en la Etapa 4, con `/configurar proyectos`, o cuando diga "ajusta los umbrales del semáforo" (o de cambios, escalamiento, contingencia):
   1. Lee la tabla de parámetros (§0) de [08_conocimiento/sops/gestion_proyectos.md](../../08_conocimiento/sops/gestion_proyectos.md). Si el módulo está `[ ]`, dímelo y ofrece activarlo antes.
   2. Pregunta en una sola línea: «¿Dejamos los umbrales por defecto o los ajustamos ahora?», con un resumen de 2 líneas de la tabla (semáforo y autoridad de cambios). No copies valores a ningún otro archivo: el SOP es el único dueño.
   3. Si los dejo: no toques nada y sigue. Si los ajusto: pregunta solo por los parámetros que quiera cambiar (por código o en lenguaje natural), edita la tabla del SOP, deja el resto intacto y añade una línea con la fecha en «Cambios».
   4. Confirma en una línea qué cambió y recuérdame que puedo volver cuando quiera con `/configurar proyectos`.
