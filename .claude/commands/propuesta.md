---
description: (Módulo Comercial) Genera una propuesta comercial completa para un cliente
argument-hint: "<nombre cliente> [tipo de servicio]"
---

> Requiere el módulo **Comercial** activo. Genera una propuesta para `$ARGUMENTS`.

## Pasos

1. **Reúne contexto**:
   - Busca el archivo del cliente en [02_relaciones/](../../02_relaciones/).
   - Lee historial: discovery y reuniones previas en `02_relaciones/reuniones/`.
   - Si falta información crítica, pregúntame antes de inventar.

2. **Define el alcance**:
   - Cruza la necesidad detectada con tu oferta. Si no encaja exactamente, propón una variación y márcala `[CUSTOM]`.

3. **Calcula la inversión**:
   - Usa tus condiciones de [08_conocimiento/sops/condiciones_comerciales.md](../../08_conocimiento/sops/condiciones_comerciales.md).
   - Considera complejidad y tamaño del cliente. Justifica el valor, no solo el precio.

4. **Genera el documento**:
   - Usa la plantilla [08_conocimiento/plantillas/propuesta.md](../../08_conocimiento/plantillas/propuesta.md).
   - Crea el archivo en [04_comercial/propuestas/](../../04_comercial/propuestas/) con nombre `YYYY-MM-DD_Cliente_Servicio.md`.
   - Marca supuestos con `[ASUMIDO: ...]`.

5. **Actualiza el pipeline**:
   - Registra/actualiza la oportunidad en [04_comercial/pipeline.md](../../04_comercial/pipeline.md) con próximo paso "enviar propuesta" y fecha.
   - Muévela a "Propuesta enviada" solo cuando yo apruebe el borrador y se haya enviado de verdad.

6. **Sugiere el siguiente paso**:
   - Borrador del correo de envío.
   - Recordatorio de seguimiento según [08_conocimiento/sops/seguimiento.md](../../08_conocimiento/sops/seguimiento.md).

**No envíes nada sin mostrarme el borrador completo primero.**
