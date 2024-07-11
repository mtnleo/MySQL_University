/*Show the ProductName, CompanyName, CategoryName from the products, suppliers, and categories table*/
SELECT
	product_name,
    company_name,
    category_name
FROM categories AS c 
JOIN products AS p ON p.category_id = c.category_id
JOIN suppliers AS s ON s.supplier_id = p.supplier_id

/**Show the category_name and the average product unit price for each category rounded to 2 decimal places.*/
SELECT
    category_name,
    ROUND(AVG(unit_price), 2) AS avg_unit_price
FROM categories AS c 
JOIN products AS p ON p.category_id = c.category_id
GROUP BY category_name