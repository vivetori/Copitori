# Plantillas — Metodología GoSmartUp

Formatos de los 8 KeyPoints. Las reglas, la secuencia y los umbrales de validación **no están aquí**:
viven en [../../sops/metodologia_gosmartup.md](../../sops/metodologia_gosmartup.md).
Aquí solo está la **estructura del documento**.

Las usa el agente `asesor-emprendimiento` y el comando `/playbook`.

## Catálogo

| Plantilla | Destino | Nombre del archivo |
|---|---|---|
| [panel.md](panel.md) | `03_iniciativas/<Startup>/` | `panel.md` |
| [kp1_buyer_problem_person.md](kp1_buyer_problem_person.md) | `03_iniciativas/<Startup>/` | `kp1_buyer_problem_person.md` |
| [kp2_antecedentes.md](kp2_antecedentes.md) | idem | `kp2_antecedentes.md` |
| [kp3_tamano_mercado.md](kp3_tamano_mercado.md) | idem | `kp3_tamano_mercado.md` |
| [kp4_propuesta_de_valor.md](kp4_propuesta_de_valor.md) | idem | `kp4_propuesta_de_valor.md` |
| [kp5_oferta_minima_viable.md](kp5_oferta_minima_viable.md) | idem *(fase ideación)* | `kp5_oferta_minima_viable.md` |
| [kp5_producto_minimo_viable.md](kp5_producto_minimo_viable.md) | idem *(fase validación)* | `kp5_producto_minimo_viable.md` |
| [kp5_producto_growth.md](kp5_producto_growth.md) | idem *(fase growth)* | `kp5_producto_growth.md` |
| [kp6_modelo_de_negocio.md](kp6_modelo_de_negocio.md) | idem | `kp6_modelo_de_negocio.md` |
| [kp7_marketing_y_ventas.md](kp7_marketing_y_ventas.md) | idem | `kp7_marketing_y_ventas.md` |
| [kp8_actividades_recursos_socios.md](kp8_actividades_recursos_socios.md) | idem | `kp8_actividades_recursos_socios.md` |
| [validacion.md](validacion.md) | `03_iniciativas/<Startup>/validaciones/` | `YYYY-MM-DD_kpN_experimento.md` |

## Convenciones

- `{{title}}` se sustituye por el nombre del archivo y `{{date}}` por la fecha de hoy.
- El campo `estado` sigue los estados del SOP: `borrador` · `en_validacion` · `validado` · `descartado`.
- Todo supuesto sin evidencia va marcado `[ASUMIDO: ...]` dentro del texto, no en el frontmatter.
- Los tipos de las propiedades nuevas (`keypoint`, `fase`, `startup`, `fecha_validacion`)
  están declarados en `.obsidian/types.json`.
