-- DVD Rental Analysis
-- Harvey Ijieh
-- 
-- Check for NULL values in the customer table
SELECT
	*
FROM
	CUSTOMER
WHERE
	FIRST_NAME IS NULL
	OR LAST_NAME IS NULL
	OR EMAIL IS NULL;

-- Check for NULL values in the payment table
SELECT
	*
FROM
	PAYMENT
WHERE
	AMOUNT IS NULL
	OR PAYMENT_DATE IS NULL;

-- Check for NULL values in the rental table
SELECT
	*
FROM
	RENTAL
WHERE
	RENTAL_DATE IS NULL
	OR INVENTORY_ID IS NULL
	OR CUSTOMER_ID IS NULL;

-- Top spending customers
SELECT
	C.CUSTOMER_ID,
	C.FIRST_NAME,
	C.LAST_NAME,
	SUM(P.AMOUNT) AS TOTAL_SPENT
FROM
	PAYMENT P
	JOIN CUSTOMER C ON P.CUSTOMER_ID = C.CUSTOMER_ID
GROUP BY
	C.CUSTOMER_ID
ORDER BY
	TOTAL_SPENT DESC
LIMIT
	10;

-- Most profitablle cities
SELECT
	CT.CITY,
	SUM(P.AMOUNT) AS TOTAL_REVENUE
FROM
	PAYMENT P
	JOIN CUSTOMER C ON P.CUSTOMER_ID = C.CUSTOMER_ID
	JOIN ADDRESS A ON C.ADDRESS_ID = A.ADDRESS_ID
	JOIN CITY CT ON A.CITY_ID = CT.CITY_ID
GROUP BY
	CT.CITY
ORDER BY
	TOTAL_REVENUE DESC
LIMIT
	10;

-- Peak rental hours
SELECT
	EXTRACT(
		HOUR
		FROM
			RENTAL_DATE
	) AS RENTAL_HOUR,
	COUNT(*) AS TOTAL_RENTALS
FROM
	RENTAL
GROUP BY
	RENTAL_HOUR
ORDER BY
	RENTAL_HOUR DESC;

-- Revenue trend over time
SELECT
	TO_CHAR(DATE_TRUNC('Month', PAYMENT_DATE), 'Month') AS MONTH,
	SUM(AMOUNT) AS TOTAL_REVENUE
FROM
	PAYMENT
GROUP BY
	DATE_TRUNC('Month', PAYMENT_DATE)
ORDER BY
	EXTRACT(
		MONTH
		FROM
			DATE_TRUNC('Month', PAYMENT_DATE)
	);

-- Tope Rental Movie Category
SELECT
	NAME,
	COUNT(R.RENTAL_ID) AS RENTAL_COUNT
FROM
	CATEGORY C
	JOIN FILM_CATEGORY CT ON C.CATEGORY_ID = CT.CATEGORY_ID
	JOIN FILM F ON CT.FILM_ID = F.FILM_ID
	JOIN INVENTORY I ON F.FILM_ID = I.FILM_ID
	JOIN RENTAL R ON I.INVENTORY_ID = R.INVENTORY_ID
GROUP BY
	C.NAME
ORDER BY
	RENTAL_COUNT DESC;

-- Revenue by category
SELECT
	C.NAME AS CATEGORY,
	SUM(P.AMOUNT) AS TOTAL_REVENUE
FROM
	PAYMENT P
	JOIN RENTAL R ON P.RENTAL_ID = R.RENTAL_ID
	JOIN INVENTORY I ON R.INVENTORY_ID = I.INVENTORY_ID
	JOIN FILM F ON I.FILM_ID = F.FILM_ID
	JOIN FILM_CATEGORY FC ON F.FILM_ID = FC.FILM_ID
	JOIN CATEGORY C ON FC.CATEGORY_ID = C.CATEGORY_ID
GROUP BY
	C.NAME
ORDER BY
	TOTAL_REVENUE DESC;

-- Revenue by ratings
SELECT
	F.RATING AS MOVIE_RATING,
	SUM(P.AMOUNT) AS TOTAL_REVENUE
FROM
	PAYMENT P
	JOIN RENTAL R ON P.RENTAL_ID = R.RENTAL_ID
	JOIN INVENTORY I ON R.INVENTORY_ID = I.INVENTORY_ID
	JOIN FILM F ON I.FILM_ID = F.FILM_ID
GROUP BY
	F.RATING
ORDER BY
	TOTAL_REVENUE DESC;

--Revenue by country
SELECT
	CO.COUNTRY,
	SUM(P.AMOUNT) AS TOTAL_REVENUE
FROM
	PAYMENT P
	JOIN CUSTOMER C ON P.CUSTOMER_ID = C.CUSTOMER_ID
	JOIN ADDRESS A ON C.ADDRESS_ID = A.ADDRESS_ID
	JOIN CITY CI ON A.CITY_ID = CI.CITY_ID
	JOIN COUNTRY CO ON CI.COUNTRY_ID = CO.COUNTRY_ID
GROUP BY
	CO.COUNTRY
ORDER BY
	TOTAL_REVENUE DESC;