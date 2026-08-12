---
description: Actualiza el panel de KPIs contra tus objetivos — qué se movió, qué se desvió y qué hacer
argument-hint: "[periodo]  (opcional: 'este mes', 'Q3')  ·  vacío = corte de hoy"
---

Actualiza el panel de KPIs `$ARGUMENTS`. Números primero, conclusión antes que el detalle.

## 1. Lee el panel actual
[01_objetivos/kpis.md](../../01_objetivos/kpis.md). Si está vacío o sin rellenar, **no preguntes primero**:
propón un panel inicial de 5–8 métricas deducidas de [01_objetivos/okrs.md](../../01_objetivos/okrs.md)
y de los módulos activos en [00_perfil/config_copiloto.md](../../00_perfil/config_copiloto.md), respetando
las reglas de selección del propio panel (máximo 8, cada una colgada de un objetivo, mezcla de
adelantadas y atrasadas, con dueño). Marca cada supuesto con `[ASUMIDO: ...]` y pídeme que corrija.

## 2. Trae los datos
Cada KPI se alimenta de su fuente, en este orden:
1. Herramienta conectada (finanzas, CRM, analítica) según [00_perfil/config_copiloto.md](../../00_perfil/config_copiloto.md).
2. Archivos locales: [05_finanzas/](../../05_finanzas/), [04_comercial/pipeline.md](../../04_comercial/pipeline.md), [02_relaciones/](../../02_relaciones/), [03_iniciativas/](../../03_iniciativas/).
3. Si un dato no está en ninguna parte, **déjalo vacío y márcalo como faltante**. Nunca lo estimes en silencio.

Para finanzas, delega en el agente `analista-financiero` en vez de leer las cifras tú.

## 3. Analiza
Para cada métrica: valor actual, delta contra el corte anterior, distancia a la meta y estado (🟢🟡🔴).

Luego, lo que importa de verdad:
- **Qué se desvió y por qué.** La causa, no solo el número. Si no la sabes, di qué habría que mirar.
- **Adelantadas que anticipan problemas.** Una métrica adelantada en rojo con la atrasada aún en verde
  es la señal más valiosa del panel: dilo con todas las letras.
- **Objetivos sin cobertura.** Un objetivo de `okrs.md` que ninguna métrica vigila es un punto ciego.
- **KPIs que sobran.** Métricas que llevan varios cortes sin mover ninguna decisión: propón retirarlas.

## 4. Escribe
Actualiza [01_objetivos/kpis.md](../../01_objetivos/kpis.md): valores, estados, fecha de corte y una línea
en el historial con qué cambió. No borres el historial anterior.

Si un KPI queda en 🔴, crea la tarea correctiva en [TASKS.md](../../TASKS.md) con dueño y fecha.
Si la desviación amenaza un objetivo, pásasela al agente `analista-riesgos` para que la registre.

## Cierre
- **Titular en una línea**: ¿vamos ganando o no?
- **Los 2 números que hay que arreglar** y qué hacer esta semana con cada uno.
- **Una alerta honesta**: si el panel se ve bien pero algo de fondo va mal, dilo.
