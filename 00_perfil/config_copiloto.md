# Configuración de Copitori

> Lo rellena el asistente de configuración (Etapas 4 y 5). Define qué módulos usa
> Copitori y qué herramientas tiene para buscar datos vivos.

## Módulos activos
> Marca `[x]` los que aplican a tu rol. Los inactivos siguen existiendo pero Copitori
> no los incluye en briefings ni revisiones.

- [x] **Relaciones** (`02_relaciones/`) — clientes o stakeholders
- [x] **Iniciativas** (`03_iniciativas/`) — proyectos e iniciativas en ejecución (fichas simples)
- [ ] **Proyectos / PMO** (`03_iniciativas/<proyecto>/`) — acta, EDT, cronograma, valor ganado, cambios, portafolio y cierre. **Desactivado por defecto**: se enciende solo si lo eliges en `/configurar` (Etapa 4; Copitori lo propone al detectar un rol de director de proyectos / PMO). Mientras esté `[ ]`, ningún comando ni briefing habla de proyectos. Umbrales configurables con `/configurar proyectos`; reglas: [08_conocimiento/sops/gestion_proyectos.md](../08_conocimiento/sops/gestion_proyectos.md)
- [x] **Equipo y decisiones** (`07_equipo/`)
- [ ] **Comercial** (`04_comercial/`) — pipeline y propuestas
- [ ] **Finanzas** (`05_finanzas/`) — presupuesto y caja
- [ ] **Comunicación** (`06_comunicacion/`) — contenido y marketing

## Herramientas conectadas (MCP)
> Marca lo que tengas conectado. Si algo no está, Copitori trabaja con los archivos
> locales y te lo dice. No asumas que una herramienta existe si no está aquí.

| Necesidad | Herramienta | ¿Conectada? |
|---|---|---|
| Correo | [ej. Gmail] | [ ] |
| Calendario | [ej. Google Calendar] | [ ] |
| Documentos / Drive | [ej. Google Drive] | [ ] |
| Notas / BD | [ej. Notion] | [ ] |
| CRM / enriquecimiento | [ej. Apollo, HubSpot] | [ ] |
| Transcripción de reuniones | [ej. Fireflies] | [ ] |
| Gestión de tareas / proyectos | [ej. Jira, Asana, ClickUp, Planner] | [ ] *(módulo Proyectos / PMO: avance real por tarea)* |
| Finanzas | [ej. wallet, ERP] | [ ] |
| Automatización | [ej. n8n, Make] | [ ] |
| Scraping / rastreo web | [ej. Apify] | [ ] *(módulo Proyectos / PMO: `vigia-convocatorias`)* |

## Plugins de skills activos
> Skills externas instaladas en Claude Code. Copitori las usa como apoyo, pero **sus comandos
> propios mandan**: conocen tus SOPs y tu voz. Si una skill externa trae umbrales o condiciones
> propias, ignóralos y usa los de [08_conocimiento/sops/](../08_conocimiento/sops/).

| Plugin | Origen | Para qué | ¿Activo? |
|---|---|---|---|
| `document-skills` | Anthropic oficial | Word, Excel, PowerPoint, PDF | [x] |
| `productivity` | Anthropic oficial | Tareas y memoria de trabajo | [x] |
| `sales` | Anthropic oficial | Investigación de cuentas, prep de llamadas, pipeline | [ ] *(módulo Comercial)* |
| `finance` | Anthropic oficial | Estados financieros, variaciones, cierre | [ ] *(módulo Finanzas)* |
| `marketing` | Anthropic oficial | Campañas, contenido, revisión de marca | [ ] *(módulo Comunicación)* |
| `operations` / `product-management` | Anthropic oficial | Apoyo de formato: informes de estado, evaluación de riesgos, solicitudes de cambio, planificación de sprints | [ ] *(módulo Proyectos / PMO — los SOP locales mandan)* |
| `skill-creator` | Anthropic oficial | Crear tus propias skills de negocio | [x] |

> Catálogo evaluado de bancos externos y qué vale la pena traer:
> [08_conocimiento/bancos_skills_y_agentes.md](../08_conocimiento/bancos_skills_y_agentes.md).

## Preferencias operativas
- **Hora del briefing diario**: [ej. 8:00]
- **Día de la revisión semanal**: [ej. viernes]
- **Moneda**: [ej. COP / USD / EUR]
