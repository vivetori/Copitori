---
name: registro-interesados
description: Actívala cuando un proyecto tenga varios actores con poder sobre él — al arrancar (/kickoff), al cambiar de fase, cuando aparezca alguien nuevo que decide o puede frenar, o cuando el usuario pregunte "a quién tengo que tener contento", "quién puede tumbar esto", "cómo le comunico esto a cada uno". Produce el registro de interesados con matriz poder/interés, postura por hechos y plan de comunicación.
---

# Registro de interesados

Los proyectos no fracasan por el Gantt: fracasan porque alguien con poder no estaba de acuerdo y nadie lo supo a tiempo. Esta skill pone nombre a esas personas y decide cuánto y cómo se les habla.

Plantilla: [interesados.md](../../../08_conocimiento/plantillas/proyecto/interesados.md). Cadencias mínimas por estrategia: [SOP de gestión de proyectos §9](../../../08_conocimiento/sops/gestion_proyectos.md).

## 1. Identificar

Fuentes, en este orden: el acta (sponsor, PM, quién acepta), las fichas de [02_relaciones/](../../../02_relaciones/), las actas en `reuniones/`, el organigrama en [00_perfil/organizacion.md](../../../00_perfil/organizacion.md). Pregunta por los que no aparecen en ningún documento: operaciones que reciben el resultado, finanzas que paga, legal que firma, la comunidad o el regulador si el proyecto los toca.

Para una persona u organización externa que no conoces, delega en el agente `investigador`; para prepararte antes de hablar con cualquiera de ellos, `/reunion`.

## 2. Clasificar

| | Interés bajo | Interés alto |
|---|---|---|
| **Poder alto** | **Mantener satisfecho** — que no se sorprenda nunca | **Gestionar de cerca** — decide con el PM |
| **Poder bajo** | **Monitorear** — aviso al cambiar de fase | **Mantener informado** — recibe avance |

- **Poder**: puede aprobar, financiar, frenar o cambiar el alcance. No es jerarquía: un técnico que es el único que sabe operar el sistema tiene poder.
- **Interés**: cuánto le afecta el resultado, para bien o para mal.
- **Postura** (`promotor` / `neutral` / `opositor`): solo por **hechos observables** — qué dijo en acta, qué firmó, qué bloqueó, a qué reunión no fue. Nada de psicología ni de intenciones: aplica las reglas del agente `gestor-de-equipo`.
- **Qué espera y qué teme**: en sus palabras si las tienes; si no, `[ASUMIDO: ...]`.

## 3. Plan de comunicación

Para cada interesado: qué recibe · por qué canal · con qué frecuencia · quién es responsable. La cadencia mínima la fija el SOP §9; aquí se puede subir, nunca bajar.

Reglas:
- **El sponsor recibe el informe de estado** (skill `informe-de-estado`), no un resumen distinto. Un mensaje por audiencia, no una versión por persona.
- **Los opositores con poder se gestionan de cerca** aunque su interés parezca bajo. Son los que no avisan.
- **Malas noticias primero y en persona** a quien tiene poder; por escrito después. Estructura con `comunicacion-ejecutiva`; tono de [voz_y_estilo.md](../../../08_conocimiento/voz_y_estilo.md).
- Si alguien lleva dos cadencias sin recibir lo suyo, aparece en `/seguimiento`.

## Al cerrar

1. Escribe `interesados.md` del proyecto. Enlaza con `[[Nombre]]` a quien tenga ficha; a quien no la tenga y sea externo con poder, propón crearla en [02_relaciones/](../../../02_relaciones/).
2. Los opositores con poder y las dependencias de una sola persona van al agente `analista-riesgos`.
3. Revísalo al cambiar de fase y cuando entre o salga alguien con poder. Un registro de interesados que no cambió en tres meses está desactualizado.

**Confidencialidad**: este archivo describe a personas reales. Hechos, no juicios; nada de vida personal; no sale del espacio del usuario.
