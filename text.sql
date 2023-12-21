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
where date(national_day) = 'null';