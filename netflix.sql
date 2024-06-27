-- Database: netflix

-- DROP DATABASE IF EXISTS netflix;

CREATE DATABASE netflix
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'English_India.1252'
    LC_CTYPE = 'English_India.1252'
    LOCALE_PROVIDER = 'libc'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;

select * from netflixraw where show_id = 's3963'
	
	--handling foreign characters nvarchar
create TABLE [dbo].[netflix_raw](
	[show_id] [varchar](10) primary key,
	[type] [varchar](10) NULL,
	[title] [nvarchar](200) NULL,
	[director] [varchar](250) NULL,
	[cast] [varchar](1000) NULL,
	[country] [varchar](150) NULL,
	[date_added] [varchar](20) NULL,
	[release_year] [int] NULL,
	[rating] [varchar](10) NULL,
	[duration] [varchar](10) NULL,
	[listed_in] [varchar](100) NULL,
	[description] [varchar](500) NULL
) 
--remove duplicates 
select title ,COUNT(*) 
from netflixraw
group by title
having COUNT(*)>1

select * from netflixraw
where concat(upper(title),typess)  in (
select concat(upper(title),typess) 
from netflixraw
group by upper(title) ,typess
having COUNT(*)>1
)
order by title
	
WITH cte AS (
    SELECT *,
           ROW_NUMBER() OVER(PARTITION BY title, typess ORDER BY show_id) AS rn
    FROM netflixraw
)
SELECT show_id,
       typess,
       title,
       CAST(date_added AS DATE) AS date_added,
       release_year,
       rating,
       CASE WHEN duration IS NULL THEN rating ELSE duration END AS duration,
       description
INTO netflix -- Here you might need to specify the correct schema if not public
FROM cte
WHERE rn = 1;


CREATE TABLE netflixdirector AS
SELECT show_id, trim(value) AS director
FROM netflixraw
CROSS JOIN LATERAL unnest(string_to_array(director, ',')) AS t(value);

select * from netflixdirector

CREATE TABLE netflixcountry AS
SELECT show_id, trim(value) AS country
FROM netflixraw
CROSS JOIN LATERAL unnest(string_to_array(country, ',')) AS t(value);

select * from netflixcountry

CREATE TABLE netflixgenre AS
SELECT show_id, trim(value) AS genre
FROM netflixraw
CROSS JOIN LATERAL unnest(string_to_array(listed_in, ',')) AS t(value);

select * from netflixdirector

CREATE TABLE netflixcasts AS
SELECT show_id, trim(value) AS casts
FROM netflixraw
CROSS JOIN LATERAL unnest(string_to_array(casts, ',')) AS t(value);

select * from netflixdirector
	
--data type conversions for date added 
--populate missing values in country,duration columns
	
insert into netflixcountry
select  show_id,m.country 
from netflixraw nr
inner join (
select director,country
from  netflixcountry nc
inner join netflixdirector nd on nc.show_id=nd.show_id
group by director,country
) m on nr.director=m.director
where nr.country is null

--netflix data analysis

/*1  for each director count the no of movies and tv shows created by them in separate columns 
for directors who have created tv shows and movies both */
select nd.director 
,COUNT(distinct case when n.typess='Movie' then n.show_id end) as no_of_movies
,COUNT(distinct case when n.typess='TV Show' then n.show_id end) as no_of_tvshow
from netflix n
inner join netflixdirector nd on n.show_id=nd.show_id
group by nd.director
having COUNT(distinct n.typess)>1
	
--2 which country has highest number of comedy movies 
select nc.country , COUNT(distinct ng.show_id ) as no_of_movies
from netflixgenre ng
inner join netflixcountry nc on ng.show_id=nc.show_id
inner join netflix n on ng.show_id=nc.show_id
where ng.genre='Comedies' and n.typess='Movie'
group by  nc.country
order by no_of_movies desc LIMIT 1
	
--3 for each year (as per date added to netflix), which director has maximum number of movies released
WITH cte AS (
    SELECT 
        nd.director,
        EXTRACT(YEAR FROM n.date_added) AS date_year,
        COUNT(n.show_id) AS no_of_movies
    FROM 
        netflix n
        INNER JOIN netflixdirector nd ON n.show_id = nd.show_id
    WHERE 
        n.typess = 'Movie'
    GROUP BY 
        nd.director, EXTRACT(YEAR FROM n.date_added)
),
cte2 AS (
    SELECT 
        *,
        ROW_NUMBER() OVER(PARTITION BY date_year ORDER BY no_of_movies DESC, director) AS rn
    FROM 
        cte
)
SELECT 
    director, date_year, no_of_movies
FROM 
    cte2 
WHERE 
    rn = 1
ORDER BY 
    date_year DESC

	--4 what is average duration of movies in each genre

select ng.genre , avg(cast(REPLACE(duration,' min','') AS int)) as avg_duration
from netflix n
inner join netflixgenre ng on n.show_id=ng.show_id
where typess='Movie'
group by ng.genre

--5  find the list of directors who have created horror and comedy movies both.
-- display director names along with number of comedy and horror movies directed by them 
select nd.director
, count(distinct case when ng.genre='Comedies' then n.show_id end) as no_of_comedy 
, count(distinct case when ng.genre='Horror Movies' then n.show_id end) as no_of_horror
from netflix n
inner join netflixgenre ng on n.show_id=ng.show_id
inner join netflixdirector nd on n.show_id=nd.show_id
where typess='Movie' and ng.genre in ('Comedies','Horror Movies')
group by nd.director
having COUNT(distinct ng.genre)=2;

select * from netflixgenre where show_id in 
(select show_id from netflixdirector where director='Steve Brill')
order by genre