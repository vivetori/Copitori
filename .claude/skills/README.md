# Skills de Copitori

Las **skills** son capacidades que Copitori activa **solo cuando el contexto lo amerita**, sin que las invoques.

Esa es la diferencia con las otras piezas del sistema:

| | Qué es | Cómo se dispara |
|---|---|---|
| **Comando** (`/x`) | Un flujo que tú pides | Lo escribes |
| **Agente** | Trabajo profundo que se delega en contexto aparte | Copitori delega, o lo pides por nombre |
| **Skill** | Un método que se aplica cuando aparece la situación | **Sola**, al detectar el contexto |
| **SOP** | Una regla con umbrales | No se ejecuta: se consulta |

Por eso, en una skill lo más importante es su `description`: es lo único que decide si se dispara.

---

## Las de este espacio

| Skill | Se activa cuando… |
|---|---|
| [comunicacion-ejecutiva](comunicacion-ejecutiva/) | Redactas algo de alto impacto: anuncio, mala noticia, actualización a junta, crisis. Define la **estructura** del argumento. |
| [presentar-numeros](presentar-numeros/) | Un entregable lleva cifras. Contexto obligatorio, variación en las dos formas, honestidad con la base. |
| [caso-de-negocio](caso-de-negocio/) | Hay que justificar una inversión: contratar, comprar, abrir una línea. Con alternativas y "no hacer nada" costeado. |
| [postmortem](postmortem/) | Algo salió mal: cliente perdido, proyecto atrasado, propuesta rechazada. Sin culpables, y termina en regla. |
| [crear-sop](crear-sop/) | Describes un proceso que se repite o dices "siempre lo hacemos así". Lo convierte en regla con dueño único. |
| [informe-de-estado](informe-de-estado/) | Reportas avance **hacia afuera**: cliente, sponsor, junta. Semáforo honesto y petición concreta. |
| [post-linkedin](post-linkedin/) | Escribes una publicación para LinkedIn. Saca el material de la bóveda, filtra lo confidencial y evita lo que delata a una IA. |

Se combinan: un informe de estado aplica también `comunicacion-ejecutiva` y `presentar-numeros`.

## Las que vienen de fuera

**Documentos** — Word, PowerPoint, Excel y PDF. Siempre disponibles: se activan al pedir un entregable con formato.
**Gráficos** — `dataviz`, para cualquier gráfico o panel.
**Plugins instalados** — declarados en [00_perfil/config_copiloto.md](../../00_perfil/config_copiloto.md).

> **Precedencia**: los comandos y skills de este espacio mandan sobre cualquier skill externa, porque conocen tus SOPs y tu voz. Una skill externa aporta método o formato, nunca reglas.

---

## Crear una propia

Si tienes un proceso repetitivo y específico de tu negocio, dile a Copitori que lo convierta en skill — o hazlo a mano:

1. Crea una carpeta `mi-skill/` aquí dentro.
2. Dentro, un archivo `SKILL.md` con frontmatter:

```markdown
---
name: mi-skill
description: Qué hace y CUÁNDO debe activarse (sé específico — esto decide si se dispara sola).
---

# Mi skill
Instrucciones paso a paso de cómo ejecutar el proceso...
```

3. Puedes añadir scripts o plantillas en subcarpetas (`scripts/`, `assets/`, `references/`) y referenciarlos desde el `SKILL.md`.

**Al escribir la `description`**, enumera situaciones concretas, no categorías. "Actívala al redactar un anuncio interno, una mala noticia o una actualización a la junta" dispara bien; "para comunicación" no dispara nunca.

> Regla de oro: una skill encapsula un **proceso**; un SOP en [08_conocimiento/sops/](../../08_conocimiento/sops/) define una **regla**. La skill **lee** la regla, no la redefine.
