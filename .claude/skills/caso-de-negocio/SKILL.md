---
name: caso-de-negocio
description: Actívala cuando haya que justificar una inversión o un gasto relevante — contratar a alguien, comprar una herramienta, abrir una línea, cambiar de proveedor, aprobar un presupuesto, decir que sí o que no a un proyecto grande. Construye el argumento con números, alternativas y recomendación.
---

# Caso de negocio

Un caso de negocio no vende una idea: **permite decidir**. Si al terminarlo no se puede decir que no, está mal hecho.

## Estructura

### 1. Resumen para decidir *(media página, se escribe al final)*
- **Qué pido**: la decisión en una frase cerrada.
- **Cuánto cuesta**: total y en qué momentos sale el dinero.
- **Qué devuelve**: el beneficio cuantificado, y cuándo.
- **Recuperación**: en cuántos meses se paga.
- **Recomendación**: `hacerlo` · `hacerlo con condición` · `no hacerlo` · `todavía no`.

### 2. El problema
Qué está roto **hoy** y cuánto cuesta que siga así — en dinero, tiempo, riesgo o clientes perdidos.

> El costo del statu quo es la parte que más se olvida y la que más convence. "No hacer nada" nunca es gratis: ponle número.

**Por qué ahora**: qué cambió. Sin disparador, la respuesta correcta suele ser "todavía no".

### 3. Alternativas
Mínimo tres, **incluyendo siempre "no hacer nada"**:

| Opción | Costo | Qué resuelve | Qué no resuelve | Riesgo |
|---|---|---|---|---|
| No hacer nada | 0 + el costo del problema |  |  |  |
| La propuesta |  |  |  |  |
| Alternativa más barata |  |  |  |  |

Un caso con una sola opción no es un caso: es una petición.

### 4. Los números
Aplica la skill `presentar-numeros`. Si el módulo Finanzas está activo, delega el cálculo en el agente `analista-financiero`.

- **Costos**: todos. Licencia + implementación + formación + el tiempo del equipo + lo que hay que mantener después. El costo oculto es casi siempre el tiempo interno.
- **Beneficios**: separa los **duros** (ingreso adicional, ahorro medible) de los **blandos** (mejor decisión, menos fricción). No los sumes juntos: los blandos se enuncian, no se cuantifican a la fuerza.
- **Cuándo llega cada cosa.** Un beneficio en el mes 18 con una caja de 6 meses no es un beneficio.
- **Recuperación** y, si el monto lo amerita, valor presente.
- **Supuestos declarados**, cada uno con su fuente. Y qué pasa si el principal falla un 30%.

### 5. Ejecución
Fases con entregables y fechas · quién lo hace (¿tiene capacidad?) · de quién depende · cómo se mide el éxito a los 3 y 6 meses.

### 6. Riesgos
Los 3–5 materiales, evaluados según [sops/riesgos.md](../../../08_conocimiento/sops/riesgos.md), cada uno con su mitigación.

**La salida**: cómo se sale si no funciona y cuánto cuesta salir. Una inversión sin salida es una apuesta.

## Reglas

- **Nunca inventes cifras para que cuadre.** Lo que no tengas va marcado como faltante o como supuesto explícito. Un caso con números inventados se descubre en el mes tres.
- **Cuantifica el statu quo** o el caso no se sostiene.
- **Nada de beneficios de catálogo.** "Mejora la productividad" no es un beneficio; "libera 6 horas semanales de Ana, que hoy factura X" sí.
- **Escribe también la razón para no hacerlo.** Si no encuentras ninguna, no miraste bien — y quien decide sí la va a encontrar.
- Si la inversión es material, **pásalo por el agente `contradictor` antes de presentarlo**. Las objeciones que sobrevivan van dentro del documento.
- **Filtro estratégico**: si no aporta a ningún objetivo de [01_objetivos/okrs.md](../../../01_objetivos/okrs.md), dilo en la primera página.

## Al cerrar

Guarda el caso en la iniciativa correspondiente de [03_iniciativas/](../../../03_iniciativas/) o, si aún no existe, propón crearla. Cuando se decida, registra la decisión **con su justificación numérica** en [07_equipo/decisiones.md](../../../07_equipo/decisiones.md) — para que dentro de un año se pueda comparar lo prometido con lo que pasó.
