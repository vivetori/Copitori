# Módulo Proyectos / PMO — diseño

> Documento de diseño del módulo. Explica **qué piezas lo componen, por qué existen y cómo se
> enganchan** con el motor de Copitori. Las reglas no están aquí: viven en
> [sops/gestion_proyectos.md](sops/gestion_proyectos.md). La estructura de carpeta, en
> [03_iniciativas/README.md](../03_iniciativas/README.md). Versión 2026-10-12.

---

## 1. Para quién y para qué

Un director o gerente de proyectos, un líder de PMO, o cualquier líder que tenga a su cargo uno o
varios proyectos con sponsor, presupuesto y fecha comprometida. Al configurarse con ese rol, Copitori
se convierte en su **cerebro de formulación y gestión de proyectos**: arranca el proyecto con acta,
lo planifica, hace el corte semanal con valor ganado y semáforo honesto, controla los cambios, muestra
el portafolio y cierra con lecciones que cambian el siguiente proyecto.

Principio del repo que manda sobre todo lo demás: **una regla, un dueño**. Los umbrales de semáforo,
escalamiento, autoridad de cambios, reservas y cierre viven en un solo SOP; comandos, skills y agentes
lo referencian y nunca redefinen valores.

## 2. Qué ya existía y qué se extiende

| Ya existía | Qué hace el módulo con ello |
|---|---|
| `03_iniciativas/` con ficha simple ([iniciativa.md](plantillas/iniciativa.md)) | Se mantiene para iniciativas pequeñas. El módulo añade la **carpeta de proyecto** para las que tienen sponsor y presupuesto. |
| Skill `informe-de-estado` | Sigue dando la forma del informe hacia afuera. Ahora, en una carpeta de proyecto, el color sale del SOP y las cifras de `valor-ganado`. |
| Agente `analista-riesgos` + [sops/riesgos.md](sops/riesgos.md) | Misma matriz para los riesgos del proyecto (`<proyecto>/riesgos.md`); los altos y críticos se espejan en el registro global. |
| Agente `contradictor` | Antes de firmar un acta grande, de comprometer una línea base larga, de un cambio irreversible o de presentar una formulación. |
| Agente `gestor-de-equipo` | Carga real de PMs y responsables únicos cuando `/portafolio` detecta concentración. |
| Agente `redactor` | Documentos largos que salgan del proyecto (informe de cierre formal, propuesta de fase 2). |
| `/junta`, `/reunion`, `/guardar-reunion` | Sin cambios: las actas del proyecto van a `<proyecto>/reuniones/` con la misma plantilla. |
| `/resumen-dia`, `/revision-semanal`, `/captura` | Una o dos líneas nuevas: proyectos en rojo/ámbar, hitos de la semana, capturas al informe en curso. |
| Skill `postmortem` | Para un fracaso con costo real dentro del proyecto. `lecciones-aprendidas` cubre todo el proyecto, incluido lo que salió bien. |
| Skill `presentar-numeros`, `comunicacion-ejecutiva`, `crear-sop` | Se combinan: cifras, estructura del mensaje al sponsor, lecciones que se vuelven regla. |

## 3. Mapa: grupos de procesos PMI → artefacto → componente

| Grupo de procesos | Artefacto en `03_iniciativas/<proyecto>/` | Plantilla | Lo produce / lo usa |
|---|---|---|---|
| **Inicio** | `acta_constitucion.md` (ficha madre), `interesados.md` v1, `riesgos.md` inicial | [proyecto/acta_constitucion.md](plantillas/proyecto/acta_constitucion.md), [interesados.md](plantillas/proyecto/interesados.md), [riesgos.md](plantillas/proyecto/riesgos.md) | `/kickoff` · skills `acta-de-constitucion`, `registro-interesados` · agente `analista-riesgos` |
| **Inicio** *(opcional: público / cooperación)* | `marco_logico.md` | [marco_logico.md](plantillas/proyecto/marco_logico.md) | agente `formulador-proyectos` · skill `formulacion-marco-logico` |
| **Planificación** | `edt.md`, `cronograma.md` (línea base), plan de comunicación en `interesados.md` | [edt.md](plantillas/proyecto/edt.md), [cronograma.md](plantillas/proyecto/cronograma.md) | agente `planificador-proyectos` · skill `edt-y-cronograma` · `contradictor` si es largo |
| **Ejecución** | `reuniones/`, novedades en `estado/`, fichas de relación | [reunion.md](plantillas/reunion.md) | `/guardar-reunion`, `/reunion`, `/captura` |
| **Monitoreo y control** | `estado/AAAA-MM-DD.md`, frontmatter del acta, `cambios.md`, `riesgos.md`, [portafolio.md](../03_iniciativas/portafolio.md) | [estado.md](plantillas/proyecto/estado.md), [cambios.md](plantillas/proyecto/cambios.md) | `/estado-semanal`, `/cambio`, `/portafolio` · agente `controlador-proyectos` · skills `valor-ganado`, `control-de-cambios`, `informe-de-estado` |
| **Cierre** | `acta_cierre.md`, `lecciones_aprendidas.md`, acta con `estado: cerrado` | [acta_cierre.md](plantillas/proyecto/acta_cierre.md), [lecciones_aprendidas.md](plantillas/proyecto/lecciones_aprendidas.md) | `/cierre` · skills `lecciones-aprendidas`, `crear-sop`, `postmortem` |

### Dominios de desempeño de PMBOK 7 — dónde cae cada uno

| Dominio | Dónde vive en Copitori |
|---|---|
| Interesados | `interesados.md`, skill `registro-interesados`, `/reunion`, fichas de `02_relaciones/` |
| Equipo | Agente `gestor-de-equipo`, `07_equipo/`, columna Responsable de la EDT |
| Enfoque de desarrollo y ciclo de vida | Predictivo por defecto (línea base + control de cambios); un proyecto iterativo usa cortes más cortos y la misma EDT por entregables |
| Planificación | Agente `planificador-proyectos`, skill `edt-y-cronograma` |
| Trabajo del proyecto | Reuniones, `TASKS.md`, novedades del informe de estado |
| Entrega | Entregables con criterio de aceptación (acta y EDT), `acta_cierre.md` |
| Medición | Skill `valor-ganado`, semáforo del SOP, `/estado-semanal`, `/portafolio`, `/kpis` |
| Incertidumbre | `riesgos.md` + [sops/riesgos.md](sops/riesgos.md), reservas del SOP §5, `contradictor` |

Los 12 principios no se mapean a archivos: se reflejan en las reglas de los componentes (administración
responsable → nada sin registro; valor → criterio de éxito del acta; sistemas → espejos entre proyecto y
bóveda; liderazgo → `gestor-de-equipo`; adaptación → la línea base cambia solo por `/cambio`; calidad →
criterios de aceptación; complejidad y riesgo → `analista-riesgos` y `contradictor`; adaptabilidad y
resiliencia → plan de recuperación en el informe; cambio → control de cambios con autoridad declarada).

## 4. Componentes

### SOP (dueño único de las reglas)
[sops/gestion_proyectos.md](sops/gestion_proyectos.md): semáforo por SPI/CPI/hitos/bloqueos, escalamiento al
sponsor, ciclo de informe, niveles de autoridad de cambios con acumulados, reservas, riesgos del proyecto,
criterios de cierre, lecciones, cadencia de comunicación. Valores por defecto marcados como editables.

### Plantillas
[plantillas/proyecto/](plantillas/proyecto/): acta, interesados, EDT, cronograma, riesgos, cambios, estado,
lecciones, acta de cierre, marco lógico. Las reuniones usan [reunion.md](plantillas/reunion.md).

### Skills (se activan solas)
| Skill | Fase | Qué aporta |
|---|---|---|
| `acta-de-constitucion` | Inicio | Charter por etapas: objetivos medibles, alcance negativo, autoridad |
| `registro-interesados` | Inicio / cada fase | Poder/interés, postura por hechos, plan de comunicación |
| `edt-y-cronograma` | Planificación | Regla del 100 %, estimación con método, ruta crítica, Gantt en Excel si se pide |
| `valor-ganado` | Control | PV/EV/AC → SPI, CPI, EAC (tres fórmulas), con datos faltantes declarados |
| `control-de-cambios` | Control | Registro → impacto → alternativas → nivel → decisión → línea base |
| `lecciones-aprendidas` | Hitos / cierre | Lo bueno y lo malo, con dueño y destino (SOP, plantilla, checklist) |
| `formulacion-marco-logico` | Inicio *(opcional)* | Árboles, matriz de marco lógico, equivalencia MGA |

### Comandos
`/kickoff` · `/estado-semanal` · `/cambio` · `/portafolio` · `/cierre`. Mismo formato que el resto:
`description`, pasos, qué escribe, qué no hace. Todos leen herramientas conectadas solo si figuran en
[../00_perfil/config_copiloto.md](../00_perfil/config_copiloto.md), y si no, trabajan con archivos y lo dicen.

### Agentes (los que cumplen la regla "cuándo delegar" de CLAUDE.md)
| Agente | Regla que cumple | Lo usa |
|---|---|---|
| `planificador-proyectos` | Método propio y profundo (EDT, estimación, secuencia, ruta crítica) + lee lecciones de otros proyectos | Después de `/kickoff`; re-planificación por cambio aprobado |
| `controlador-proyectos` | Lee mucho para devolver poco (cronograma, cambios, riesgos, actas, informes previos → semáforo y tres líneas) | `/estado-semanal`, `/portafolio` |
| `formulador-proyectos` | Método propio y profundo (marco lógico / MGA); opcional | Formulación pública o con cooperación |

## 5. Lo que no se creó, y por qué

- **Agente de interesados / comunicación.** No cumple la regla: la skill `registro-interesados` resuelve el método, `/reunion` prepara cada conversación, `investigador` investiga a quien no se conoce y `gestor-de-equipo` pone las reglas de trato a personas. Un agente más habría sido una capa sin valor.
- **Agente de riesgos del proyecto.** `analista-riesgos` ya lo es; solo cambió dónde escribe (el `riesgos.md` del proyecto) y qué espeja al global.
- **Comando `/planificar`.** La planificación la pide `/kickoff` al terminar y la ejecuta el agente; un comando aparte duplicaba el punto de entrada.
- **Comando `/informe` al sponsor.** El borrador sale de `/estado-semanal`; un segundo comando habría producido un segundo informe con otra fuente.
- **Carpeta `_archivo/` para cerrados.** Mover carpetas rompe wikilinks (regla dura de CLAUDE.md). Un cerrado queda en su sitio con `estado: cerrado` y sale de la tabla de activos.
- **Cálculo automático (scripts) del valor ganado.** La tabla del cronograma es pequeña; el agente la calcula y declara el método. Un script escondería supuestos (regla de avance, % planificado lineal) que deben verse.
- **Metodologías ágiles como módulo aparte.** El ciclo (acta → línea base → cortes → cambios → cierre) sirve a un proyecto iterativo con cortes de sprint; si un usuario necesita backlog y velocidad, es una Ola 4 propia (ver [bancos_skills_y_agentes.md](bancos_skills_y_agentes.md)).

## 6. Preset de rol en `/configurar`

Si en la Etapa 1 el usuario se identifica como gestor/director de proyectos, líder de PMO o similar, la
Etapa 4 enciende **Proyectos / PMO**, **Relaciones** y **Equipo y decisiones**, registra la herramienta
de gestión de tareas/proyectos si la tiene, y el cierre propone como primer paso `/kickoff` con su
proyecto más importante. Los demás módulos siguen siendo opcionales.

## 7. Datos vivos: qué usa cada comando si está conectado

| Herramienta (config_copiloto) | Quién la usa | Para qué |
|---|---|---|
| Gestión de tareas/proyectos (Jira, Asana, ClickUp, Planner…) | `/estado-semanal`, `controlador-proyectos` | % avance real por tarea; el cronograma de la bóveda es el espejo |
| Transcripción de reuniones | `/estado-semanal`, `/guardar-reunion` | Reuniones de la semana sin pegar notas |
| Calendario | `/kickoff`, `/estado-semanal`, `planificador-proyectos` | Evento de kickoff; hitos y reuniones próximas; vacaciones y cierres |
| Finanzas | `/cierre`, `analista-financiero` | Costo real y liquidación |

Sin ninguna, el módulo funciona al 100 % con los archivos y lo dice en cada corte.

## 8. Ejemplo incluido

[`03_iniciativas/_ejemplo_ampliacion_planta/`](../03_iniciativas/_ejemplo_ampliacion_planta/): proyecto
ficticio "Ampliación Planta Norte" ($2.400M COP, 32 semanas, semana 21, SPI 0,87, CPI 0,94, EAC $2.560M,
segundo corte en ámbar, un cambio de nivel 3 pendiente). Todos los archivos del módulo, rellenos de forma
corta, para ver el resultado y para demos en vivo. Se borra cuando el usuario tiene el suyo.
