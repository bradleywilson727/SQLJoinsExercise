SELECT * FROM products;
SELECT * FROM categories;
SELECT * FROM reviews;
SELECT * FROM departments;
SELECT * FROM sales;

/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
SELECT products.name AS 'Product Name', categories.name AS 'Category Name'
FROM products JOIN categories ON products.CategoryID = categories.CategoryID WHERE products.CategoryID = 1;

/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
SELECT products.name, products.price, reviews.rating 
FROM products JOIN reviews ON products.productid = reviews.ProductID WHERE reviews.rating = 5;
 
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
SELECT SUM(sales.quantity) AS 'Total Sold', employees.firstname AS 'First Name', employees.LastName AS 'Last Name' 
FROM employees JOIN sales ON employees.EmployeeID = sales.EmployeeID 
GROUP BY employees.FirstName, employees.LastName
ORDER BY 'total sold' DESC;-- this 'order by' isn't working correctly and I'm not sure why.

/* joins: find the name of the department, and the name of the category for Appliances and Games */
SELECT departments.name, categories.name 
FROM departments JOIN categories 
ON departments.DepartmentID = categories.DepartmentID 
WHERE categories.name = 'appliances' OR categories.name = 'games';

/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
 SELECT products.name, SUM(sales.Quantity) AS 'Total Sold', (products.price*SUM(sales.Quantity)) AS 'Total Price Sold'
 FROM products JOIN sales ON products.ProductID = sales.ProductID 
 WHERE products.ProductID = 97;

/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
SELECT products.name, reviews.Reviewer, reviews.rating, reviews.comment FROM products 
JOIN reviews ON products.ProductID = reviews.ProductID WHERE reviews.rating <= 1 AND products.name LIKE '%visio%'; 


-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sold */