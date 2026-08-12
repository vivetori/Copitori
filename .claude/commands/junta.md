---
description: Prepara una junta directiva o comité — agenda, materiales, cifras, riesgos y las preguntas incómodas que te van a hacer
argument-hint: "<fecha o nombre de la junta>  (ej: junta trimestral 30 de septiembre)"
---

Prepárame la junta `$ARGUMENTS`. Esto es material de gobierno: honesto, con cifras, sin adornos.
Si algo va mal, va en la agenda — una junta que solo trae buenas noticias no sirve para decidir.

## 1. Encuadre
Confirma en una línea: tipo de junta (directiva, comité, socios), fecha, duración y asistentes.
Si no me lo diste, dedúcelo del calendario si está conectado; si no, propónlo con `[ASUMIDO: ...]` y sigue.

## 2. Agenda propuesta
Construye la agenda con tiempos, ordenada por lo que **requiere decisión** primero. Estructura base:

| Bloque | Contenido |
|---|---|
| Apertura | Los 3 titulares del periodo: qué ganamos, qué perdimos, qué decidimos hoy |
| Resultados | Avance contra [01_objetivos/okrs.md](../../01_objetivos/okrs.md) y [01_objetivos/kpis.md](../../01_objetivos/kpis.md) |
| Finanzas | *(si el módulo está activo)* Delega en el agente `analista-financiero` |
| Iniciativas | Estado de [03_iniciativas/](../../03_iniciativas/): en curso, en riesgo, bloqueadas |
| Comercial | *(si el módulo está activo)* [04_comercial/pipeline.md](../../04_comercial/pipeline.md) |
| Riesgos | Delega en el agente `analista-riesgos`: solo críticos y altos de [07_equipo/riesgos.md](../../07_equipo/riesgos.md) |
| Decisiones que pido | Lo que necesita voto o aval, con la recomendación |
| Cierre | Acuerdos y responsables |

Marca cada bloque como **decisión**, **discusión** o **informativo**. Si más de la mitad es informativo, dímelo: esa junta es un correo.

## 3. Lo que pido decidir
Para cada punto que requiere aval:
- **Qué decido**: la pregunta, en una frase cerrada.
- **Opciones**: 2–3, con su costo y su consecuencia.
- **Mi recomendación** y por qué.
- **Qué pasa si no decidimos hoy**: el costo de esperar.

Pasa cada decisión de peso por el agente `contradictor` antes de llevarla. Si una objeción sobrevive, va en el material: la junta va a encontrarla de todos modos, y es mejor que la traiga yo.

## 4. Las preguntas que me van a hacer
Anticipa 5–8 preguntas incómodas, con respuesta preparada y el dato que la sustenta.
Prioriza: desviaciones contra plan, cualquier cifra que empeoró, promesas de la junta anterior sin cumplir
(revisa [07_equipo/decisiones.md](../../07_equipo/decisiones.md) y las actas previas en [07_equipo/reuniones/](../../07_equipo/reuniones/)).
Si no tengo respuesta para alguna, dilo — es mejor saberlo hoy.

## 5. Materiales
- **Pre-lectura** de 1 página: lo que deben leer antes, para no gastar la junta explicando.
- **Presentación**: si te la pido, úsala con la skill de PowerPoint. Una idea por lámina, la cifra grande y la conclusión escrita en el título.
- **Anexos**: enlaza los archivos de respaldo, no los pegues.

## Al terminar
1. Guarda todo en `07_equipo/reuniones/YYYY-MM-DD_Junta.md` con la plantilla [reunion.md](../../08_conocimiento/plantillas/reunion.md), enlazando con wikilinks las iniciativas, relaciones y riesgos que menciones.
2. Agrega a [TASKS.md](../../TASKS.md) lo que debo preparar antes, con fecha.
3. Recuérdame correr `/guardar-reunion` al terminar la junta para registrar decisiones y acuerdos.
