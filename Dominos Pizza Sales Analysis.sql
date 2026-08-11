create database pizza;

use pizza;

select * from order_details;
select * from orders;
select * from pizzas;
select * from pizza_types;



#1.Retrieve the total number of orders placed

select count(order_id) as Total_Orders from orders;



#2. List the top 5 most ordered pizza types along with their quantities

select row_number() over(order by sum(od.quantity) desc) as '', name as Pizza_Type, 
sum(od.quantity) as No_of_Orders
from order_details od
join pizzas p join pizza_types pt
on od.pizza_id = p.pizza_id and p.pizza_type_id = pt.pizza_type_id
group by name order by no_of_orders desc limit 5;



#3. * Join the necessary tables to find the total quantity of each pizza category ordered

select row_number() over(order by sum(od.quantity) desc) as '', Category, sum(od.quantity) as No_of_Orders
from order_details od
join pizzas p join pizza_types pt
on od.pizza_id = p.pizza_id and p.pizza_type_id = pt.pizza_type_id
group by category order by no_of_orders desc;



#4. Join relevant tables to find the category-wise distribution of pizzas

select row_number() over(order by category) as '', Category, count(distinct name) as Count
from pizza_types
group by category;



#5.Group the orders by date and calculate the average number of pizzas ordered per day

create view pizzas_per_day as
select sum(quantity) as pizzas_per_day
from orders o
join order_details od
on o.order_id = od.order_id
group by date;

select round(avg(pizzas_per_day),2) as avg_per_day from pizzas_per_day;



#6.Calculate the percentage contribution of each pizza type to total revenue. Analyze the cumulative revenue generated over time


select * from order_details;
select * from orders;
select * from pizzas;
select * from pizza_types;

##Part 1

create view total_revenue as
select category, round(sum(price),2) as revenue
from order_details od
join pizzas p join pizza_types pt
on od.pizza_id = p.pizza_id and p.pizza_type_id = pt.pizza_type_id
group by category;

select row_number() over(order by category) as '',category, 
round(revenue/sum(revenue) over() * 100,2) as percent_contribution from total_revenue;


drop view total_revenue;

desc total_revenue;
select sum(revenue) from total_revenue;

#change acc to category
#not getting exact value


##Part 2

with total_revenue as
(
select date, round(sum(price),2) as revenue
from order_details od
join pizzas p join pizza_types pt join orders o
on od.pizza_id = p.pizza_id and p.pizza_type_id = pt.pizza_type_id and od.order_id = o.order_id
group by date
)
select row_number() over(order by date) as '', date, 
round(sum(revenue) over(order by date),2) as cumulative_revenue from total_revenue;

#not getting exact value

#7.Identify the most common pizza size ordered

select row_number() over(order by sum(quantity) desc) as '',
size, sum(quantity) as quantity_ordered
from order_details od
join pizzas p
on od.pizza_id = p.pizza_id
group by size order by quantity_ordered desc;   


#not getting exact values



#8. Identify the highest-priced pizza

select row_number() over(order by price desc) as '', 
Name, Price 
from pizza_types pt
join pizzas p
on pt.pizza_type_id = p.pizza_type_id
order by price desc limit 1;




#9.Calculate the total revenue generated from pizza sales

with revenue as
(
select order_id, sum(price * quantity) as revenue
from order_details od
join pizzas p
on od.pizza_id = p.pizza_id
group by order_id
)
select round(sum(revenue),2) as Total_Revenue from revenue;



#10. Determine the distribution of orders by hour of the day

select row_number() over(order by time) as '',
hour(time) as hour, count(order_id) as order_count
from orders
group by hour order by hour;





