--1. Observe the result of running this SQL command to show the name, continent
-- and population of all countries.
SELECT name, continent, population FROM world;

--2.Show the name for the countries that have a population of at least 200 million. 200 million is 200000000.
SELECT name FROM world
WHERE population > 200000000;

--3. Give the name and the per capita GDP for those countries with a population 
-- of at least 200 million.
SELECT name, gdp/population AS percapitalGDP 
 FROM world WHERE population>200000000;

--4. Show the name and population in millions for the countries of the continent
-- 'South America'. Divide the population by 1000000 to get population in millions.
SELECT name, population/1000000 as population 
 FROM world WHERE continent='South America';

--5. Show the name and population for France, Germany, Italy
select name, population from world where name in ('France', 'Germany', 'Italy');

--6. Show the countries which have a name that includes the word 'United'
select name from world where name like concat('%','United', '%'); --?
select name from world where name like '%United%'; 

--7. Show the countries that are big by area or big by population. 
--Show name, population and area. Two ways to be big: A country is big if it has
-- an area of more than 3 million sq km or it has a population of more than 250 million.
select  name, population , area from world 
 where area>3000000 or population>250000000;

--8. Exclusive OR (XOR). Show the countries that are big by area or big by 
--population but not both. 
select name, population , area from world 
 where area>3000000 XOR population>250000000;

--9. For South America show population in millions and GDP in billions 
-- both to 2 decimal places.
select name, round(population/1000000,2), round(gdp/1000000000,2) 
 from world where continent='South America';

--10. Show per-capita GDP for the trillion dollar countries to the nearest $1000.
select name, round(gdp/population, -3) as percapitaGDP 
 from world where gdp> 1000000000000;

--11. Show the name and capital where the name and the capital have the same number of characters.
SELECT name,  capital
  FROM world where LENGTH(capital)=length(name);
  
--12. Show the name and the capital where the first letters of each match. 
--Don't include countries where the name and the capital are the same word.
SELECT name, capital FROM world 
 WHERE LEFT(name,1)=LEFT(capital,1) AND NAME<>CAPITAL;

--13. Find the country that has all the vowels and no spaces in its name.
SELECT name FROM world
 WHERE name like  '%a%' AND name like  '%e%' AND name like  '%i%' AND name like  '%o%' 
  AND name like  '%u%'  AND name NOT LIKE '% %';
