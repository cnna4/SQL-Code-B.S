
/* March 25, 2020. Chapter 3 How to retrieve data using SQL
	select command. We will use database AP as an example.
    The basic syntax of the select statement is as follows:
    SELECT
    FROM
    WHERE
    ORDER BY
    LIMIT
*/

-- select AP database

use ap; 

-- 1. Display first 10 invoices in the invoice table

SELECT *
from invoices
limit 10;

-- 2. display invoice id, vendor id, and balance due for all invoices that have an outstanding payment. Order the 
--     result by vendor id

select invoice_id, vendor_id, (invoice_total-payment_total-credit_total) as balance_due
from invoices
where invoice_total-payment_total-credit_total>0
order by vendor_id;

-- 3. display vendor id, vendor name for vendors that did not make a payment before due date.
-- concat function
select distinct i.vendor_id, vendor_name
from invoices i
inner join vendors v on i.vendor_id=v.vendor_id
where invoice_due_date<payment_date;

-- 4 display vendor id, vendor name and vendor full address (address1, address2, city, state, and zip code)
select vendor_id, vendor_name, 
       concat(vendor_address1,' ', vendor_address2, ', ', vendor_city, ', ', vendor_state, ' ', vendor_zip_code) as address
from vendors;

select vendor_id, vendor_name, 
       concat(vendor_address1,', ', vendor_city, ', ', vendor_state, ' ', vendor_zip_code) as address
from vendors
where concat(vendor_address1,', ', vendor_city, ', ', vendor_state, ' ', vendor_zip_code) is not null;

-- 5. display invoice id, invoice date and display invoice date as mm/dd/yy and dd-Mon-yyyy
-- refer to page 277 of your textbook for coding date and time
select invoice_id, invoice_date, date_format(invoice_date, '%m/%d/%Y') as 'mm/dd/yy',
	   date_format(invoice_date, '%e-%b-%Y') as 'dd-Mon-yyyy'
from invoices;

-- 6. display invoice id, invoice date, invoice total for all invoice with invoice total greater than 500 and
--    invoice is due in May
select invoice_id, invoice_date, invoice_total
from invoices
where invoice_total>500 and month(invoice_date)=5;

-- 6a. display invoice id, invoice date and invoice total for all invoices with invoice total greater than 500 or
--    invoice is due in May, or June

select invoice_id, invoice_date, invoice_total
from invoices
where invoice_total>500 or month(invoice_date)=5 or month(invoice_date)=6;

select invoice_id, invoice_date, invoice_total
from invoices
where invoice_total>500 or month(invoice_date) in (5,6)
;

-- 7. display invoice id, invoice date and invoice total for all invoices that are due between April and June of 2018
select invoice_id, invoice_date, invoice_total
from invoices
where invoice_date between '2018-04-01' and '2018-06-30';

-- basic operators you can use: and, or, in, between, not

-- 8. display vendor id and vendor name for all vendors where vendor address include PO BOX.
-- we need to use pattern match operators: LIKE or REGEXP

select vendor_id, vendor_name, vendor_address1
from vendors
where vendor_address1 like '%PO BOX%'; 

select vendor_id, vendor_name, vendor_address1
from vendors
where vendor_address1 REGEXP 'PO BOX';

-- 9. display vendor id and vendor name for all vendors where vendor address starts with PO BOX.

select vendor_id, vendor_name, vendor_address1
from vendors
where vendor_address1 like 'PO BOX%'; 

select vendor_id, vendor_name, vendor_address1
from vendors
where vendor_address1 REGEXP '^PO BOX';

-- 10. display vendor id and vendor name for all vendors where vendor address starts with a house number.

select vendor_id, vendor_name, vendor_address1
from vendors
where vendor_address1 REGEXP '^[0-9]';


-- 10a. display vendor id and vendor name for all vendors where vendor address ends with a number.

select vendor_id, vendor_name, vendor_address1
from vendors
where vendor_address1 REGEXP '[0-9]$';

-- 10b. display vendor id, vendor name, vendor state for all vendors in either CA or DC state.

select vendor_id, vendor_name, vendor_state
from vendors
where vendor_state REGEXP 'CA|DC';

select vendor_id, vendor_name, vendor_state
from vendors
where vendor_state in ('CA', 'DC');

select vendor_id, vendor_name, vendor_state
from vendors
where vendor_state='CA' or vendor_state='DC'



