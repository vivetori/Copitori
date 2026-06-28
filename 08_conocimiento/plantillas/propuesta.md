# Plantilla — Propuesta estándar (módulo Comercial)

> Copiar a `04_comercial/propuestas/YYYY-MM-DD_Cliente_Servicio.md`.
> Las condiciones salen siempre de [../sops/condiciones_comerciales.md](../sops/condiciones_comerciales.md) — no escribir valores a mano.

```markdown
---
cliente: [Nombre]
fecha_envio: YYYY-MM-DD
estado: draft | enviada | negociacion | ganada | perdida
valor:
valida_hasta: YYYY-MM-DD
---

# Propuesta para [Cliente]
## [Título del proyecto]

## 1. Contexto y dolor
[En palabras del cliente — citar el discovery. Qué les cuesta hoy: tiempo, dinero, errores.]

## 2. Solución propuesta
[Qué se construye/entrega y qué logrará el cliente — una frase de objetivo.]
**Incluye**:
-
**No incluye** (explícito, para evitar scope creep):
-

## 3. Plan de trabajo
**Fase 1 — [Nombre]**
- Actividades y entregable

| # | Entregable | Fase | Rondas de ajuste |
|---|---|---|---|
| 1 | | | |

## 4. Inversión
| Concepto | Monto |
|---|---|
| | |
| **Total** | |
[Justificar el valor (retorno, ahorro), no solo el precio.]

## 5. Condiciones
- **Forma de pago**: [según condiciones_comerciales.md]
- **Soporte post-entrega**: [según condiciones_comerciales.md]
- **Supuestos**: [que el cliente entregue X antes de Y]

## 6. Siguiente paso
[Uno solo, con fecha.]

---
**Validez**: hasta YYYY-MM-DD.
**Contacto**: [Nombre · correo]
```
