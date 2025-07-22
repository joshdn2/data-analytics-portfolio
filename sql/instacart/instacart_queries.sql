-- Load data (only once)
CREATE TABLE products AS SELECT * FROM read_csv_auto('products.csv');

-- Query
SELECT product_name, COUNT(*) AS reorder_count
FROM order_products_train opt
JOIN products p ON opt.product_id = p.product_id
WHERE reordered = 1
GROUP BY product_name
ORDER BY reorder_count DESC
LIMIT 10;