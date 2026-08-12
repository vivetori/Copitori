---
tipo: panel
tags:
  - panel
---

# 🏠 Panel de mando

> [!tip] Cómo usar este panel
> Es la portada de la bóveda. Desde Copitori, escribe `/resumen-dia` para el briefing de hoy.
> Desde Obsidian, sigue los enlaces. Los bloques `query` se rellenan solos con el buscador.

## Hoy

- 📓 **Bitácora de hoy** → nota diaria (`Cmd/Ctrl+P` → «Abrir nota de hoy»), se guarda en [09_bitacora/](09_bitacora/)
- ✅ **Pendientes** → [[TASKS]]
- 🎯 **Objetivos vigentes** → [[okrs]] · 📊 **Panel de KPIs** → [[01_objetivos/kpis|KPIs]]
- ⚠️ **Riesgos abiertos** → [[07_equipo/riesgos|registro de riesgos]]

### Tareas abiertas en toda la bóveda
```query
task-todo:""
```

---

## Los ejes

| | Dónde | Qué encuentras |
|---|---|---|
| 🎯 | [01_objetivos/](01_objetivos/) | El filtro estratégico: todo se prioriza contra esto |
| 🤝 | [02_relaciones/](02_relaciones/) | Clientes, prospectos, stakeholders, actas de reuniones |
| 🚀 | [03_iniciativas/](03_iniciativas/) | Proyectos en ejecución, con fases y riesgos |
| 💼 | [04_comercial/](04_comercial/) | Pipeline y propuestas *(módulo opcional)* |
| 💰 | [05_finanzas/](05_finanzas/) | Presupuesto, caja y cobros *(módulo opcional)* |
| 📣 | [06_comunicacion/](06_comunicacion/) | Contenido y vocería *(módulo opcional)* |
| 🧭 | [07_equipo/](07_equipo/) | Equipo, reuniones internas y [[decisiones]] |
| 📚 | [08_conocimiento/](08_conocimiento/) | SOPs, plantillas y tu voz — la ley operativa |
| 📓 | [09_bitacora/](09_bitacora/) | Un archivo por día: briefings y cierre |

---

## Radar

### Iniciativas en riesgo
```query
path:"03_iniciativas" ["estado":"en_riesgo"]
```

### Relaciones sin próximo paso definido
```query
path:"02_relaciones" -"Próximos pasos"
```

### Riesgos críticos y altos
```query
path:"07_equipo/riesgos" (Crítico OR Alto)
```

### Decisiones recientes
![[decisiones]]

---

## Reglas que rigen todo

- **Voz y estilo** → [[08_conocimiento/voz_y_estilo|voz y estilo]] — lo lee todo borrador externo
- **Seguimiento** → [[08_conocimiento/sops/seguimiento|seguimiento]] — umbrales de cuándo algo se está enfriando
- **Onboarding** → [[08_conocimiento/sops/onboarding|onboarding]] — arranque de relación o proyecto
- **Riesgos** → [[08_conocimiento/sops/riesgos|matriz de riesgos]] — cómo se evalúa y cada cuánto se revisa
- **Calificación de leads** → [[08_conocimiento/sops/calificacion_leads|calificación de leads]] *(comercial)*
- **Condiciones comerciales** → [[08_conocimiento/sops/condiciones_comerciales|condiciones comerciales]] *(comercial)*
- **Propuestas** → [[08_conocimiento/sops/propuestas|propuestas]] *(comercial)*

## Tu configuración

- Quién eres → [[identidad]]
- Tu organización → [[organizacion]]
- Módulos y herramientas activas → [[config_copiloto]]

---

## Comandos más usados

`/resumen-dia` · `/captura` · `/triage` · `/seguimiento` · `/reunion` · `/sintesis` · `/revision-semanal` · `/kpis` · `/junta` · `/guardar-reunion` · `/boveda`

Mantenimiento: `/instalar` (entorno y Obsidian) · `/configurar` (tu perfil)

## Tu equipo directivo

Pídelos por nombre cuando los necesites; si no, Copitori delega solo.

⚔️ `contradictor` — ataca tu decisión · 📜 `archivista` — memoria de la bóveda · 🔎 `investigador` — una persona u organización
⚠️ `analista-riesgos` · 💰 `analista-financiero` · 🤝 `negociador` · 👤 `gestor-de-equipo`
🎯 `analista-competencia` · ⚖️ `revisor-legal` · 📈 `estratega-comercial` · ✍️ `redactor`

> Guía de la bóveda Obsidian → [[OBSIDIAN]] · Bancos de skills y agentes → [[bancos_skills_y_agentes]]
