---
name: acta-de-constitucion
description: Actívala al arrancar un proyecto con sponsor, presupuesto o fecha comprometida — cuando el usuario diga "vamos a arrancar X", "me asignaron el proyecto Y", "necesito el acta / charter / documento de inicio", o cuando /kickoff cree la carpeta del proyecto. Produce el acta de constitución (project charter) por etapas, con objetivos medibles, alcance negativo explícito y autoridad clara.
---

# Acta de constitución

El acta es el contrato que autoriza el proyecto: qué se va a lograr, con cuánto, para cuándo y quién decide. Sin acta aprobada no hay proyecto, hay una intención — y las intenciones no tienen sponsor que las defienda cuando falta plata.

Plantilla: [acta_constitucion.md](../../../08_conocimiento/plantillas/proyecto/acta_constitucion.md). Reservas, autoridad y criterios: [SOP de gestión de proyectos](../../../08_conocimiento/sops/gestion_proyectos.md). Regla de oro del arranque: [SOP de onboarding](../../../08_conocimiento/sops/onboarding.md).

## Antes de preguntar

1. Lee lo que ya existe: la relación en [02_relaciones/](../../../02_relaciones/), actas previas en `reuniones/`, la propuesta en [04_comercial/propuestas/](../../../04_comercial/propuestas/) si el módulo está activo, el caso de negocio si lo hubo. La mitad del acta ya está escrita en algún sitio.
2. Lee [01_objetivos/okrs.md](../../../01_objetivos/okrs.md): el acta debe decir a qué objetivo contribuye. Si no contribuye a ninguno, dilo en la primera línea — es el primer hallazgo, no un detalle.
3. Redacta un **borrador completo** con `[ASUMIDO: ...]` en todo lo que no esté sustentado. Es más fácil corregir que crear desde cero.

## Las preguntas, por etapas (2–4 por bloque)

**Bloque 1 — El porqué y el qué.** ¿Qué problema u oportunidad resuelve y qué pasa si no se hace? ¿Qué resultado medible lo declara exitoso? ¿Qué queda explícitamente fuera?

**Bloque 2 — El marco.** ¿Quién es el sponsor y quién el PM? ¿Presupuesto base y fecha fin comprometida — y cuál de los dos es la restricción dura? ¿Qué supuestos estamos dando por ciertos (recursos, aprobaciones, proveedores)?

**Bloque 3 — Lo que puede torcerlo.** ¿Quién puede frenarlo? ¿Qué nos preocupa desde el día uno? ¿Quién acepta los entregables y con qué criterio?

No dispares los tres bloques de golpe. Propón, confirma, avanza.

## Reglas del acta

- **Objetivos medibles o no son objetivos.** "Mejorar la capacidad" no se puede cerrar; "pasar de 400 a 560 unidades/día antes del 2026-12-28" sí. Cada objetivo con indicador, meta y fecha.
- **El alcance negativo es obligatorio.** Lo que alguien podría suponer que está incluido y no lo está. Es la frase que evita el 80 % de las discusiones de cambio.
- **Un sponsor con nombre y autoridad real.** Si quien firma no puede aprobar un cambio de nivel 2 del SOP, no es el sponsor: es un interesado.
- **Presupuesto base separado de las reservas.** El BAC es el que se compara con el valor ganado; la contingencia se consume solo con cambio registrado.
- **Supuestos ≠ riesgos.** Un supuesto es lo que damos por verdad; si es improbable, no es supuesto: pásalo a riesgos.
- **Criterio de aceptación por entregable**, con quién acepta. "Aprobado por el cliente" sin nombre es nadie.
- **Nada inventado.** Cifras, fechas y nombres sin fuente van como `[ASUMIDO: ...]` con el dato que los confirmaría.

## Al cerrar

Antes de escribir, comprueba que el módulo Proyectos / PMO esté `[x]` en [00_perfil/config_copiloto.md](../../../00_perfil/config_copiloto.md). Si está `[ ]`, entrega el acta en la conversación y sugiere en una línea activarlo con `/configurar` para guardarla como carpeta de proyecto; no crees la carpeta.

1. Escribe `03_iniciativas/<slug>/acta_constitucion.md` con el frontmatter completo (`aliases` con el nombre del proyecto, `sponsor`, `pm`, `inicio`, `fin_objetivo`, `presupuesto`, `fase: inicio`).
2. Pasa los riesgos iniciales a `riesgos.md` del proyecto y los interesados clave a `interesados.md` (skill `registro-interesados`).
3. Agrega a [TASKS.md](../../../TASKS.md): firma del acta por el sponsor y reunión de kickoff, con fecha.
4. Si el proyecto es grande o irreversible, propón pasarlo por el agente `contradictor` **antes** de la firma. Las objeciones que sobrevivan van en el acta como supuestos o riesgos.
5. Propón el siguiente paso: planificación con el agente `planificador-proyectos` (EDT + cronograma).
