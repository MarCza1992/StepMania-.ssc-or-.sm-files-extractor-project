-- tworzenie zapasowej tabeli
create table backuptable
like chartsdata;

insert into backuptable
select *
from chartsdata;

						-- DATA CLEANING --

-- Fixing Song_length format
ALTER TABLE chartsdata ADD COLUMN formatted_Song_Length TIME;
update chartsdata set formatted_Song_Length = sec_to_time(Song_Length);
alter table chartsdata drop column song_length;
alter table chartsdata change formatted_Song_length Song_Length TIME;
alter table chartsdata modify column Song_Length TIME after Song_Artist;

-- small fixes in charts_title and subtitle
UPDATE chartsdata
set song_title = 'WACCA ULTRA DREAM MEGAMIX'
where song_title = '[Marathon] WACCA ULTRA DREAM MEGAMIX';

UPDATE chartsdata
set song_subtitle = null
where song_subtitle IN('(+18)', '(Bass Tester EXTREME 2 Anthem)', ' ');

-- fixing display of values in Song_BPM column
update chartsdata
set Song_BPM = 
(
CASE
	WHEN position('-' in song_bpm) = 0 THEN round(song_bpm, 2)
    ELSE concat(round(song_bpm, 2), '-', round(substr(song_bpm, position('-' in song_bpm) + 2, 1000), 2))
END
);

-- if you want only max bpm value, add this querry 
update chartsdata 
set Song_BPM = if(position('-' in song_bpm), substr(song_bpm, position('-' in song_bpm) + 1, 1000), song_bpm);

-- fixing display of values in Technical_Notation column for visualisations purposes (removing unnecessary symbols and values to make it easier to analyze)
update chartsdata
set Technical_Notation = 'NoTech'
where Technical_Notation = 'No Tech';

update chartsdata
set Technical_Notation = replace(replace(Technical_Notation, '+', ''), '-', '');

update chartsdata
set Technical_Notation = 'STR'
where Technical_Notation like '%broken%'
	or Technical_Notation like 'STR%/%'
    or Technical_Notation like '%*%'
    or Technical_Notation like '%71632'
    or Technical_Notation like '%total%';
    
update chartsdata
set Technical_Notation = replace(replace(Technical_Notation, '(', ''), ')', '')
where Technical_Notation like '%(%';

update chartsdata
set Technical_Notation = replace(technical_notation, ' @', '@')
where Technical_Notation like 'STR @132%';

update chartsdata
set Technical_Notation = replace(technical_notation, 'BXF', 'BR XO FS');

update chartsdata
set Technical_Notation = replace(technical_notation, 'XM', 'XMOD');

update chartsdata
set Technical_Notation = 'NoTech'
where Technical_Notation = ' ';

update chartsdata
set Step_Artist = lower(Step_Artist)
where Step_Artist = 'Arki';

-- fixing type of data for song BPM column (if u decided only for max BPM value)
ALTER TABLE `projekt_baza_chartow_bte`.`chartsdata` 
CHANGE COLUMN `Song_BPM` `Song_BPM` DOUBLE NULL DEFAULT NULL;

-- setting primary key to Chart_ID column in chartsdata
ALTER TABLE `chartsdata`
CHANGE COLUMN `Chart_ID` `Chart_ID` INT NOT NULL AUTO_INCREMENT,
ADD PRIMARY KEY (`Chart_ID`);

-- setting foreign key in notes_statistic
ALTER TABLE `notesdata`
CHANGE COLUMN `Chart_ID` `Chart_ID` INT NOT NULL,
ADD FOREIGN KEY (`Chart_ID`) REFERENCES chartsdata(`Chart_ID`) ON DELETE CASCADE;

-- checking if there are any blank values in chartsdata
select *
from chartsdata
where Chart_ID = '' or
	  Song_Title = '' or
      Song_Subtitle = '' or
      Song_Artist = '' or
      Song_Length = '' or
      Song_BPM = '' or
      Technical_Notation = '' or
      Difficulty_Name = '' or
      Difficulty_Rating = '' or
      Step_Artist = '' or
      Pack = '';

							-- SOME INTERESTING QUERIES FOR DATA ANALYSIS

-- Total amount of objects in each pack (excluding mines)
select c.Pack, sum(n.Amount_of_Notes + n.Amount_of_LongNotes + n.Amount_of_Rolls) as Total_amount_of_objects
from chartsdata as c
join notesdata as n
	on c.Chart_ID = n.Chart_ID
group by c.pack;

-- Step Artists contribution in each pack based of amount of charts created (and compared to numer of total charts in pack)
select Pack, Step_Artist, count(Chart_ID) as Amount_of_Charts, sum(count(*)) over (partition by Pack) as Total_charts_in_pack
from chartsdata
group by Pack, Step_Artist
order by Pack, Amount_of_charts desc;

-- Avarage difficulty rating in each pack on each difficulty name (except "Edit" charts), ordered by difficulty name (not alphabetically)
select Pack, Difficulty_Name, round(AVG(Difficulty_Rating), 2)
from chartsdata
where Difficulty_Name != 'Edit'
group by Difficulty_Name, Pack
order by CASE Difficulty_Name
	WHEN 'Beginner' THEN 1
    WHEN 'Easy' THEN 2
    WHEN 'Medium' THEN 3
    WHEN 'Hard' THEN 4
    ELSE 5
END;

-- How many charts are nontechnical (NoTech) compared to Technical charts (any Tech notation) on difficulty rating 7 and above
select CASE
	WHEN Technical_Notation = 'NoTech' THEN 'NonTechnical charts'
    ELSE 'Technical charts'
END as Type_of_chart,
count(*) as Total
from chartsdata
where Difficulty_Rating >= 7
group by Type_of_chart;

-- what kind of popular technical patterns (like 'XO', 'BR' etc.) are the most often used in charts
with testtable as
(
select 'has XO' as hastech from chartsdata where Technical_Notation like '%XO%'
UNION ALL
select 'has BR' as hastech from chartsdata where Technical_Notation like '%BR%'
UNION ALL
select 'has FS' as hastech from chartsdata where Technical_Notation like '%FS%'
UNION ALL
select 'has DS' as hastech from chartsdata where Technical_Notation like '%DS%'
UNION ALL
select 'has BU' as hastech from chartsdata where Technical_Notation like '%BU%'
UNION ALL
select 'has SS' as hastech from chartsdata where Technical_Notation like '%SS%'
UNION ALL
select 'has RH' as hastech from chartsdata where Technical_Notation like '%RH%'
UNION ALL
select 'has BR' as hastech from chartsdata where Technical_Notation like '%BR%'
UNION ALL
select 'has JU' as hastech from chartsdata where Technical_Notation like '%BR%'
UNION ALL
select 'has BT' as hastech from chartsdata where Technical_Notation like '%BT%'
UNION ALL
select 'has JA' as hastech from chartsdata where Technical_Notation like '%JA%'
UNION ALL
select 'has DT' as hastech from chartsdata where Technical_Notation like '%DT%'
UNION ALL
select 'has SJ' as hastech from chartsdata where Technical_Notation like '%SJ%'
UNION ALL
select 'has HS' as hastech from chartsdata where Technical_Notation like '%HS%'
UNION ALL
select 'has MA' as hastech from chartsdata where Technical_Notation like '%MA%'
UNION ALL
select 'has JH' as hastech from chartsdata where Technical_Notation like '%JH%'
UNION ALL
select 'has XMOD' as hastech from chartsdata where Technical_Notation like '%XMOD%'
UNION ALL
select 'has DR' as hastech from chartsdata where Technical_Notation like '%DR%'
UNION ALL
select 'has FL' as hastech from chartsdata where Technical_Notation like '%FL%'
UNION ALL
select 'has STR' as hastech from chartsdata where Technical_Notation like '%STR%'
)
select hastech, count(*) as total_charts
from testtable
group by hastech
order by total_charts desc;

-- Amount of SONGS (not charts) grouped by song length
with tabletest as
(
select 
distinct(song_title), 
CASE
	WHEN song_length < '00:01:45' THEN 'Short songs (max 00:01:44)'
	WHEN song_length between '00:01:45' and '00:02:30' THEN 'Standard songs (00:01:45 - 00:02:30)'
    WHEN song_length between '00:02:31' and '00:04:00' THEN 'Long songs (00:02:31 - 00:04:00)'
    ELSE 'Marathon songs (min 00:04:01)'
END as Song_length_category
from chartsdata
)
select Song_length_category, count(*) total_songs
from tabletest
group by Song_length_category
order by total_songs desc;

-- are there any charts with 1000+ objects (notes+longnotes+rolls) which songs are not longer than 00:02:30?
select c.song_title, c.song_subtitle, c.song_artist, c.song_length, c.difficulty_name, c.difficulty_rating, c.step_artist, c.pack, (n.amount_of_notes + n.amount_of_longnotes + n.amount_of_rolls) as amount_of_objects
from chartsdata as c
join notesdata as n
	on c.chart_id = n.chart_id
where c.Song_Length <= '00:02:30'
having amount_of_objects >= 1000
order by amount_of_objects desc;

-- select top chart for each difficulty rating that has the most objects
with tabletest as
(
select c.song_title, c.song_subtitle, c.song_artist, c.song_length, c.difficulty_name, c.difficulty_rating, c.step_artist, c.pack, 
n.amount_of_notes + n.amount_of_longnotes + n.amount_of_rolls as amount_of_objects,
row_number() over (partition by c.difficulty_rating order by n.amount_of_notes + n.amount_of_longnotes + n.amount_of_rolls desc) as rn
from chartsdata as c
join notesdata as n
	on c.chart_id = n.chart_id
)
select song_title, song_subtitle, song_artist, song_length, difficulty_name, difficulty_rating, step_artist, pack, amount_of_objects
from tabletest
where rn = 1
order by difficulty_rating;

-- each pack comparision by avarage of difficulty rating and amount of objects in charts
select c.pack, round(avg(c.difficulty_rating), 2) as avarage_difficulty_rating, round(avg(n.amount_of_notes + n.amount_of_longnotes + n.amount_of_rolls), 2) as avarage_amount_of_objects
from chartsdata as c
join notesdata as n
	on c.chart_id = n.chart_id
group by c.pack;

-- avarage SONG (not chart) length in each pack
with tabletest as
(
select distinct(concat(song_title, ' - ', song_artist)) as full_song_name, Song_Length, pack
from chartsdata
)
select pack, sec_to_time(avg(time_to_sec(song_length))) as avarage_song_length
from tabletest
group by pack;

-- every note type contribition (in %) on each chart
with tabletest as
(
select c.*, 
(n.amount_of_notes + amount_of_longnotes + amount_of_rolls + amount_of_mines) as total
from chartsdata as c
join notesdata as n
	on c.chart_id = n.chart_id
)
select song_title, difficulty_name, difficulty_rating,
concat(round((n2.amount_of_notes / total) * 100, 2), '%') as '% notes contribution',
concat(round((n2.amount_of_longnotes / total) * 100, 2), '%') as '% longnotes contribution',
concat(round((n2.amount_of_rolls / total) * 100, 2), '%') as '% rolls contribution',
concat(round((n2.amount_of_mines / total) * 100, 2), '%') as '% mines contribution'
from tabletest t
join notesdata n2
	on t.chart_id = n2.chart_id;
















