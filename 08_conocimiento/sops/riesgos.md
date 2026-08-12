# SOP — Evaluación y registro de riesgos

> **Dueño único de esta regla.** La matriz, las categorías y los plazos de revisión viven aquí.
> Lo usan: el agente `analista-riesgos`, `/junta`, `/revision-semanal`, las fichas de [03_iniciativas/](../../03_iniciativas/).
> El registro vivo está en [07_equipo/riesgos.md](../../07_equipo/riesgos.md) — este archivo define *cómo* se evalúa, no *qué* riesgos hay.

## Matriz de nivel

| | Impacto bajo | Impacto medio | Impacto alto |
|---|---|---|---|
| **Probabilidad alta** | Medio | Alto | **Crítico** |
| **Probabilidad media** | Bajo | Medio | Alto |
| **Probabilidad baja** | Bajo | Bajo | Medio |

**Impacto alto** = pone en riesgo un objetivo de [01_objetivos/okrs.md](../../01_objetivos/okrs.md), un cliente clave o la caja del trimestre.

## Categorías

`operativo` · `financiero` · `comercial` · `legal_cumplimiento` · `reputacional` · `talento` · `tecnologico` · `estrategico`

## Estados

`abierto` → `mitigando` → `mitigado` · `aceptado` · `materializado` · `cerrado`

**Aceptado** exige justificación escrita y dueño. Un riesgo alto o crítico no se acepta en silencio.

## Reglas

- **Todo riesgo tiene dueño y fecha de revisión.** Sin dueño no es un riesgo, es una queja.
- **Solo se registra lo material y accionable.** Si no puedes influir en la probabilidad ni en el impacto, es un supuesto del negocio, no un riesgo — anótalo en la ficha correspondiente y sigue.
- **La mitigación es una acción con fecha**, no una intención. Va a [TASKS.md](../../TASKS.md).
- Un riesgo **crítico o alto** se escala en el siguiente `/resumen-dia` y se lleva a `/junta`.
- Un riesgo **materializado** deja rastro: se registra qué falló en [07_equipo/decisiones.md](../../07_equipo/decisiones.md).

## Cadencia de revisión

| Nivel | Se revisa |
|---|---|
| Crítico | Semanal (en `/revision-semanal`) |
| Alto | Quincenal |
| Medio | Mensual |
| Bajo | Trimestral, o al cambiar el contexto |

Un riesgo sin revisar más allá de su cadencia aparece como pendiente en `/seguimiento`.

---
Cambios: [YYYY-MM-DD] — valores iniciales de la plantilla.
