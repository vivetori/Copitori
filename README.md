# Copitori — Tu copiloto ejecutivo

Copitori es una **plantilla de copiloto ejecutivo** para cualquier líder: CEO, gerente, director o líder de área. Funciona sobre [Claude Code](https://claude.com/claude-code): un espacio de archivos donde Claude lee tu contexto y trabaja por ti — briefings, seguimientos, propuestas, actas, análisis.

No es un chatbot genérico. Es un **jefe de gabinete**: proactivo, conoce tu negocio, respeta tus reglas y redacta en tu voz.

---

## ⚡ Cómo empezar (2 pasos)

1. **Abre esta carpeta en Claude Code** (o cópiala como tu espacio de trabajo).
2. **Salúdalo.** Escribe "hola".

La primera vez, Copitori detecta que no está configurado y **te guía paso a paso**, en dos tramos:

- **Entorno (1–2 min)** — revisa tu máquina, instala Obsidian si te falta (Homebrew en macOS, winget en Windows, Flatpak en Linux), registra esta carpeta como bóveda, la abre y repara la estructura si falta alguna carpeta. Te pide permiso antes de instalar o abrir nada.
- **Configuración (≈5 min, 6 bloques cortos)** — quién eres, tu organización, tus objetivos, qué módulos necesitas, qué herramientas tienes y tu estilo de escritura.

Al terminar, queda listo para tu día a día.

> ¿Reinstalar o reparar el entorno después? `/instalar`. ¿Reconfigurar tu perfil? `/configurar`.
> ¿Prefieres no usar Obsidian? Dilo y sigue: Copitori funciona igual solo con los archivos.

---

## 🗺️ Mapa del espacio

| Carpeta | Para qué |
|---|---|
| [PANEL.md](PANEL.md) | La portada. Tu panel de mando: hoy, radar, reglas y accesos. |
| [00_perfil/](00_perfil/) | Quién eres + tu organización + configuración de Copitori. **Aquí vive tu perfil.** |
| [01_objetivos/](01_objetivos/) | Tus objetivos/OKRs — el filtro estratégico de toda priorización. |
| [02_relaciones/](02_relaciones/) | CRM ligero: clientes, prospectos, stakeholders, aliados. |
| [03_iniciativas/](03_iniciativas/) | Proyectos e iniciativas en ejecución. |
| [04_comercial/](04_comercial/) | *(opcional)* Pipeline y propuestas. |
| [05_finanzas/](05_finanzas/) | *(opcional)* Presupuesto, caja y cobros. |
| [06_comunicacion/](06_comunicacion/) | *(opcional)* Contenido y comunicación. |
| [07_equipo/](07_equipo/) | Equipo, reuniones internas y registro de decisiones. |
| [08_conocimiento/](08_conocimiento/) | SOPs (reglas), plantillas y tu voz. La "ley operativa". |
| [09_bitacora/](09_bitacora/) | Un archivo por día: briefing de la mañana y cierre. |
| [99_adjuntos/](99_adjuntos/) | Imágenes y PDFs que arrastres a una nota. |
| [TASKS.md](TASKS.md) | Tus pendientes. |

Los módulos opcionales se activan según tu rol durante la configuración: un CEO usa casi todos; un líder de área quizá solo Relaciones, Iniciativas y Equipo; un director de proyectos puede encender además el módulo **Proyectos / PMO** dentro de `03_iniciativas/` (viene desactivado; se enciende solo si lo eliges en `/configurar`).

### Si eres director de proyectos o lideras una PMO

Di tu rol al saludar: Copitori te **propondrá** el módulo Proyectos / PMO y, si lo aceptas, se configura como tu cerebro de formulación y gestión de proyectos. El flujo:
**hola** → `/configurar` (aceptas el preset de rol y decides si dejas los umbrales por defecto) → `/kickoff` para arrancar tu proyecto con acta de constitución → planificación (EDT, cronograma y ruta crítica con el agente `planificador-proyectos`) → `/estado-semanal` cada corte (semáforo, valor ganado, borrador al sponsor) → `/cambio` cuando algo mueva alcance, fecha o costo → `/portafolio` para ver todos tus proyectos y las decisiones que esperan por ti → `/cierre` con lecciones que cambian el siguiente proyecto.
Los umbrales de semáforo, escalamiento y autoridad de cambios tienen valores por defecto sensatos y **se pueden cambiar cuando quieras** con `/configurar proyectos` o editando la tabla de parámetros de [08_conocimiento/sops/gestion_proyectos.md](08_conocimiento/sops/gestion_proyectos.md), el único lugar donde viven. El diseño del módulo, alineado con PMBOK 7 y los cinco grupos de procesos (y con marco lógico / MGA como opción para proyectos públicos), está en [08_conocimiento/modulo_proyectos.md](08_conocimiento/modulo_proyectos.md).

---

## 🛠️ Comandos

Escribe `/` para verlos. Los más usados:

| Comando | Qué hace |
|---|---|
| `/resumen-dia` | Briefing matutino: agenda, correos, pendientes y las 3 cosas que importan hoy. |
| `/triage` | Clasifica tu inbox y redacta borradores en tu voz. |
| `/seguimiento` | Detecta lo que se está enfriando y propone los mensajes. |
| `/reunion` | Briefing pre-reunión con contexto y preguntas clave. |
| `/revision-semanal` | Cierre de semana contra tus objetivos. |
| `/guardar-reunion` | Archiva una reunión en el expediente de la relación. |
| `/captura` | Suelta algo al vuelo (nota, compromiso, dato) y lo archiva donde corresponde. |
| `/sintesis` | Responde una pregunta cruzando toda la bóveda, con fuentes citadas. |
| `/junta` | Prepara una junta o comité: agenda, cifras, riesgos y las preguntas incómodas. |
| `/kpis` | Actualiza el panel de KPIs contra tus objetivos. |
| `/boveda` | Audita la bóveda: enlaces rotos, notas huérfanas, fichas sin próximo paso. |
| `/playbook` | Desarrolla un negocio con la metodología GoSmartUp: los 8 KeyPoints, validados y escritos. |
| `/instalar` | Verifica el entorno e instala lo que falte (Obsidian, bóveda, estructura). |
| `/pipeline`, `/propuesta` | *(módulo comercial)* |
| `/kickoff` | *(Proyectos / PMO)* Arranca un proyecto: carpeta desde plantillas y acta de constitución por etapas. |
| `/estado-semanal` | *(Proyectos / PMO)* Corte semanal: semáforo, valor ganado, hitos, cambios, riesgos y borrador al sponsor. |
| `/cambio` | *(Proyectos / PMO)* Registra y evalúa una solicitud de cambio con su nivel de autoridad. |
| `/portafolio` | *(Proyectos / PMO)* Todos tus proyectos en una pantalla y las decisiones que esperan por ti. |
| `/cierre` | *(Proyectos / PMO)* Checklist de cierre, lecciones aprendidas y acta de cierre. |
| `/configurar` | (Re)ejecuta el asistente de configuración. `/configurar proyectos` ajusta los umbrales del módulo Proyectos / PMO. |

---

## 👥 Tu equipo directivo

Dieciséis agentes especializados. No los invocas: Copitori delega en ellos cuando la tarea encaja, o los pides por nombre. Cada uno mira el negocio desde un ángulo distinto.

| | Agente | Para qué |
|---|---|---|
| ⚔️ | `contradictor` | Ataca tu decisión antes de que lo haga la realidad |
| 🚀 | `asesor-emprendimiento` | Construye el negocio con los 8 KeyPoints de GoSmartUp |
| 📜 | `archivista` | "¿Qué le prometimos a este cliente?" — cruza toda la bóveda y cita fuentes |
| 🔎 | `investigador` | Investiga a fondo una persona u organización |
| ⚠️ | `analista-riesgos` | Qué puede salir mal, con dueño y fecha |
| 💰 | `analista-financiero` | Caja, rentabilidad, presupuesto vs. real *(Finanzas)* |
| 🤝 | `negociador` | Alternativas, límites y concesiones antes de sentarte |
| 👤 | `gestor-de-equipo` | Carga, 1:1, señales de rotación |
| 🎯 | `analista-competencia` | Dónde ganamos, dónde perdemos, qué se movió |
| ⚖️ | `revisor-legal` | Cláusulas que hay que mirar antes de firmar |
| 📈 | `estratega-comercial` | Qué tratos son reales y cuáles están muertos *(Comercial)* |
| ✍️ | `redactor` | Documentos largos en tu voz |
| 🗺️ | `planificador-proyectos` | Del acta a la EDT, el cronograma y la ruta crítica *(Proyectos / PMO)* |
| 📐 | `controlador-proyectos` | Valor ganado y semáforo honesto en cada corte *(Proyectos / PMO)* |
| 🏛️ | `formulador-proyectos` | Marco lógico y MGA para proyectos públicos o con cooperación *(Proyectos / PMO, opcional)* |
| 🔭 | `vigia-convocatorias` | Convocatorias abiertas, elegibilidad, requisitos y fechas: a cuál aplicar *(Proyectos / PMO)* |

El más valioso suele ser el `contradictor`: es el único que no está de tu lado, y por diseño.

---

## 🧩 Skills — el método que se aplica solo

No se invocan. Se activan cuando aparece la situación, y se combinan entre sí.

| Skill | Se activa cuando… |
|---|---|
| `comunicacion-ejecutiva` | Escribes algo de alto impacto. Lo importante va en las dos primeras líneas; la mala noticia nunca al final. |
| `presentar-numeros` | Un documento lleva cifras. Ningún número viaja sin contexto, ni un porcentaje sin su base. |
| `caso-de-negocio` | Hay que justificar una inversión. Incluye siempre "no hacer nada" **con su costo**. |
| `postmortem` | Algo salió mal. Sin culpables, y termina en una regla, no en "tener más cuidado". |
| `crear-sop` | Dices "siempre lo hacemos así". Lo convierte en regla que el sistema aplica solo. |
| `informe-de-estado` | Reportas avance a un cliente, sponsor o junta. Semáforo honesto y petición concreta. |
| `post-linkedin` | Escribes en LinkedIn. El material sale de tu bóveda, no del aire — y filtra lo confidencial antes. |
| `acta-de-constitucion` · `edt-y-cronograma` · `registro-interesados` | *(Proyectos / PMO)* Arrancas y planificas un proyecto: acta por etapas, EDT con regla del 100 %, ruta crítica, interesados por poder/interés. |
| `valor-ganado` · `control-de-cambios` · `lecciones-aprendidas` | *(Proyectos / PMO)* Lo controlas y lo cierras: SPI/CPI/EAC con la fórmula declarada, cambios con nivel de autoridad, lecciones que se vuelven regla. |
| `formulacion-marco-logico` | *(Proyectos / PMO, opcional)* Formulas para una entidad pública, cooperación o MGA: árboles de problemas y objetivos, matriz de marco lógico. |

Más las de documentos (Word, PowerPoint, Excel, PDF) y gráficos, siempre disponibles.
¿Tienes un proceso propio del negocio? Pídele a Copitori que lo convierta en skill — ver [.claude/skills/](.claude/skills/).

---

## 🔮 Ábrelo en Obsidian

Esta carpeta ya es una **bóveda de Obsidian** configurada. Instala [Obsidian](https://obsidian.md),
elige `Abrir carpeta como bóveda`, apunta aquí y abre `PANEL.md`.

Es el mismo archivo que edita Copitori — no hay sincronización ni exportación. Lo que ganas:

- **Backlinks**: abres un cliente y ves cada acta, propuesta y decisión que lo menciona.
- **Grafo**: una iniciativa colgando sola es una iniciativa sin dueño. Se ve.
- **Propiedades**: el frontmatter se edita como formulario y se filtra desde la búsqueda.
- **Móvil**: la misma bóveda en el teléfono.

Funciona con los plugins nucleares — no hay que instalar nada más.
Detalles y convenciones de enlace → [OBSIDIAN.md](OBSIDIAN.md).

---

## 🧠 Cómo funciona por dentro

- **El comportamiento** vive en [CLAUDE.md](CLAUDE.md) — es estable y no cambia entre usuarios.
- **Tus datos** viven en `00_perfil/` y las demás carpetas — los rellenas tú (o el asistente).
- **Tus reglas** viven en [08_conocimiento/sops/](08_conocimiento/sops/) con *dueño único*: cada umbral o condición se define una sola vez; los comandos la referencian, nunca la duplican.
- Copitori usa las **herramientas (MCP)** que tengas conectadas (correo, calendario, CRM…). Si no tienes ninguna, funciona 100% con los archivos.

## 🔒 Privacidad y qué corre en tu máquina
Todo vive en archivos locales en tu equipo. Lo que se sincroniza con servicios externos depende solo de las herramientas que tú conectes. El log de auditoría de herramientas (`.claude/logs/`) no se versiona.

Para que sepas qué traes al descargarlo, [.claude/settings.json](.claude/settings.json) registra dos *hooks* que Claude Code ejecuta solo (te pedirá permiso la primera vez que abras la carpeta):

- **`SessionStart`** → [`arranque.sh`](.claude/scripts/arranque.sh): al abrir la sesión, lee `00_perfil/identidad.md` para saber si ya te configuraste. Solo lee; no modifica nada ni sale de la carpeta.
- **`PostToolUse`** en herramientas MCP → añade una línea a `.claude/logs/auditoria.jsonl` cada vez que Copitori usa una herramienta externa. Es tu registro local de qué se consultó y cuándo; nunca sale de tu equipo.

El único script que modifica algo es [`entorno.sh`](.claude/scripts/entorno.sh), y solo cuando tú lo llamas desde `/instalar`: crea carpetas que falten, registra la bóveda en Obsidian (con respaldo de tu configuración previa) o instala Obsidian — esto último siempre pidiéndote permiso antes. `entorno.sh verificar` solo diagnostica.

## 📤 Reutilizar / compartir
Copia la carpeta `Copitori/` y entrégala a otra persona. Al abrirla y saludar, el asistente la configurará desde cero para su realidad. Para empezar limpio, basta con que `00_perfil/identidad.md` tenga `estado_configuracion: SIN_CONFIGURAR`.

## 📄 Licencia
[MIT](LICENSE). Úsala, modifícala y compártela — también para tu empresa o tus clientes.

---
Plantilla creada a partir de un copiloto ejecutivo real en producción.
