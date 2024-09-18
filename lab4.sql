--4.1
/*
No, because fips = '51' is still referenced in other tables as a foreign key
*/

--4.2
/*
No, because there is no fips value of '80' in the name table
*/

--4.3
/*
I need to create three tables; one with states' names and fips, a second with states' incomes, and the third with states' populations in different years. How do I define this structure in SQL?

The prompts given by ChatGPT are not perfect, mainly because it did not check for if the tables existed already. The first prompt given was 
CREATE TABLE States (
instead of 
CREATE TABLE IF NOT EXISTS States (
The formatting was also different, which may have caused problems if the tables already existed, but because ChatGPT was working from scratch, this is not a big problem.
Additionally, ChatGPT created extraneous primary keys. After telling it to remove this extraneous key, it gave instructions on how to more efficiently create the primary keys.
/*

--4.4, 4.5
/*
It does recognize the ERD table. It identified all of the variables, as well as instructions on how to make them.
*/

--4.6
/*
This was the code it gave me:

WITH RecentYears AS (
    SELECT MAX(year) AS recent_year
    FROM income
)
SELECT n.name, i.income, i.year
FROM income i
JOIN name n ON i.fips = n.fips
JOIN RecentYears ry ON i.year = ry.recent_year
ORDER BY i.income DESC
LIMIT 1;

It does work, returning Washington DC in 2019 with an income of 92266 as the highest income.
*/

--4.7
/*
Prompt: Calculate the population growth in Virginia over the past five years

Return:
WITH VirginiaPop AS (
    SELECT p.year, p.pop
    FROM population p
    JOIN name n ON p.fips = n.fips
    WHERE n.name = 'Virginia'
    ORDER BY p.year DESC
    LIMIT 5
)
SELECT
    MIN(year) AS start_year,
    MAX(year) AS end_year,
    MIN(pop) AS start_population,
    MAX(pop) AS end_population,
    ((MAX(pop) - MIN(pop)) * 100.0 / MIN(pop)) AS population_growth_percentage
FROM VirginiaPop;

This did work, giving a percentage growth between 2015-2019 for Virginia at 1.82%.
*/

--4.8
/*
It doesn't give perfect answers every time, such as the extraneous variables it created when creating the tables, but the answers it gives are sometimes "good enough". The extraneous variables
aren't wrong, per se, it's just better without them.
*/
