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
 
 -- practice: surfaces all rows for top-10 hits 
 -- for which Ludacris is part of the Group.
SELECT *
  FROM tutorial.billboard_top_100_year_end
  WHERE year_rank <= 10
  AND "group" ILIKE '%ludacris%'
  
-- practice: surfaces the top-ranked records in 1990, 2000, and 2010
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

-- practice: return songs that ranked between 10 and 20 (inclusive) in 1993, 2003, or 2013. 
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
  
-- practice:to determine counts of every single column
       COUNT(month) AS month,
       COUNT(open) AS open,
       COUNT(high) AS high,
       COUNT(low) AS low,
       COUNT(close) AS close,
       COUNT(volume) AS volume
  FROM tutorial.aapl_historical_stock_price  
  
SELECT SUM(volume)
  FROM tutorial.aapl_historical_stock_price  
  
--practice: to calculate the average opening price
SELECT SUM(open)/COUNT(open) AS avg_open_price
  FROM tutorial.aapl_historical_stock_price  
  
-- practice:What was the highest single-day increase in Apple's share value
SELECT MAX(close - open)
  FROM tutorial.aapl_historical_stock_price
  
SELECT year,
       COUNT(*) AS count
  FROM tutorial.aapl_historical_stock_price
 GROUP BY year
 
 SELECT year,
       month,
       COUNT(*) AS count
  FROM tutorial.aapl_historical_stock_price
 GROUP BY year, month
-- you can add ORDER BY year,month at the end
-- it will start from 2000,1 
  
-- practice: to calculate the total number of shares traded each month. 
-- Order your results chronologically.
SELECT year,
       month,
       SUM(volume) AS volume_sum
  FROM tutorial.aapl_historical_stock_price
 GROUP BY year, month
 ORDER BY year, month
 
-- practice: to calculate the average daily price change in Apple stock, grouped by year
SELECT year,
       AVG(close - open) AS avg_daily_change
  FROM tutorial.aapl_historical_stock_price
 GROUP BY 1
 ORDER BY 1
 
-- practice: to calculate the lowest and highest prices that Apple stock achieved each month
SELECT year,
       month,
       MIN(low) AS lowest_price,
       MAX(high) AS highest_price
  FROM tutorial.aapl_historical_stock_price
 GROUP BY 1, 2
 ORDER BY 1, 2
 
-- Query clause order
SELECT
FROM
WHERE
GROUP BY
HAVING
ORDER BY

SELECT DISTINCT month
  FROM tutorial.aapl_historical_stock_price

-- Note: You only need to include DISTINCT once in your SELECT clause
-- you do not need to add it for each column name.
SELECT DISTINCT year, month
  FROM tutorial.aapl_historical_stock_price
  
SELECT COUNT(DISTINCT month) AS unique_months
  FROM tutorial.aapl_historical_stock_price

-- practice: counts the number of unique values in the month column for each year
SELECT year,
       COUNT(DISTINCT month) AS months_count
  FROM tutorial.aapl_historical_stock_price
 GROUP BY year
 ORDER BY year
 
 -- practice: Write a query that separately counts the number of unique values in the month column 
 -- and the number of unique values in the `year` column
 -- when you have two COUNT function, have to alias each one, or it will only show one column
SELECT COUNT(DISTINCT year) AS years_count,
       COUNT(DISTINCT month) AS months_count
  FROM tutorial.aapl_historical_stock_price
  
------ need "," before CASE!!! ------- 
-- practice:Write a query that includes a column that is flagged "yes" when a player is from California
-- and sort the results with those players first.
SELECT player_name,
       state,
       CASE WHEN state = 'CA' THEN 'yes'
            ELSE NULL END AS from_california
  FROM benn.college_football_players
 ORDER BY 3
 
 SELECT player_name,
       year,
       CASE WHEN year = 'SR' THEN 'yes'
            ELSE NULL END AS is_a_senior
  FROM benn.college_football_players
  
SELECT player_name,
       year,
       CASE WHEN year = 'SR' THEN 'yes'
            ELSE 'no' END AS is_a_senior
  FROM benn.college_football_players
  
SELECT player_name,
       weight,
       CASE WHEN weight > 250 THEN 'over 250'
            WHEN weight > 200 AND weight <= 250 THEN '201-250'
            WHEN weight > 175 AND weight <= 200 THEN '176-200'
            ELSE '175 or under' END AS weight_group
  FROM benn.college_football_players

-- practice: includes players' names and a column 
-- that classifies them into four categories based on height.
  SELECT player_name,
  height,
       CASE WHEN height > 74 THEN 'over 74'
            WHEN height > 72 AND height <= 74 THEN '73-74'
            WHEN height > 70 AND height <= 72 THEN '71-72'
            ELSE 'under 70' END AS height_group
  FROM benn.college_football_players

-- practice: selects all columns and adds an additional column 
-- that displays the player's name if that player is a junior or senior.
SELECT *,
       CASE WHEN year = 'JR' OR year = 'SR' THEN player_name
            ELSE NULL END AS junior_or_senior
  FROM benn.college_football_players
  
-- OR
SELECT *,
       CASE WHEN year in ('JR','SR') THEN player_name
            ELSE NULL END AS junior_or_senior
  FROM benn.college_football_players  

SELECT CASE WHEN year = 'FR' THEN 'FR'
            WHEN year = 'SO' THEN 'SO'
            WHEN year = 'JR' THEN 'JR'
            WHEN year = 'SR' THEN 'SR'
            ELSE 'No Year Data' END AS year_group,
            COUNT(1) AS count
  FROM benn.college_football_players
 GROUP BY 1

-- remember to remove the AS year_group column naming 
SELECT CASE WHEN year = 'FR' THEN 'FR'
            WHEN year = 'SO' THEN 'SO'
            WHEN year = 'JR' THEN 'JR'
            WHEN year = 'SR' THEN 'SR'
            ELSE 'No Year Data' END AS year_group,
            COUNT(1) AS count
  FROM benn.college_football_players
 GROUP BY CASE WHEN year = 'FR' THEN 'FR'
               WHEN year = 'SO' THEN 'SO'
               WHEN year = 'JR' THEN 'JR'
               WHEN year = 'SR' THEN 'SR'
               ELSE 'No Year Data' END

-- to count the number of 300lb+ players for each of the following regions
--West Coast (CA, OR, WA), Texas, and Other (Everywhere else)
SELECT CASE WHEN state IN ('CA', 'OR', 'WA') THEN 'West Coast'
            WHEN state = 'TX' THEN 'Texas'
            ELSE 'Other' END AS arbitrary_regional_designation,
            COUNT(1) AS players
  FROM benn.college_football_players
 WHERE weight >= 300
 GROUP BY 1

-- to calculate the combined weight of all underclass players (FR/SO) in California 
--as well as the combined weight of all upperclass players (JR/SR) in California.
SELECT CASE WHEN year IN ('FR', 'SO') THEN 'underclass'
            WHEN year IN ('JR', 'SR') THEN 'upperclass'
            ELSE NULL END AS class_group,
       SUM(weight) AS combined_player_weight
  FROM benn.college_football_players
 WHERE state = 'CA'
 GROUP BY 1

  -- displays the number of players in each state, with FR, SO, JR, and SR players in separate columns and another column for the total number of players.
  -- Order results such that states with the most players come first
SELECT state,
       COUNT(CASE WHEN year = 'FR' THEN 1 ELSE NULL END) AS fr_count,
       COUNT(CASE WHEN year = 'SO' THEN 1 ELSE NULL END) AS so_count,
       COUNT(CASE WHEN year = 'JR' THEN 1 ELSE NULL END) AS jr_count,
       COUNT(CASE WHEN year = 'SR' THEN 1 ELSE NULL END) AS sr_count,
       COUNT(1) AS total
  FROM benn.college_football_players
  GROUP BY state
  ORDER BY total DESC

  -- shows the number of players at schools with names that start with A through M,
  --and the number at schools with names starting with N - Z.
  SELECT CASE WHEN school_name < 'n' THEN 'A-M'
            	WHEN school_name >= 'n' THEN 'N-Z'
            ELSE NULL END AS school_name_group,
       COUNT(1) AS players
  FROM benn.college_football_players
 GROUP BY 1
 
-- selects the school name, player name, position, and weight for every player in Georgia, ordered by weight (heaviest to lightest)
-- Be sure to make an alias for the table, and to reference all column names in relation to the alias. 
SELECT players.school_name, 
       players.player_name,
       players.position,
       players.weight
FROM benn.college_football_players  players
WHERE players.state = 'GA'
ORDER BY players.weight DESC

SELECT teams.conference AS conference,
       AVG(players.weight) AS average_weight
  FROM benn.college_football_players players
  JOIN benn.college_football_teams teams
    ON teams.school_name = players.school_name
 GROUP BY teams.conference
 ORDER BY AVG(players.weight) DESC
 
 -- practice: displays player names, school names and conferences for schools 
 -- in the "FBS (Division I-A Teams)" division.
 SELECT players.player_name,
       players.school_name,
       teams.conference
  FROM benn.college_football_players players
  JOIN benn.college_football_teams teams
    ON teams.school_name = players.school_name
 WHERE teams.division = 'FBS (Division I-A Teams)'
 

SELECT companies.permalink AS companies_permalink,
       companies.name AS companies_name,
       acquisitions.company_permalink AS acquisitions_permalink,
       acquisitions.acquired_at AS acquired_date
  FROM tutorial.crunchbase_companies companies
  JOIN tutorial.crunchbase_acquisitions acquisitions
    ON companies.permalink = acquisitions.company_permalink
	
SELECT companies.permalink AS companies_permalink,
       companies.name AS companies_name,
       acquisitions.company_permalink AS acquisitions_permalink,
       acquisitions.acquired_at AS acquired_date
  FROM tutorial.crunchbase_companies companies
  LEFT JOIN tutorial.crunchbase_acquisitions acquisitions
    ON companies.permalink = acquisitions.company_permalink

-- practicｅ： performs an inner join between the tutorial.crunchbase_acquisitions table and the tutorial.crunchbase_companies table
-- but instead of listing individual rows, count the number of non-null rows in each table.	
SELECT COUNT(companies.permalink) AS companies_rowcount,
       COUNT(acquisitions.company_permalink) AS acquisitions_rowcount
  FROM tutorial.crunchbase_companies companies
  JOIN tutorial.crunchbase_acquisitions acquisitions
    ON companies.permalink = acquisitions.company_permalink
-- modify the query above to be a LEFT JOIN
-- left count is 27355, right count is the same 1673

-- Count the number of unique companies (don't double-count companies) and unique acquired companies by state. 
-- Do not include results for which there is no state data
-- and order by the number of acquired companies from highest to lowest.
SELECT companies.state_code,
       COUNT(DISTINCT companies.permalink) AS unique_companies,
       COUNT(DISTINCT acquisitions.company_permalink) AS unique_companies_acquired
  FROM tutorial.crunchbase_companies companies
  LEFT JOIN tutorial.crunchbase_acquisitions acquisitions
    ON companies.permalink = acquisitions.company_permalink
 WHERE companies.state_code IS NOT NULL
 GROUP BY 1
 ORDER BY 3 DESC
 
 -- same result using RIGHT JOIN
 SELECT companies.state_code,
       COUNT(DISTINCT companies.permalink) AS unique_companies,
       COUNT(DISTINCT acquisitions.company_permalink) AS acquired_companies
  FROM tutorial.crunchbase_acquisitions acquisitions
 RIGHT JOIN tutorial.crunchbase_companies companies
    ON companies.permalink = acquisitions.company_permalink
 WHERE companies.state_code IS NOT NULL
 GROUP BY 1
 ORDER BY 3 DESC
 
-- note filtering in the WHERE clause can also filter null values, but we want to keep null for right table
-- so we added an extra line to make sure to include the nulls.
 SELECT companies.permalink AS companies_permalink,
       companies.name AS companies_name,
       acquisitions.company_permalink AS acquisitions_permalink,
       acquisitions.acquired_at AS acquired_date
  FROM tutorial.crunchbase_companies companies
  LEFT JOIN tutorial.crunchbase_acquisitions acquisitions
    ON companies.permalink = acquisitions.company_permalink
 WHERE acquisitions.company_permalink != '/company/1000memories'
    OR acquisitions.company_permalink IS NULL
 ORDER BY 1
