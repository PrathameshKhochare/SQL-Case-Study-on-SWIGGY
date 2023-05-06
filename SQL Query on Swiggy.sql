create table users(
   user_id int8 primary key,
	name varchar(50),
	email varchar(50),
	password varchar(20)  -- hashed password
)

create table restaurants(
    r_id int8 primary key,
	r_name varchar(50),
	cuisine varchar(50)
)

create table food(
    f_id int8 primary key,
	f_name varchar(50),
	type varchar(50)
)

create table menu(
    menu_id int8 primary key,
	r_id int8,
	f_id int8,
	price numeric
)

create table orders(
    order_id int8 primary key not null,
	user_id int8 not null,
	r_id int8 not null,
	amount numeric,
	date date,
	partner_id int8,
	delivery_time int8,
	delivery_rating int8,
	restaurant_rating int8
)

create table delivery_partner(
    partner_id int8 primary key not null,
	partner_name varchar(50)
)

create table order_details(
    id int8 primary key not null,
	order_id numeric,
	f_id int8
)

----------------------
select * from restaurants

copy users(user_id,name,email,password)
from 'C:\Users\Prathamesh\Downloads\Copy of zomato-schema.csv'
delimiter ','
csv header
------------
insert into users
(user_id,name,email,password)
values
(1,'Nitish','nitish@gmail.com','p252h'),
(2,'Khushboo','khushboo@gmail.com','hxn9b'),
(3,'Vartika','vartika@gmail.com','9hu7j'),
(4,'Ankit','ankit@gmail.com','lkko3'),
(5,'Neha','neha@gmail.com','3i7qm'),
(6,'Anupama','anupama@gmail.com','46rdw2'),
(7,'Rishabh','rishabh@gmail.com','4sw123')


copy restaurants(r_id,r_name,cuisine)
from 'C:\Users\Prathamesh\Downloads\zomato-schema - restaurants.csv'
delimiter ','
csv header
---------------
insert into restaurants
(r_id,r_name,cuisine)
values
(1,'dominos','Italian'),
(2,'kfc','American'),
(3,'box8','North Indian'),
(4,'Dosa Plaza','South Indian'),
(5,'China Town','Chinese')
----------------------

insert into food
(f_id,	f_name,	type)
values
(1,	'Non-veg Pizza',	'Non-veg'),
(2,	'Veg Pizza',	'Veg'),
(3,	'Choco Lava cake',	'Veg'),
(4,	'Chicken Wings',	'Non-veg'),
(5,	'Chicken Popcorn',	'Non-veg'),
(6,	'Rice Meal',	'Veg'),
(7,	'Roti meal',	'Veg'),
(8,	'Masala Dosa',	'Veg'),
(9,	'Rava Idli',	'Veg'),
(10,	'Schezwan Noodles',	'Veg'),
(11,	'Veg Manchurian',	'Veg')

select * from menu
-----------------------
insert into menu
(menu_id,	r_id,	f_id,	price)
values
(1,	1,	1,	450),
(2,	1,	2,	400),
(3,	1,	3,	100),
(4,	2,	3,	115),
(5,	2,	4,	230),
(6,	2,	5,	300),
(7,	3,	3,	80),
(8,	3,	6,	160),
(9,	3,	7,	140),
(10,	4,	6,	230),
(11,	4,	8,	180),
(12,	4,	9,	120),
(13,	5,	6,	250),
(14,	5,	10,	220),
(15,	5,	11,	180)
------------------
insert into orders
(order_id,	user_id,	r_id,	amount,	date,	partner_id,	delivery_time,	delivery_rating,	restaurant_rating)
values
(1001,	1,	1,	550,	'2022-05-10',	1,	25,	5,	3),
(1002,	1,	2,	415,	'2022-05-26',	1,	19,	5,	2),
(1003,	1,	3,	240,	'2022-06-15',	5,	29,	4, null	),
(1004,	1,	3,	240,	'2022-06-29',	4,	42,	3,	5),
(1005,	1,	3,	220,	'2022-07-10',	1,	58,	1,	4),
(1006,	2,	1,	950,	'2022-06-10',	2,	16,	5, null	),
(1007,	2,	2,	530,	'2022-06-23',	3,	60,	1,	5),
(1008,	2,	3,	240,	'2022-07-07',	5,	33,	4,	5),
(1009,	2,	4,	300,	'2022-07-17',	4,	41,	1, null	),
(1010,	2,	5,	650,	'2022-07-31',	1,	67,	1,	4),
(1011,	3,	1,	450,	'2022-05-10',	2,	25,	3,	1),
(1012,	3,	4,	180,	'2022-05-20',	5,	33,	4,	1),
(1013,	3,	2,	230,	'2022-05-30',	4,	45,	3, null	),
(1014,      3,	2,	230,	'2022-06-11',	2,	55,	1,	2),
(1015,	3,	2,	230,	'2022-06-22',	3,	21,	5, null	),
(1016,	4,	4,	300,	'2022-05-15',	3,	31,	5,	5),
(1017,	4,	4,	300,	'2022-05-30',	1,	50,	1, null	),
(1018,	4,	4,	400,	'2022-06-15',	2,	40,	3,	5),
(1019,	4,	5,	400,	'2022-06-30',	1,	70,	2,	4),
(1020,	4,	5,	400,	'2022-07-15',	3,	26,	5,	3),
(1021,	5,	1,	550,	'2022-07-01',	5,	22,	2, null	),
(1022,	5,	1,	550,	'2022-07-08',	1,	34,	5,	1),
(1023,	5,	2,	645,	'2022-07-15',	4,	38,	5, null	),
(1024,	5,	2,	645,	'2022-07-21',	2,	58,	2,	1),
(1025,	5,	2,	645,	'2022-07-28',	2,	44,	4, null	)

select * from delivery_partner
-----------------------
insert into delivery_partner
(partner_id,	partner_name)
values
(1,	'Suresh'),
(2,	'Amit'),
(3,	'Lokesh'),
(4,	'Kartik'),
(5,	'Gyandeep')

---------------
select * from order_details

insert into order_details
(id,	order_id,	f_id)
values
(1,	1001,	1),
(2,	1001,	3),
(3,	1002,	4),
(4,	1002,	3),
(5,	1003,	6),
(6,	1003,	3),
(7,	1004,	6),
(8,	1004,	3),
(9,	1005,   7),
(10,	1005,	3),
(11,	1006,	1),
(12,	1006,	2),
(13,	1006,	3),
(14,	1007,	4),
(15,	1007,	3),
(16,	1008,	6),
(17,	1008,	3),
(18,	1009,	8),
(19,	1009,	9),
(20,	1010,	10),
(21,	1010,	11),
(22,	1010,6),
(23,	1011,	1),
(24,	1012,	8),
(25,	1013,	4),
(26,	1014,	4),
(27,	1015,	4),
(28,	1016,	8),
(29,	1016,	9),
(30,	1017,	8),
(31,	1017,	9),
(32,	1018,	10),
(33,	1018,	11),
(34,	1019,	10),
(35,	1019,	11),
(36,	1020,	10),
(37,	1020,	11),
(38,	1021,	1),
(39,	1021,	3),
(40,	1022,	1),
(41,	1022,	3),
(42,	1023,	3),
(43,	1023,	4),
(44,	1023,	5),
(45,	1024,	3),
(46,	1024,	4),
(47,	1024,	5),
(48,	1025,	3),
(49,	1025,	4),
(50,	1025,	5)

select * from order_details
-------------------------
# We have successfully loaded the Dataset #
-----
select * from restaurants
select * from users
select * from orders
select * from order_details
select * from menu
select * from food
select * from delivery_partner

###Question:
Swiggy Case Study-  ###

Q1. 1. Find customers who have never ordered
Ans -

select name from users 
where user_id not in
         (select user_id from orders
		  group by order_id
		 )
		 
---------------
Q2. Average Price/dish
Ans-

select f_name,round(avg(m.price),2) as avg_food_price
from food f 
join menu m on f.f_id = m.f_id
group by f_name
order by avg_food_price desc

-----------------------------	
Q3. Find the top restaurant in terms of the number of orders for a given month (June)
Ans-
select extract(year from date) as my_year from orders

select r.r_name,count(*) as total_orders
from orders o join restaurants r on o.r_id = r.r_id
where extract(month from date) = 6
group by r.r_id
order by total_orders desc
limit 1


select r.r_id,r.r_name,count(*) as total_orders
from orders o join restaurants r on o.r_id = r.r_id
where extract(month from date) = 5                      ----for month May
group by r.r_id
order by total_orders desc
limit 1

--------------------------------------
Q4. restaurants with monthly sales greater than 500 for month June
Ans-

select r.r_name,sum(o.amount) as total_revenue
from orders o join restaurants r on o.r_id = r.r_id
where extract(month from date) = 6 
group by r.r_name
having sum(o.amount)> 500
order by total_revenue desc

--------------------------------------
Q5. Show all orders with order details for a particular customer (Ankit) in a particular date range
(10 June to 10 July)
Ans-

select distinct u.name,o.date,r.r_name,r.cuisine,m.price,f.f_name,f.type
from orders o join users u on o.user_id = u.user_id
join restaurants r on o.r_id = r.r_id
join menu m on r.r_id = m.r_id
join food f on m.f_id = f.f_id
where o.date between '2022-06-10' and '2022-07-10'
and u.name like 'Ankit'


select distinct u.name,o.order_id,o.date,r.r_name,r.cuisine,m.price,f.f_name,f.type
from orders o join users u on o.user_id = u.user_id
join restaurants r on o.r_id = r.r_id
join menu m on r.r_id = m.r_id
join food f on m.f_id = f.f_id
where o.date between '2022-06-10' and '2022-07-10'
and u.name like 'Nitish'                                       --- Nitish's order
---------------------------
Q6. Find restaurants with max repeated customers 
Ans-

subquery----
select user_id,r_id,count(*) as total_visits from orders group by user_id,r_id having count(*) >1

mainquery ----
select r.r_name, count(*) as Loyal_customers
from
            (
			select user_id,r_id,count(*) as total_visits
			from orders
			group by user_id,r_id 
			having count(*) >1
			) t
join restaurants r on t.r_id = r.r_id			
group by r.r_name
order by Loyal_customers desc
limit 1

-------------------------------
Q7. Month over month revenue growth of swiggy
Ans-

--- 1st we calculate total revenue for each month---
select extract (month from date) as month_,sum(amount) as revenue from orders
group by extract(month from date)
order by month_

-- now we will calculate growth rate--  growth rate = ((current month rev - prev month rev)/prev month rev) *100

select month_,revenue,((revenue - prev)/prev)*100 as growth_rate from
(
    with sales as(
              select extract (month from date) as month_,sum(amount) as revenue from orders
              group by extract(month from date)
              order by month_
                 )
select month_,revenue,lag(revenue,1) over(order by revenue)	as prev from sales
)t

--------------------------
Q8.  Customer - favorite food
Ans-
---we have to calculate users with their fav food (i.e user with any food which is highest count as fav food)--

with temp as (
               select o.user_id,od.f_id,count(*) as total_orders 
               from orders o 
	           join order_details od on o.order_id = od.order_id
	           group by o.user_id,od.f_id
               )
select u.name,f.f_name,t1.total_orders
from temp t1
join users u on u.user_id = t1.user_id
join food f on f.f_id = t1.f_id
where t1.total_orders = 
     (
	 select max(total_orders) 
     from temp t2
     where t1.user_id = t2.user_id
	 )

----------other way ----------
 select * from (
     select * , dense_rank() over(partition by name order by total desc) rnk from
     (select name , f_name , count(f_name ) total from
     (select o.user_id , u.name , f_name ,   d.order_id , d.f_id from order_details d 
     join orders o 
     on o.order_id = d.order_id
     join users u on u.user_id = o.user_id
     join food f on d.f_id = f.f_id ) a
     group by f_name , name ) b ) d 
     where rnk = 1
-------------------------------	 
Additional Que.
--Q9. Find the most loyal customers for all restaurant--
Ans-
subquery----
select user_id,r_id,count(*) as total_visits from orders group by user_id,r_id having count(*) >1 

mainquery--
select r.r_name,u.name,count(*) as loyal_customers
from
            (
            select user_id,r_id,count(*) as total_visits 
	        from orders 
	        group by user_id,r_id 
	        having count(*) >1 
            )t
join restaurants r on r.r_id = t.r_id
join users u on u.user_id = t.user_id
group by r.r_name,u.name

---------------------------
--Q.10 Month over month revenue growth of a restaurant kfc
Ans.  -- // kfc has r_id 2 //--

--- 1st we calculate total revenue for each month for kfc---
select r_id,extract(month from date) month_,sum(amount) as total_revenue
from orders 
group by extract(month from date),r_id 
having r_id = 2                                         

-- revenue growth = ((current rev - prev rev)/prev rev)*100  --
select month_,total_revenue,round((((total_revenue - prev_)/prev_)*100),2) as growth_rate 
from
(
with sales as(
           select r_id,extract(month from date) as month_,sum(amount) as total_revenue
           from orders 
           group by extract(month from date),r_id 
           having r_id = 2 
           )
select month_,total_revenue,lag(total_revenue,1) over(order by total_revenue) as prev_ from sales
)t	
------

-----------------------for dominos  r_id =1
select month_,total_revenue,round((((total_revenue - prev_)/prev_)*100),2) as growth_rate 
from
(
with sales as(
           select r_id,extract(month from date) as month_,sum(amount) as total_revenue
           from orders 
           group by extract(month from date),r_id 
           having r_id = 1 
           )
select month_,total_revenue,lag(total_revenue,1) over(order by total_revenue) as prev_ from sales
)t	

---------------------   