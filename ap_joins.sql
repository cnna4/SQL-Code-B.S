/* this exercise focuses on retrieving data from two or more tables.
there are three types of joins in MySQL: inner join, left join and right join.
you may also use union command. 

Basic innner join syntax

SELECT select_list
FROM table_1
    [INNER] JOIN table_2
        ON join_condition_1
   [[INNER] JOIN table_3
        ON join_condition_2]...  */

-- select AP database

use ap;

-- 1. display vendor_id, vendor_name, invoice_id, invoice_date, invoice_total, invoice_due_date. Order by vendor_id.






-- 2. display vendor_id, vendor_name, invoice_id, invoice_date, invoice_total, invoice_due_date, payment_date, terms_description. 
--    Order by vendor_id.


-- for inner join, inner can be skipped.



-- 3. Find all vendors living at the same city and state. Display vendor_ID, vendor_name, city, and state.
--    order by state and city



-- 4. display employee_id, employee name, and manager of each employee. (need to use ex database)



-- 4a. display employee_id, employee name, department_name and manager of each employee. (need to use ex database)




-- 5. Find all vendor who do not have any invoices. Display vendor_id, vendor_name.




-- 5a. Find all invoices that do not have a matching vendor in the vendor table. 
--     Display invoice_id, vendor_id, invoice_date, and invoice_total (bad data).



-- 6. what is the result of executing the following query?

select v.vendor_id, vendor_name, invoice_number, invoice_date, invoice_total
from vendors v, invoices i;


-- 7. display type, invoice_number, invoice_date, and invoice_total. Type is paid if balance is paid off. Otherwise it is active.



-- In class exercises (based on ex database)
-- 1. Find the departments that have not been assigned to any employee. Disply department_number, department_name.




-- 2. find the employees that have not been assigned to any department. Display employee_id, and name



 
-- 3. find the employee that have been assigned to a non-existing department (bad data)





-- 4. classify invoice into three category based on invoice total, if total is greater than 10000, then large invoice;
--    if total is between 500 and 10000, then medium invoice, otherwise, small invoice.
--    display category, invoice_number, invoice_date and invoice_total (hint: use union)



