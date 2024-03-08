--                                                   "TARGET CASE STUDY"


#Q1:  Import the dataset and do usual exploratory analysis steps like checking the structure & characteristics of the dataset:

#Q1.1: Data type of all columns in the "customers" table.
SELECT
  COLUMN_NAME, DATA_TYPE
FROM
  industrial-keep-408812.target_datas.INFORMATION_SCHEMA.COLUMNS
WHERE
  table_name = 'customers'

#Q1.2: Get the time range between which the orders were placed
SELECT
  MIN(order_purchase_timestamp) as first_order,
  max(order_purchase_timestamp) as last_order
from
  `industrial-keep-408812.target_datas.orders`


#Q1.3: Count the Cities & States of customers who ordered during the given period
SELECT
  COUNT(DISTINCT geolocation_city) as city_cnt,
  COUNT(DISTINCT geolocation_state) as state_cnt
FROM 
  `industrial-keep-408812.target_datas.geolocation`


#Q2:  In-depth Exploration:

#Q2.1: Is there a growing trend in the no. of orders placed over the past years?
SELECT
  EXTRACT(YEAR FROM order_purchase_timestamp) as year,
  count(order_id) as num_of_yr
from 
  `industrial-keep-408812.target_datas.orders`
group by
  year
order by
  year

#Q2.2: Can we see some kind of monthly seasonality in terms of the no. of orders being placed
SELECT
  month,
  count(order_id) as total_order
FROM
    (select
        *,
        EXTRACT(MONTH FROM order_purchase_timestamp) as month
      from `industrial-keep-408812.target_datas.orders`
    ) as n_t
group by month
order by total_order DESC

/*Q2.3:
During what time of the day,do the Brazilian customers mostly place their orders? 
(Dawn, Morning, Afternoon,Night)
*/

SELECT
  CASE WHEN EXTRACT(HOUR FROM order_purchase_timestamp) between 0 and 6 then "DRAW"
       WHEN EXTRACT(HOUR FROM order_purchase_timestamp) between 7 and 12 then "Morning"
       WHEN EXTRACT(HOUR FROM order_purchase_timestamp) between 13 and 18 then "Afternoon"
       else "Night"
  END AS order_time,
  count(order_id) as order_count
from 
  `industrial-keep-408812.target_datas.orders`
group by order_time
order by order_count desc

#Q3: Evolution of E-commerce orders in the Brazil region:

#Q3.1: Get the month on month no. of orders placed in each state.
SELECT 
  EXTRACT(month from o.order_purchase_timestamp) as order_month,
  c.customer_state, count(*) as num_of_order
FROM
  `target_datas.customers` as c inner join
  `target_datas.orders` as o 
  on c.customer_id = o.customer_id
group by 
  order_month,c.customer_state
order by 
  num_of_order DESC

#Q3.2: How are the customers distributed across all the states?

SELECT 
  customer_state,
  COUNT(DISTINCT customer_id) as total_cust
from 
  `target_datas.customers`
group by 
  customer_state
order by 
  total_cust desc

#Q4: Impact on Economy: Analyse the money movement by e-commerce by looking at order prices, freight and others:

/*
Q4.1: Get the % increase in the cost of orders from year 2017 to 2018 (include months between Jan to Aug only).
You can use the "payment_value" column in the payments table to get the cost of orders.
*/
SELECT
  ROUND((((total_cost_2018-total_cost_2017)/total_cost_2017)*100),2) 
  as pursentage_increase
FROM
  (SELECT
   sum(
       case when extract(year from o.order_purchase_timestamp)=2017
       and 
       extract(month from o.order_purchase_timestamp) between 1 and 8 
       then payment_value else 0 end
      ) as total_cost_2017,
   sum(
       case when extract(year from o.order_purchase_timestamp)=2018
       and 
       extract(month from o.order_purchase_timestamp) between 1 and 8 
       then payment_value else 0 end
      ) as total_cost_2018
   FROM
     `target_datas.orders` as o 
      inner join 
     `target_datas.payments` as p
      on o.order_id = p.order_id
   ) as T


#Q4.2: Calculate the Total & Average value of order price for each state:
SELECT
  c.customer_state,
  ROUND(sum(p.payment_value),2) as total_order_price,
  ROUND(avg(p.payment_value),2) as avg_order_price
FROM
  `target_datas.orders` as o 
  inner join 
  `target_datas.payments` as p
  on o.order_id = p.order_id
  inner join
  `target_datas.customers` as c
  on o.customer_id = c.customer_id
group by
  c.customer_state
order by
  total_order_price desc

#Q4.3: Calculate the Total & Average value of order freight for each state

SELECT
  c.customer_state,
  ROUND(sum(o_i.freight_value),2) as total_order_freight,
  ROUND(avg(o_i.freight_value),2) as avg_order_freight
FROM
  `target_datas.orders` as o 
  inner join 
  `target_datas.order_items` as o_i
  on o.order_id = o_i.order_id
  inner join
  `target_datas.customers` as c
  on o.customer_id = c.customer_id
group by
  c.customer_state
order by
  total_order_freight desc

#Q5: Analysis based on sales, freight and delivery time:

/* Q5.1:
Find the no. of days taken to deliver each order from the order’s purchase date as delivery time.
Also, calculate the difference (in days) between the estimated & actual delivery date of an order.
Do this in a single query.
You can calculate the delivery time and the difference between the estimated & actual delivery date using the given formula:
time_to_deliver = order_delivered_customer_date - order_purchase_timestamp
diff_estimated_delivery = order_delivered_customer_date - order_estimated_delivery_date
*/

SELECT
  order_id,
  DATE_DIFF(DATE(order_delivered_customer_date),
  DATE(order_purchase_timestamp),DAY) AS delivery_time,
  DATE_DIFF(DATE(order_delivered_customer_date),
  DATE(order_estimated_delivery_date),DAY) 
    AS diff_bwt_delivery_n_estimate
FROM
  `target_datas.orders`

#Q5.2.1: Find out the top 5 states with the highest average freight value

SELECT
  c.customer_state,
  ROUND(AVG(oi.freight_value),2) as highest_avg_freight_value
FROM
  `target_datas.orders` as o 
  join `target_datas.order_items` as oi
  on o.order_id=oi.order_id
  join `target_datas.customers` as c
  on o.customer_id = c.customer_id
group by
  c.customer_state
order by 
  highest_avg_freight_value desc
limit
  5

#Q5.2.2: Find out the top 5 states with the lowest average freight value

SELECT
  c.customer_state,
  ROUND(AVG(oi.freight_value),2) as lowest_avg_freight_value
FROM
  `target_datas.orders` as o 
  join `target_datas.order_items` as oi
  on o.order_id=oi.order_id
  join `target_datas.customers` as c
  on o.customer_id = c.customer_id
group by
  c.customer_state
order by 
  lowest_avg_freight_value 
limit
  5

#Q5.3.1: Find out the top 5 states with the highest average delivery time

SELECT
  c.customer_state,
  ROUND(AVG(t.delivery_time),2) as heighest_avg_delivery_time
FROM
  (
    SELECT
      *,
      DATE_DIFF(DATE(order_delivered_customer_date),
      DATE(order_purchase_timestamp),DAY) AS delivery_time
    FROM
      `target_datas.orders`
    WHERE
      order_status = "delivered" and
      order_delivered_customer_date is not null
    order by  
      order_purchase_timestamp
  ) as t
  JOIN
  `target_datas.customers` as c
  on t.customer_id=c.customer_id
group by
  c.customer_state
order by
  heighest_avg_delivery_time desc
limit
  5

#Q5.3.2: Find out the top 5 states with the highest average delivery time

SELECT
  c.customer_state,
  ROUND(AVG(t.delivery_time),2) as lowest_avg_delivery_time
FROM
  (
    SELECT
      *,
      DATE_DIFF(DATE(order_delivered_customer_date),
      DATE(order_purchase_timestamp),DAY) AS delivery_time
    FROM
      `target_datas.orders`
    WHERE
      order_status = "delivered" and
      order_delivered_customer_date is not null
    order by  
      order_purchase_timestamp
  ) as t
  JOIN
  `target_datas.customers` as c
  on t.customer_id=c.customer_id
group by
  c.customer_state
order by
  lowest_avg_delivery_time
limit
  5

/* Q5.4:
Find out the top 5 states where the order delivery is really fast as compared to the estimated date of delivery.
You can use the difference between the averages of actual & estimated delivery date to figure out how fast the delivery was for each state.
*/

SELECT
  customer_state,
  ROUND(avg_delivery_speed,2) as avg_delivery_speed
FROM
  (
    SELECT
      c.customer_state,
      avg(DATE_DIFF(o.order_delivered_customer_date,
      o.order_estimated_delivery_date,DAY)) as avg_delivery_speed
    from 
      `target_datas.orders` as o
      join `target_datas.customers` as c
      on o.customer_id = c.customer_id
    where
      o.order_delivered_customer_date is not null and
      o.order_estimated_delivery_date is not null
    group by
      c.customer_state
  ) AS T
ORDER BY 
  avg_delivery_speed
LIMIT 
  5

#Q6: Analysis based on the payments:

#Q6.1: Find the month on month no. of orders placed using different payment types

SELECT
  format_timestamp("%y-%m" , o.order_purchase_timestamp) as order_month,
  p.payment_type,count(*) num_of_order
FROM
  `target_datas.payments` as p
  join `target_datas.orders` as o 
  on p.order_id = o.order_id
group by
  order_month,payment_type
order by
  order_month,payment_type

#Q6.2: Find the no. of orders placed on the basis of the payment installments that have been paid

SELECT
  payment_installments,count(distinct order_id) as num_of_order
FROM
  `target_datas.payments`
group by 
  payment_installments
order by
  num_of_order desc



