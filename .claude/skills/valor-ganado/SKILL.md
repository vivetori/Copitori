---
name: valor-ganado
description: Actívala siempre que haya que decir cuánto ha avanzado un proyecto y a qué costo — en /estado-semanal, /portafolio, /cierre, un informe al sponsor, o cuando el usuario pregunte "cómo vamos", "vamos a llegar", "cuánto nos vamos a pasar", "cuál es el SPI / CPI". Define cómo se calculan PV, EV, AC, SPI, CPI, EAC y cómo se presentan. Complementa a presentar-numeros; los umbrales del semáforo los pone el SOP.
---

# Valor ganado

"Llevamos el 60 % del tiempo y el 55 % del presupuesto" no dice nada hasta que sabes cuánto **trabajo** está hecho. Valor ganado cruza las tres cosas: lo planeado, lo hecho y lo gastado.

Datos de entrada: la tabla de paquetes de [cronograma.md](../../../08_conocimiento/plantillas/proyecto/cronograma.md). Umbrales que convierten estas cifras en color: [SOP de gestión de proyectos §1](../../../08_conocimiento/sops/gestion_proyectos.md) — **no los redefinas aquí**. Forma de presentar cualquier número: skill `presentar-numeros`.

## 1. Las tres cifras base, al corte

| Cifra | Qué es | Cómo se obtiene por paquete `i` |
|---|---|---|
| **BAC** | Presupuesto base total (sin reservas) | Σ `Costo plan (BAC_i)` |
| **PV** | Valor planificado: lo que *debería* estar hecho a la fecha, en dinero | `BAC_i × % planificado a la fecha` |
| **EV** | Valor ganado: lo que *está* hecho, valorado al plan | `BAC_i × % avance` |
| **AC** | Costo real: lo gastado para lograr ese EV | Σ `Costo real (AC_i)` |

**% planificado a la fecha**: si el paquete no empezó según el plan, 0; si ya debía estar terminado, 100; si está en curso, proporción lineal entre `Inicio plan` y `Fin plan` en días hábiles. Es una aproximación: dilo.

**% avance**: la regla declarada en el cronograma por paquete — `0/100` (nada hasta terminar), `50/50` (la mitad al empezar) o `% medido` con evidencia (unidades, entregables aceptados). Si no está declarada, usa `0/100`: es la que menos miente. **Nunca** uses "horas gastadas / horas planificadas" como avance: eso es AC disfrazado de EV.

## 2. Los indicadores

| Indicador | Fórmula | Se lee así |
|---|---|---|
| Variación de cronograma | **SV = EV − PV** | Negativo = atrasado, en dinero |
| Variación de costo | **CV = EV − AC** | Negativo = sobrecosto |
| Índice de cronograma | **SPI = EV / PV** | 0,87 = por cada peso que debía estar hecho, hay 0,87 |
| Índice de costo | **CPI = EV / AC** | 0,94 = cada peso gastado produce 0,94 de trabajo |
| Estimación al terminar | **EAC** *(tres fórmulas, abajo)* | Lo que va a costar el proyecto completo |
| Estimación para terminar | **ETC = EAC − AC** | Lo que falta por gastar |
| Variación al terminar | **VAC = BAC − EAC** | Negativo = nos vamos a pasar |
| Índice para completar | **TCPI = (BAC − EV) / (BAC − AC)** | Eficiencia necesaria de aquí en adelante; > 1,10 es poco realista |

**EAC — declara siempre cuál usas:**
1. `EAC = BAC / CPI` — el desvío de costo es típico y va a continuar. **Por defecto.**
2. `EAC = AC + (BAC − EV)` — el desvío fue puntual y el resto va a plan. Solo con una razón escrita.
3. `EAC = AC + (BAC − EV) / (CPI × SPI)` — el atraso también encarece. Para proyectos en rojo.

Si CPI y SPI difieren mucho, da la 1 y la 3: el rango es la información.

**Ejemplo ilustrativo** (cifras inventadas): un proyecto de 32 semanas con BAC $2.400M llega a la semana 21 con PV $1.517M, EV $1.323M y AC $1.411M. SV = −$194M y CV = −$88M; SPI = 0,87 (por cada peso que debía estar hecho hay 0,87) y CPI = 0,94. EAC típico = 2.400 / 0,94 ≈ $2.560M (VAC −$160M); si el sobrecosto fue puntual, EAC = 1.411 + 1.077 = $2.488M. TCPI = 1.077 / 989 = 1,09: el resto tendría que rendir un 9 % mejor que el plan. Con los parámetros por defecto del SOP, SPI y CPI caen en la banda ámbar; el color final lo fija el SOP cruzando también hitos y bloqueos.

## 3. Fecha fin estimada

El SPI tiende a 1 cuando el proyecto se acerca al final (el PV se agota), así que **no sirve solo para estimar la fecha**. Úsalo como alerta temprana y cruza con:
- Los **hitos**: desvío en días hábiles de cada uno, el de la ruta crítica manda.
- La **re-estimación del equipo** del trabajo restante, si existe.
- Como referencia gruesa: `duración restante / SPI`, marcada `[ASUMIDO: extrapolación lineal]`.

La fecha fin estimada que va al frontmatter es la del cronograma (`fin_estimado`), no la extrapolación.

## 4. Cuando faltan datos

- **Sin costo real** (no hay módulo Finanzas o no se registra): calcula SV y SPI; CPI y EAC quedan como **faltantes**. Puedes usar horas en vez de dinero si el plan está en horas — dilo.
- **Sin % avance medido**: usa `0/100` y dilo. El SPI saldrá peor de lo real, que es el lado correcto del error.
- **Sin línea base aprobada**: no hay PV y no hay valor ganado. Reporta hitos y bloqueos, y señala que falta la línea base.
- Nunca estimes en silencio. Un dato faltante marcado vale más que un índice bonito.

## 5. Cómo se presenta

- La tabla de 8 filas del informe de estado ([estado.md](../../../08_conocimiento/plantillas/proyecto/estado.md)): BAC, PV, EV, AC, SPI, CPI, EAC (con fórmula), fecha fin estimada vs. comprometida. Con moneda y fecha de corte.
- Índices con **dos decimales**; dinero redondeado a lo que la decisión necesita. Tres decimales sobre un avance estimado a ojo es precisión falsa.
- **Tendencia**: SPI y CPI de los últimos 3 cortes. Un índice que empeora tres veces seguidas es más importante que su valor absoluto.
- **Una línea de "y esto qué significa"** por indicador. Si no la hay, el número sobra.
- Al sponsor le importan tres: **SPI, CPI y VAC** (cuánto nos vamos a pasar). El resto va en el anexo.

## Reglas

- **El color lo pone el SOP, no esta skill.** Aquí se calcula; allí se decide qué es verde, ámbar o rojo.
- **Mismo método cada corte.** Cambiar la regla de avance entre semanas fabrica tendencias.
- **El EV nunca supera el BAC_i** de un paquete, ni el avance baja sin explicación escrita.
- **Un cambio aprobado mueve el BAC** (nueva versión de línea base). Hasta entonces, el trabajo extra es sobrecosto, no alcance.
