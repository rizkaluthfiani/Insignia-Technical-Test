# Insignia-Technical-Test
```SQL
This SQL code is to fulfil one of the Data Analyst internship assessment tests for Insignia
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
```

---
`SELECT`: This query is to display all columns needed for the table. Each column has specific purpose. The selected columns are: year, month, product name and the the number of sales of each product.

`EXTRACT(YEAR FROM orders.created_at) AS year`: This query is to retrieve only the year from the created_at column in orders table. `AS year` as in "year" will be the name of the column.

`EXTRACT(MONTH FROM orders.created_at) AS month`: This query is to retrieve only the month from the created_at column in orders table. `AS month` as in "month" will be the name of the column.

`COUNT(order_items.product_id) AS total_sales`: To find the number of sales of each product. `AS total_sales` as in "total_sales" will be the name of the column.

`FROM bigquery-public-data.thelook_ecommerce.order_items AS order_items`: This query accesses the data from the order_items table from thelook_ecommerce dataset. Specifically, we need it to join and attain product_id and order_id. `AS order_items` is the shortname of the table.

`INNER JOIN bigquery-public-data.thelook_ecommerce.orders AS orders`: This query accesses the data from the orders table from thelook_ecommerce dataset and joins it to the order_items table. `AS orders` is the shortname of the table. This table is needed to obtain the status order, the year and month each order is created. 

`ON order_items.order_id = orders.order_id`: This query is to specify that the tables are joined through the relationship between the columns (in this case, order_id columns) of the tables being joined.

`INNER JOIN bigquery-public-data.thelook_ecommerce.products AS products`: This query accesses the data from the products table from thelook_ecommerce dataset and combines it to the order_items and orders tables. This table is needed to obtain the product name. `AS products` is the shortname of the table.

`ON order_items.product_id = products.id`: This query is to specify that the tables are joined through the relationship between the columns (in this case, product_id columns) of the tables being joined.

`WHERE orders.status = 'Complete'`: This query filters the order status to 'Complete' because we only want to know the successful orders, from creation to delivery, and that were never returned.

`GROUP BY year, month, products.name`: This query is to group the results of a query based on year, month and product name

`ORDER BY year DESC, month DESC, total_sales DESC`: to sort the results of a query based on the three columns: year, month and total_sales in descending order, meaning that we get the records starting with the most recent year and month. Within each year and month, we get the first list of the highest sales products.

`LIMIT 1000`: This query is to display only the first 1000 records.
