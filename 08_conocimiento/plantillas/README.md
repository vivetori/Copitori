# Plantillas

Formatos base para fichas, actas, propuestas, decisiones y bitácora diaria.

Son **plantillas nativas de Obsidian**: el archivo se inserta tal cual, con su frontmatter.
No llevan bloques de código alrededor — si los llevaran, se copiarían al documento final.

## Cómo se usan

**Desde Obsidian**: crea la nota vacía en su carpeta y usa el plugin *Plantillas*
(`Cmd/Ctrl+P` → «Insertar plantilla»). Obsidian sustituye `{{title}}` por el nombre del
archivo y `{{date}}` por la fecha de hoy.

**Desde Copitori**: los comandos leen la plantilla y generan el archivo ya relleno,
resolviendo `{{title}}` y `{{date}}` con los datos reales.

## Catálogo

| Plantilla | Destino | Nombre del archivo | Quién la usa |
|---|---|---|---|
| [relacion.md](relacion.md) | `02_relaciones/activos/` o `prospectos/` | `Nombre.md` | `/configurar`, agente `investigador`, SOP de onboarding |
| [reunion.md](reunion.md) | `02_relaciones/reuniones/` (externa) o `07_equipo/reuniones/` (interna) | `YYYY-MM-DD_Titulo.md` | `/guardar-reunion` |
| [iniciativa.md](iniciativa.md) | `03_iniciativas/` | `Nombre.md` (o carpeta si es grande) | SOP de onboarding |
| [propuesta.md](propuesta.md) | `04_comercial/propuestas/` | `YYYY-MM-DD_Cliente_Servicio.md` | `/propuesta`, agente `redactor` |
| [decision.md](decision.md) | entrada dentro de [../../07_equipo/decisiones.md](../../07_equipo/decisiones.md) | *(fragmento, no archivo)* | `/guardar-reunion`, `/revision-semanal` |
| [dia.md](dia.md) | `09_bitacora/` | `YYYY-MM-DD.md` | `/resumen-dia`, nota diaria de Obsidian |
| [gosmartup/](gosmartup/) | `03_iniciativas/<Startup>/` | `panel.md`, `kpN_*.md`, `validaciones/` | `/playbook`, agente `asesor-emprendimiento` |

> Las propuestas toman sus condiciones de [../sops/condiciones_comerciales.md](../sops/condiciones_comerciales.md)
> y su estructura de [../sops/propuestas.md](../sops/propuestas.md) — nunca se escriben valores a mano.

## Al editar una plantilla

- Mantén el **frontmatter** al inicio: alimenta las Propiedades y el grafo de Obsidian.
- Los campos de enlace (`relacion`, `iniciativa`, `objetivo`, `asistentes`) van en formato lista
  con wikilinks entre comillas:
  ```yaml
  relacion:
    - "[[Acme S.A.]]"
  ```
- Los tipos de cada propiedad están declarados en `.obsidian/types.json`. Si añades un campo nuevo,
  decláralo ahí para que Obsidian lo trate como fecha, número o enlace y no como texto plano.
