select * from bioskop.schedules
join films on (schedules.film_code = films.film_code);

select schedules.tanggal_tayang, films.film_code, films.film_name 
from bioskop.schedules
join films on (schedules.film_code = films.film_code);


SELECT film_code, film_name, airing
FROM bioskop.films
WHERE film_code='1005';

select a.film_name, b.tanggal_tayang, c.studio_name
from films a left join schedules b on a.film_code = b.film_code 
left join studio c on c.studio_id = b.studio_id
where c.studio_id = '2';