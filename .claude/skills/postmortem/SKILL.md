---
name: postmortem
description: Actívala cuando algo salió mal y hay que entender por qué — un cliente perdido, un proyecto que se atrasó o fracasó, una entrega con errores, una propuesta rechazada, un incidente operativo, una decisión que resultó cara. Reconstruye qué pasó sin buscar culpables y convierte el fracaso en regla.
---

# Postmortem

Un fracaso sin postmortem se repite. Uno con postmortem que busca culpables se repite **y además** destruye la confianza para contar el siguiente.

## El principio

**Sin culpables, con responsables.** Se analiza el sistema, no a la persona. Si tu conclusión es "Ana se equivocó", no terminaste: la pregunta real es por qué el proceso permitió que un error de una persona llegara hasta el cliente.

Nadie se levanta con la intención de hacerlo mal. Si alguien tomó una decisión que hoy parece obvia y equivocada, **en su momento tenía sentido con la información que tenía**. Reconstruye esa información, no la de ahora.

## 1. Los hechos

Cronología con fechas y horas, un hecho por línea, **con su evidencia**:

| Cuándo | Qué pasó | Quién lo sabía | Dónde consta |
|---|---|---|---|
|  |  |  |  |

Fuentes: actas en `reuniones/`, [09_bitacora/](../../../09_bitacora/), correos, la ficha de la relación, [07_equipo/decisiones.md](../../../07_equipo/decisiones.md).

Marca cuatro momentos: **cuándo empezó** · **cuándo se pudo haber detectado** · **cuándo se detectó de verdad** · **cuándo se actuó**. Las brechas entre ellos suelen ser el hallazgo.

## 2. Los porqués

Encadena hasta llegar a algo que se pueda cambiar. Baja al menos cinco niveles — los tres primeros casi siempre son síntomas.

Cuando llegues a "falta de comunicación" o "falta de tiempo", **no pares**: eso no es una causa, es una etiqueta. ¿Qué hizo que faltara?

Termina en una causa que sea **accionable**. Si terminas en "el mercado cambió", el hallazgo real es que no lo vimos venir — y eso sí se puede cambiar.

## 3. Qué funcionó
Corto pero obligatorio. En casi todo fracaso hay algo que evitó que fuera peor: detectarlo evita desmontarlo en la reacción.

## 4. Las señales que estaban ahí
Lo que se veía y no se leyó. Casi siempre hay dos o tres. **No es para castigarse**: es el insumo de la próxima alerta temprana.

## 5. Qué cambia

Cada acción con dueño y fecha. Va a [TASKS.md](../../../TASKS.md).

Prioriza en este orden:
1. **Cambiar el sistema** — que el error ya no sea posible o que se detecte solo.
2. **Cambiar el proceso** — una verificación, un umbral, un paso.
3. **Cambiar el comportamiento** — lo más débil: depende de que alguien se acuerde.

> Si la única acción es "tener más cuidado", el postmortem falló. Eso no es una acción.

## Reglas

- **Los hechos primero, las interpretaciones marcadas como tales.**
- **Nada de psicología ni de motivos.** Qué hizo alguien es un hecho; por qué lo hizo, salvo que lo haya dicho, es especulación.
- **No lo hagas en caliente**, salvo que siga sangrando. Y si involucra a personas concretas, aplica las reglas del agente `gestor-de-equipo`.
- **Proporción**: un retraso de dos días no merece este análisis. Reserva esto para lo que costó dinero, un cliente o credibilidad.

## Al cerrar

1. Guarda el postmortem en la carpeta de la iniciativa o de la relación, con wikilinks a lo involucrado.
2. Registra en [07_equipo/decisiones.md](../../../07_equipo/decisiones.md) qué se decidió cambiar.
3. Si aparece un riesgo que puede repetirse, pásalo al agente `analista-riesgos`.
4. **Si la lección es permanente, conviértela en regla**: usa la skill `crear-sop`. Un aprendizaje que vive en un documento archivado no cambia nada; uno que vive en un SOP se aplica solo.
