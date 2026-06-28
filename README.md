# Copitori — Tu copiloto ejecutivo

Copitori es una **plantilla de copiloto ejecutivo** para cualquier líder: CEO, gerente, director o líder de área. Funciona sobre [Claude Code](https://claude.com/claude-code): un espacio de archivos donde Claude lee tu contexto y trabaja por ti — briefings, seguimientos, propuestas, actas, análisis.

No es un chatbot genérico. Es un **jefe de gabinete**: proactivo, conoce tu negocio, respeta tus reglas y redacta en tu voz.

---

## ⚡ Cómo empezar (2 pasos)

1. **Abre esta carpeta en Claude Code** (o cópiala como tu espacio de trabajo).
2. **Salúdalo.** Escribe "hola".

La primera vez, Copitori detecta que no está configurado y **te guía paso a paso** (≈5 minutos, 6 bloques cortos): quién eres, tu organización, tus objetivos, qué módulos necesitas, qué herramientas tienes y tu estilo de escritura. Al terminar, queda listo para tu día a día.

> ¿Quieres reconfigurarlo después? Usa el comando `/configurar`.

---

## 🗺️ Mapa del espacio

| Carpeta | Para qué |
|---|---|
| [00_perfil/](00_perfil/) | Quién eres + tu organización + configuración de Copitori. **Aquí vive tu perfil.** |
| [01_objetivos/](01_objetivos/) | Tus objetivos/OKRs — el filtro estratégico de toda priorización. |
| [02_relaciones/](02_relaciones/) | CRM ligero: clientes, prospectos, stakeholders, aliados. |
| [03_iniciativas/](03_iniciativas/) | Proyectos e iniciativas en ejecución. |
| [04_comercial/](04_comercial/) | *(opcional)* Pipeline y propuestas. |
| [05_finanzas/](05_finanzas/) | *(opcional)* Presupuesto, caja y cobros. |
| [06_comunicacion/](06_comunicacion/) | *(opcional)* Contenido y comunicación. |
| [07_equipo/](07_equipo/) | Equipo, reuniones internas y registro de decisiones. |
| [08_conocimiento/](08_conocimiento/) | SOPs (reglas), plantillas y tu voz. La "ley operativa". |
| [TASKS.md](TASKS.md) | Tus pendientes. |

Los módulos opcionales se activan según tu rol durante la configuración: un CEO usa casi todos; un líder de área quizá solo Relaciones, Iniciativas y Equipo.

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
| `/pipeline`, `/propuesta` | *(módulo comercial)* |
| `/configurar` | (Re)ejecuta el asistente de configuración. |

---

## 🧠 Cómo funciona por dentro

- **El comportamiento** vive en [CLAUDE.md](CLAUDE.md) — es estable y no cambia entre usuarios.
- **Tus datos** viven en `00_perfil/` y las demás carpetas — los rellenas tú (o el asistente).
- **Tus reglas** viven en [08_conocimiento/sops/](08_conocimiento/sops/) con *dueño único*: cada umbral o condición se define una sola vez; los comandos la referencian, nunca la duplican.
- Copitori usa las **herramientas (MCP)** que tengas conectadas (correo, calendario, CRM…). Si no tienes ninguna, funciona 100% con los archivos.

## 🔒 Privacidad
Todo vive en archivos locales en tu equipo. Lo que se sincroniza con servicios externos depende solo de las herramientas que tú conectes. El log de auditoría de herramientas (`.claude/logs/`) no se versiona.

## 📤 Reutilizar / compartir
Copia la carpeta `Copitori/` y entrégala a otra persona. Al abrirla y saludar, el asistente la configurará desde cero para su realidad. Para empezar limpio, basta con que `00_perfil/identidad.md` tenga `estado_configuracion: SIN_CONFIGURAR`.

---
Plantilla creada a partir de un copiloto ejecutivo real en producción.
