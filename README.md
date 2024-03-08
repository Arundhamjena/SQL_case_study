# SQL_case_study

![image](https://github.com/Arundhamjena/SQL_case_study/assets/153628729/65ea7aac-ce7c-45d3-a89c-36cfe0bcc411)
 
🔷	This Repo serves as a business case study. Providing Solution, Insights and Recommendation for the growth in their Revenue through SQL queries.
🔷	This SQL solutions done in Google "BigQuery"
                                                                                                                                                                                                                                                                    **	Welcome to the Target Data Analysis project! **
                                                                                                                                                                                                                                                                    
🔷	As a data scientist at Target, you've been given the exciting opportunity to analyse 100000 orders from 2016 to 2018 made at Target in Brazil. 
🔷	The dataset is available in 8 csv files:                                                                                                                                                        
        •	customers.csv 
        •	geolocation.csv 
        •	order_items.csv 
        •	payments.csv 
        •	reviews.csv 
        •	orders.csv 
        •	products.csv 
        •	sellers.csv 
        
🔷	So, what does 'good' look like? We'll import the dataset and perform exploratory analysis steps to check the structure, characteristics, data types, and time period for which the data is given. We'll also look at the cities and states of customers who ordered during the given period.

🔷 In-depth Exploration:
    ->	Is there a growing trend in the no. of orders placed over the past years?
    ->	Can we see some kind of monthly seasonality in terms of the no. of orders being placed?
    ->	During what time of the day, do the Brazilian customers mostly place their orders? (Dawn, Morning, Afternoon or Night)
            o	0-6 hrs : Dawn
            o	7-12 hrs : Mornings
            o	13-18 hrs : Afternoon
            o	19-23 hrs : Night

🔷	Evolution of E-commerce orders in the Brazil region:
    ->	Get the month on month no. of orders placed in each state.
    ->	How are the customers distributed across all the states?

🔷	Impact on Economy: Analyze the money movement by e-commerce by looking at order prices, freight and others.
    ->	Get the % increase in the cost of orders from year 2017 to 2018 (include months between Jan to Aug only).
        You can use the "payment_value" column in the payments table to get the cost of orders.
    ->	Calculate the Total & Average value of order price for each state.
    ->	Calculate the Total & Average value of order freight for each state.

🔷	Analysis based on sales, freight and delivery time.
    ->	Find the no. of days taken to deliver each order from the order’s purchase date as delivery time.
        Also, calculate the difference (in days) between the estimated & actual delivery date of an order.
        Do this in a single query.
        You can calculate the delivery time and the difference between the estimated & actual delivery date using the given formula:
            o	time_to_deliver = order_delivered_customer_date - order_purchase_timestamp
            o	diff_estimated_delivery = order_delivered_customer_date - order_estimated_delivery_date
    ->	Find out the top 5 states with the highest & lowest average freight value.
    ->	Find out the top 5 states with the highest & lowest average delivery time.
    ->	Find out the top 5 states where the order delivery is really fast as compared to the estimated date of delivery.
        You can use the difference between the averages of actual & estimated delivery date to figure out how fast the delivery was for each state.

🔷	Analysis based on the payments:
    ->	Find the month on month no. of orders placed using different payment types.
    ->	Find the no. of orders placed on the basis of the payment installments that have been paid.


---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


**Give a ⭐️ if you like this project!**


