# E-Commerce Order Analysis
## **Welcome to the Target SQL project**
![image](https://github.com/Arundhamjena/SQL_case_study/assets/153628729/65ea7aac-ce7c-45d3-a89c-36cfe0bcc411)

 ***
#### 	This Repo serves as a business case study. Providing Solution, Insights and Recommendation for the growth in their Revenue through SQL queries.
🔷	This SQL solutions done in Google "[BigQuery](https://console.cloud.google.com/bigquery?project=industrial-keep-408812&ws=!1m0)"
                                                                                                                                                                                                 
🔷	As a data scientist at Target, you've been given the exciting opportunity to analyse 100000 orders from 2016 to 2018 made at Target in Brazil. 

🔷	The dataset is available in 8 csv files:                                                                                                                                                        
  
 1. customers.csv 
 2. geolocation.csv 
 3. order_items.csv 
 4. payments.csv 
 5. reviews.csv 
 6. orders.csv 
 7. products.csv 
 8. sellers.csv 
        
🔷	So, what does 'good' look like? We'll import the dataset and perform exploratory analysis steps to check the structure, characteristics, data types, and time period for which the data is given. We'll also look at the cities and states of customers who ordered during the given period.

🔷 In-depth Exploration:

    1.	Is there a growing trend in the no. of orders placed over the past years?
    2.	Can we see some kind of monthly seasonality in terms of the no. of orders being placed?
    3.	During what time of the day, do the Brazilian customers mostly place their orders? (Dawn, Morning, Afternoon or Night)
            -	0-6 hrs : Dawn
            -	7-12 hrs : Mornings
            -	13-18 hrs : Afternoon
            -	19-23 hrs : Night

🔷	Evolution of E-commerce orders in the Brazil region:

    1.	Get the month on month no. of orders placed in each state.
    2.	How are the customers distributed across all the states?

🔷	Impact on Economy: Analyze the money movement by e-commerce by looking at order prices, freight and others.

    1.	Get the % increase in the cost of orders from year 2017 to 2018 (include months between Jan to Aug only).
        You can use the "payment_value" column in the payments table to get the cost of orders.
    2.	Calculate the Total & Average value of order price for each state.
    3.	Calculate the Total & Average value of order freight for each state.

🔷	Analysis based on sales, freight and delivery time.

    1.	Find the no. of days taken to deliver each order from the order’s purchase date as delivery time.
        Also, calculate the difference (in days) between the estimated & actual delivery date of an order.
        Do this in a single query.
        You can calculate the delivery time and the difference between the estimated & actual delivery date using the given formula:
            -	time_to_deliver = order_delivered_customer_date - order_purchase_timestamp
            -	diff_estimated_delivery = order_delivered_customer_date - order_estimated_delivery_date
    2.	Find out the top 5 states with the highest & lowest average freight value.
    3.	Find out the top 5 states with the highest & lowest average delivery time.
    4.	Find out the top 5 states where the order delivery is really fast as compared to the estimated date of delivery.
        You can use the difference between the averages of actual & estimated delivery date to figure out how fast the delivery was for each state.

🔷	Analysis based on the payments:

    1.	Find the month on month no. of orders placed using different payment types.
    2.	Find the no. of orders placed on the basis of the payment installments that have been paid.
***



### If you have any questions, reach out to me  on [LinkedIn](www.linkedin.com/in/arundham-jena-59aa20143)


