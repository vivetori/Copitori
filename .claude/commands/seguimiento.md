---
description: Detecta seguimientos pendientes (relaciones, correos, compromisos) y propone los mensajes
---

Hazme una pasada completa de seguimientos pendientes y propón los mensajes a enviar.

## Umbrales
Todos los plazos salen de [08_conocimiento/sops/seguimiento.md](../../08_conocimiento/sops/seguimiento.md) — no uses otros valores.

## Fuentes a revisar
1. **Relaciones** ([02_relaciones/activos/](../../02_relaciones/activos/)): sin contacto reciente, o con un hito/compromiso próximo a vencer.
2. **Comercial** (si el módulo está activo — [04_comercial/pipeline.md](../../04_comercial/pipeline.md)): propuestas enviadas sin respuesta, reuniones sin próximo paso, oportunidades con "próximo paso" vencido.
3. **Correos sin responder** (si hay correo conectado): solo los que requieren mi acción.
4. **Compromisos abiertos** ([TASKS.md](../../TASKS.md) y [07_equipo/decisiones.md](../../07_equipo/decisiones.md)): cosas que prometí y no he cerrado.
5. **Finanzas** (si el módulo está activo): cobros o pagos vencidos.

## Salida esperada
Para cada seguimiento detectado:

```
[N] [Tipo: relación / comercial / correo / compromiso / cobro]
Contacto: [Nombre, organización]
Último toque: YYYY-MM-DD ([N] días)
Por qué: [razón breve]
Borrador propuesto:
  "[mensaje listo para enviar]"
Acción: [responder correo / enviar nuevo / agendar / etc.]
```

Al final, ranking por **urgencia** (impacto × tiempo transcurrido).

**No envíes nada. Solo borradores para que yo apruebe.**
