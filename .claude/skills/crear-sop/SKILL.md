---
name: crear-sop
description: Actívala cuando el usuario describa un proceso que se repite o diga cosas como "siempre lo hacemos así", "la regla es", "cada vez que pasa X hacemos Y", "el criterio para aprobar es". Convierte ese conocimiento en un SOP con dueño único en 08_conocimiento/sops/.
---

# Crear un SOP

Copitori funciona con **dueño único de cada regla**: un umbral, un criterio o una condición se define en un solo archivo, y todo lo demás lo referencia. Esta skill convierte conocimiento que vive en la cabeza del usuario en una regla que el sistema aplica solo.

## Cuándo sí y cuándo no

**Sí** cuando: se repite (mensual o más), hay un criterio o umbral que hoy se decide "a ojo", el resultado varía según quién lo haga, o alguien nuevo tendría que preguntar cómo se hace.

**No** cuando: pasó una sola vez, es una decisión de contexto que cambia cada vez, o ya está cubierto por un SOP existente. En ese último caso **actualiza el que hay** — nunca crees uno paralelo. Dos SOPs sobre lo mismo con valores distintos es peor que ninguno.

## Antes de escribir

1. **Lee los SOPs existentes** en [08_conocimiento/sops/](../../../08_conocimiento/sops/). Si el tema ya tiene dueño, ese archivo es el destino.
2. **Extrae las reglas reales.** Si el usuario describe el proceso en prosa, tu trabajo es sacar los números: cuántos días, desde qué monto, con qué aprobación. Un SOP sin umbrales concretos no sirve de nada.
3. **Pregunta solo lo que falte para que sea aplicable.** No hagas un cuestionario: propón valores por defecto sensatos marcados `[ASUMIDO: ...]` y deja que corrija. Es más rápido corregir que inventar.

## La estructura

```markdown
# SOP — [Nombre de la regla]

> **Dueño único de esta regla.** [Qué define exactamente y qué NO define.]
> Lo usan: [comandos y agentes que la referencian].
> Ajusta estos valores a tu realidad. Son un punto de partida, no dogma.

## [Umbrales / Criterios / Niveles]
[Tabla. Aquí van los números — es el corazón del SOP.]

## Reglas
- [Lo que siempre se hace, en imperativo.]
- [Lo que nunca se hace.]

## [Cadencia / Excepciones]
[Cuándo se revisa. Quién puede saltarse la regla y con qué justificación.]

---
Cambios: [YYYY-MM-DD] — [qué cambió y por qué].
```

## Reglas al escribirlo

- **Concreto y verificable.** "Responder rápido" no es una regla; "responder en menos de 24 h hábiles" sí. Si no se puede comprobar si se cumplió, no es un SOP.
- **Una regla, un lugar.** Si el nuevo SOP necesita un valor que ya existe en otro, **enlázalo**, no lo copies. Copiar un umbral es sembrar una contradicción futura.
- **Declara qué NO cubre.** Es lo que evita que dos SOPs se pisen.
- **Define las excepciones.** Una regla sin salida se rompe en silencio; una con salida documentada se respeta.
- **Corto.** Un SOP de tres páginas no se lee. Si no cabe en una, probablemente son dos SOPs.
- **En imperativo**, sin explicaciones largas de por qué. La justificación va en una línea, si acaso.

## Al terminar

1. Guarda en `08_conocimiento/sops/<nombre>.md`.
2. **Registra el SOP en el índice** de [08_conocimiento/README.md](../../../08_conocimiento/README.md), indicando si aplica a todos o a un módulo.
3. **Enlázalo desde donde se aplica**: los comandos y agentes que deban obedecerlo. Un SOP que nadie referencia no se ejecuta nunca — este paso es el que lo pone en vigor.
4. Dile al usuario en una línea qué cambia a partir de ahora en el comportamiento de Copitori.
