/*  You need to complet the following steps so that you can load a csv file into a table directly.
Step 1:	Start mysql workbench, create an adventure_copy database (you do not want to overwrite your adventure database)
Step 2:  copy all data files (guide, customer, reservation, trip, and tripguide) into C:\ProgramData\MySQL\MySQL Server 8.0\Data\adventure_copy
         adventure_copy is the folder where all data related to this database is stored
Step 3: go to C:\ProgramData\MySQL\MySQL Server 8.0, open my.ini configuration file, search for secure-file-priv, set it to secure-file-priv=""
		It is very important that you use notepad ++ (NOT notepad) to edit my.ini file.  Editing with notepad will put additional characters in your file
		you will not be able to start your MySQL server. 
Note: if you cannot find ProgramData folder, it may be hidden. Your can go to search box and type "show hidden files and folders", and enable this option. 
Step 4: run this script file
*/

-- CREATE DATABASE IF NOT EXISTS ADVENTURE_COPY;


USE ADVENTURE_COPY;

DROP Table if exists Reservation;
DROP Table if exists tripGuides;
DROP Table if exists Guide;
DROP Table if exists trip;
DROP Table if exists Customer;

CREATE TABLE Guide
(GuideNum CHAR(4) PRIMARY KEY,
LastName CHAR(15),
FirstName CHAR(15),
Address CHAR(25),
City CHAR(25),
State CHAR(2),
PostalCode CHAR(5),
PhoneNum CHAR(12),
HireDate DATE );

LOAD DATA INFILE 'Guide.csv'
INTO TABLE Guide 
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES;  -- skip the first line since it is header row

DROP Table if exists trip;
CREATE TABLE Trip
(TripID DECIMAL(3,0) PRIMARY KEY,
TripName CHAR(75),
StartLocation CHAR(50),
State CHAR(2),
Distance DECIMAL(4,0),
MaxGrpSize DECIMAL(4,0),
Type CHAR(20),
Season CHAR(20) );

LOAD DATA INFILE 'trip.csv'
INTO TABLE trip 
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

DROP Table if exists tripGuides;
CREATE TABLE TripGuides
(TripID DECIMAL(3,0),
GuideNum CHAR(4),
PRIMARY KEY (TripID, GuideNum),
CONSTRAINT tripguide_fk_trip
    FOREIGN KEY (tripID)
    REFERENCES trip (TripID),
CONSTRAINT tripGuide_fk_guide
    FOREIGN KEY (guideNum)
    REFERENCES guide (GuideNum));

LOAD DATA INFILE 'tripguide.csv'
INTO TABLE tripguides 
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

DROP Table if exists Customer;
CREATE TABLE Customer
(CustomerNum CHAR(4) PRIMARY KEY,
LastName CHAR(30) NOT NULL,
FirstName CHAR (30),
Address CHAR(35),
City CHAR(35),
State CHAR(2),
PostalCode CHAR(5),
Phone CHAR(12) );

LOAD DATA INFILE 'customer.csv'
INTO TABLE customer 
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

DROP Table if exists Reservation;
CREATE TABLE Reservation
(ReservationID CHAR(7) PRIMARY KEY,
TripID DECIMAL(3,0),
TripDate DATE,
NumPersons DECIMAL(3,0),
TripPrice DECIMAL(6,2),
OtherFees DECIMAL(6,2),
CustomerNum CHAR(4),
CONSTRAINT reservation_fk_trip
    FOREIGN KEY (tripID)
    REFERENCES trip (TripID),
CONSTRAINT reservation_fk_customer
    FOREIGN KEY (CustomerNum)
    REFERENCES customer (CustomerNum) );

LOAD DATA INFILE 'Reservation.csv'
INTO TABLE Reservation 
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES;