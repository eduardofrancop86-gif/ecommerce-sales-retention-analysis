Caso de Estudio: Análisis de Ventas y Retención en e-Commerce
========================================================================

El Reto del Negocio
------------------------------------------------------------------------
El equipo directivo necesitaba entender cómo ha evolucionado la salud financiera de la plataforma y qué está impulsando realmente el crecimiento. El objetivo principal fue analizar el comportamiento de las ventas mensuales (filtrando meses con ingresos mayores a $10,000 USD) para descubrir si el crecimiento actual se debe a la llegada de clientes nuevos o a que los usuarios actuales nos están comprando más seguido.

Herramientas y Datos Utilizados
------------------------------------------------------------------------
Para este análisis trabajé con la base de datos pública 'thelook_ecommerce' directamente en Google BigQuery. El proceso incluyó:

* Extracción y limpieza de fechas con EXTRACT para agrupar la información por año y mes.
* Uso de COUNT(DISTINCT) para separar el volumen total de órdenes del número real de clientes únicos.
* Filtrado de datos agrupados mediante HAVING para enfocarnos en los periodos con mayor impacto financiero.
* Creación de un INNER JOIN para cruzar el historial de transacciones con el catálogo de productos mediante la llave product_id.

El repositorio incluye los dos scripts de SQL que utilicé para el proyecto:
* query_analisis_mensual.sql (Métricas globales y comportamiento del cliente).
* query_segmentacion_categorias.sql (Cruce y desglose por categorías de producto).

Hallazgos e Insights Clave
========================================================================

1. Crecimiento Sostenido vs. Estacionalidad
Hay una tendencia al alza muy sólida año con año desde el 2024. Un punto interesante es que, aunque existen los típicos picos de ventas a fin de año y principios del siguiente, estos incrementos no son tan drásticos. El éxito del negocio no depende de una temporada específica, sino de un crecimiento constante.

2. El Verdadero Motor: Frecuencia de Compra
Los últimos dos meses muestran un aumento muy fuerte tanto en ventas como en clientes nuevos. Sin embargo, al analizar a fondo los datos, descubrí que el factor clave no es solo la adquisición de usuarios, sino que el número de órdenes por cliente aumentó a un ritmo mucho mayor. 

Comprobé esta hipótesis matemáticamente calculando el índice de recompra mensual, el cual dio un salto importante en el último trimestre:
* Abril 2026: 1.07 órdenes por cliente.
* Mayo 2026: 1.12 órdenes por cliente.
* Último mes: 1.33 órdenes por cliente (Máximo histórico).

Esto confirma que los usuarios recurrentes están regresando a comprar más veces dentro del mismo mes, siendo este el pilar principal del aumento en la facturación.

3. Comportamiento de Compra Cruzada
Al desglosar los datos por tipo de producto, las categorías que más dinero generan son las de mayor valor transaccional (alto ticket): Outerwear & Coats (ropa de abrigo), Jeans y Sweaters.

Lo más curioso es que al ver cada categoría por separado, el índice de órdenes por cliente se mantiene plano, muy cerca de 1.0. 

¿Qué significa esto para el negocio? Que los clientes VIP que están regresando a comprar no están repitiendo el mismo producto. El fenómeno real es la Compra Cruzada (Cross-selling): el usuario que entra a la plataforma por una prenda básica regresa semanas después a diversificar su carrito con artículos de mayor valor. La estrategia debe enfocarse en sugerir categorías complementarias en el momento correcto.
