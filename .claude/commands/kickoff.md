---
description: (módulo Proyectos / PMO) Arranca un proyecto — crea su carpeta desde las plantillas y construye el acta de constitución por etapas
argument-hint: "<nombre del proyecto>  (ej: Nueva sede regional)"
---

Arranca el proyecto `$ARGUMENTS`.

## 0. Módulo activo
Comprueba en [00_perfil/config_copiloto.md](../../00_perfil/config_copiloto.md) que **Proyectos / PMO** esté marcado `[x]`. Si no, responde solo esto y no sigas: «El módulo Proyectos / PMO está desactivado. Actívalo con `/configurar` (Etapa 4) y vuelve a correr `/kickoff`.»

Reglas del módulo: [08_conocimiento/sops/gestion_proyectos.md](../../08_conocimiento/sops/gestion_proyectos.md).
Estructura de carpeta y frontmatter: [03_iniciativas/README.md](../../03_iniciativas/README.md).
Arranque de relación/proyecto: [SOP de onboarding](../../08_conocimiento/sops/onboarding.md) — este comando es su paso 3 cuando hay sponsor y presupuesto.

## 1. Ubica
- Convierte el nombre en slug (`ampliacion_planta_norte`). Si ya existe `03_iniciativas/<slug>/`, no lo pises: dime en qué fase está y pregúntame si quiero retomarlo.
- Si no me diste nombre, pregúntamelo — es lo único que no puedes asumir.
- Busca lo que ya hay sobre el proyecto: la relación en [02_relaciones/](../../02_relaciones/), actas en `reuniones/`, propuesta en [04_comercial/propuestas/](../../04_comercial/propuestas/) si el módulo está activo, un caso de negocio en [03_iniciativas/](../../03_iniciativas/). No me preguntes lo que ya está escrito.

## 2. Crea la carpeta
Desde [08_conocimiento/plantillas/proyecto/](../../08_conocimiento/plantillas/proyecto/): `acta_constitucion.md`, `interesados.md`, `riesgos.md`, `cambios.md` (vacío) y `lecciones_aprendidas.md` (vacío), más las carpetas `estado/` y `reuniones/`. **La EDT y el cronograma no**: esos salen de la planificación, después del acta.

## 3. Construye el acta por etapas
Aplica la skill `acta-de-constitucion`: tres bloques de 2–4 preguntas, con borrador y supuestos `[ASUMIDO: ...]` antes de cada bloque, para que yo solo corrija. Escribe el acta a medida que avanzamos, no al final.

Frontmatter completo: `aliases` con el nombre del proyecto, `sponsor`, `pm`, `relacion`, `objetivo` (wikilink al objetivo de [01_objetivos/okrs.md](../../01_objetivos/okrs.md)), `inicio`, `fin_objetivo`, `presupuesto` (base, sin reservas), `fase: inicio`, `semaforo: verde`.

Si el proyecto no aporta a ningún objetivo vigente, dímelo antes de seguir.

## 4. Completa lo que sale del acta
- **Interesados**: con los del acta, aplica `registro-interesados` para la primera versión de `interesados.md`. Propón fichas en [02_relaciones/](../../02_relaciones/) para los externos con poder que no la tengan.
- **Riesgos iniciales**: los 3–5 del acta a `riesgos.md` con la matriz de [sops/riesgos.md](../../08_conocimiento/sops/riesgos.md). Si el proyecto es grande, delega en el agente `analista-riesgos`.
- **Reserva de contingencia**: según el SOP §5, anotada en el acta y en `riesgos.md`.

## 5. Registra
- Fila nueva en [03_iniciativas/portafolio.md](../../03_iniciativas/portafolio.md) (crea el archivo si no existe).
- [TASKS.md](../../TASKS.md): firma del acta por el sponsor y reunión de kickoff, con fecha absoluta.
- Si hay calendario conectado ([00_perfil/config_copiloto.md](../../00_perfil/config_copiloto.md)), propón el evento del kickoff — **muéstramelo y espera mi confirmación**. Si hay herramienta de gestión de proyectos conectada, dime qué conviene crear allá; no lo crees sin mi OK.
- Si el proyecto es grande o irreversible, sugiere pasarlo por el agente `contradictor` antes de la firma.

## Cierre
1. Resumen de 5 líneas: qué proyecto, sponsor, presupuesto, fecha fin, qué asumí.
2. Lo que falta para firmar el acta.
3. Siguiente paso: planificación con el agente `planificador-proyectos` (EDT + cronograma) — pregúntame si arrancamos ya.

**No hagas**: inventar presupuesto o fechas (van como `[ASUMIDO]`), crear la EDT sin acta aprobada, enviar nada ni crear eventos sin confirmación.
