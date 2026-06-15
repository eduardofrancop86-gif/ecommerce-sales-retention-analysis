# 📊 Caso de Estudio: Análisis de Rendimiento Histórico y Comportamiento de Compra (e-Commerce)

## 1. Contexto y Problema de Negocio
El equipo directivo de la plataforma de e-commerce requería evaluar la salud financiera del negocio e identificar los verdaderos motores de crecimiento histórico. El objetivo fue analizar las ventas mensuales estandarizadas (mayores a $10,000 USD) para determinar si el crecimiento estaba apalancado por la adquisición de nuevos usuarios o por la fidelización de los actuales.

## 2. Enfoque Técnico (Acción)
Para resolver esto, se extrajeron y procesaron millones de registros de la base de datos pública `thelook_ecommerce` en **Google BigQuery**, aplicando:
* Funciones de fecha (`EXTRACT`) para la agregación temporal (Año/Mes).
* Funciones de agregación combinadas con conteos únicos (`COUNT(DISTINCT)`) para aislar el comportamiento de usuarios frente a transacciones.
* Filtrado avanzado post-agregación mediante `HAVING`.
* Métricas calculadas para medir la densidad transaccional por usuario.

## 3. Código SQL Utilizado
El script detallado de la consulta se encuentra en el archivo `query_analisis_mensual.sql` de este repositorio.

## 4. Hallazgos de Negocio & Insights Clave
Tras analizar la data histórica desde 2024 a 2026, se detectaron tres patrones críticos:

* **Crecimiento Sostenido Anual:** Existe una sólida tendencia al alza año con año a partir de 2024. Aunque se observan picos habituales en temporadas comerciales de fin de año y arranques del siguiente, la estacionalidad no es el factor determinante del éxito del negocio.
* **Despegue Reciente:** Los últimos dos meses reflejan una aceleración histórica, registrando un aumento significativo tanto en ingresos totales como en captación de clientes.
* **El Verdadero Motor (Frecuencia de Compra):** El análisis profundo demostró matemáticamente que el verdadero motor de la facturación actual es la fidelización. El índice de órdenes por cliente experimentó un crecimiento acelerado en el último trimestre de 2026, pasando de **1.07 en abril**, a **1.12 en mayo**, y alcanzando un máximo histórico de **1.33 en el último mes**. Esto confirma que los usuarios recurrentes están incrementando drásticamente su frecuencia de compra, siendo este el pilar principal del incremento en las ventas.
## 5. Fase 2: Análisis de Segmentación por Categorías (INNER JOIN)
Para entender *qué* categorías de productos estaban impulsando el crecimiento transaccional, se realizó un cruce relacional entre el historial de transacciones (`order_items`) y el catálogo de productos (`products`) mediante una llave foránea (`product_id`). 

El script de esta fase se encuentra detallado en el archivo `query_segmentacion_categorias.sql`.

### Hallazgos de la Fase 2 & Estrategia de Negocio:
* **Líderes de Facturación:** Las categorías que dominan los ingresos durante el 2026 son artículos de alto valor transaccional: `Outerwear & Coats`, `Jeans`, `Sweaters` y `Fashion Hoodies/Sweatshirts`.
* **El Fenómeno de Compra Cruzada (Cross-Category Shopping):** Un dato crítico del análisis es que el índice de órdenes por cliente de forma individual en cada categoría se mantiene hermético cerca del **1.0**. 
* **Conclusión Estratégica:** Al contrastar este dato con el incremento de 1.33 de la frecuencia global obtenido en la Fase 1, se descarta que los clientes estén recomprando el mismo tipo de producto. El verdadero motor del negocio es la **Compra Cruzada**. La plataforma está logrando con éxito que un cliente retornado diversifique su guardarropa adquiriendo categorías distintas a lo largo del trimestre, escalando hacia los productos de mayor ticket.
