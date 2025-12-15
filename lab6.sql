-- 6 lab

-- 6.1: Вивести інформацію про ідентифікатор співробітника, повне ім’я та email співробітника .

USE company;

SELECT
    LPAD(employee_id, 5, '0') as 'Employee ID',
    CONCAT_WS(" ", last_name, first_name) as 'Full name',
    CONCAT_WS(" ", last_name, first_name, position) as 'Full name with Position',
    CONCAT(LOWER(first_name), ".", LOWER(last_name), "@company.com") as 'email'
FROM
    Employee;
    
    -- 6.2: Відобразити інформацію про працівника, дату його найму та стаж роботи.
    
    SELECT
    first_name as 'First name',
    last_name as 'Last name',
    DATE_FORMAT(employment_date, "%d %M %Y") AS 'Date of hiring',
    FORMAT(DATEDIFF(CURDATE(), employment_date)/365.22, 1) as 'Length of service',
    TIMESTAMPDIFF(YEAR, employment_date, CURDATE()) AS 'Years of service'
FROM
    Employee;
    
    -- 6.3 Відобразити інформацію про зарплати та премії співробітників(два окремих звіти).
    
-- 1
    SELECT
    'Count of All employees' AS 'Bonus eligible',
    COUNT(*) 'Count of employees'
FROM Employee
UNION
SELECT
    'Count of employees who received bonus',
    COUNT(*)
FROM Employee
WHERE bonus IS NOT NULL;

-- 2
SELECT
    MIN(rate) 'Lowest salary',
    MAX(rate) 'Highest salary',
    FORMAT(AVG(bonus), 2) AS 'Average Bonus by Employee',
    FORMAT(SUM(bonus) / COUNT(*), 2) AS 'Average Bonus by Company'
FROM Employee;

-- 6.4: Відобразити інформацію про список посад співробітників за відділами та представництвами.
-- 1
SELECT
    COUNT(*) AS 'Count of Offices',
    COUNT(DISTINCT city) AS 'Count of representative offices of cities'
FROM department;

-- 2
SELECT
    position As 'Position',
    COUNT(*) AS 'Count Employee by Position'
FROM Employee
GROUP BY position; 

-- 3 
SELECT
    department_id AS 'Department id',
    COUNT(*) AS 'Count of employees by Position for each Departmenn'
FROM Employee
GROUP BY department_id;

-- 6.5: Відобразити інформацію про список посад співробітників за відділами та представництвами.
SELECT
    department_id,
    position,
    COUNT(*) AS 'Count Employee'
FROM
    employee
GROUP BY
    department_id, position
HAVING
    COUNT(*) > 1;
    
    -- Домашня робота 
    -- 1
    
    SELECT
    LPAD(product_id, 4, '0') AS 'Product ID',
    CONCAT(manufacture, ' :: ', product_name) AS 'Product Name',
    UPPER(CONCAT(product_type, ' - ', category)) AS 'Category'
FROM
    product
ORDER BY
    manufacture;
    
    -- 2
    SELECT
    LPAD(MONTH(i.transaction_moment), 2, '0') AS 'Month',
    FORMAT(SUM(p.price * o.quantity), 2) AS 'Total revenue',
    CONCAT('Quater ', QUARTER(i.transaction_moment), '-', YEAR(i.transaction_moment)) AS 'Sales Period'
FROM
    invoice i
JOIN
    orders o ON i.invoice_id = o.invoice_id
JOIN
    product p ON o.product_id = p.product_id
GROUP BY
    YEAR(i.transaction_moment),
    QUARTER(i.transaction_moment),
    MONTH(i.transaction_moment)
ORDER BY
    MAX(i.transaction_moment);
    
    -- 3.1
    SELECT
    p.product_id AS 'Product ID',
    p.product_name AS 'Product name',
    p.price AS 'Product Price',
    SUM(o.quantity) AS 'Product Quantity',
    SUM(p.price * o.quantity) AS 'Total Amount'
FROM
    product p
JOIN
    orders o ON p.product_id = o.product_id
GROUP BY
    p.product_id
HAVING
    SUM(p.price * o.quantity) > 50000
ORDER BY
    SUM(p.price * o.quantity) DESC;
    
    -- 3.2
    SELECT
    LPAD(c.customer_id, 3, '0') AS 'Customer ID',
    c.last_name AS 'Customer last name',
    c.first_name AS 'Customer first name',
    SUM(p.price * o.quantity) AS 'Total Amount'
FROM
    customer c
JOIN
    invoice i ON c.customer_id = i.customer_id
JOIN
    orders o ON i.invoice_id = o.invoice_id
JOIN
    product p ON o.product_id = p.product_id
GROUP BY
    c.customer_id
ORDER BY
    SUM(p.price * o.quantity) DESC
LIMIT 10;
    
    
    
    
    
