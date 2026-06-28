---
description: (Re)ejecuta el asistente de configuración de Copitori — perfil, organización, objetivos, módulos, herramientas y voz
---

Ejecuta el **Asistente de configuración** descrito en [CLAUDE.md](../../CLAUDE.md) (sección "🚀 Asistente de configuración").

Reglas para esta corrida:

1. Si `00_perfil/identidad.md` ya está `CONFIGURADO`, no empieces de cero: muéstrame un resumen de la configuración actual y pregúntame **qué quiero ajustar** (puedo querer solo cambiar objetivos, o activar un módulo nuevo). Ve directo a esa etapa.
2. Si está `SIN_CONFIGURAR`, corre las 6 etapas en orden.
3. Trabaja por etapas, 2–4 preguntas por bloque, con borradores y supuestos `[ASUMIDO: ...]`. No me abrumes.
4. Escribe los cambios en los archivos correspondientes a medida que avanzas (no esperes al final).
5. Al terminar, deja `estado_configuracion: CONFIGURADO` con fecha y propón mis 3 primeros pasos.
