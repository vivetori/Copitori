# Plantillas — Módulo Proyectos / PMO

Formatos de los artefactos de un proyecto. Las reglas —semáforo, escalamiento, autoridad de cambios,
cierre— **no están aquí**: viven en [../../sops/gestion_proyectos.md](../../sops/gestion_proyectos.md).
Aquí solo está la **estructura de cada documento**. El diseño del módulo y su mapa contra PMBOK:
[../../modulo_proyectos.md](../../modulo_proyectos.md).

Las usan `/kickoff`, `/estado-semanal`, `/cambio`, `/portafolio`, `/cierre` y los agentes
`planificador-proyectos`, `controlador-proyectos` y `formulador-proyectos`.

## Catálogo

| Plantilla | Destino | Nombre del archivo | Cuándo se crea |
|---|---|---|---|
| [acta_constitucion.md](acta_constitucion.md) | `03_iniciativas/<proyecto>/` | `acta_constitucion.md` | `/kickoff` — es la **ficha madre**: su frontmatter es el estado vivo del proyecto |
| [interesados.md](interesados.md) | idem | `interesados.md` | `/kickoff` |
| [edt.md](edt.md) | idem | `edt.md` | Planificación (`planificador-proyectos`) |
| [cronograma.md](cronograma.md) | idem | `cronograma.md` | Planificación; lo actualiza cada corte |
| [riesgos.md](riesgos.md) | idem | `riesgos.md` | `/kickoff`; lo mantiene `analista-riesgos` |
| [cambios.md](cambios.md) | idem | `cambios.md` | `/kickoff` (vacío); lo alimenta `/cambio` |
| [estado.md](estado.md) | `03_iniciativas/<proyecto>/estado/` | `AAAA-MM-DD.md` | `/estado-semanal`, uno por corte |
| [lecciones_aprendidas.md](lecciones_aprendidas.md) | `03_iniciativas/<proyecto>/` | `lecciones_aprendidas.md` | `/kickoff` (vacío); se llena en hitos y en `/cierre` |
| [acta_cierre.md](acta_cierre.md) | idem | `acta_cierre.md` | `/cierre` |
| [marco_logico.md](marco_logico.md) | idem *(opcional)* | `marco_logico.md` | `formulador-proyectos`, para proyectos públicos o con cooperación |
| [../reunion.md](../reunion.md) | `03_iniciativas/<proyecto>/reuniones/` | `AAAA-MM-DD_Titulo.md` | `/guardar-reunion` — misma plantilla que el resto de la bóveda |

## Convenciones

- `{{title}}` se sustituye por el nombre del archivo y `{{date}}` por la fecha de hoy.
- El acta lleva `aliases` con el nombre del proyecto: así `[[Nombre del proyecto]]` resuelve al acta
  desde cualquier nota, aunque todas las actas se llamen `acta_constitucion.md`.
- `estado` usa los valores de [03_iniciativas/](../../../03_iniciativas/README.md): `idea` · `activo` · `en_riesgo` · `pausado` · `cerrado`.
- `fase`: `inicio` · `planificacion` · `ejecucion` · `cierre` · `cerrado`.
- `semaforo`: `verde` · `ambar` · `rojo` (sin tilde, para que las búsquedas de Obsidian no fallen).
- `spi`, `cpi` y `presupuesto` son números; `ultimo_corte`, `inicio`, `fin_objetivo` y `fin_estimado` son fechas `YYYY-MM-DD`.
- Todo supuesto sin evidencia va marcado `[ASUMIDO: ...]` dentro del texto, no en el frontmatter.
- Las propiedades nuevas (`sponsor`, `pm`, `semaforo`, `presupuesto`, `spi`, `cpi`, `ultimo_corte`,
  `fin_estimado`, `proyecto`, `semana`, `version_linea_base`) están declaradas en `.obsidian/types.json`.
