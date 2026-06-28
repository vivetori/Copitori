# Skills de Copitori

Las **skills** son capacidades que Copitori activa solo cuando el contexto lo amerita (sin que las invoques con un comando).

## Disponibles siempre
Copitori puede crear y editar **Word, PowerPoint, Excel y PDF** mediante las skills de documentos integradas — se activan cuando pides un entregable con formato (una propuesta en Word, un deck, una hoja de cálculo).

## Crear skills propias del negocio
Si tienes un proceso repetitivo y específico de tu negocio (p. ej. "generar el informe mensual de mi área con mi formato"), conviértelo en una skill:

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

> Regla de oro: una skill encapsula un proceso; un SOP en [08_conocimiento/sops/](../../08_conocimiento/sops/) define una regla. La skill **lee** la regla, no la redefine.
