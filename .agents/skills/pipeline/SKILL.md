---
name: pipeline
description: "(Módulo Comercial) Estado del pipeline + análisis y sugerencias de acción. Úsala cuando el usuario la pida, escriba /pipeline o $pipeline."
---
<!-- Generado por sincronizar-codex — no editar; edita .claude/ (fuente: .claude/commands/pipeline.md) -->
# $pipeline

> En Claude Code este flujo es el comando `/pipeline`; en Codex es esta skill (`$pipeline`).
> `<argumentos>` = lo que el usuario escribió después del nombre de la skill (o, si no escribió nada, lo que pida en su mensaje). Formato esperado: [opcional: nombre de cliente para foco específico]

> Requiere el módulo **Comercial** activo ([00_perfil/config_copiloto.md](../../../00_perfil/config_copiloto.md)). Si no lo está, dímelo y ofréceme activarlo.

Si `<argumentos>` está vacío, hazme un análisis general del pipeline. Si tiene un nombre de cliente, enfócate solo en esa oportunidad.

> **Delega el análisis general en el agente `estratega-comercial`** — lee las actas trato por trato y eso no debe consumir el hilo principal. Tú te quedas con su conclusión y la conversación conmigo. Para el foco en un cliente concreto, trabaja aquí mismo.

## Análisis general
1. Lee [04_comercial/pipeline.md](../../../04_comercial/pipeline.md).
2. Si hay CRM conectado, cruza con datos frescos.
3. Calcula:
   - Total pipeline (# oportunidades y valor)
   - Distribución por etapa
   - Velocidad: días promedio por etapa
   - Cuello de botella (etapa donde más se atascan)
4. Detecta oportunidades sin movimiento, con "próximo paso" vencido o propuestas sin respuesta — umbrales de [08_conocimiento/sops/seguimiento.md](../../../08_conocimiento/sops/seguimiento.md).
5. Sugiere **3 acciones concretas** con dueño y plazo.
6. Actualiza la sección "Análisis rápido" de `pipeline.md`.

## Foco en cliente específico
Si `<argumentos>` tiene valor:
1. Busca el archivo del cliente en [02_relaciones/](../../../02_relaciones/).
2. Recupera historia, contactos, último contacto.
3. Sugiere el próximo paso óptimo.
4. Si corresponde, redacta el borrador de correo o mensaje.
