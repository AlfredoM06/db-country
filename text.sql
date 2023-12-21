create database db_country;
use db_country;


-- query da svolgere:

-- 1 Selezionare tutte le nazioni il cui nome inizia con la P e la cui area è maggiore di 1000 kmq

select *
from countries c 
where name like 'P%' and area >= 1000;

-- 2 Contare quante nazioni sono presenti nel database

select count(*) as tot_countries
from countries c;

-- 3 Selezionare il nome delle regioni del continente europeo, in ordine alfabetico

select r.name  
from regions r 
join continents c on r.continent_id = c.continent_id 
where c.name = 'Europe';

-- 4 Contare quante regioni sono presenti nel continente Africa

select count(*) as tot_regions_Africa
from regions r 
join continents c on r.continent_id = c.continent_id 
where c.name = 'Africa'

-- 5 Selezionare quali nazioni non hanno un national day

select *
from countries c 
where national_day is null;

-- 6 Per ogni nazione, in ordine alfabetico, selezionare il nome, la regione e il continente

select c.name, r.name, c2.name
from countries c 
join regions r on c.region_id = c.region_id 
join continents c2 on r.continent_id = c2.continent_id 
order by 'name' asc;

-- 7 Selezionare le lingue ufficiali dell’Albania

select *
from languages l 
join country_languages cl on l.language_id = cl.language_id 
join countries c on cl.country_id = c.country_id 
where cl.official = 1 and c.name = 'Albania';

-- 8 Selezionare il Gross domestic product (GDP) medio dello United Kingdom tra il 2000 e il 2010

select avg(gdp) 
from country_stats cs 
join countries c on cs.country_id = c.country_id 
where `year` >= 2000 and `year` <= 2010;

-- 9 Selezionare tutte le nazioni in cui si parla hindi, ordinate dalla più estesa alla meno estesa

select *
from countries c 
join country_languages cl on c.country_id = cl.country_id 
join languages l on cl.language_id = l.language_id 
where `language` = 'hindi' 
order by area asc ;

-- 10 Modificare la nazione di nome Italy, inserendo come national day il 2 giugno 1946

update countries 
set national_day = '1946-06-02'
where country_id = 107;

-- Query Bonus:

-- 11 Selezionare le nazioni il cui national day è avvenuto prima del 1900, ordinate per national day dal più recente al meno recente

select *
from countries c 
where year(national_day) < 1900
order by national_day desc;

-- 12 Contare quante lingue sono parlate in Italia

select count(*)
from languages l 
join country_languages cl on l.language_id = cl.language_id 
join countries c on cl.country_id = c.country_id 
where c.name = 'Italy';

-- 13 Per la regione Antarctica mostrare il valore dell’area totale e dell’area media delle nazioni

select sum(area), avg(area)  
from countries c 
join regions r on c.region_id = r.region_id 
where r.name = 'Antarctica';







