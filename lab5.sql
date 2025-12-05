-- lab5
-- 5.1
USE company;
SELECT
	employee_id "Manager ID",
	last_name "Manager Last Name",
	first_name "Manager First Name",
position 'Manager Title',
	employment_date AS 'Manager Hire Date'
FROM 
	employee AS Managers 
WHERE 
position IN ('CEO', 'Manager');

-- 5.2
SELECT 
	e.employee_id "Employee ID",
	e.last_name "Employee Last Name",
	e.first_name 'Employee First Name',
	e.position 'Employee Title',
	e.manager_id "Employee Manager ID",	
	m.employee_id "Manager ID",
	m.last_name "Manager Last Name",
	m.first_name 'Manager First Name',
	m.position 'Manager Title',
	m.employment_date AS 'Manager Hire Date'
FROM 
	employee AS e,
	employee AS m
WHERE 
	e.manager_id = m.employee_id;

-- 5.3
SELECT 
	e.employee_id "Employee ID",
	e.last_name "Employee Last Name",
	e.first_name 'Employee First Name',
	e.position 'Employee Title',
	e.department_id "Employee Department ID",
	d.department_id "Department ID",
	d.department_name "Department name"
FROM 
	employee AS e,
	department AS d
WHERE 
	e.department_id = d.department_id;

-- 5.4
SELECT 
	e.employee_id "Employee ID",
	e.last_name "Employee Last Name",
	e.first_name 'Employee First Name',
	e.position 'Employee Title',
	i.employee_id "Invoice Employee ID",
	i.invoice_id 'Invoice',
	i.transaction_moment 'Transaction moment'
FROM 
	employee AS e 
JOIN 
	invoice AS i
ON 
	e.employee_id = i.employee_id
ORDER By
	i.transaction_moment;

-- 5.5
SELECT 
	e.employee_id "Employee ID",
	e.last_name "Employee Last Name",
	e.first_name 'Employee First Name',
	e.position 'Employee Title',
	i.employee_id "Invoice Employee ID",
	i.invoice_id 'Invoice',
	i.customer_id 'Invoice Customer ID',
	i.transaction_moment 'Transaction moment',
	c.customer_id 'Customer ID',
	c.last_name 'Customer Last Name',
	c.first_name 'Customer First Name'
FROM 
	employee AS e
NATURAL JOIN 
	invoice AS i
JOIN 
	customer AS c
USING (customer_id)
ORDER BY
	i.transaction_moment;

-- 5.7
SELECT 
	e.employee_id "Employee ID",
	e.last_name "Employee Last Name",
	e.first_name 'Employee First Name',
	e.position 'Employee Title',
	i.employee_id "Invoice Employee ID",
	i.invoice_id 'Invoice',
	i.customer_id 'Invoice Customer ID',
	i.transaction_moment 'Transaction moment',
	c.customer_id 'Customer ID',
	c.last_name 'Customer Last Name',
	c.first_name 'Customer First Name'
FROM 
	employee AS e 
NATURAL JOIN 
	invoice AS i
LEFT JOIN 
	customer AS c 
USING (customer_id)
WHERE customer_id IS NULL
ORDER BY 
	i.transaction_moment;

-- 5.8
SELECT
-- Employee as e 
	e.employee_id 'Employee id',
	e.last_name 'Employee Last Name',
	e.first_name 'Employee First Name',
	e.position 'Employee position',
	e.manager_id 'Employee Manager Id',
	e.department_id 'Employee department_id',
-- Manager as m 
	m.employee_id 'Manager ID',
	m.last_name ' Manager Last Name',
	m.first_name ' Manager First Name',
	m.position 'Manager position',
	m.department_id 'Manager Department Id',
-- department as d 
	d.department_id ' Department ID',
	d.department_name 'Department Name',
	d.city ' Department City'
FROM 
	department as d 
Right join  
	employee as e 
ON 
	e.department_id = d.department_id
Left join 
	employee as m 
ON e.manager_id = m.employee_id;

-- 5.9
SELECT 
	employee_id,
	first_name,
	last_name,
	position,
'Consulting' as Responsibility 
FROM 
	employee 
WHERE 
	position like '%Consultant%'
UNION 
SELECT 
	employee_id,
	first_name,
	last_name,
	position, 'Not Consulting'
FROM 
	employee
WHERE 
	position NOT LIKE '%Consultant%'
Order BY last_name;

-- Домашнє завдання
-- 1.
SELECT
    o.orders_id AS "Orders ID",
    p.product_name AS "Product name",
    p.category AS "Product category",
    i.invoice_id AS "Invoice ID",
    i.transaction_moment AS "Transaction moment",
    c.first_name AS "Customer first name",
    c.last_name AS "Customer last name"
FROM
    orders o
INNER JOIN
    product p ON o.product_id = p.product_id
INNER JOIN
    invoice i ON o.invoice_id = i.invoice_id
INNER JOIN
    customer c ON i.customer_id = c.customer_id
ORDER BY
    o.orders_id ASC;

-- 2.
SELECT
    o.orders_id AS "Orders ID",
    p.product_name AS "Product name",
    p.category AS "Product category",
    i.invoice_id AS "Invoice ID",
    i.transaction_moment AS "Transaction moment",
    c.last_name AS "Customer last name",
    c.first_name AS "Customer first name",
    e.first_name AS "Employee first name",
    e.last_name AS "Employee last name"
FROM
    orders o
INNER JOIN
    product p ON o.product_id = p.product_id
INNER JOIN
    invoice i ON o.invoice_id = i.invoice_id
LEFT JOIN
    customer c ON i.customer_id = c.customer_id
INNER JOIN
    Employee e ON i.employee_id = e.employee_id 
INNER JOIN
    department d ON e.department_id = d.department_id 
WHERE
    d.department_name = 'Mercury'
    AND i.transaction_moment BETWEEN '2023-07-01 00:00:00' AND '2023-10-01 23:59:59' 
ORDER BY
    o.orders_id ASC;
    
-- 3. 
SELECT
    c.customer_id AS "Customer ID",
    c.last_name AS "Last Name",
    c.first_name AS "First Name",
    i.invoice_id AS "Invoice ID",
    i.transaction_moment AS "Transaction Moment"
FROM
    customer c
LEFT JOIN
    invoice i ON c.customer_id = i.customer_id 
ORDER BY
    i.invoice_id ASC; 