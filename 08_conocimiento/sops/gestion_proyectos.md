# SOP — Gestión de proyectos (módulo Proyectos / PMO)

> **Dueño único de esta regla.** Aquí viven los criterios de semáforo, los umbrales de escalamiento
> al sponsor, el ciclo de informe, la autoridad de control de cambios, la reserva de contingencia,
> la cadencia de comunicación y los criterios de cierre de un proyecto.
> Lo usan: `/kickoff`, `/estado-semanal`, `/cambio`, `/portafolio`, `/cierre`, los agentes
> `planificador-proyectos`, `controlador-proyectos` y `formulador-proyectos`, y las skills
> `acta-de-constitucion`, `edt-y-cronograma`, `registro-interesados`, `valor-ganado`,
> `control-de-cambios`, `lecciones-aprendidas` e `informe-de-estado`. **Ninguno define valores propios.**
> **No define**: la matriz de riesgos ([riesgos.md](riesgos.md)), los plazos de seguimiento de
> compromisos ([seguimiento.md](seguimiento.md)) ni el arranque de una relación ([onboarding.md](onboarding.md)).
> Las fórmulas de valor ganado son método, no regla: están en la skill `valor-ganado`.
> Aplica solo con el módulo **Proyectos / PMO** activo en [config_copiloto.md](../../00_perfil/config_copiloto.md).

## 0. Parámetros — valores por defecto

> **Valores por defecto; edítalos aquí cuando quieras o pídeselo a Copitori** (`/configurar proyectos`
> o "ajusta los umbrales del semáforo"). Es la **única** tabla con números de este SOP: las secciones
> de abajo explican la lógica y citan el código del parámetro. Al cambiar un valor, anota la fecha en «Cambios».

| Código | Parámetro | Valor por defecto | Lo usa |
|---|---|---|---|
| **S1** | SPI y CPI mínimos para 🟢 verde | ≥ 0,95 | Semáforo |
| **S2** | SPI y CPI mínimos para 🟡 ámbar (por debajo es 🔴 rojo) | ≥ 0,85 | Semáforo |
| **S3** | Desvío máximo de hito pendiente o fecha fin para 🟢 verde | 5 días hábiles | Semáforo |
| **S4** | Desvío máximo de hito pendiente o fecha fin para 🟡 ámbar (más es 🔴 rojo) | 15 días hábiles | Semáforo |
| **S5** | EAC máximo sobre el presupuesto base para 🟡 ámbar (más es 🔴 rojo) | +10 % | Semáforo |
| **S6** | Cortes consecutivos en ámbar que disparan aviso al sponsor con plan de recuperación | 2 | Escalamiento |
| **S7** | Cortes consecutivos en ámbar que convierten el proyecto en rojo | 3 | Semáforo |
| **S8** | Días sin corte para que un proyecto aparezca como «sin dato» | 7 | `/portafolio`, `/resumen-dia` |
| **E1** | Plazo para resolver una solicitud de cambio fuera de la autoridad del PM | 5 días hábiles | Escalamiento |
| **E2** | Días de bloqueo por un tercero a partir de los cuales se escala al sponsor | 10 días hábiles | Escalamiento |
| **E3** | Días de decisión pendiente del sponsor a partir de los cuales se recuerda con el costo de esperar | 5 días hábiles | Escalamiento, `/seguimiento` |
| **C1** | Nivel 1 (PM decide): costo máximo del cambio | ≤ 2 % del presupuesto base | Control de cambios |
| **C2** | Nivel 1 (PM decide): plazo máximo del cambio en la fecha fin | ≤ 5 días hábiles | Control de cambios |
| **C3** | Nivel 2 (sponsor): costo máximo del cambio | ≤ 10 % del presupuesto base | Control de cambios |
| **C4** | Nivel 2 (sponsor): plazo máximo del cambio | ≤ 20 días hábiles | Control de cambios |
| **C5** | Acumulado de cambios de nivel 1 que hace subir de nivel al siguiente | 5 % del presupuesto o 10 días hábiles | Control de cambios |
| **R1** | Reserva de contingencia sobre el presupuesto base | 10 % | Acta, riesgos |
| **I1** | Corte de control (`/estado-semanal`) | Semanal, el día de revisión semanal de [config_copiloto.md](../../00_perfil/config_copiloto.md) | Ciclo de informe |
| **I2** | Informe al sponsor | Semanal si ámbar o rojo; quincenal si verde | Ciclo de informe |
| **I3** | Comité con el sponsor | Quincenal; mensual si verde | Ciclo de informe |
| **I4** | Cadencia mínima por estrategia de interesado: gestionar de cerca / mantener satisfecho / mantener informado / monitorear | Semanal / quincenal / mensual / al cambiar de fase | Comunicación |
| **L1** | Lecciones aprendidas al cierre (mínimo – máximo) | 3 – 10 | Cierre |

## 1. Semáforo del proyecto

Se calcula en cada corte. **El color del proyecto es el peor de las cuatro columnas.**

| Color | Cronograma (SPI) | Costo (CPI) | Hitos pendientes y fecha fin | Bloqueos y riesgos |
|---|---|---|---|---|
| 🟢 `verde` | ≥ S1 | ≥ S1 | Desvío estimado ≤ S3 | Sin bloqueo externo; sin riesgo crítico abierto |
| 🟡 `ambar` | ≥ S2 y < S1 | ≥ S2 y < S1 | Desvío estimado > S3 y ≤ S4; EAC ≤ S5 | Riesgo alto o crítico **con** mitigación en curso; bloqueo que el equipo aún puede resolver |
| 🔴 `rojo` | < S2 | < S2 | Desvío estimado > S4, o EAC > S5 | Bloqueo que **no** se resuelve sin el sponsor; riesgo crítico sin mitigación |

El desvío se mide contra la **fecha comprometida** de la línea base vigente. Un hito ya cumplido con desvío es historia (y lección), no color.

Reglas:
- **Ámbar S7 cortes seguidos es rojo.** Se nombra así aunque los números no hayan empeorado.
- **Rojo implica `estado: en_riesgo`** en el acta. Al volver a verde o ámbar, `estado: activo`.
- Sin datos de costo, el semáforo se calcula con SPI, hitos y bloqueos **y se dice** que falta el costo. Sin datos de avance, solo con hitos y bloqueos. Nunca se pone verde por falta de información.
- El semáforo se escribe en el frontmatter del acta (`semaforo`, `spi`, `cpi`, `ultimo_corte`) y en el informe de la semana. Un proyecto sin corte en más de S8 días aparece como **sin dato** en `/portafolio`, no con su último color.

## 2. Escalamiento al sponsor

| Situación | Qué se hace | Cuándo |
|---|---|---|
| Semáforo rojo | Informe al sponsor con causa, opciones y recomendación | El mismo día del corte |
| Ámbar en S6 cortes consecutivos | Aviso en el informe semanal con plan de recuperación fechado | En el informe de ese corte |
| Solicitud de cambio fuera de la autoridad del PM | Pasa al nivel que corresponda (punto 4) | ≤ E1 desde la solicitud |
| Riesgo crítico nuevo o materializado | Al sponsor y al siguiente `/resumen-dia`; cadencia de [riesgos.md](riesgos.md) | Al detectarlo |
| Bloqueo que depende de un tercero | Al sponsor, con la petición concreta y la consecuencia de no destrabarlo | Al superar E2 |
| Decisión pendiente del sponsor | Recordatorio con el costo de esperar | Al superar E3; aparece en `/seguimiento` y `/portafolio` |

Toda escalada lleva **petición concreta**: qué se necesita, de quién y para cuándo. Sin eso es una queja, no una escalada.

## 3. Ciclo de informe

| Qué | Cadencia | Dónde queda |
|---|---|---|
| Corte de control (`/estado-semanal`) | I1 | `<proyecto>/estado/AAAA-MM-DD.md` + frontmatter del acta |
| Informe al sponsor | I2 | Borrador en el mismo informe; se envía solo con tu OK |
| Vista de portafolio (`/portafolio`) | Tras los cortes de I1 | [03_iniciativas/portafolio.md](../../03_iniciativas/portafolio.md) |
| Reunión de seguimiento del equipo | Semanal | `<proyecto>/reuniones/` con `/guardar-reunion` |
| Comité con el sponsor | I3 | idem |
| Revisión de interesados y plan de comunicación | Al cambiar de fase | `<proyecto>/interesados.md` |
| Lección aprendida | Al cumplirse cada hito (opcional) y al cierre (obligatoria) | `<proyecto>/lecciones_aprendidas.md` |

Formato del informe hacia afuera: skill `informe-de-estado`. Las cifras siguen `presentar-numeros` y `valor-ganado`.

## 4. Control de cambios — autoridad

Un cambio es cualquier modificación de la **línea base** (alcance, cronograma o presupuesto aprobados). Se clasifica por el **mayor** de sus impactos:

| Nivel | Quién decide | Umbral |
|---|---|---|
| 1 | PM — decide, registra e informa | Costo ≤ C1 **y** plazo ≤ C2 **y** sin cambio de alcance ni de objetivos |
| 2 | Sponsor | Costo ≤ C3, o plazo ≤ C4, o **cualquier** cambio de alcance |
| 3 | Comité directivo / junta | Costo > C3, o plazo > C4, o cambio de objetivos o del caso de negocio |

Reglas:
- **Nada se ejecuta sin registro** en `<proyecto>/cambios.md` con impacto en alcance, tiempo, costo y riesgo. "Un favor pequeño" también es un cambio.
- **Los acumulados cuentan.** Cuando la suma de cambios de nivel 1 supera C5, el siguiente cambio sube de nivel aunque por sí solo no lo supere.
- Un cambio `aprobado` actualiza la línea base (EDT, cronograma, presupuesto) **en el mismo cambio** y deja constancia de la versión anterior.
- Toda decisión de nivel 2 o 3 se registra además en [07_equipo/decisiones.md](../../07_equipo/decisiones.md).
- Estados: `solicitado` → `en_evaluacion` → `aprobado` · `rechazado` · `diferido` → `implementado`.

## 5. Reservas

- **Reserva de contingencia**: R1 del presupuesto base, para riesgos identificados. Se consume solo con un cambio registrado que cite el riesgo.
- **Reserva de gestión**: la decide el sponsor en el acta (puede ser 0). Nunca la usa el PM por su cuenta.
- El presupuesto que se compara con el valor ganado es el **base sin reservas** (BAC).

## 6. Riesgos del proyecto

- Viven en `<proyecto>/riesgos.md` con la matriz, categorías, estados y cadencia de [riesgos.md](riesgos.md). No se inventa otra escala.
- Se **espejan** en [07_equipo/riesgos.md](../../07_equipo/riesgos.md) los de nivel alto o crítico y los que amenazan un objetivo de [01_objetivos/okrs.md](../../01_objetivos/okrs.md). El espejo enlaza al proyecto con `[[Nombre del proyecto]]`.
- Un riesgo materializado se convierte en cambio (`/cambio`) si toca la línea base, y en lección aprendida siempre.

## 7. Cierre

Un proyecto se cierra —por entrega o por cancelación— cuando se cumple todo esto:

1. Entregables aceptados **por escrito** por el sponsor o el cliente (correo o acta vale).
2. Cambios: ninguno en `solicitado` o `en_evaluacion`; los aprobados están `implementado`.
3. Riesgos: todos `cerrado`, `materializado` o transferidos a operación con dueño.
4. Finanzas: costo final registrado contra el presupuesto; facturación o liquidación cerradas si el módulo Finanzas está activo.
5. Lecciones aprendidas escritas (L1) y las permanentes convertidas en regla con la skill `crear-sop`.
6. Relación en [02_relaciones/](../../02_relaciones/) actualizada con el resultado y el siguiente paso (garantía, siguiente fase, nada).
7. Acta de cierre firmada y frontmatter del acta en `estado: cerrado` · `fase: cerrado`.

Un proyecto cancelado sigue el mismo checklist. La causa de la cancelación queda en [07_equipo/decisiones.md](../../07_equipo/decisiones.md).

## 8. Lecciones aprendidas

- Se escriben **durante** el proyecto (al cumplirse un hito, una línea) y **al cierre** (sesión completa, skill `lecciones-aprendidas`).
- Cada lección tiene: qué pasó · qué haríamos distinto o igual · regla candidata · dueño · destino (SOP, plantilla, checklist de riesgos).
- Lo que salió bien también es lección. Para lo que salió mal con costo real, además `postmortem`.

## 9. Interesados y comunicación

Cadencia mínima por estrategia según I4 (la matriz poder/interés es método de la skill `registro-interesados`):

| Estrategia | Cadencia mínima | Qué recibe |
|---|---|---|
| Gestionar de cerca (sponsor, cliente) | I4 — semanal | Informe de estado + decisiones pendientes |
| Mantener satisfecho | I4 — quincenal | Resumen de 5 líneas y lo que le afecta |
| Mantener informado | I4 — mensual | Avance e hitos cumplidos |
| Monitorear | I4 — al cambiar de fase | Aviso de hitos relevantes |

Se revisa el registro de interesados al cambiar de fase y cuando entra o sale un actor con poder.

---
Cambios: 2026-10-12 — versión inicial de la plantilla; valores por defecto en la tabla del punto 0.
