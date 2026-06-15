SELECT
EXTRACT(YEAR FROM created_at) AS anio,
EXTRACT(MONTH FROM created_at) AS mes,

SUM(sale_price) AS ingresos_totales,

COUNT(DISTINCT order_id) AS total_ordenes,
COUNT(DISTINCT user_id) AS total_clientes,
ROUND(COUNT(DISTINCT order_id) / COUNT(DISTINCT user_id), 2) AS ordenes_por_cliente

FROM
`bigquery-public-data.thelook_ecommerce.order_items`

GROUP BY
anio,
mes

HAVING
 ingresos_totales > 10000

ORDER BY
anio DESC,
mes DESC;
