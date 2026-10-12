---
tipo: proyecto
aliases:
  - "Ampliación Planta Norte"
estado: activo
fase: ejecucion
semaforo: ambar
sponsor: Mariana Quintero
pm: Andrés Palacio
relacion: 
objetivo:
  - "[[okrs|O2 — Capacidad instalada]]"
inicio: 2026-05-18
fin_objetivo: 2026-12-28
presupuesto: 2400
spi: 0.87
cpi: 0.94
ultimo_corte: 2026-10-09
tags:
  - proyecto
  - iniciativa
  - ejemplo
---

# Acta de constitución — Ampliación Planta Norte

> [!info] Proyecto de ejemplo (ficticio)
> Empresa, personas y cifras son inventadas: sirve para ver cómo queda cada archivo del módulo y para demos. Bórralo cuando tengas el tuyo.
> El **frontmatter** es el estado vivo (lo actualizan `/estado-semanal` y `/cambio`); el **cuerpo** es el acta firmada el 2026-05-15 y no se reescribe: lo que cambió después está en [cambios.md](cambios.md).
> Criterios y umbrales: [SOP de gestión de proyectos](../../08_conocimiento/sops/gestion_proyectos.md).

## 1. Justificación
Planta Norte de Fabricanto S.A. opera al 97 % de su capacidad (400 unidades/día) y rechazó pedidos por $1.900M en el primer trimestre de 2026. Sin una segunda línea, el contrato con el distribuidor del norte (desde enero de 2027, +130 unidades/día) no se puede atender. Objetivo del año al que contribuye: O2 — capacidad instalada.

## 2. Objetivos del proyecto
| # | Objetivo (medible) | Indicador | Meta | Fecha |
|---|---|---|---|---|
| 1 | Poner en operación una segunda línea de producción | Unidades/día sostenidas durante 10 días | 560 (desde 400) | 2026-12-28 |
| 2 | Hacerlo sin parar la línea actual más de 48 h acumuladas | Horas de parada atribuibles al proyecto | ≤ 48 h | Durante el proyecto |
| 3 | Dentro del presupuesto base más la contingencia | Costo final | ≤ $2.640M | Al cierre |

## 3. Alcance
**Incluye**:
- Diseño, licencias, obra civil (nave de 1.200 m²), compra y montaje de la línea de proceso, instalaciones eléctricas y de servicios, pruebas y puesta en marcha, capacitación de operadores.

**No incluye**:
- Línea de empaque adicional (la actual tiene capacidad para 600 unidades/día).
- Bodega de producto terminado y patio de maniobras.
- Contratación del personal de la nueva línea (lo hace Operaciones por fuera del proyecto).

## 4. Entregables principales
| Entregable | Criterio de aceptación | Quién acepta |
|---|---|---|
| Nave industrial terminada | Acta de recibo de interventoría sin pendientes mayores | Camila Torres (interventoría) |
| Línea de proceso montada y probada | 10 días a 560 unidades/día con desperdicio ≤ 2 % | Luis Fernando Ríos (Operaciones) |
| Instalaciones eléctricas y servicios | Certificación RETIE y empalme sin parada > 48 h | Rocío Bermúdez (Planta) |
| Operadores capacitados | 12 operadores certificados en el procedimiento nuevo | Luis Fernando Ríos |

## 5. Hitos de alto nivel
| Hito | Fecha comprometida |
|---|---|
| Diseños aprobados | 2026-06-26 |
| Licencia de construcción | 2026-07-17 |
| Obra civil terminada | 2026-10-16 |
| Equipos en sitio | 2026-10-23 |
| Montaje terminado | 2026-12-04 |
| Pruebas aprobadas | 2026-12-21 |
| Entrega a operación | 2026-12-28 |

Detalle y estado: [cronograma.md](cronograma.md).

## 6. Presupuesto de alto nivel
| Concepto | Monto (COP) |
|---|---|
| Presupuesto base (BAC) | $2.400M |
| Reserva de contingencia (10 %) | $240M |
| Reserva de gestión | $0 — decisión de la sponsor |
| **Total autorizado** | **$2.640M** |

## 7. Supuestos y restricciones
**Supuestos**:
- La licencia de construcción se aprueba en 6 semanas con la ingeniería de detalle completa.
- El suelo del lote soporta la cimentación convencional del diseño preliminar. *(No se cumplió → [CC-01](cambios.md).)*
- El proveedor de equipos entrega en 15 semanas desde la orden de compra.

**Restricciones**:
- Fecha fin: el contrato del distribuidor arranca el 2027-01-15; la línea debe operar antes.
- La línea actual no puede parar más de 48 h acumuladas.
- Horario de obra: lunes a sábado, 7:00–18:00 (acuerdo con la comunidad vecina).

## 8. Riesgos iniciales
> [!warning] Los que se veían desde el día uno
> - Si la licencia tarda más de 6 semanas, la obra arranca tarde y corre la fecha fin → radicar con ingeniería básica.
> - Si el dólar sube antes del pago final de equipos, el paquete sube hasta $45M → cobertura cambiaria.
> - Si el empalme eléctrico exige parar la línea más de 48 h, se pierde producción y un cliente clave → empalme en fin de semana largo.
>
> Registro completo: [riesgos.md](riesgos.md).

## 9. Interesados clave
Sponsor, Dirección Financiera, Gerencia de Operaciones (recibe la línea), Gerencia Comercial (contrato nuevo), interventoría, contratista civil y proveedor de equipos. Registro completo: [interesados.md](interesados.md).

## 10. Organización y autoridad
- **Sponsor**: Mariana Quintero, Gerente General — aprueba cambios de nivel 2; recibe el informe semanal.
- **Directora/Director de proyecto (PM)**: Andrés Palacio, Director de Proyectos — autoridad de nivel 1; asigna recursos dentro del presupuesto base.
- **Equipo núcleo**: Luis Fernando Ríos (Operaciones), Rocío Bermúdez (Planta), Daniel Ospina (HSE y permisos), Carolina Vélez (Finanzas).
- **Comité directivo**: decide cambios de nivel 3; sesiona cada tercer lunes.

## 11. Criterios de éxito
La nueva línea atiende el contrato del distribuidor desde el 2027-01-15 sin haber parado la actual, y el costo final cabe en el total autorizado.

## 12. Aprobación
| Rol | Nombre | Fecha | Firma / evidencia |
|---|---|---|---|
| Sponsor | Mariana Quintero | 2026-05-15 | Acta del comité directivo 2026-05-15 |
| PM | Andrés Palacio | 2026-05-15 | idem |

---
Artefactos del proyecto: [interesados](interesados.md) · [EDT](edt.md) · [cronograma](cronograma.md) · [riesgos](riesgos.md) · [cambios](cambios.md) · [lecciones](lecciones_aprendidas.md) · [estado/](estado/) · [reuniones/](reuniones/)
