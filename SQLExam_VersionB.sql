/*ISA341 Fall 2020 SQL Exam (100 points)

If your last name starts with M-Z, please use this version, version B

The ISA Department at Tiny College maintains the Free Access to Current Technology (FACT) library of e-books. 
FACT is a collection of current technology e-books for use by faculty and students. Agreements with the publishers 
allow patrons to electronically check out a book, which gives them exclusive access to the book online through the FACT website, 
but only one patron at a time can have access to a book. A book must have at least one author but can have many. 
An author must have written at least one book to be included in the system but may have written many books. 
A book may have never been checked out but can be checked out many times by the same patron or different patrons over time. 
Because all faculty and staff in the department are given accounts at the online library, a patron may have never checked out a book
or they may have checked out many books over time. To simplify determining which patron currently has a given book checked out, 
a redundant relationship between BOOK and PATRON is maintained. The ERD for this system is shown in attached Fact_ERD 
and should be used to answer the queries in this exam.

This exam is open book and open notes. Please write the query to answer the following ten questions. 
For each query, please copy the first five rows of your result at the end of each query. 
Please do not leave any question blank. You may receive partial credits for trying.

After done, please submit completed script file to the course Blackboard.

Please download CreateFactDatabase_VersionB.sql from Blackboard, import it into MySQL, execute the script and create FACT_B database.

Below is an example:
*/
use FACT_B;

select book_num, book_title, book_year, book_cost
from book
order by book_year;

/* partial result
	5235	Beginner's Guide to JAVA	2014	59.99
	5236	Database in the Cloud	2014	79.99
	5237	Mastering the database environment	2015	89.99
	5238	Conceptual Programming	2015	59.99
	5239	J++ in Mobile Apps	2015	49.99
*/

/* query 1. Displays the book title, year of publication, and cost for every book with the cost below $50.
			   Sort the results by book title. */
Select BOOK_TITLE, BOOK_YEAR, BOOK_COST 
From book 
where BOOK_COST <50
order by BOOK_TITLE;

/*Coding Style for Maintenance	2017	49.99
J++ in Mobile Apps	2015	49.99
JAVA First Steps	2015	49.99
What You Always Wanted to Know About Database, But Were Afraid to Ask	2016	49.99
*/

    
/* query 2. Displays the book title, year of publication, and cost for all books 
   related to Java (hint: book title needs to include Java) and was published before year 2015. 
   Order by book title. */
   
   Select BOOK_TITLE, BOOK_YEAR, BOOK_COST
   from book
   where BOOK_YEAR < 2015 and Book_TITLE regexp 'JAVA'
   order by BOOK_Title;
   
   /*Beginner's Guide to JAVA	2014	59.99*/





/* query 3. Display every book written in subject “Programming”. 
            Display Book Number, Book Title, book cost and Author’ name.
            Order by book cost with the highest cost first */
            
             Select BOOK_TITLE, BOOK_YEAR, BOOK_COST, BOOK_SUBJECT, 
				concat (a.Au_FName, ' ', a.Au_LName) as Author_Name
			from book b
            Inner Join writes w on w.BOOK_NUM = b.BOOK_NUM
            inner join author a on w.AU_ID = a.AU_ID
			where Book_Subject = 'Programming'
            order by book_cost desc;

/*Shining Through the Cloud: Sun Programming	2016	109.99	Programming	Robert Lake
iOS Programming	2015	79.99	Programming	Rachel Beatney
Virtual Programming for Virtual Environments	2016	79.99	Programming	Art Smith
Beginner's Guide to JAVA	2014	59.99	Programming	Reba Durante
Thoughts on Revitalizing Ruby	2016	59.99	Programming	Connie Paulsen
*/

/* query 4. For all books in the system, display highest cost, lowest cost, and average cost of all books. */

Select max(Book_Cost), min(Book_Cost), avg(Book_cost)
from book;

/*129.99	49.99	74.981000*/


/* query 5. Display number of books by year and by subject. 
            Order by year first and then number of books in descending order. */
            
SELECT BOOK_YEAR, BOOK_SUBJECT, COUNT(BOOK_NUM) as count
from book 
order by BOOK_YEAR desc, BOOK_SUBJECT;


-- 2014	Programming	20




/* query 6. Display number of books checked out by week day and by subject. 
            Display week day, subject, and number of books checked out. 
            Order by subject and week day. */
	
     Select count(Check_Num) as Books_Checked_Out, DAYNAME(Check_Out_Date), b.Book_Subject
	 from Checkout c
     inner join Book b on b.Book_Num = c.Book_Num
     group by DAYNAME(Check_Out_Date)
     order by Book_Subject, DAYNAME(Check_Out_Date);

/*3	Thursday	Cloud
5	Tuesday	Cloud
18	Friday	Programming
10	Monday	Programming
6	Saturday	Programming
*/     
     
     
            



/* query 7. Display the patron ID, and name of all patrons who have never checked out any book. 
           Sort the result by patron’s name. */
	
  Select p.PAT_ID, CONCAT(p.Pat_Fname, ' ', p.Pat_Lname) as FullName
   from patron p
   left join checkout c on p.PAT_ID = c.PAT_ID
   where c.PAT_ID is null
   order by FullName;

/*1167	Alan Martin
1227	Alicia Dickson
1237	Brandi Larson
1205	Claire Gomez
1239	Elton Irwin
*/


/* query 8. Display the book number, title, and number of times each book has been checked out. 
           Limit the results to books that have been checked out more than five times. 
           Sort the results in descending order by the number of times checked out and then by book title. */
   Select b.BOOK_NUM, b.BOOK_TITLE, COUNT(c.CHECK_NUM) as Count
   from book b
   inner join checkout c on b.BooK_NUM = c.BooK_NUM
   group BY b.BooK_NUM, b.BooK_Title
   having count>5
   order by count, b.book_title;

/*5238	Conceptual Programming	6
5240	iOS Programming	7
5235	Beginner's Guide to JAVA	9
5236	Database in the Cloud	12
*/


/* query 9. Display the book number, title, subject, and cost for all books 
            that the cost of the book is less than average cost of all books for that subject
            sort by book subject*/
            
  SELECT b.BOOK_NUM, b.BOOK_TITLE, b.BOOK_SUBJECT, b.BOOK_COST
   from book b
   inner join (select b.BooK_Subject, Avg(b.BOOK_COST) as AvergeCost
   from book b
   group BY b.BooK_Subject) t on b.BooK_Subject=t.BooK_Subject
   where b.BooK_Cost<t.AvergeCost
   order by b.BooK_Subject;

/*5235	Beginner's Guide to JAVA	Programming	59.99
5252	Beyond the Database Veil	Database	69.99
5242	C# in Middleware Deployment	Middleware	59.99
5246	Capture the Cloud	Cloud	69.99
5244	Cloud-based Mobile Applications	Cloud	69.99
*/
         



/* query 10. Find top author in each book subejct based on number of books written by each author.
             Display author's name, subject, and number of books written.
             order by book subject. */
             
Select count(b.BOOK_NUM) as Number_Of_Books_Written, BOOK_YEAR, BOOK_COST, BOOK_SUBJECT, 
				concat (a.Au_FName, ' ', a.Au_LName) as Author_Name
			from book b
            Inner Join writes w on w.BOOK_NUM = b.BOOK_NUM
            inner join author a on w.AU_ID = a.AU_ID
			group by book_Subject desc
            order by Book_Subject 