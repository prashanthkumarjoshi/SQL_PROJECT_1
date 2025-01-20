---Exploratory Data Analsyis--
-- checking if there are any null values in transaction_id column
SELECT
	*
FROM
	retail_sales
WHERE
	transactions_id IS NULL
	OR sale_date IS NULL
	OR sale_time IS NULL
	OR gender IS NULL
	OR category IS NULL
	OR quantiy IS NULL
	OR cogs IS NULL
	OR total_sale IS NULL
	---Validating sales format--
SELECT
	*
FROM
	retail_sales
WHERE
	total_sale < 0
	-- Basic statsticsfor Sales
SELECT
	MIN(total_sale) AS min_sale,
	MAX(total_sale) AS max_sale
FROM
	retail_sales
WHERE
	total_sale IS NOTNULL
	----Identifying Outliers detect unusually high or low sales--
	---- high sales----
SELECT
	sale_date,
	customer_id,
	gender,
	age category,
	quantiy,
	price_per_unit,
	cogs,
	total_sale
FROM
	retail_sales
WHERE
	total_sale IS NOT NULL
ORDER BY
	total_sale DESC
LIMIT
	10
	-----low sales---
SELECT
	sale_date,
	customer_id,
	gender,
	age category,
	quantiy,
	price_per_unit,
	cogs,
	total_sale
FROM
	retail_sales
WHERE
	total_sale IS NOT NULL
ORDER BY
	total_sale ASC
LIMIT
	10
	-- Categorical Analysis: Most Frequent  sales based on the types of buyers(female/male)
SELECT
	gender,
	COUNT(*) AS total_sale_count
FROM
	retail_sales
GROUP BY
	gender
ORDER BY
	total_sale_count DESC
	--Most frequent sales based on the category---
SELECT
	category,
	COUNT(*) AS total_sale_count
FROM
	retail_sales
GROUP BY
	category
ORDER BY
	total_sale_count DESC
	---Most Frequent  sales based on the types of buyers(female/male) and category
SELECT
	gender,
	category,
	COUNT(*) AS total_sale_count
FROM
	retail_sales
GROUP BY
	gender,
	category
ORDER BY
	total_sale_count DESC
	-------------------------------------------------------------------------------------------
	---------------------------------DATA CLEANING---------------------------------------------
	---Deleteing the records that has null values---
DELETE FROM retail_sales
WHERE
	transactions_id IS NULL
	OR sale_date IS NULL
	OR sale_time IS NULL
	OR gender IS NULL
	OR category IS NULL
	OR quantiy IS NULL
	OR cogs IS NULL
	OR total_sale IS NULL
	---Data Exploration---
	--How many sales we have
SELECT
	COUNT(*),
	total_sales
FROM
	retail_sales
SELECT
	*
FROM
	retail_sales
	---How many customers we have?---
SELECT
	COUNT(DISTINCT customer_id) AS total_sales
FROM
	retail_sales
	----How many distinct category we have---
SELECT DISTINCT
	category
FROM	