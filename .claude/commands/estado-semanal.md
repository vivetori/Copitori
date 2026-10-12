---
description: (módulo Proyectos / PMO) Corte semanal de un proyecto o de todos — semáforo, valor ganado, hitos, cambios y riesgos, con el borrador para el sponsor
argument-hint: "<proyecto | todos>  (vacío = todos los activos)"
---

Hazme el corte de control de `$ARGUMENTS`. Honesto: el semáforo lo fijan los números y el SOP, no el ánimo.

Reglas (semáforo, escalamiento, ciclo): [08_conocimiento/sops/gestion_proyectos.md](../../08_conocimiento/sops/gestion_proyectos.md).
Cálculo de SPI/CPI/EAC: skill `valor-ganado`. Plantilla del informe: [estado.md](../../08_conocimiento/plantillas/proyecto/estado.md).

## 1. Alcance
- Un proyecto por nombre o slug; `todos` (o vacío) = cada carpeta de [03_iniciativas/](../../03_iniciativas/) con `acta_constitucion.md` y `estado` ∈ {`activo`, `en_riesgo`}.
- Fecha de corte: hoy, salvo que me indiques otra.

## 2. Fuentes
Por proyecto: `cronograma.md`, `cambios.md`, `riesgos.md`, el informe anterior en `estado/`, actas de los últimos 7 días en `reuniones/`, [TASKS.md](../../TASKS.md).
Herramientas conectadas según [00_perfil/config_copiloto.md](../../00_perfil/config_copiloto.md): gestión de proyectos (avance real por tarea), transcripción (reuniones de la semana), calendario (hitos y reuniones próximas). **Si no hay ninguna, trabaja con los archivos y dilo en una línea.**

## 3. Delega el análisis
Delega en el agente `controlador-proyectos`, uno por proyecto (en paralelo si son varios). Él lee todo, calcula valor ganado, aplica el semáforo del SOP, escribe el informe en `estado/AAAA-MM-DD.md` y actualiza el frontmatter del acta (`semaforo`, `spi`, `cpi`, `ultimo_corte`; `estado: en_riesgo` si rojo, `activo` si vuelve). A ti te devuelve el resumen.

Si el agente reporta datos faltantes (sin costo real, sin % avance, sin línea base), no los rellenes: aparecen como faltantes en el informe.

## 4. Lo que haces tú con el resumen
- **Escalamiento**: aplica el SOP §2. Rojo, ámbar por segunda vez, cambio fuera de autoridad, decisión del sponsor vencida — cada uno con su petición concreta.
- **Espejos**: riesgos que subieron a alto o crítico → [07_equipo/riesgos.md](../../07_equipo/riesgos.md); decisiones de nivel 2–3 tomadas en la semana → [07_equipo/decisiones.md](../../07_equipo/decisiones.md).
- **Borrador para el sponsor** en mi voz ([voz_y_estilo.md](../../08_conocimiento/voz_y_estilo.md)), con la estructura de la skill `informe-de-estado`: si cambió el color, va en la primera línea. Déjalo en la sección «Borrador para el sponsor» del informe. **No lo envíes.**
- **Tareas**: compromisos y mitigaciones con fecha a [TASKS.md](../../TASKS.md); lo que espera decisión del sponsor, con la fecha límite del SOP.
- Si un hito se cumplió esta semana, pregúntame la lección de una línea para `lecciones_aprendidas.md`.

## Cierre
Por proyecto, tres líneas: **semáforo y por qué** · **lo que cambió desde el corte anterior** · **lo que necesito decidir o pedir**. Luego el enlace al informe y el borrador.
Si corrí `todos`, termina con la fila de cada proyecto y recuérdame correr `/portafolio`.

**No hagas**: poner verde por falta de datos, re-planificar el cronograma (eso es un cambio: `/cambio`), enviar el informe, cambiar `fecha comprometida` de ningún hito.
