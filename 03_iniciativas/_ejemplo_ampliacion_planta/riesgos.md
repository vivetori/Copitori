---
tipo: registro
proyecto:
  - "[[Ampliación Planta Norte]]"
tags:
  - proyecto
  - riesgos
  - ejemplo
---

# Riesgos — Ampliación Planta Norte

> Matriz, categorías, estados y cadencia: [SOP de riesgos](../../08_conocimiento/sops/riesgos.md).
> Los altos y críticos se espejan en [07_equipo/riesgos.md](../../07_equipo/riesgos.md) ([SOP de gestión de proyectos §6](../../08_conocimiento/sops/gestion_proyectos.md)). Lo mantiene el agente `analista-riesgos`.

**Reserva de contingencia**: $240M — consumida: $95M ([CC-01](cambios.md)) — disponible: $145M

## Abiertos

| # | Riesgo (si X, entonces Y) | Categoría | Prob. | Impacto | Nivel | Dueño | Mitigación | Próx. revisión | Espejo global |
|---|---|---|---|---|---|---|---|---|---|
| R2 | Si el peso supera 4.300 COP/USD antes del pago final de equipos (2026-10-23), el paquete 5.1 sube hasta $45M | financiero | media | alto | Alto | Carolina Vélez | Cobertura forward por el 35 % restante, tomada el 2026-09-10 | 2026-10-16 | sí |
| R3 | Si las lluvias de octubre–noviembre superan 12 días sin trabajo, 4.2 se corre otra semana y arrastra el montaje | operativo | alta | medio | Alto | Patricia Mejía | Cubierta provisional + doble turno en días secos (aprobado 2026-10-06) | 2026-10-16 | sí |
| R4 | Si el empalme eléctrico exige parar la línea actual más de 48 h, se pierden ~$60M de producción y se incumple al distribuidor actual | operativo | media | alto | Alto | Rocío Bermúdez | Empalme en el fin de semana largo 2026-12-05/07 con equipo de respaldo; ensayo en vacío el 2026-11-28 | 2026-11-13 | sí |
| R5 | Si el contratista eléctrico no confirma cuadrilla para diciembre antes del 2026-10-30, el montaje eléctrico (6.2) se corre a enero | talento | media | medio | Medio | Rocío Bermúdez | Contrato con cláusula de disponibilidad firmado antes del 2026-10-30 | 2026-10-30 | no |
| R6 | Si el comité aprueba CC-03 sin ampliar plazo ni presupuesto, la entrega se corre 6 semanas y la contingencia no alcanza | estratégico | media | alto | Alto | Andrés Palacio | Recomendación escrita de diferir a fase 2 con cotización separada; 1:1 con Gerencia Comercial antes del 2026-10-15 | 2026-10-20 | sí |

## Aceptados

| # | Riesgo | Nivel | Por qué lo aceptamos | Quién lo decidió | Fecha |
|---|---|---|---|---|---|
| R7 | Si el proveedor de equipos entrega con una semana de retraso, el montaje no se afecta | Bajo | Hay 10 días hábiles de holgura entre entrega y montaje | Andrés Palacio | 2026-07-10 |

## Cerrados y materializados

| # | Riesgo | Desenlace | Cambio generado | Lección | Fecha |
|---|---|---|---|---|---|
| R1 | Si la licencia tarda más de 6 semanas, la obra arranca tarde | **Materializado**: aprobada el 2026-08-07, +15 días hábiles | Ninguno (absorbido con doble turno en 4.1) | [L1](lecciones_aprendidas.md): radicar con ingeniería básica | 2026-08-07 |
| R8 | Si el suelo no soporta la cimentación convencional, hay que pilotar | **Materializado**: estudio de suelos del 2026-08-12 | [CC-01](cambios.md) +$95M, +10 días hábiles | [L2](lecciones_aprendidas.md): estudio de suelos antes del presupuesto base | 2026-08-14 |

---
Última revisión completa: 2026-10-09
