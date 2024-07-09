/*Show the category_name and description from the categories table sorted by category_name.*/
SELECT category_name, description FROM categories
order by category_name


/*Show all the contact_name, address, city of all customers which are not from 'Germany', 'Mexico', 'Spain'*/
SELECT contact_name, address, city
FROM customers
WHERE country NOT IN ('Germany', 'Mexico', 'Spain');

/*Show order_date, shipped_date, customer_id, Freight of all orders placed on 2018 Feb 26*/
SELECT order_date, shipped_date, customer_id, freight
FROM orders
WHERE order_date = '2018-02-26'