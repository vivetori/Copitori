---
name: edt-y-cronograma
description: Actívala cuando haya que planificar un proyecto — "arma el plan", "desglosa el trabajo", "cuándo terminamos", "cuál es la ruta crítica", "hazme el Gantt", o cuando el agente planificador-proyectos construya el plan a partir de un acta. Produce la EDT (WBS), los hitos, el cronograma con dependencias y la ruta crítica simplificada, en markdown y, si se pide, en Excel con Gantt.
---

# EDT y cronograma

Primero el **qué** (EDT: todo el trabajo, nada más que el trabajo), luego el **cuándo** (cronograma: secuencia, duraciones, hitos). Al revés se planifican fechas de cosas que nadie definió.

Plantillas: [edt.md](../../../08_conocimiento/plantillas/proyecto/edt.md) y [cronograma.md](../../../08_conocimiento/plantillas/proyecto/cronograma.md). Fuente del alcance: el [acta](../../../08_conocimiento/plantillas/proyecto/acta_constitucion.md) del proyecto. Reservas y semáforo: [SOP de gestión de proyectos](../../../08_conocimiento/sops/gestion_proyectos.md).

## 1. EDT (estructura de desglose del trabajo)

- **Regla del 100 %**: la EDT contiene todo el trabajo del alcance y solo ese. Lo que no está en la EDT no se hace; lo que se hace y no está, es un cambio.
- **Orientada a entregables**, no a actividades: "Diseños aprobados", no "Diseñar". Las actividades van en el cronograma.
- **Máximo 4 niveles.** Nivel 1 = fases o entregables mayores; último nivel = paquete de trabajo.
- **Paquete de trabajo**: un responsable único, un criterio de aceptación, una estimación. Tamaño orientativo: entre 8 y 80 horas, o entre una y dos semanas de calendario. Más grande, se parte; más pequeño, se agrupa.
- **Siempre existe el paquete "Gestión del proyecto"**: planificación, control, informes, cierre. Olvidarlo es la forma más común de subestimar el costo.
- Numeración `1`, `1.1`, `1.1.1`. El código es la llave que une EDT, cronograma, costos y cambios.

## 2. Estimación

Declara el método por paquete: **analogía** (un proyecto parecido — busca en `lecciones_aprendidas.md` de otros proyectos de [03_iniciativas/](../../../03_iniciativas/)), **juicio de experto** (quién lo dijo), **paramétrica** (tasa × cantidad) o **tres valores** (optimista / probable / pesimista → (O + 4M + P) / 6).

Nunca una duración o un costo sin base: lo que no tenga fuente va como `[ASUMIDO: ...]` con el dato que lo confirmaría. Una estimación redonda sin método es un deseo.

## 3. Cronograma

1. **Secuencia**: cada paquete con sus dependencias (`Depende de`). Por defecto fin-a-inicio; si hay solapes o esperas (curado, aprobaciones, importaciones), escríbelos.
2. **Duraciones** en días hábiles. Calendario: fines de semana y festivos del país de [00_perfil/identidad.md](../../../00_perfil/identidad.md).
3. **Hitos**: duración cero, verificables ("licencia radicada" no es hito; "licencia aprobada" sí). Entre 5 y 12 por proyecto; más es ruido.
4. **Ruta crítica simplificada**: la cadena más larga de dependencias es la que fija la fecha fin. Lístala en orden y márcala. Paquetes fuera de ella tienen **holgura**: anótala si supera 5 días hábiles, son los que pueden ceder recursos.
5. **Reservas**: la contingencia de tiempo va como holgura explícita al final, no escondida en cada paquete.
6. **Línea base**: una vez aprobada, `Fecha comprometida` no se toca. Lo que cambie va a `Fecha estimada` con causa en `cambios.md`.

Si hay herramienta de gestión de proyectos conectada (ver [00_perfil/config_copiloto.md](../../../00_perfil/config_copiloto.md)), el cronograma de la bóveda es el espejo; se dice de dónde salió cada fecha.

## 4. Entregables

- **Markdown siempre**: las tablas de `edt.md` y `cronograma.md`, con ruta crítica y supuestos del plan.
- **Excel con Gantt, si se pide o si el proyecto supera 30 paquetes**: usa la skill de documentos (`xlsx`). Una hoja por tabla, columnas = las de la plantilla, y un Gantt por formato condicional (una columna por semana, celda sombreada entre inicio y fin). Hitos como rombo o fila destacada; ruta crítica en otro color. El Excel es un derivado: la fuente de verdad sigue siendo el markdown.
- Para presentar a un sponsor, el gráfico solo si la tabla de hitos no se entiende sola (regla de `presentar-numeros`).

## Reglas

- **Sin acta aprobada no hay línea base.** Se puede planificar en borrador, marcado como tal.
- **Cada paquete, un responsable con nombre.** "El equipo" no es responsable de nada.
- **Fechas absolutas** `YYYY-MM-DD`.
- **Declara los supuestos del plan** (disponibilidad, aprobaciones, proveedores, clima). Son los primeros riesgos del proyecto: pásalos al agente `analista-riesgos`.
- Un plan de más de 6 meses o con más de 3 dependencias externas se pasa por el agente `contradictor` antes de comprometer la fecha.
