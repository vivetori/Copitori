---
description: (módulo Proyectos / PMO) Vista de todos los proyectos — semáforo, próximo hito, bloqueos y las decisiones que esperan por ti
---

Hazme la vista de portafolio. Una pantalla: lo que necesito para decidir dónde poner mi atención esta semana.

## 0. Módulo activo
Comprueba en [00_perfil/config_copiloto.md](../../00_perfil/config_copiloto.md) que **Proyectos / PMO** esté marcado `[x]`. Si no, responde solo esto y no sigas: «El módulo Proyectos / PMO está desactivado. Actívalo con `/configurar` (Etapa 4).»
Si está activo pero no hay ninguna carpeta de proyecto, dilo en una línea y propón `/kickoff`.

Criterios de semáforo y escalamiento: [08_conocimiento/sops/gestion_proyectos.md](../../08_conocimiento/sops/gestion_proyectos.md). Destino: [03_iniciativas/portafolio.md](../../03_iniciativas/portafolio.md).

## 1. Fuentes
Cada carpeta de [03_iniciativas/](../../03_iniciativas/) con `acta_constitucion.md`: el frontmatter del acta (`estado`, `fase`, `semaforo`, `spi`, `cpi`, `ultimo_corte`, `sponsor`, `pm`, `fin_objetivo`, `presupuesto`), el último informe en `estado/`, los cambios en `solicitado` / `en_evaluacion` de `cambios.md`, los riesgos críticos de `riesgos.md`, el próximo hito de `cronograma.md`.
Las fichas simples y las startups GoSmartUp de la carpeta no entran aquí: se ven en `/revision-semanal` y `/playbook`.

**No recalcules el valor ganado**: usa el último corte. Si son más de tres proyectos o varios no tienen corte reciente, delega la lectura en el agente `controlador-proyectos` (uno por proyecto, en paralelo) y quédate con sus resúmenes.

## 2. Qué construyes

**Tabla de activos** (`estado` activo o en_riesgo), ordenada rojo → ámbar → verde → sin dato:

| Proyecto | Fase | Semáforo | SPI | CPI | Último corte | Próximo hito (fecha) | Bloqueo | Decisión pendiente (de quién) |

Un proyecto sin corte en más de 7 días va como **sin dato**, no con su último color (SOP §1).

**Secciones después de la tabla**:
1. **Decisiones que esperan por mí** — cambios de nivel 2–3, escaladas abiertas, aprobaciones de entregables; con desde cuándo y el costo de esperar. Marca las que superan el plazo del SOP §2.
2. **Hitos de los próximos 14 días** — proyecto, hito, fecha, estado.
3. **Proyectos sin corte reciente** — y a quién tocaría pedírselo.
4. **Capacidad** — si una misma persona es PM o responsable único en tres o más proyectos activos, dilo; si hay que mirar carga de verdad, delega en el agente `gestor-de-equipo`.
5. **Cerrados en el periodo** — una línea por proyecto, con desvío final de fecha y costo.

Cifras con la skill `presentar-numeros`: moneda, base y una lectura por número.

## 3. Escribe
Reemplaza el contenido de [03_iniciativas/portafolio.md](../../03_iniciativas/portafolio.md) con la vista nueva y la fecha de corte; conserva la sección «Historial» añadiendo una línea con qué cambió frente a la vista anterior (proyectos que cambiaron de color, nuevos, cerrados). Enlaza cada proyecto con `[[Nombre del proyecto]]`.

Agrega a [TASKS.md](../../TASKS.md) las decisiones pendientes que no estén ya, con fecha límite.

## Cierre
- **Titular en una línea**: cuántos proyectos, cuántos en rojo/ámbar, cuánto presupuesto total en riesgo.
- **Las 2 cosas que tengo que decidir esta semana** y qué pasa si no.
- **Una alerta honesta**: el proyecto que se ve verde pero tiene algo de fondo (ámbar reiterado, cambios acumulándose, PM saturado).

**No hagas**: recalcular SPI/CPI (eso es `/estado-semanal`), inventar un corte para un proyecto sin datos, incluir fichas simples o startups.
