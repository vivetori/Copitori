---
tipo: registro
proyecto:
  - "[[Ampliación Planta Norte]]"
tags:
  - proyecto
  - cambios
  - ejemplo
---

# Control de cambios — Ampliación Planta Norte

> Niveles de autoridad, umbrales y acumulados: [SOP de gestión de proyectos §4](../../08_conocimiento/sops/gestion_proyectos.md).
> Flujo de evaluación: skill `control-de-cambios`. Lo alimenta `/cambio`. **Nada se ejecuta sin fila en esta tabla.**

**Acumulado de cambios aprobados**: costo $95M (4,0 % del presupuesto base, cargado a contingencia) · plazo +10 días hábiles en 4.1, absorbidos con doble turno (línea base v2)

## Registro

| ID | Fecha | Solicitado por | Descripción | Impacto alcance | Impacto tiempo | Impacto costo | Nivel | Estado | Decisión (quién, fecha) |
|---|---|---|---|---|---|---|---|---|---|
| CC-01 | 2026-08-14 | Camila Torres (interventoría) | Refuerzo de cimentación con pilotaje en zona B: el estudio de suelos dio capacidad portante menor a la asumida | 4.1 incluye pilotaje | +10 días hábiles en 4.1 | +$95M (4,0 %) | 2 | implementado | Aprobado por Mariana Quintero, 2026-08-21, con cargo a contingencia |
| CC-02 | 2026-09-04 | Rocío Bermúdez | Cambio de proveedor de tableros eléctricos: el original pasó de 8 a 11 semanas de entrega | Sin cambio | −5 días hábiles en 6.1 | $0 (diferencia de +$2M absorbida en 6.1) | 1 | implementado | Aprobado por Andrés Palacio, 2026-09-07 |
| CC-03 | 2026-10-05 | Sebastián Lora (Gerencia Comercial) | Segunda línea de empaque para atender el contrato nuevo desde enero | Nuevo paquete 5.3 (fuera del alcance del acta) | +30 días hábiles (6 semanas) en la entrega | +$310M (12,9 %) | 3 | en_evaluacion | Pendiente comité directivo, 2026-10-20 |

Estados: `solicitado` → `en_evaluacion` → `aprobado` · `rechazado` · `diferido` → `implementado`.

## Detalle

### CC-01 — Refuerzo de cimentación (pilotaje zona B)
- **Qué se pide y por qué**: el estudio de suelos del 2026-08-12 (hecho al iniciar excavación) mostró capacidad portante de 8 t/m² en la zona B contra 15 t/m² asumidas en el diseño preliminar. Sin pilotaje, la estructura no se puede certificar.
- **Alternativas consideradas**: (a) pilotaje en zona B — elegida; (b) reubicar la nave 12 m al oriente — descartada: implicaba rediseño (+4 semanas) y nueva licencia; (c) no hacerlo — inviable: la interventoría no certifica.
- **Impacto**: alcance 4.1 · tiempo +10 días hábiles en 4.1 (absorbidos con doble turno, fechas posteriores sin cambio) · costo +$95M · calidad sin cambio · riesgos: R8 materializado, R3 agravado (la cimentación corrió el cierre de cubierta hacia la temporada de lluvias) · interesados: sponsor, finanzas, contratista.
- **Recomendación del PM**: aprobar con cargo a la reserva de contingencia.
- **Decisión**: aprobado por Mariana Quintero el 2026-08-21, con la condición de que no se toque la reserva de gestión. Registrado en [07_equipo/decisiones.md](../../07_equipo/decisiones.md) *(en un proyecto real)*.
- **Línea base actualizada**: EDT v2, cronograma v2 (2026-08-24); `presupuesto` del acta sin cambio (BAC); contingencia disponible $145M.
- **Relacionado**: [[Ampliación Planta Norte]] · [R8](riesgos.md) · [L2](lecciones_aprendidas.md)

### CC-02 — Cambio de proveedor de tableros eléctricos
- **Qué se pide y por qué**: el fabricante original pasó su plazo de 8 a 11 semanas; el alterno entrega en 5 con un sobreprecio de $2M.
- **Alternativas**: (a) cambiar de proveedor — elegida; (b) esperar y comprimir montaje eléctrico — descartada: consume la holgura de 6.1 y presiona el empalme.
- **Impacto**: alcance sin cambio · tiempo −5 días hábiles en 6.1 · costo $0 neto (los $2M se absorben con el saldo de 6.1) · riesgos: ninguno nuevo.
- **Decisión**: aprobado por Andrés Palacio el 2026-09-07 (nivel 1).
- **Línea base actualizada**: sin cambio de versión (no mueve fechas comprometidas ni BAC).

### CC-03 — Segunda línea de empaque
- **Qué se pide y por qué**: Gerencia Comercial proyecta que el contrato nuevo exigirá 650 unidades/día de empaque en el segundo semestre de 2027; la línea actual llega a 600.
- **Alternativas consideradas**: (a) incluirlo ahora — +$310M y +6 semanas sobre una entrega ya en riesgo; (b) **diferir a una fase 2** con cotización separada para el segundo trimestre de 2027 — recomendada: la necesidad es del segundo semestre; (c) turno adicional de empaque desde julio de 2027 — alternativa operativa de Operaciones, sin inversión.
- **Impacto**: alcance: nuevo paquete 5.3 fuera del acta · tiempo +30 días hábiles en la entrega (comparte cuadrilla y energía con 5.2 y 6.2) · costo +$310M (12,9 % del BAC; la contingencia disponible es $145M) · riesgos: R6 · interesados: Gerencia Comercial (a favor), Operaciones (prefiere diferir), Finanzas (sin presupuesto en 2026).
- **Recomendación del PM**: diferir a fase 2. Si el comité lo aprueba ahora, exige ampliar presupuesto y fecha de entrega explícitamente en el acta.
- **Decisión**: pendiente — comité directivo del 2026-10-20. Solicitud de decisión enviada a la sponsor el 2026-10-09 (ver [estado/2026-10-09](estado/2026-10-09.md)).
- **Línea base actualizada**: `pendiente`.
- **Relacionado**: [[Ampliación Planta Norte]] · [R6](riesgos.md)
