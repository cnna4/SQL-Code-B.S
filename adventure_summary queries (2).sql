/* SQL Assignment 4: SQL summary/aggregate functions
   Due Date: Tuesday 11/10 at midnight
   Please submit the completed SQL script file and a spreadsheet showing the result of each SQL query */

--  example: List total sales, total number of trips, average sales, highest sales  and lowest sales of all trips.
use adventure;

Select sum(tripprice*numPersons+OtherFees) as total_sales, 
        count(reservationID) as number_of_trips,
	    round(avg(tripprice*numPersons+OtherFees)) average_sales,
        max(tripprice*numPersons+OtherFees) as highest_sales, 
        min(tripprice*numPersons+OtherFees) as Lowest_sales
from reservation;

-- Query 1. Which state has the most guides? Display state and number of guides.




/* Query 2. List the customers with at least 2 reservation. 
           Display customer name, and number of reservation. 
           Order by customer with highest number of reservation first */




/* query 3. List all customers who have made at least 2 reservations and live at MA state.
			Display customer name, and number of reservation. 
            Order by customer name. */




/* query 4. Which guide(s) give the most trips in each season?
            display season, guide's name, and number of trips. */





/*	Query 5. What days of the week are the most trips booked for? 
    Display week day and number of trips. display week day as name of each week day such as Monday etc. */





/* query 5a challenge question (this is extra credit question. you do not need to do it). 
   Can you order the week day in logical order from Monday to Sunday. */





/* query 6. List top 5 guides based on number of trips. List guide’ name and number of trips led by each guide.
			order by number of trips with the highest value first. */





/* query 7. List guides who have led at least 4 trips. Display guide’ name and number of trips. */






/* query 8. List number of trips, total sales by season and by type.
			Display season, type, number of trips and total sales. Order by season and then by type */





/* query 9.	What trip types are the most popular (based on number of trips) among customers from both MA and RI states? */





/* query 10. for each state a customer is in, display monthly sales, and 3 month moving average sales.
   Display state, month, total sales of each month and 3 month moving average sales.
   order by state and then month.
*/




/* Below is part of results for query 10.

CT	8	325.00	357.50
CT	9	390.00	265.00
CT	10	80.00	235.00
MA	5	75.00	182.50
MA	6	290.00	255.00
MA	7	400.00	345.00
MA	9	75.00	135.00
MA	10	195.00	135.00

*/