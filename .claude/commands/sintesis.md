---
description: Responde una pregunta cruzando toda la bóveda y las herramientas conectadas, con fuentes citadas
argument-hint: "<pregunta>  (ej: por qué se paró el proyecto con Acme)"
---

Responde: `$ARGUMENTS`

Esto no es una búsqueda: es una **síntesis**. Cruza todo lo que hay, resuelve las contradicciones y dame
una respuesta que pueda usar para decidir. Con fuentes, para que pueda verificarla.

> **Delega en el agente `archivista`.** Barrer la bóveda entera puede costar decenas de archivos y no
> debe consumir el hilo principal: él lee mucho y devuelve poco. Tú me entregas su síntesis y seguimos
> conversando sobre ella. Si la pregunta abarca varios frentes independientes, lánzalo en paralelo, uno por frente.

## 1. Barre en paralelo
- **La bóveda**: [02_relaciones/](../../02_relaciones/) (fichas y actas), [03_iniciativas/](../../03_iniciativas/), [07_equipo/decisiones.md](../../07_equipo/decisiones.md), [07_equipo/riesgos.md](../../07_equipo/riesgos.md), [09_bitacora/](../../09_bitacora/), y los módulos activos.
- **Los backlinks**: si la pregunta es sobre una entidad con ficha, lo que la enlaza suele valer más que la ficha misma.
- **Las herramientas conectadas** (correo, calendario, drive, CRM, transcripciones) según [00_perfil/config_copiloto.md](../../00_perfil/config_copiloto.md). Si no hay ninguna, dilo y sigue con los archivos.

## 2. Deduplica
El mismo hecho aparece en varios sitios: acta, correo, ficha, bitácora. Fúndelos en un solo punto
y cita todas las fuentes. Cuando dos versiones difieran, prefiere en este orden:
1. La más completa (con contexto, no solo la conclusión).
2. La más autoritativa: decisión registrada > acta > correo > nota suelta.
3. La más reciente, si el asunto evolucionó.

**No fundas** lo que solo parece repetido: posturas distintas de personas distintas, o una decisión
que cambió entre marzo y junio, son dos hechos — y su diferencia suele ser la respuesta.

## 3. Responde
- **La respuesta primero**, en 3–5 líneas. Sin preámbulo.
- **La cronología**, si la pregunta es sobre cómo se llegó hasta aquí: fechas absolutas, un hecho por línea.
- **Lo que está en disputa**: dónde las fuentes se contradicen y cuál es más creíble.
- **Nivel de confianza**: alto (fuentes concordantes y recientes), medio (indirectas o antiguas), bajo (una sola fuente o inferencia). Dilo explícitamente.
- **Lo que falta**: qué dato cerraría la pregunta y dónde buscarlo. Un hueco nombrado vale más que un relleno plausible.

**Nunca rellenes con lo que suena razonable.** Si la bóveda no lo dice, la respuesta es "no está registrado".

## 4. Fuentes
Al final, lista cada fuente con enlace y fecha:
```
- [[2026-05-14_Acme_Kickoff]] — acta, 14 may
- [[Acme S.A.]] — ficha, actualizada 2 jun
- Correo "Alcance fase 2" de Ana Ruiz — 3 jun (Gmail)
```

## 5. Cierra el círculo
Si la síntesis destapa algo que debería estar registrado y no lo está — una decisión sin acta, un
riesgo sin registrar, un compromiso sin tarea — propónlo al final como acción concreta. Es la mitad
del valor de haber preguntado.
