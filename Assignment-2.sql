select *
from `rudrack-007.ipl_analysis.2019_batsmen`
where Mat >10;

/*Extracts the first 5 records only*/

select Player, Team 
from `rudrack-007.ipl_analysis.2019_batsmen`
limit 5;

/*What are the names and teams of all players in the 2018's Batsmen table?*/

select Player,Team
from `rudrack-007.ipl_analysis.2018_batsmen`;

/*What are the distinct teams in the 2019's Bowlers table?
Explanation: This question is designed to demonstrate the use of the DISTINCT keyword, which returns only unique values for the specified column(s).*/

select distinct Team
from `rudrack-007.ipl_analysis.2019_bowlers`;

/*What are the total runs for all players in the 2018's Batsmen table?
Explanation: This question is designed to demonstrate the use of the SUM function, which returns the total value of the specified column across all rows in the table.*/


select sum(Runs) as Total_runs
from `rudrack-007.ipl_analysis.2018_batsmen`;

/*What are the names and total number of matches of all players in the 2019's Batsmen table who played for Chennai?
Explanation: This question is designed to demonstrate the use of the WHERE clause, which allows us to filter the results based on a specified condition.*/

select Player,Mat
from `rudrack-007.ipl_analysis.2019_batsmen`
where Team = 'Chennai Super Kings';

/*What are the names and runs incurred by the bowlers in the 2018, sorted by runs in ascending order?
Explanation: This question is designed to demonstrate the use of the ORDER BY clause, which allows us to sort the results based on the specified column(s).*/


select Player,Runs
from `rudrack-007.ipl_analysis.2018_bowlers`
order by Runs asc;

/*What are the names and teams of all Allrounders in the year 2019?
Explanation: This question is designed to demonstrate the use of the INNER JOIN clause, which allows us to combine rows from two or more tables based on a related column(s).*/

select p.Player,p.Team
from `rudrack-007.ipl_analysis.2019_batsmen` as p inner join `rudrack-007.ipl_analysis.2019_bowlers` as a
on p.Player = a.Player ;

/*What are the total number of players in the 2019 Batsmen table, grouped by Team?
Explanation: This question is designed to demonstrate the use of the GROUP BY clause, which allows us to group the results based on the specified column(s), and the use of the COUNT function, which returns the total number of rows in each group.*/


select Team, count(Player) as number_of_players
from `rudrack-007.ipl_analysis.2019_batsmen`
group by Team;

/*What are the total number of players in the 2019 Batsmen table, grouped by Team, and sorted by count in descending order?
Explanation: This question is designed to demonstrate the use of the GROUP BY clause in combination with the ORDER BY clause, which allows us to sort the grouped results based on the specified column(s).*/


select Team, count(Player) as total_count
from `rudrack-007.ipl_analysis.2019_batsmen`
group by Team
order by count(Player) desc;

/*What are the names of top 2 teams which consists of most number of bowlers in 2018?
Explanation: This question is designed to demonstrate the use of the GROUP BY clause in combination with the ORDER BY clause and the LIMIT clause, which allows us to limit the number of results returned.*/



select Team,count(Player) as total_count
from `rudrack-007.ipl_analysis.2018_bowlers`
group by Team
order by count(Player) desc
limit 2;

#1. Which bowlers took the most wickets in the 2018 season?

select Player, Wkts
from `rudrack-007.ipl_analysis.2018_bowlers`
order by Wkts desc
limit 1;


#2. Which batsmen scored the most runs in the 2018 season while maintaining an average strike rate of at least 130?

select Team, Player, Runs , S_R
from `rudrack-007.ipl_analysis.2018_batsmen`
where S_R >=130
order by Runs desc
limit 1;


#3. Which bowlers took the most wickets in the 2018 season while maintaining an economy rate of less than 7 runs per over?

select Player,Team,Wkts,E_R
from `rudrack-007.ipl_analysis.2018_bowlers`
where E_R < 7
order by Wkts desc;


#4. Which batsmen scored the most runs across both 2018 and 2019 seasons?

select p.Player,(p.Runs+ a.Runs) as total_runs
from `rudrack-007.ipl_analysis.2019_batsmen` as p inner join `rudrack-007.ipl_analysis.2018_batsmen` as a
on p.Player = a.Player 
order by total_runs
limit 5;


#5. Which batsmen has hit the maximum number of boundaries in 2018, combining 4s and 6s?


select Player, (sum(`4s`)+ sum(`6s`)) as boundaries
from `rudrack-007.ipl_analysis.2018_batsmen`
group by Player
order by boundaries desc limit 1;


#6. Name the bowlers who have got 4 wickets haul in 2019.

select Player,Team,four_wickets
from `rudrack-007.ipl_analysis.2019_bowlers`
where four_wickets >0;

#7. Name 5 such bowlers who bowled the least number of overs in 2018.

select Player,Overs
from `rudrack-007.ipl_analysis.2018_bowlers`
order by Overs asc
limit 5;

#8. Which team scored the maximum number of runs in 2019?

select Team, sum(Runs) as total_runs
from `rudrack-007.ipl_analysis.2019_batsmen`
group by Team
order by total_runs desc
limit 1;

#9. Name the Batsmen who has hit maximum half centuries, both the years combined

select p.Player,sum(p.`50s`+ a.`50s`) as half_centuries
from `rudrack-007.ipl_analysis.2018_batsmen` as p inner join `rudrack-007.ipl_analysis.2019_batsmen` as a
on p.Player = a.Player
group by p.Player
order by half_centuries desc limit 1;











