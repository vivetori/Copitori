---
description: Deja el entorno listo — verifica e instala lo que falte (Obsidian, bóveda, estructura) y te guía paso a paso
---

Prepara el entorno de este espacio para que Copitori funcione de verdad. Es el **Paso 0** del primer arranque; también sirve para reparar el entorno más adelante.

## Cómo conducirlo

Vas guiando **paso a paso, uno a la vez**: dices qué vas a hacer, lo haces, confirmas el resultado y pasas al siguiente. Nada de listas de 10 instrucciones para que el usuario las ejecute.

Regla dura: **antes de instalar software o abrir aplicaciones, pide confirmación** (una frase, opción por defecto "sí"). Leer, diagnosticar y crear carpetas dentro del espacio no requiere permiso.

Si algo falla, no te bloquees: registra qué quedó pendiente, sigue con lo demás y dilo al cerrar.

---

### Paso 1 · Diagnóstico

```
bash .claude/scripts/entorno.sh verificar
```

Lee el bloque `--- ESTADO ---` (pares `clave=valor`) y traduce al usuario, en 3–5 líneas, qué hay y qué falta. No pegues la salida cruda.

### Paso 2 · Estructura de la bóveda

Si `carpetas_faltantes` ≠ `ninguna`:

```
bash .claude/scripts/entorno.sh reparar-estructura
```

Si `archivos_faltantes` ≠ `ninguno`, dilo: son archivos base de la plantilla (el script no los inventa). Ofrece recrear los que sepas reconstruir desde [08_conocimiento/plantillas/](../../08_conocimiento/plantillas/); si falta algo estructural como `CLAUDE.md`, avisa de que conviene recuperarlo del repositorio original.

### Paso 3 · Obsidian

Explica en una línea por qué: *Copitori escribe los archivos; Obsidian es donde tú los lees, navegas y ves los enlaces entre clientes, reuniones y decisiones. No es obligatorio para trabajar con Copitori, pero es la mitad visual del sistema.*

- Si `obsidian=instalado` → sigue.
- Si `obsidian=falta` y `gestor` ≠ `ninguno` → pide confirmación y corre:
  ```
  bash .claude/scripts/entorno.sh instalar-obsidian
  ```
  (En macOS instala con Homebrew; en Windows con winget; en Linux con Flatpak o snap. Puede tardar 1–2 minutos y pedir contraseña.)
- Si `gestor=ninguno` → dale el enlace de descarga (https://obsidian.md/download), dile que instale y avise cuando termine; mientras tanto, continúa con el Paso 5 y vuelve luego.
- Si el usuario no quiere Obsidian → perfecto, todo funciona igual con los archivos. Anótalo y salta al Paso 5.

### Paso 4 · Abrir esta carpeta como bóveda

```
bash .claude/scripts/entorno.sh abrir-boveda
```

Registra esta carpeta como bóveda de Obsidian y la abre. Casos:

- **Obsidian estaba abierto** o no hay motor JSON (`motor_json=ninguno`) → el script no toca la configuración e imprime los 2 clics manuales. Guía al usuario por ellos y espera su confirmación.
- **Se abrió bien** → dile qué mirar primero: [PANEL.md](../../PANEL.md) es la portada; los marcadores del panel izquierdo llevan a tareas, objetivos, relaciones y decisiones.

Cierra el paso mencionando lo único que puede romperse: si renombra notas fuera de Obsidian, los `[[enlaces]]` se rompen. Ver [OBSIDIAN.md](../../OBSIDIAN.md).

### Paso 5 · Herramientas conectadas (opcional)

Enumera qué MCP ves conectados en esta sesión (correo, calendario, drive, notas, CRM, transcripciones, finanzas) y déjalo anotado en [00_perfil/config_copiloto.md](../../00_perfil/config_copiloto.md). Si hay servidores pendientes de autorizar, dilo y explica dónde se autoriza — no intentes hacerlo tú. Sin ninguna herramienta conectada, Copitori funciona al 100% con los archivos locales.

### Paso 6 · Entrega y salto a la configuración

Cierra con:

1. Dos o tres líneas: qué quedó instalado, qué quedó pendiente y por qué.
2. Si `configuracion` = `SIN_CONFIGURAR`, **enlaza directo con el asistente**: "El entorno está listo. Ahora te configuro a ti: son 6 bloques cortos, unos 5 minutos. ¿Arrancamos?" — y al confirmar, ejecuta el asistente de [CLAUDE.md](../../CLAUDE.md) (mismo contenido que `/configurar`). No dejes al usuario buscando el siguiente comando.
3. Si ya estaba `CONFIGURADO`, propón el siguiente paso útil (`/resumen-dia`, `/captura`, cargar sus relaciones clave).
