---
tipo: cronograma
proyecto:
  - "[[Ampliación Planta Norte]]"
inicio: 2026-05-18
fin_objetivo: 2026-12-28
fin_estimado: 2027-01-18
semanas: 32
version_linea_base: 2
tags:
  - proyecto
  - cronograma
  - ejemplo
---

# Cronograma — Ampliación Planta Norte

> [!info] Cómo se leen estas tablas
> `Fecha comprometida` es la línea base y no se reemplaza; lo que se movió está en `Fecha estimada / real` con su causa en [cambios.md](cambios.md).
> Desvíos en días hábiles, sin descontar festivos. Semáforo según [SOP §1](../../08_conocimiento/sops/gestion_proyectos.md). Corte vigente: 2026-10-09 (semana 21 de 32).

## Hitos

| # | Hito | Fecha comprometida | Fecha estimada / real | Estado | Desvío (días hábiles) |
|---|---|---|---|---|---|
| H1 | Acta firmada y kickoff | 2026-05-18 | 2026-05-18 | cumplido | 0 |
| H2 | Diseños e ingeniería aprobados | 2026-06-26 | 2026-06-26 | cumplido | 0 |
| H3 | Orden de compra de equipos emitida | 2026-07-10 | 2026-07-10 | cumplido | 0 |
| H4 | Licencia de construcción aprobada | 2026-07-17 | 2026-08-07 | cumplido | +15 |
| H5 | Cimentación y estructura terminadas | 2026-09-11 | 2026-09-25 | cumplido | +10 |
| H6 | Obra civil terminada | 2026-10-16 | 2026-11-06 | en_riesgo | +15 |
| H7 | Equipos en sitio | 2026-10-23 | 2026-10-23 | pendiente | 0 |
| H8 | Montaje mecánico y eléctrico terminado | 2026-12-04 | 2026-12-18 | en_riesgo | +10 |
| H9 | Pruebas y puesta en marcha aprobadas | 2026-12-21 | 2027-01-12 | en_riesgo | +15 |
| H10 | Entrega a operación | 2026-12-28 | 2027-01-18 | en_riesgo | +15 |

## Paquetes de trabajo (línea base v2)

Regla de avance: `% medido` con actas de interventoría en 4.x; hitos de pago (40 / 25 / 35) en 5.1; `0/100` en los demás. Costos en millones de COP.

| EDT | Paquete | Responsable | Inicio plan | Fin plan | Fin estimado / real | Depende de | Costo plan (BAC_i) | % plan a la fecha | % avance | Costo real (AC_i) |
|---|---|---|---|---|---|---|---|---|---|---|
| 1.1 | Gestión del proyecto | Andrés Palacio | 2026-05-18 | 2026-12-28 | 2027-01-18 | — | 120 | 65 | 65 | 80 |
| 2.1 | Ingeniería básica y de detalle | Camila Torres | 2026-05-18 | 2026-06-26 | 2026-06-26 | — | 180 | 100 | 100 | 174 |
| 3.1 | Licencia y permisos | Daniel Ospina | 2026-06-01 | 2026-07-17 | 2026-08-07 | 2.1 | 40 | 100 | 100 | 51 |
| 4.1 | Cimentación y estructura | Patricia Mejía | 2026-07-20 | 2026-09-11 | 2026-09-25 | 3.1 | 420 | 100 | 100 | 515 |
| 4.2 | Cubierta, cerramientos y acabados | Patricia Mejía | 2026-09-14 | 2026-10-16 | 2026-11-06 | 4.1 | 340 | 82 | 38 | 127 |
| 5.1 | Compra y fabricación de equipos | Jorge Benítez | 2026-07-10 | 2026-10-23 | 2026-10-23 | 2.1 | 640 | 65 | 65 | 404 |
| 5.2 | Montaje mecánico | Jorge Benítez / Luis F. Ríos | 2026-10-26 | 2026-12-04 | 2026-12-18 | 4.2, 5.1 | 340 | 0 | 0 | 0 |
| 6.1 | Diseño eléctrico y tableros | Rocío Bermúdez | 2026-08-03 | 2026-10-23 | 2026-10-23 | 2.1 | 120 | 87 | 50 | 60 |
| 6.2 | Montaje eléctrico y empalme | Rocío Bermúdez | 2026-11-02 | 2026-12-11 | 2026-12-18 | 5.2, 6.1 | 100 | 0 | 0 | 0 |
| 7.1 | Pruebas y puesta en marcha | Luis Fernando Ríos | 2026-12-07 | 2026-12-21 | 2027-01-12 | 5.2, 6.2 | 70 | 0 | 0 | 0 |
| 8.1 | Cierre y entrega | Andrés Palacio | 2026-12-21 | 2026-12-28 | 2027-01-18 | 7.1 | 30 | 0 | 0 | 0 |
| | **Totales** | | | | | | **2.400** | | | **1.411** |

## Ruta crítica
1. 3.1 Licencia → 4.1 Cimentación → 4.2 Cubierta y acabados → 5.2 Montaje mecánico → 6.2 Montaje eléctrico → 7.1 Pruebas → 8.1 Entrega.

Cada día que se mueve 4.2 mueve la entrega un día. 5.1 (equipos) tiene 10 días hábiles de holgura hasta el inicio de montaje; 6.1 (tableros) tiene 6.

**Holguras relevantes**: 5.1 y 6.1 pueden ceder cuadrilla a 4.2 en días secos (plan de recuperación aprobado el 2026-10-06).

## Supuestos del plan
- Lluvias de octubre–noviembre dentro del promedio (≤ 12 días sin trabajo en 4.2). *En riesgo: [R3](riesgos.md).*
- Cuadrilla eléctrica disponible la primera semana de diciembre. *[R5](riesgos.md).*
- El empalme se hace el fin de semana largo del 2026-12-05 al 2026-12-07. *[R4](riesgos.md).*
- Pruebas en diciembre: 8 días hábiles perdidos por festivos y vacaciones colectivas si se corren a enero (ya reflejado en H9).

## Historial de línea base
| Versión | Fecha | Qué cambió | Cambio aprobado |
|---|---|---|---|
| 1 | 2026-05-29 | Línea base inicial | — |
| 2 | 2026-08-24 | 4.1 +10 días hábiles y +$95M (pilotaje zona B); fechas de H6 en adelante sin cambio, absorbidas con doble turno | CC-01 |
