--BASIC SQL
SELECT *
  FROM tutorial.us_housing_units

SELECT year,
       month,
       west
  FROM tutorial.us_housing_units

SELECT west AS West_Region,
       south AS South_Region
  FROM tutorial.us_housing_units

SELECT *
  FROM tutorial.us_housing_units
 LIMIT 100

SELECT *
  FROM tutorial.us_housing_units
WHERE month = 1

SELECT *
  FROM tutorial.us_housing_units
 WHERE west > 30

-- non-numeric value use ' ' not " "
SELECT *
  FROM tutorial.us_housing_units
 WHERE month_name != 'January'

-- will yield only rows in which month_name starts with “j” or later in the alphabet
-- January is included in the results because SQL considers ‘Ja’ to be greater than ‘J’ 
SELECT *
  FROM tutorial.us_housing_units
 WHERE month_name > 'J'


SELECT year,
       month,
       west,
       south,
       west + south AS south_plus_west
  FROM tutorial.us_housing_units

SELECT year,
       month,
       west,
       south,
       west + south - 4 * year AS nonsense_column
  FROM tutorial.us_housing_units

SELECT year,
       month,
       west,
       south,
       (west + south)/2 AS south_west_avg
  FROM tutorial.us_housing_units

-- practice:calculates the percentage of all houses completed by each region
--  Only return results from the year 2000 and later. 

SELECT year,
       month,
       west/(west + south + midwest + northeast)*100 AS west_pct,
       south/(west + south + midwest + northeast)*100 AS south_pct,
       midwest/(west + south + midwest + northeast)*100 AS midwest_pct,
       northeast/(west + south + midwest + northeast)*100 AS northeast_pct
  FROM tutorial.us_housing_units
 WHERE year >= 2000

SELECT *
  FROM tutorial.billboard_top_100_year_end
 ORDER BY year DESC, year_rank

-- % wildcard, LIKE case-sensitive
-- group need" " for column name
SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE "group" LIKE 'Snoop%'

-- ILIKE ignore case
SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE "group" ILIKE 'snoop%'

SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE artist ILIKE 'dr_ke'


-- returns all rows for which Ludacris was a member of the group
SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE "group" ILIKE '%Ludacris%'

SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE year_rank IN (1, 2, 3)

SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE artist IN ('Taylor Swift', 'Usher', 'Ludacris')

SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE year_rank BETWEEN 5 AND 10

SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE year_rank >= 5 AND year_rank <= 10

SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE artist IS NULL
 
 -- practice: Write a query that surfaces all rows for top-10 hits 
 -- for which Ludacris is part of the Group.
SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE year_rank <= 10
  AND "group" ILIKE '%ludacris%'
  
-- practice: Write a query that surfaces the top-ranked records in 1990, 2000, and 2010
SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE year_rank = 1
  AND year IN (1990, 2000, 2010)  
  
SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE year = 2013

SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE year = 2013
   AND "group" NOT ILIKE '%macklemore%'

SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE year = 2013
   AND artist IS NOT NULL   

SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE year_rank <= 3
 ORDER BY year DESC, year_rank

SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE year_rank <= 3
 ORDER BY 2, 1 DESC

 SELECT *  --This comment won't affect the way the code runs
  FROM tutorial.billboard_top_100_year_end
 WHERE year = 2013

 
   /* Here's a comment so long and descriptive that
it could only fit on multiple lines. Fortunately,
it, too, will not affect how this code runs. */
SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE year = 2013

-- practice: Write a query that returns songs that ranked between 10 and 20 (inclusive) in 1993, 2003, or 2013. 
-- Order the results by year and rank
--and leave a comment on each line of the WHERE clause to indicate what that line does 
SELECT * 
  FROM tutorial.billboard_top_100_year_end
  WHERE year_rank BETWEEN 10 AND 20
  AND year IN (1993,2003,2013)
  ORDER BY year, year_rank
  
-- TERMEDIATE SQL

SELECT COUNT(*)
  FROM tutorial.aapl_historical_stock_price

SELECT COUNT(high)
  FROM tutorial.aapl_historical_stock_price
  
-- practice:Write a query that determines counts of every single column
       COUNT(month) AS month,
       COUNT(open) AS open,
       COUNT(high) AS high,
       COUNT(low) AS low,
       COUNT(close) AS close,
       COUNT(volume) AS volume
  FROM tutorial.aapl_historical_stock_price  
  
SELECT SUM(volume)
  FROM tutorial.aapl_historical_stock_price  
  
--practice:Write a query to calculate the average opening price
SELECT SUM(open)/COUNT(open) AS avg_open_price
  FROM tutorial.aapl_historical_stock_price  
  
-- practice:What was the highest single-day increase in Apple's share value
SELECT MAX(close - open)
  FROM tutorial.aapl_historical_stock_price