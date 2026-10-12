---
name: control-de-cambios
description: Actívala cuando alguien pida algo que mueve el alcance, la fecha o el costo de un proyecto con línea base — "el cliente quiere agregar X", "nos piden adelantar la entrega", "el proveedor subió el precio", "¿podemos incluir esto?", un riesgo que se materializó, o cuando /cambio registre una solicitud. Lleva la solicitud desde el registro hasta la decisión: impacto en alcance, tiempo, costo y riesgo, alternativas y nivel de autoridad según el SOP.
---

# Control de cambios

Un proyecto no se desvía por un cambio grande: se desvía por veinte pequeños que nadie registró. Esta skill convierte "¿podemos incluir esto?" en una decisión con dueño y consecuencias escritas.

Registro: [cambios.md](../../../08_conocimiento/plantillas/proyecto/cambios.md) del proyecto. Niveles de autoridad, umbrales y acumulados: [SOP de gestión de proyectos §4](../../../08_conocimiento/sops/gestion_proyectos.md) — **la skill los aplica, no los define**.

## El flujo

### 1. Registrar
Fila nueva en `cambios.md` con ID `CC-NN`, fecha, quién lo pide, qué pide y por qué. Estado `solicitado`. **Antes de evaluar, antes de opinar.** Lo que no está registrado no existe, y lo que no existe se ejecuta por debajo de la mesa.

### 2. Evaluar el impacto
Lee la [EDT](../../../08_conocimiento/plantillas/proyecto/edt.md), el [cronograma](../../../08_conocimiento/plantillas/proyecto/cronograma.md) (ruta crítica y holguras) y los riesgos del proyecto. Responde con número o con "ninguno":

| Dimensión | Pregunta |
|---|---|
| **Alcance** | ¿Qué paquetes de la EDT se agregan, cambian o desaparecen? ¿Toca los objetivos del acta? |
| **Tiempo** | ¿Toca la ruta crítica? ¿Cuántos días hábiles mueve la fecha fin? ¿Qué hito se corre? |
| **Costo** | Costo directo + el costo del tiempo adicional + el impacto sobre otros paquetes. En dinero y en % del presupuesto base. |
| **Calidad** | ¿Cambia algún criterio de aceptación? |
| **Riesgos** | ¿Crea, agrava o elimina alguno? Pásalo al agente `analista-riesgos` si cambia de nivel. |
| **Interesados** | ¿Quién gana, quién pierde, quién tiene que enterarse? |

Si el impacto no se puede estimar con lo que hay, dilo: el estado pasa a `en_evaluacion` con fecha y qué falta.

### 3. Alternativas
Mínimo dos, **siempre incluida "no hacerlo"** con su consecuencia. Casi siempre existe una versión más pequeña del cambio que resuelve el 80 % del problema: propónla.

### 4. Nivel y autoridad
Clasifica por el **mayor** de los impactos con la tabla del SOP §4, sumando los acumulados del proyecto. Escribe el nivel en la fila. Si el nivel es 2 o 3, el PM no decide: **recomienda**, y la skill redacta la solicitud al sponsor o al comité (estructura de `comunicacion-ejecutiva`: qué se pide, cuánto cuesta, qué pasa si no, para cuándo se necesita la respuesta).

### 5. Decidir
Quien tiene la autoridad decide: `aprobado` · `rechazado` · `diferido` (con fecha de revisión). Con nombre, fecha y condición si la hay. Un cambio de nivel 2 o 3 va además a [07_equipo/decisiones.md](../../../07_equipo/decisiones.md) con la plantilla [decision.md](../../../08_conocimiento/plantillas/decision.md).

### 6. Implementar
Un `aprobado` actualiza la línea base **en el mismo cambio**: EDT (nueva versión), cronograma (`Fecha comprometida` se conserva, cambia `Fecha estimada` y el historial), `presupuesto` y `fin_objetivo` en el frontmatter del acta si los mueve. Estado `implementado` cuando el trabajo quedó reflejado. Comunica a los interesados afectados según su plan de comunicación.

## Reglas

- **Nada se ejecuta sin fila.** Ni "mientras tanto vamos avanzando".
- **No hay cambios gratis.** Un cambio con "impacto cero" en las tres dimensiones casi siempre tiene el costo escondido en el tiempo del equipo. Búscalo.
- **El *gold plating* es un cambio** aunque lo proponga el propio equipo y aunque el cliente no lo haya pedido.
- **Los acumulados cuentan** (SOP §4). Lleva la suma al día en la cabecera de `cambios.md`.
- **Un riesgo materializado que toca la línea base entra por aquí**, y deja además lección aprendida.
- **La fecha comprometida original no se borra nunca.** Se conserva junto a la nueva: es la memoria de cuántas veces se movió.
- Tono con quien pide el cambio: [voz_y_estilo.md](../../../08_conocimiento/voz_y_estilo.md). Decir que no a un cambio con un impacto escrito es más fácil que decirlo con una opinión.

## Al cerrar
Deja la fila y el detalle en `cambios.md`, actualiza el acumulado, agrega a [TASKS.md](../../../TASKS.md) lo que espera decisión (con dueño y la fecha del SOP §2) y, si el cambio cambió el semáforo, dilo en el siguiente `/estado-semanal`.
