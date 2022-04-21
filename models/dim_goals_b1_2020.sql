with step1 as (
SELECT HomeTeam, AwayTeam, FTHG, FTAG, FTR
FROM `bethacking.history.B1_2020` 
), 
home_summary as (
    select 
        HomeTeam, 
        count(*) as ht_matches, 
        sum(FTHG) as ht_goals
    from step1
    group by 1
), 

away_summary as (
    select
        AwayTeam, 
        count(*) at_matches, 
        sum(FTAG) at_goals
    from step1
    group by 1
)

select 
  hs.HomeTeam as Team, 
  hs.ht_matches as HomeMatches, 
  hs.ht_goals as HomeGoals, 
  a.at_matches as AwayMatches,
  a.at_goals as AwayGoals
from home_summary hs 
inner join away_summary a on 
  hs.HomeTeam = a.AwayTeam


