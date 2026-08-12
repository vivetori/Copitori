---
name: informe-de-estado
description: Actívala al reportar el avance de un proyecto o iniciativa hacia AFUERA — a un cliente, a un sponsor, a la junta, a otra área. Semáforo, hitos, bloqueos y lo que necesitas de ellos. Para el cierre interno de tu semana usa /revision-semanal.
---

# Informe de estado

Reporte hacia afuera: alguien que no vive el proyecto necesita saber en treinta segundos si va bien y qué necesitas de él.

> **No confundir con [`/revision-semanal`](../../commands/revision-semanal.md)**, que es tu cierre interno contra objetivos. Esto se envía a otra persona y por eso se escribe distinto: menos detalle, más decisión.

## Estructura

### Encabezado
Proyecto · periodo · responsable · **semáforo**.

### Semáforo — con criterio declarado

| | Significa |
|---|---|
| 🟢 **Verde** | Hitos en fecha, sin bloqueos, presupuesto dentro de lo previsto. |
| 🟡 **Amarillo** | Algo se va a mover o hay un riesgo activo **con** mitigación en curso. Todavía se arregla dentro del equipo. |
| 🔴 **Rojo** | Un hito ya se perdió o se perderá, o hay un bloqueo que **no** se resuelve sin quien lee esto. |

**Regla dura**: un proyecto pasa a rojo el día que se sabe, no el día que ya no hay remedio. El amarillo que dura tres periodos seguidos es rojo — nómbralo.

Si cambió de color desde el último informe, **dilo en la primera línea y explica por qué**. Es lo primero que se busca.

### Resumen (3 líneas)
Qué se logró · qué está en riesgo · qué necesito de ti.

### Hitos
| Hito | Fecha comprometida | Fecha estimada | Estado |
|---|---|---|---|

Mantén siempre la **fecha comprometida original** junto a la estimada. Reemplazarla borra la historia y es exactamente lo que hace que nadie confíe en las fechas.

### Bloqueos
Solo lo que está detenido, con: qué está parado · desde cuándo · **qué necesito y de quién** · qué pasa si no se destraba y para cuándo.

Un bloqueo sin petición concreta no es un bloqueo, es una queja.

### Riesgos
Los que quien lee puede ayudar a mitigar. Los internos quedan en [07_equipo/riesgos.md](../../../07_equipo/riesgos.md), no aquí.

### Próximo periodo
Máximo tres cosas, con fecha.

## Reglas

- **Nunca maquilles el semáforo.** Un verde que se vuelve rojo de golpe cuesta más credibilidad que tres periodos en amarillo honesto. Esto se recuerda por años.
- **Malas noticias arriba.** Aplica la skill `comunicacion-ejecutiva`.
- **Toda cifra con contexto.** Aplica la skill `presentar-numeros`.
- **No reportes actividad, reporta avance.** "Tuvimos seis reuniones" no dice nada; "el módulo de pagos quedó aprobado por el cliente" sí.
- **Mismo formato cada periodo.** La comparabilidad es la mitad del valor de reportar.
- **Solo lo verificable.** Si no sabes el estado de algo, dilo — no lo pongas en verde por defecto.

## Fuentes y cierre

Sácalo de la ficha en [03_iniciativas/](../../../03_iniciativas/): plan de fases, riesgos y bitácora. Si la ficha está desactualizada, actualízala primero: el informe es un reflejo, no una fuente paralela.

Al terminar: registra el envío en la bitácora de la iniciativa, agrega a [TASKS.md](../../../TASKS.md) lo que te comprometiste a resolver, y muestra el borrador antes de enviarlo.
