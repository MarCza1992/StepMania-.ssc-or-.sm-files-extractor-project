						-- CREATING BACKUP TABLES --
                        
create table backup_charts_data
like charts_data;
create table backup_notes_data
like notes_data;

insert into backup_charts_data
select *
from charts_data;
insert into backup_notes_data
select *
from notes_data;

						-- DATA CLEANING/PREPARING --

-- Fixing Song_length format
ALTER TABLE charts_data ADD COLUMN Song_Length_formatted TIME;
UPDATE charts_data SET Song_Length_formatted = CAST(Song_Length AS TIME);
ALTER TABLE charts_data DROP COLUMN Song_Length;
ALTER TABLE charts_data CHANGE Song_Length_formatted Song_Length TIME;
ALTER TABLE charts_data MODIFY COLUMN Song_Length TIME AFTER Song_Artist;

-- fixing MIN_BPM and MAX_BPM format
ALTER TABLE charts_data ADD COLUMN MIN_BPM_formatted DECIMAL(10, 2);
UPDATE charts_data SET MIN_BPM_formatted = CAST(replace(MIN_BPM, ',', '.') AS DECIMAL(10, 2));
ALTER TABLE charts_data DROP COLUMN MIN_BPM;
ALTER TABLE charts_data CHANGE MIN_BPM_formatted MIN_BPM DECIMAL(10, 2);
ALTER TABLE charts_data MODIFY COLUMN MIN_BPM DECIMAL(10, 2) AFTER Song_Length;

ALTER TABLE charts_data ADD COLUMN MAX_BPM_formatted DECIMAL(10, 2);
UPDATE charts_data SET MAX_BPM_formatted = CAST(replace(MAX_BPM, ',', '.') AS DECIMAL(10, 2));
ALTER TABLE charts_data DROP COLUMN MAX_BPM;
ALTER TABLE charts_data CHANGE MAX_BPM_formatted MAX_BPM DECIMAL(10, 2);
ALTER TABLE charts_data MODIFY COLUMN MAX_BPM DECIMAL(10, 2) AFTER MIN_BPM;

-- setting primary key to Chart_ID column in charts_data
ALTER TABLE charts_data
CHANGE COLUMN Chart_ID Chart_ID INT NOT NULL AUTO_INCREMENT,
ADD PRIMARY KEY (Chart_ID);

-- setting foreign key in notes_data
ALTER TABLE notes_data
CHANGE COLUMN Chart_ID Chart_ID INT NOT NULL,
ADD FOREIGN KEY (Chart_ID) REFERENCES charts_data(Chart_ID) ON DELETE CASCADE;

-- fixing Song Title in one song (MySQL automatically converted 'n/a' title to null)
update charts_data
set Song_Title = "n/a"
where Chart_ID between 15581 and 15585;

-- removing rows with empty data in important columns
DELETE FROM charts_data
where Song_Title IS NULL OR Song_Title = '' OR
	Song_Length IS NULL OR Song_Length = '' OR
	Difficulty_Name IS NULL OR Difficulty_Name = '' OR
	Difficulty_Rating IS NULL OR Difficulty_Rating = '' OR
	Pack IS NULL OR Pack = '' OR
	`Type` IS NULL OR `Type` = '';

-- removing rows with almost no objects (from notes data), those are empty charts, useless for database
DELETE FROM charts_data
where Chart_ID IN (select Chart_ID
					from (select c.Chart_ID
							from charts_data as c
							join notes_data as n ON c.Chart_ID = n.Chart_ID
							where (n.Amount_of_Notes + n.Amount_of_LongNotes + n.Amount_of_Rolls) < 5) AS temporarytable);

-- removing rows with very very short Song_Length time, useless for database
DELETE FROM charts_data 
where Song_Length < 15;

-- removing rows with absurdly high difficulty rating
DELETE FROM charts_data 
where Difficulty_Rating > 24;

-- replacing all null values in Technical_Notation to "Unknown" value
update charts_data
set Technical_Notation = "Unknown"
where Technical_Notation is null;

-- deleting rows with unknown ("other") chart type
DELETE FROM charts_data 
where `type` = "other";

-- deleting duplicates
with tabletest as
(select c.Chart_ID, row_number() over(partition by Song_Title, Song_Subtitle, Song_Artist, Difficulty_Name, Difficulty_Rating, Technical_Notation, pack, `Type`, Amount_of_Notes, Amount_of_LongNotes, Amount_of_Rolls, Amount_of_Mines) as rn
from charts_data as c
join notes_data as n on c.Chart_ID = n.Chart_ID)
DELETE FROM charts_data
where Chart_ID IN (select Chart_ID
					from tabletest
                    where rn > 1);

							-- SOME INTERESTING QUERIES FOR DATA ANALYSIS

-- Top10 packs with biggest amount of objects (excluding mines)
select c.Pack, sum(n.Amount_of_Notes + n.Amount_of_LongNotes + n.Amount_of_Rolls) as Total_amount_of_objects
from charts_data as c
join notes_data as n
	on c.Chart_ID = n.Chart_ID
group by c.pack
order by 2 desc
limit 10; -- most of the top10 packs in that category are stamina packs

-- Step Artists contribution in each pack based of amount of charts created (and compared to number of total charts in pack)
select Pack, Step_Artist, count(Chart_ID) as Amount_of_Charts, sum(count(*)) over (partition by Pack) as Total_charts_in_pack
from charts_data
group by Pack, Step_Artist
order by Pack, Amount_of_charts desc;

-- Avarage difficulty rating in each pack on each difficulty name
select Pack, Difficulty_Name, round(AVG(Difficulty_Rating), 2) as average_difficulty_rating
from charts_data
group by Difficulty_Name, Pack
order by Pack, CASE Difficulty_Name
	WHEN 'Beginner' THEN 1
    WHEN 'Easy' THEN 2
    WHEN 'Medium' THEN 3
    WHEN 'Hard' THEN 4
    WHEN 'Challenge' THEN 5
    ELSE 6
END;

-- How many charts are nontechnical (NoTech) compared to Technical charts (any Tech notation) on difficulty rating 7 or more
select CASE
	WHEN Technical_Notation = 'NoTech' THEN 'NonTechnical charts'
    WHEN Technical_Notation = 'Unknown' THEN 'Undefinied'
    ELSE 'Technical charts'
END as Type_of_chart,
count(*) as Total
from charts_data
where Difficulty_Rating >= 7
group by Type_of_chart; -- most of the described charts are technical, however there is still a huge amount of charts that are undefinied

-- what kind of popular technical patterns (like 'XO', 'BR' etc.) are the most often used in charts
with testtable as
(
select 'has XO' as hastech from charts_data where Technical_Notation like '%XO%'
UNION ALL
select 'has BR' as hastech from charts_data where Technical_Notation like '%BR%'
UNION ALL
select 'has FS' as hastech from charts_data where Technical_Notation like '%FS%'
UNION ALL
select 'has DS' as hastech from charts_data where Technical_Notation like '%DS%'
UNION ALL
select 'has BU' as hastech from charts_data where Technical_Notation like '%BU%'
UNION ALL
select 'has SS' as hastech from charts_data where Technical_Notation like '%SS%'
UNION ALL
select 'has RH' as hastech from charts_data where Technical_Notation like '%RH%'
UNION ALL
select 'has BR' as hastech from charts_data where Technical_Notation like '%BR%'
UNION ALL
select 'has JU' as hastech from charts_data where Technical_Notation like '%JU%'
UNION ALL
select 'has BT' as hastech from charts_data where Technical_Notation like '%BT%'
UNION ALL
select 'has JA' as hastech from charts_data where Technical_Notation like '%JA%'
UNION ALL
select 'has GH' as hastech from charts_data where Technical_Notation like '%GH%'
UNION ALL
select 'has DT' as hastech from charts_data where Technical_Notation like '%DT%'
UNION ALL
select 'has CT' as hastech from charts_data where Technical_Notation like '%CT%'
UNION ALL
select 'has KS' as hastech from charts_data where Technical_Notation like '%KS%'
UNION ALL
select 'has SJ' as hastech from charts_data where Technical_Notation like '%SJ%'
UNION ALL
select 'has RS' as hastech from charts_data where Technical_Notation like '%RS%'
UNION ALL
select 'has MODS' as hastech from charts_data where Technical_Notation like '%MODS%'
UNION ALL
select 'has HS' as hastech from charts_data where Technical_Notation like '%HS%'
UNION ALL
select 'has MA' as hastech from charts_data where Technical_Notation like '%MA%'
UNION ALL
select 'has JH' as hastech from charts_data where Technical_Notation like '%JH%'
UNION ALL
select 'has XM' as hastech from charts_data where Technical_Notation like '%XM%'
UNION ALL
select 'has DR' as hastech from charts_data where Technical_Notation like '%DR%'
UNION ALL
select 'has FL' as hastech from charts_data where Technical_Notation like '%FL%'
UNION ALL
select 'has STR' as hastech from charts_data where Technical_Notation like '%STR%'
)
select hastech, count(*) as total_charts
from testtable
group by hastech
order by total_charts desc; -- the most often used techs are BR, XO and FS with a big focus on BR, thats not a surprise because there is a special short for these 3 notations "BXF" because these are the most often used in charts. Other popular techs are DS, BU, JA, SS, XM and RH

-- Amount of SONGS (not charts) grouped by song length
with tabletest as
(
select distinct
song_title, Song_Subtitle, Song_Artist,
CASE
	WHEN song_length < '00:01:45' THEN 'Short songs (max 00:01:44)'
	WHEN song_length between '00:01:45' and '00:02:30' THEN 'Standard songs (00:01:45 - 00:02:30)'
    WHEN song_length between '00:02:31' and '00:04:00' THEN 'Long songs (00:02:31 - 00:04:00)'
    ELSE 'Marathon songs (min 00:04:01)'
END as Song_length_category
from charts_data
)
select Song_length_category, count(*) total_songs
from tabletest
group by Song_length_category
order by total_songs desc; -- the most popular songs are in 00:01:45-00:02:30 interval, which is not surprising, as this is a standardized song length in most official rhythm games. However, when we exclude that interval, custom creators tend to prefer making charts for shorter songs (<00:01:45) rather than longer ones (>00:02:30)

-- are there any charts with 1000+ objects (notes+longnotes+rolls) which songs are not longer than 00:02:00?
select c.song_title, c.song_subtitle, c.song_artist, c.song_length, c.difficulty_name, c.difficulty_rating, c.step_artist, c.pack, c.`type`, (n.amount_of_notes + n.amount_of_longnotes + n.amount_of_rolls) as amount_of_objects
from charts_data as c
join notes_data as n
	on c.chart_id = n.chart_id
where c.Song_Length <= '00:02:00'
having amount_of_objects >= 1000
order by amount_of_objects desc; -- there are plenty of charts (exactly 163) that meet these criteria

-- select top chart for each difficulty rating that has the most objects for songs with standarized length (00:01:45 - 00:02:30)
with tabletest as
(
select c.song_title, c.song_subtitle, c.song_artist, c.song_length, c.difficulty_name, c.difficulty_rating, c.step_artist, c.pack, 
n.amount_of_notes + n.amount_of_longnotes + n.amount_of_rolls as amount_of_objects
from charts_data as c
join notes_data as n
	on c.chart_id = n.chart_id
where song_length between '00:01:45' and '00:02:30'
)
select difficulty_rating, round(avg(amount_of_objects), 0) as Average_amount_of_objects
from tabletest
group by difficulty_rating
order by difficulty_rating; -- by average we have a linear progression, except difficulties above 18, however we can explain that by having not too much data for difficulties above 18 (those are very rare)

-- each pack comparision by avarage of difficulty rating and amount of objects in charts
select c.pack, round(avg(c.difficulty_rating), 2) as avarage_difficulty_rating, round(avg(n.amount_of_notes + n.amount_of_longnotes + n.amount_of_rolls), 0) as avarage_amount_of_objects
from charts_data as c
join notes_data as n
	on c.chart_id = n.chart_id
group by c.pack;

-- top10 packs with longest avarage song length
with tabletest as
(
select distinct(concat(song_title, ' - ', song_artist)) as full_song_name, Song_Length, pack
from charts_data
)
select pack, round(avg(song_length), 0) as avarage_song_length_seconds
from tabletest
group by pack
order by 2 desc
limit 10; -- yeah, TranceMania 3 pack has very very long stuff in there

-- every note type contribition (in %) on each pack
with tabletest as
(
select c.pack, 
sum(n.amount_of_notes) as total_notes,
sum(n.amount_of_longnotes) as total_longnotes,
sum(n.amount_of_rolls) as total_rolls,
sum(n.amount_of_mines) as total_mines,
sum(n.amount_of_notes + n.amount_of_longnotes + n.amount_of_rolls + n.amount_of_mines) as total
from charts_data as c
join notes_data as n
	on c.chart_id = n.chart_id
group by c.pack
)
select pack,
concat(round((total_notes / total) * 100, 2), '%') as '% notes contribution',
concat(round((total_longnotes / total) * 100, 2), '%') as '% longnotes contribution',
concat(round((total_rolls / total) * 100, 2), '%') as '% rolls contribution',
concat(round((total_mines / total) * 100, 2), '%') as '% mines contribution'
from tabletest;

-- is there enough content for "double" type of charts for beginners to learn like in "single" type?

with tabletest as
(
select `type`, Difficulty_Name, count(*) as Total_Charts, round(avg(Difficulty_Rating), 2) as Average_Difficulty_Rating, sum(count(*)) over (partition by `type`) as total
from charts_data
where `type` IN ("single", "double") and Difficulty_Name <> "Edit"
group by `type`, Difficulty_Name
)
select `type`, Difficulty_Name, Average_Difficulty_Rating, Total_Charts, concat(round((Total_Charts / total) * 100, 2), '%') as "Total_Charts (% contribution by difficulty in each type)"
from tabletest
order by `type` desc, CASE Difficulty_Name
	WHEN 'Beginner' THEN 1
    WHEN 'Easy' THEN 2
    WHEN 'Medium' THEN 3
    WHEN 'Hard' THEN 4
    ELSE 5
END; -- There are no beginner difficulties for "double" charts, however there are enough easier charts just above that level, so players who have learned the basics of the game in the "single" type can easily start learning from easy difficulties in "double" (where the average rating is actually lower than in the "single" type!)

-- does higher MAX_BPM means higher difficulty rating for difficulties 10?

select difficulty_rating, round(avg(max_bpm), 2) as Average_BPM
from charts_data
where Difficulty_Rating >= 10
group by Difficulty_Rating
order by Difficulty_Rating; -- that's true, a higher BPM means higher difficulty rating by average, probably because its easier to make harder charts when BPM is higher