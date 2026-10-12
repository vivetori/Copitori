---
name: formulacion-marco-logico
description: Actívala cuando haya que formular un proyecto para una entidad pública, un organismo de cooperación, una convocatoria o un fondo — "hay que presentarlo en MGA", "necesito el marco lógico", "la convocatoria pide árbol de problemas", "indicadores de producto y resultado", "cadena de valor del proyecto". Construye árbol de problemas, árbol de objetivos, análisis de alternativas y matriz de marco lógico, con equivalencia a la MGA colombiana. Opcional: no aplica a proyectos internos corrientes.
---

# Formulación con marco lógico

El marco lógico obliga a demostrar que las actividades producen componentes, que los componentes logran el propósito y que el propósito contribuye a un fin — con indicadores que alguien pueda verificar. Es lo que piden las entidades públicas, la cooperación y la mayoría de convocatorias, y es también una buena forma de descubrir que un proyecto no resuelve el problema que dice resolver.

Plantilla: [marco_logico.md](../../../08_conocimiento/plantillas/proyecto/marco_logico.md). Lo ejecuta el agente `formulador-proyectos`. El resultado alimenta el [acta](../../../08_conocimiento/plantillas/proyecto/acta_constitucion.md) (Propósito → objetivo) y la [EDT](../../../08_conocimiento/plantillas/proyecto/edt.md) (Componentes → nivel 1).

## 1. Árbol de problemas

1. **Problema central**: una frase, en negativo, sobre una población en un lugar. "Baja productividad" no es un problema central; "los productores de la vereda X pierden el 30 % de la cosecha por falta de centro de acopio" sí. Con el dato y su fuente.
2. **Causas**: por qué ocurre. Directas (las que producen el problema) e indirectas (las que producen las causas). Baja hasta algo sobre lo que el proyecto pueda actuar.
3. **Efectos**: qué provoca. Directos e indirectos, hasta el efecto final que justifica intervenir.

Regla: cada causa y cada efecto es un **hecho verificable**, no una opinión. Si no tiene fuente, va `[ASUMIDO: ...]`.

## 2. Árbol de objetivos

Es el espejo en positivo: el problema central se vuelve **objetivo central**; las causas, **medios**; los efectos, **fines**. Revisa que cada medio sea una acción posible y cada fin un resultado deseable. Si al pasar a positivo algo no tiene sentido, el árbol de problemas estaba mal.

## 3. Alternativas

De los medios salen las alternativas de solución: combinaciones distintas de medios que atacan el problema. Mínimo dos, comparadas por qué resuelven, costo aproximado, viabilidad (técnica, institucional, financiera, ambiental) y pertinencia para la población. Se elige una y se dice por qué — ese es el proyecto.

## 4. Matriz de marco lógico

| Nivel | Qué es | Indicador | Supuesto |
|---|---|---|---|
| **Fin** | El impacto al que el proyecto contribuye (no lo logra solo) | De impacto, a largo plazo | Lo externo que debe mantenerse para que el propósito aporte al fin |
| **Propósito** | El cambio en la población al terminar el proyecto — **uno solo** | De resultado: línea base → meta, con fecha | Lo externo para que los componentes logren el propósito |
| **Componentes** | Los productos que el proyecto entrega (obras, servicios, capacidades) | De producto: cantidad, calidad, tiempo | Lo externo para que las actividades produzcan los componentes |
| **Actividades** | Lo que se hace para producir cada componente, con su costo | Presupuesto por actividad | Lo externo para arrancar |

- **Lógica vertical**: actividades + supuestos → componentes + supuestos → propósito + supuestos → fin. Léela de abajo arriba; si un "si… entonces" no se sostiene, falta un componente o sobra una actividad.
- **Lógica horizontal**: cada nivel con su indicador y su **medio de verificación** (de dónde sale el dato: registro, encuesta, informe de interventoría). Un indicador sin medio de verificación no es verificable y no sirve.
- **Supuestos**: condiciones externas, fuera del control del proyecto, *probables*. Si un supuesto es improbable, no es supuesto: es un riesgo (va a `riesgos.md` con la matriz de [sops/riesgos.md](../../../08_conocimiento/sops/riesgos.md)) o un motivo para rediseñar.

## 5. Indicadores

Cada uno con nombre · unidad · línea base (valor y fecha) · meta (valor y fecha) · fuente · frecuencia. "Mejorar la cobertura" no es indicador; "porcentaje de productores con acceso a acopio: 12 % (2026) → 60 % (2028), registro del centro" sí. No inventes líneas base: si no hay dato, el primer componente suele ser levantarlo.

## 6. Equivalencia MGA (Colombia)

Para cargar en la Metodología General Ajustada del DNP, el mapeo está en la plantilla: problema y árbol (§1), objetivo general (Propósito), objetivos específicos (Componentes), productos con sus indicadores de producto, actividades con costo, población objetivo y localización. Los **catálogos oficiales** (productos, indicadores, sectores) los fija la MGA Web: esta skill prepara el contenido en lenguaje natural; el usuario lo mapea al catálogo al cargar. No sustituye la metodología oficial ni la asesoría del banco de proyectos.

## Reglas

- **Ningún número inventado.** Población, costos, líneas base: con fuente o `[ASUMIDO: ...]` con el dato que lo confirmaría.
- **Un solo propósito.** Dos propósitos son dos proyectos.
- **Los componentes son productos entregables**, no actividades ni deseos.
- **La población se cuenta**, no se describe: cuántos, dónde, con qué fuente.
- Antes de presentar a una convocatoria o entidad, pásalo por el agente `contradictor`: la lógica vertical es exactamente lo que un evaluador va a atacar.
