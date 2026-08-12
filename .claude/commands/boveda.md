---
description: Audita la bóveda Obsidian — enlaces rotos, notas huérfanas, frontmatter incompleto y fichas sin próximo paso
---

Audita la salud de la bóveda. Trabaja solo con los archivos locales — no necesitas herramientas externas.
Reporta hallazgos concretos con la ruta del archivo; no describas el método.

**1. Wikilinks rotos**
Busca todos los `[[...]]` en la bóveda y verifica que exista una nota con ese nombre
(o con ese alias en su frontmatter). Ignora los que estén dentro de `08_conocimiento/plantillas/`
(son marcadores de plantilla) y dentro de bloques de código.
Para cada roto: archivo origen, línea, destino esperado y —si hay un candidato con nombre
parecido— la corrección sugerida.

**2. Notas huérfanas**
Notas en `02_relaciones/`, `03_iniciativas/` y `04_comercial/` a las que **nadie** enlaza.
Excluye READMEs y archivos de índice. Una relación o iniciativa huérfana suele significar
trabajo abandonado: dilo así.

**3. Frontmatter fuera de esquema**
Compara el frontmatter de cada ficha contra su plantilla en [08_conocimiento/plantillas/](../../08_conocimiento/plantillas/):
- Campos obligatorios ausentes
- Fechas que no sean `YYYY-MM-DD`
- Valores de `estado` o `tipo` fuera de los permitidos por la plantilla
- Campos de enlace (`relacion`, `iniciativa`, `objetivo`) escritos como texto plano en vez de wikilink
- Propiedades usadas en la bóveda pero no declaradas en `.obsidian/types.json`

**4. Fichas sin próximo paso**
Relaciones activas e iniciativas en marcha cuyo bloque «Próximos pasos» esté vacío, o cuya
fecha ya haya vencido. Cruza con los umbrales de [08_conocimiento/sops/seguimiento.md](../../08_conocimiento/sops/seguimiento.md).

**5. Adjuntos sueltos**
Imágenes o PDFs fuera de `99_adjuntos/`, y adjuntos en `99_adjuntos/` que ninguna nota referencia.

---

**Entrega así:**

Un bloque por categoría, con conteo y la lista. Si una categoría está limpia, una línea:
`✅ Sin hallazgos.`

Cierra con **«Arreglos propuestos»**: las correcciones que puedes aplicar tú directamente
(enlaces rotos con candidato claro, frontmatter incompleto, fechas mal formateadas), numeradas.
Pregunta cuáles aplico antes de tocar nada — excepto si te digo "aplica todo".

> Al corregir un wikilink, edita el archivo **origen**. Nunca renombres el destino para que
> cuadre: eso rompería los demás enlaces entrantes.
