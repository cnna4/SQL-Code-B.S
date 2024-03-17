
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




-- 1. Display first top 10 invoices in the invoice table



-- 2. display invoice id, vendor id, and balance due for all invoices that have an outstanding payment. Order the 
--     result by vendor id



-- 3. display vendor id, vendor name for vendors that did not make a payment before due date.
-- concat function



-- 4 display vendor id, vendor name and vendor full address (address1, address2, city, state, and zip code)



-- 5. display invoice id, invoice date and display invoice date as mm/dd/yy and dd-Mon-yyyy
-- refer to page 277 of your textbook for coding date and time




-- 6. display invoice id, invoice date, invoice total for all invoice with invoice total greater than 500 and
--    invoice is due in May




-- 6a. display invoice id, invoice date and invoice total for all invoices with invoice total greater than 500 or
--    invoice is due in May, or June



-- 7. display invoice id, invoice date and invoice total for all invoices that are due between April and June of 2018




-- 8. display vendor id and vendor name for all vendors where vendor address include PO BOX.
-- we need to use pattern match operators: LIKE or REGEXP





-- 9. display vendor id and vendor name for all vendors where vendor address starts with PO BOX.





-- 10. display vendor id and vendor name for all vendors where vendor address starts with a house number.






-- 10a. display vendor id and vendor name for all vendors where vendor address ends with a number.





-- 10b. display vendor id, vendor name, vendor state for all vendors in either CA or DC state.




