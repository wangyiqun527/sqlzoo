--1. Modify it to show the matchid and player name for all goals scored by Germany.
-- To identify German players, check for: teamid = 'GER'
SELECT matchid,player FROM goal WHERE teamid = 'GER';
  
--2. Show id, stadium, team1, team2 for just game 1012
SELECT id,stadium,team1,team2  FROM game WHERE id=1012 ;
  
--3. You can combine the two steps into a single query with a JOIN.
-- Modify it to show the player, teamid, stadium and mdate and for every German goal.
SELECT player,teamid, stadium,mdate
  FROM game  JOIN goal ON (id=matchid AND teamid = 'GER');
  
--4. Show the team1, team2 and player for every goal scored by a player called Mario player LIKE 'Mario%'
SELECT team1, team2,player
  FROM game JOIN goal ON (id=matchid AND player LIKE 'Mario%')
  
--5. Show player, teamid, coach, gtime for all goals scored in the first 10 minutes gtime<=10
SELECT player, teamid, coach, gtime
  FROM goal JOIN eteam on (teamid=id AND  gtime<=10);
  
--6. List the the dates of the matches and the name of the team in which 'Fernando Santos' was the team1 coach.
SELECT mdate, teamname
  FROM game JOIN eteam on (team1=eteam.id AND eteam.coach= 'Fernando Santos');
    
--7. List the player for every goal scored in a game where the stadium was 'National Stadium, Warsaw'
SELECT player
  FROM goal JOIN game on (game.id=goal.matchid AND game.stadium= 'National Stadium, Warsaw');
  
--8. The example query shows all goals scored in the Germany-Greece quarterfinal.
SELECT player, gtime
  FROM game JOIN goal ON matchid = id WHERE (team1='GER' AND team2='GRE') ;
--Instead show the name of all players who scored a goal against Germany.
SELECT DISTINCT player
  FROM game JOIN goal ON matchid = id 
    WHERE ((team1='GER' OR team2='GER') AND teamid!='GER');
    
--9. Show teamname and the total number of goals scored.
SELECT teamname, COUNT(player)
  FROM eteam JOIN goal ON id=teamid GROUP BY teamname
 ORDER BY teamname;
 
--10. Show the stadium and the number of goals scored in each stadium.
SELECT stadium, COUNT(player)  FROM game JOIN goal ON id=matchid 
 GROUP BY stadium;

--11. For every match involving 'POL', show the matchid, date and the number of goals scored.
SELECT matchid,mdate, COUNT(player)
  FROM game JOIN goal ON (matchid = id AND (team1 = 'POL' OR team2 = 'POL') )
   GROUP BY matchid, mdate;

--12. For every match where 'GER' scored, show matchid, match date and the number of goals scored by 'GER'
SELECT matchid, mdate, COUNT(player) FROM game JOIN goal
 ON (id=matchid AND teamid='GER') GROUP BY matchid, mdate;
 
--13. List !!EVERY!! match with the goals scored by each team as shown. 
-- This will use "CASE WHEN" which has not been explained in any previous exercises.
-- Sort your result by mdate, matchid, team1 and team2.
SELECT mdate,
  team1, SUM(CASE WHEN teamid=team1 THEN 1 ELSE 0 END) AS score1, 
  team2, SUM(CASE WHEN teamid=team2 THEN 1 ELSE 0 END) AS score2
  FROM game LEFT JOIN goal ON matchid = id 
  GROUP BY mdate, team1, team2
  ORDER BY mdate, matchid, team1, team2;
  
