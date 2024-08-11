SELECT
  EXTRACT(YEAR
  FROM
    orders.created_at) AS year,
  EXTRACT(MONTH
  FROM
    orders.created_at) AS month,
  products.name,
  COUNT(order_items.product_id) AS total_sales
FROM
  `bigquery-public-data.thelook_ecommerce.order_items` AS order_items
INNER JOIN
  `bigquery-public-data.thelook_ecommerce.orders` AS orders
ON
  order_items.order_id = orders.order_id
INNER JOIN
  `bigquery-public-data.thelook_ecommerce.products` AS products
ON
  order_items.product_id = products.id
WHERE
  orders.status = 'Complete'
GROUP BY
  year,
  month,
  products.name
ORDER BY
  year DESC,
  month DESC,
  total_sales DESC
LIMIT 1000;