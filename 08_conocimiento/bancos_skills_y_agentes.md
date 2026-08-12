# Bancos de skills y agentes — qué adoptar para Copitori

> Evaluado el **2026-08-11**. Las estrellas y fechas vienen de la API de GitHub ese día.
> Este documento no es un directorio: es un **filtro**. La mayoría de estos repos están hechos
> para equipos de software, no para un copiloto ejecutivo. Aquí está lo que sí encaja y lo que no.

---

## El criterio

Copitori es un copiloto de **decisiones de negocio**, no de código. Un banco de skills sirve si:

1. **Encaja con el rol** — briefings, relaciones, propuestas, decisiones, finanzas, comunicación.
2. **Está vivo** — actividad en los últimos 3 meses. Un repo parado en 2025 acumula deuda.
3. **Tiene licencia clara** — MIT o Apache. Vas a copiar archivos a tu espacio.
4. **No compite con los SOPs** — [sops/](sops/) tiene *dueño único* de cada regla. Una skill que
   traiga sus propios umbrales de seguimiento o condiciones comerciales **rompe ese principio**.

El punto 4 es el que descarta más cosas. Ampliar el catálogo es fácil; mantener la coherencia, no.

---

## Lo que ya tienes sin instalar nada

Antes de ir a GitHub: el **marketplace oficial de Anthropic** ya está disponible en esta sesión
y trae plugins de negocio listos, mantenidos por Anthropic:

| Plugin | Skills relevantes para Copitori |
|---|---|
| `sales` | `daily-briefing`, `call-prep`, `call-summary`, `account-research`, `pipeline-review`, `forecast`, `draft-outreach`, `competitive-intelligence` |
| `marketing` | `campaign-plan`, `content-creation`, `brand-review`, `competitive-brief`, `email-sequence`, `performance-report`, `seo-audit` |
| `finance` | `financial-statements`, `variance-analysis`, `close-management`, `reconciliation`, `journal-entry` |
| `productivity` | `task-management`, `memory-management`, `start`, `update` |
| `document-skills` | `docx`, `xlsx`, `pptx`, `pdf` — siempre activas |

**Empieza por aquí.** Cubre buena parte de lo que buscarías fuera, con cero riesgo de licencia
y sin duplicar reglas. El solapamiento con los comandos propios (`sales:daily-briefing` vs.
`/resumen-dia`) es real: los comandos de Copitori ganan, porque conocen tus SOPs y tu voz.

---

## Bancos evaluados

### ✅ Adoptar

| Repo | ★ | Últ. actividad | Licencia | Qué tomar |
|---|---:|---|---|---|
| [anthropics/skills](https://github.com/anthropics/skills) | 168.2k | 2026-08-07 | — | Referencia canónica del formato. `doc-coauthoring`, `internal-comms`, `brand-guidelines`, `skill-creator`. Es el estándar contra el que escribir tus skills. |
| [alirezarezvani/claude-skills](https://github.com/alirezarezvani/claude-skills) | 24.3k | 2026-08-09 | MIT | El mejor encaje ejecutivo. Carpetas `c-level-advisor`, `business-operations`, `productivity` (`weekly-review`, `deep-work`, `capture`, `meetings`, `reflect`), `research-ops`, `commercial`. Instalable como marketplace. |
| [w95/awesome-claude-corporate-skills](https://github.com/w95/awesome-claude-corporate-skills) | 150 | 2026-02-26 | MIT | 166 skills organizadas **por rol corporativo**. `01-executive-leadership` trae `board-meeting-prep`, `strategic-planning`, `kpi-dashboard`, `risk-assessment`, `executive-communication`, `knowledge-synthesis`. Pocas estrellas, pero es el catálogo con mejor taxonomía para un CEO. |
| [AgriciDaniel/claude-obsidian](https://github.com/AgriciDaniel/claude-obsidian) | 10.8k | 2026-08-01 | MIT | Segundo cerebro Obsidian + Claude Code. Sus flujos de mantenimiento del grafo y citación de fuentes son la mejor referencia para evolucionar `/boveda`. |

### 🔍 Consultar, no importar

| Repo | ★ | Últ. actividad | Para qué |
|---|---:|---|---|
| [obra/superpowers](https://github.com/obra/superpowers) | 270.8k | 2026-08-08 | Framework de metodología. Casi todo es desarrollo, pero `brainstorming`, `writing-plans` y `writing-skills` son transferibles. Lee cómo estructura una skill antes de escribir la tuya. |
| [ComposioHQ/awesome-claude-skills](https://github.com/ComposioHQ/awesome-claude-skills) | 72.3k | 2026-08-10 | La lista curada más completa. Punto de partida para buscar algo puntual. |
| [hesreallyhim/awesome-claude-code](https://github.com/hesreallyhim/awesome-claude-code) | 52.2k | 2026-08-12 | Recursos de Claude Code en general: hooks, comandos, patrones. |
| [wshobson/agents](https://github.com/wshobson/agents) | 38.7k | 2026-08-05 | 89 plugins. Solo ~8 no son de código: `business-analytics`, `startup-business-analyst`, `content-marketing`, `customer-sales-automation`, `hr-legal-compliance`, `pptx-deck-creation`, `social-publishing`, `agent-orchestration`. Instala plugins sueltos, nunca el marketplace entero. |
| [mimurchison/claude-chief-of-staff](https://github.com/mimurchison/claude-chief-of-staff) · [jdpolasky/ai-chief-of-staff](https://github.com/jdpolasky/ai-chief-of-staff) · [jimprosser/claude-code-cos](https://github.com/jimprosser/claude-code-cos) | 425 · 90 · 191 | 2026-02 · 2026-08 · 2026-03 | Sistemas *competidores* de Copitori, no complementos. Léelos por las ideas: `goals.yaml` como fuente única, log de aprendizajes por sesión, «Must/Should/Could» en el briefing. El de jdpolasky corre sobre Obsidian. |

### ❌ Descartar para este proyecto

| Repo | Por qué |
|---|---|
| [VoltAgent/awesome-claude-code-subagents](https://github.com/VoltAgent/awesome-claude-code-subagents) (24.2k) | 100+ subagentes, todos de desarrollo. Cero encaje. |
| [BehiSecc/awesome-claude-skills](https://github.com/BehiSecc/awesome-claude-skills) (9.9k) | Seguridad de aplicaciones (OWASP, ASVS). Excelente, fuera de dominio. |
| [wshobson/commands](https://github.com/wshobson/commands) (2.6k) · [0xfurai/claude-code-subagents](https://github.com/0xfurai/claude-code-subagents) (1.0k) · [vijaythecoder/awesome-claude-agents](https://github.com/vijaythecoder/awesome-claude-agents) (4.4k) | Sin actividad desde 2025. |
| [claude-office-skills/skills](https://github.com/claude-office-skills/skills) (376) | Buena idea, parada desde enero 2026 y solapa con `document-skills` oficial. |

---

## Cómo instalar

**Repos con `.claude-plugin/`** (anthropics/skills, alirezarezvani, wshobson, obra) se instalan
como marketplace, sin copiar archivos:

```
/plugin marketplace add alirezarezvani/claude-skills
/plugin install <nombre-del-plugin>@claude-skills
```

**Repos sin `.claude-plugin/`** (w95, claude-office-skills) hay que copiarlos a mano a
`.claude/skills/<nombre>/SKILL.md`. Revisa el contenido antes: una skill es un prompt que se
ejecuta con tus permisos y tus datos.

> **Instala de a una.** Cada skill instalada consume contexto en cada sesión. Veinte skills
> mediocres degradan más que las cinco buenas que aportan.

---

## Ruta de evolución de Copitori

### ✅ Ola 1 — Aprovechar lo que ya está *(hecho 2026-08-11)*
- Plugins oficiales activos: `document-skills`, `productivity`, `skill-creator`. Los de módulo
  (`sales`, `finance`, `marketing`) se activan cuando se active su módulo.
- Declarados en [../00_perfil/config_copiloto.md](../00_perfil/config_copiloto.md), igual que los MCP,
  con la **regla de precedencia**: los comandos de Copitori mandan sobre cualquier skill externa.
- `/boveda` disponible para dejar la bóveda limpia antes de añadir nada.

### ✅ Ola 2 — Cerrar los huecos *(hecho 2026-08-11)*
Portados a español y enganchados a los SOPs. **No se instaló ninguna skill de terceros**: se leyó
el material fuente y se reescribió, porque las originales traen sus propias reglas y romperían el
principio de dueño único.

| Hueco | Fuente consultada | Entregado |
|---|---|---|
| Preparación de junta / comité | `w95/board-meeting-prep` | [`/junta`](../.claude/commands/junta.md) |
| Panel de KPIs contra OKRs | `w95/kpi-dashboard` | [`/kpis`](../.claude/commands/kpis.md) + [01_objetivos/kpis.md](../01_objetivos/kpis.md) |
| Registro y seguimiento de riesgos | `w95/risk-assessment` | agente [`analista-riesgos`](../.claude/agents/analista-riesgos.md) + [SOP](sops/riesgos.md) + [registro](../07_equipo/riesgos.md) |
| Síntesis de conocimiento | `w95/knowledge-synthesis` + `claude-obsidian` | [`/sintesis`](../.claude/commands/sintesis.md) |
| Captura rápida al vuelo | `alirezarezvani/productivity/capture` | [`/captura`](../.claude/commands/captura.md) |

Qué se cambió al portar: español y tono ejecutivo; se quitaron los ejemplos de SaaS y e-commerce
(Copitori sirve a cualquier rol); los umbrales de riesgo pasaron a [sops/riesgos.md](sops/riesgos.md)
en vez de vivir dentro del prompt; y todo escribe en la bóveda con wikilinks en vez de devolver texto suelto.

### ✅ Ola 3 — Skills que se activan solas *(hecho 2026-08-12)*
Mismo método que la Ola 2: se leyó el fuente y se reescribió. El filtro fue duro — **una skill
solo entra si se dispara sola**. La mayoría de lo que estos repos llaman "skill" es en realidad
un comando (`board-meeting-prep`, `daily-briefing`, `contract-review`): eso ya está resuelto aquí
como comando o como agente, y duplicarlo habría creado dos caminos para lo mismo.

| Skill | Fuente consultada | Se dispara al… |
|---|---|---|
| [comunicacion-ejecutiva](../.claude/skills/comunicacion-ejecutiva/) | `w95/executive-communication` | Redactar algo de alto impacto |
| [caso-de-negocio](../.claude/skills/caso-de-negocio/) | `w95/business-case-builder` | Justificar una inversión |
| [postmortem](../.claude/skills/postmortem/) | `w95/incident-postmortem` | Analizar algo que salió mal |
| [crear-sop](../.claude/skills/crear-sop/) | `w95/sop-builder` | Detectar un proceso repetible |
| [informe-de-estado](../.claude/skills/informe-de-estado/) | `w95/project-status-report` | Reportar avance hacia afuera |
| [presentar-numeros](../.claude/skills/presentar-numeros/) | *(propia — no existe equivalente)* | Poner cifras en un entregable |

Cambios al portar: `incident-postmortem` venía de operaciones de TI (despliegues, logs, PagerDuty)
y se reencuadró a fracasos de negocio; `project-status-report` traía umbrales de presupuesto
codificados que se eliminaron; `business-case-builder` traía modelos financieros de SaaS que se
sustituyeron por delegación en el agente `analista-financiero`.

### Ola 4 — Lo que ningún banco te va a dar *(pendiente)*
Las skills que codifican **tu** negocio en concreto: metodología de cotización, criterios de
"cliente ideal", tu ritual de cierre de mes, cómo calificas a un proveedor. Ahí está la ventaja
que no se descarga. La skill [crear-sop](../.claude/skills/crear-sop/) y `skill-creator` (oficial)
las construyen; [.claude/skills/README.md](../.claude/skills/README.md) explica cómo.

---

## Higiene

- **Una regla, un dueño.** Si una skill importada trae umbrales o condiciones propias, bórralos y
  apunta al SOP. Dos fuentes de verdad es peor que ninguna.
- **Español y tono ejecutivo.** Todo lo importado viene en inglés y con relleno. Reescríbelo.
- **Revisa antes de instalar.** Una skill de terceros es un prompt con tus permisos sobre tus datos.
- **Poda cada trimestre.** Lo que no usaste en 90 días, fuera.
