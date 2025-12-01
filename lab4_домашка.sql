-- 4.1 ЗАВДАННЯ

USE company;

SELECT * FROM Employee;

-- 4.2 завдання
USE company;
SELECT
 
employee_id,
first_name,
last_name,
position

FROM Employee;

-- 4.3 завдання
USE company;
SELECT
 
	employee_id,
	first_name,
	last_name,
	position

FROM Employee
LIMIT 7;

-- 4.5 завдання
USE company;

SELECT distinct
	position
    
FROM Employee

ORDER By position ASC;

-- 2 solution

USE company;

SELECT distinct
	position
    
FROM Employee

ORDER By position DESC;

-- 4.4 завдання
USE company;

SELECT distinct
	position
    
FROM Employee;

-- 4.6 завдання 
SELECT
 
	employee_id,
	first_name,
	last_name,
	position
    employment_date

FROM 
	Employee
WHERE
	position = 'Seller'
ORDER BY 
	employment_date ASC;
    
    -- 4.7 завдання 

SELECT
 
	employee_id,
	first_name,
	last_name,
	position
    employment_date
FROM 
	Employee
WHERE
(
	position = 'Seller'

OR
	position = 'Consultant'
    )
AND 
	employment_date > '2013-01-01'
ORDER BY 
	employment_date DESC;
    
    -- 4.8 завдання
SELECT
 
	employee_id,
	first_name,
	last_name,
	position,
    employment_date
FROM 
	Employee
WHERE
(
	position LIKE 'Seller'

OR
	position IN ('Senior Consultant','Consultant')
    )
AND 
	employment_date > '2013-01-01'
ORDER BY 
	employment_date DESC;
    
   -- 4.9 

SELECT
 
	employee_id,
	first_name,
	last_name,
	position,
    manager_id,
    department_id
FROM 
	Employee
WHERE
	manager_id IS NULL
OR
	department_id IS NOT NULL
ORDER BY 
	employment_date ASC;
    
    -- Домашнє завдання 4 лаб
	-- 1.Дізнайтеся, які клієнти були зареєстровані в нашій компанії (показати всі доступні поля).
    -- Відсортуйте список за Прізвищем.
    SELECT * FROM customer
    ORDER By
    last_name ASC;
    
    -- 2.Вивести унікальні назви виробників (manufacture ) з таблиці продуктів в одному запиті, 
    -- впорядкованому за алфавітом.
    SELECT DISTINCT manufacture 
FROM product 
ORDER BY manufacture ASC;

-- 3. Отримати коротку інформацію про продукти (назва_продукту, виробник, категорія, тип_продукту, ціна),
-- вироблені компанією 'DELL', з таблиці продуктів в одному запиті, впорядкованому за назвою продукту в
-- алфавітному порядку.

SELECT 
	product_name, 
	manufacture, 
	category, 
	product_type, 
	price 
FROM 
	product 
WHERE 
	manufacture = 'DELL' 
ORDER BY 
	product_name ASC;
    
    -- 4. Отримати інформацію про клієнтів-жінок 1990-2000 років народження (ім'я, прізвище, стать, дата
-- народження, номер телефону) з таблиці customer в одному запиті, відсортовану за прізвищем в
-- алфавітному порядку.
SELECT 
	first_name, 
    last_name, 
    gender, 
    birth_date, 
    phone_number 
FROM 
	customer 
WHERE 
	gender = 'F' 
  AND YEAR (birth_date) BETWEEN 1990 AND 2000 
  
ORDER BY 
	last_name ASC;
    
    -- 5. Отримати інформацію з таблиці товарів про наявні на складі ноутбуки, які оснащені дисковими
-- накопичувачами об'ємом 512 ГБ.

SELECT * FROM product 
WHERE 
	category = 'NOTEBOOK' 
  AND amount > 0 
  AND (product_description LIKE '%512GB%' OR product_description LIKE '%512 GB%');
  
  -- 6. Отримати інформацію з таблиці товарів про наявні на складі ноутбуки або настільні комп'ютери, які
-- оснащені дисковими накопичувачами 512 ГБ або 1 ТБ.

  SELECT * FROM product 
WHERE (category = 'NOTEBOOK' OR category = 'Desktops') 
  AND amount > 0 
  AND (
      product_description LIKE '%512GB%' OR product_description LIKE '%512 GB%'
      OR product_description LIKE '%1TB%' OR product_description LIKE '%1 TB%'
  );
  
  -- 7. Отримати інформацію з таблиці рахунків-фактур (invoice ) про всі покупки, зроблені неавторизованими
-- покупцями (customer_id NULL).
SELECT * FROM invoice 
WHERE 
	customer_id IS NULL;