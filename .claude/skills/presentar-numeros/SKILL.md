---
name: presentar-numeros
description: Actívala siempre que un entregable contenga cifras — briefing, informe, propuesta, panel de KPIs, actualización a junta, correo con resultados. Define cómo se presenta un número para que signifique algo y no engañe. Para gráficos, usa además la skill dataviz.
---

# Presentar números

Un número sin contexto no informa: decora. Esta skill define el mínimo con el que una cifra puede salir de aquí.

## La regla de los tres contextos

Ninguna cifra viaja sola. Toda cifra necesita al menos uno de estos tres, y de preferencia dos:

1. **Contra qué se compara** — periodo anterior, meta, presupuesto, mismo mes del año pasado.
2. **De qué tamaño es** — sobre qué base. "Crecimos 40%" sobre 5 clientes no es lo mismo que sobre 500.
3. **Qué se esperaba** — la desviación importa más que el valor absoluto.

> ❌ "Ingresos: $180M."
> ✅ "Ingresos: $180M — 12% sobre el mes pasado, 8% bajo la meta del trimestre. La brecha viene de dos cierres que se corrieron a octubre."

## Variación: siempre las dos formas

Da el cambio **absoluto y relativo** juntos. Cada uno miente por su cuenta.

- Solo relativo esconde la escala: "+300%" puede ser de 1 a 4.
- Solo absoluto esconde la proporción: "+$2M" puede ser irrelevante o histórico.

`"+$2,4M (+18%)"` — así, siempre.

## Honestidad con la base

- **Di el denominador.** Un porcentaje sin base es propaganda. "El 67% de los clientes lo pidió" con n=3 hay que escribirlo con el n.
- **No cambies la base entre periodos** sin advertirlo. Es la forma más común de mentir con datos reales.
- **Promedios con cuidado.** Si hay pocos casos o un valor extremo, da también la mediana o el rango. Un promedio de ticket dominado por un cliente grande describe a nadie.
- **Anualizar es una proyección, no un dato.** Dilo cuando lo hagas.

## Distinciones que no se pueden confundir

En un contexto de negocio, confundir estas es el error más caro que existe. Nómbralas siempre con precisión:

| | |
|---|---|
| **Pipeline** | Lo que podría pasar. Ponderado por etapa, nunca sumado en bruto. |
| **Comprometido** | Firmado, aún no ejecutado. |
| **Facturado** | Ya se emitió la factura. |
| **Cobrado** | El dinero está en la cuenta. Lo único que paga la nómina. |

Lo mismo con ingreso vs. margen, y con costo vs. inversión.

## Cómo se ve

- **Cifras grandes, redondeadas** a lo que la decisión necesita. `$1,84M` no `$1.843.291`. El detalle exacto va en el anexo si alguien lo pide.
- **Moneda y periodo explícitos** en cada tabla. La de [00_perfil/config_copiloto.md](../../../00_perfil/config_copiloto.md).
- **Máximo 5–7 filas** por tabla en un documento ejecutivo. Más que eso ya no se lee, se hojea: parte en dos tablas o manda el detalle aparte.
- **La conclusión va escrita**, no deducida de la tabla. El título de la tabla dice qué hay que ver.
- **Semáforos con umbral declarado.** 🟢🟡🔴 solo si en algún lugar dice qué separa un color del otro.

## Lo que nunca se hace

- **Inventar o estimar en silencio.** Un dato que falta se marca como faltante. Si se estima, se dice que es estimación y con qué supuesto.
- **Mezclar unidades o periodos** en la misma comparación sin advertirlo.
- **Presentar solo lo que favorece.** Si una métrica empeoró, va con las demás y con el mismo tamaño de letra.
- **Precisión falsa.** Tres decimales sobre un dato estimado a ojo es mentir con formato.

## Al cerrar

Toda tabla o cifra en un entregable termina con **una línea de "y esto qué significa"**: la implicación o la decisión que sugiere. Si no hay ninguna, el número sobra — quítalo.

Para gráficos, aplica también la skill `dataviz`. Regla previa: si la tabla se entiende sola, no hagas gráfico.
