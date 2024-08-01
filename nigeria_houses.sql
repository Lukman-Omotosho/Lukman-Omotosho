select bedrooms, state, avg(price) as avg_price
from nigeria_houses_data 
group by bedrooms, state
having bedrooms = 3
order by avg_price desc;

select bedrooms, state, avg(price) as avg_price
from nigeria_houses_data 
group by bedrooms, state
having bedrooms = 6
order by avg_price desc;

select bedrooms, title, avg(price) as avg_price
from nigeria_houses_data 
group by bedrooms, title
having bedrooms = 3
order by avg_price desc;

select bedrooms, title, avg(price) as avg_price
from nigeria_houses_data 
group by bedrooms, title
having bedrooms = 6
order by avg_price desc;

select bedrooms, state, town, avg(price) as avg_price
from nigeria_houses_data 
group by bedrooms,state, town 
having state = 'Lagos' and bedrooms = 3
order by avg_price desc
limit 10;

select bedrooms, state, town, avg(price) as avg_price
from nigeria_houses_data 
group by bedrooms,state, town 
having state = 'Lagos' and bedrooms = 3
order by avg_price 
limit 10;

select bedrooms, state, town, avg(price) as avg_price
from nigeria_houses_data 
group by bedrooms,state, town 
having state = 'Abuja' and bedrooms = 3
order by avg_price desc
limit 10;

select bedrooms, state, town, avg(price) as avg_price
from nigeria_houses_data 
group by bedrooms,state, town 
having state = 'Abuja' and bedrooms = 3
order by avg_price 
limit 10;

select bedrooms, state, town, avg(price) as avg_price
from nigeria_houses_data 
group by bedrooms,state, town 
having state = 'Delta' and bedrooms = 3
order by avg_price desc
limit 10;

select bedrooms, state, title, avg(price) as avg_price
from nigeria_houses_data 
group by bedrooms,state, title 
having state = 'Lagos' and bedrooms = 3
order by avg_price desc
limit 10;