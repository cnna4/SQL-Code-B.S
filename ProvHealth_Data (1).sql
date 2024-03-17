USE providencehealth;

INSERT INTO Insurance
VALUES
(1600001,'Preferred Provider Organization (PPO)'),
(1600002,'Health Maintenance Organization (HMO)'),
(1600003,'Point of Service (POS)'),
(1600004,'Exclusive Provider Organization (EPOs)'),
(1600005,'Indemnity Health'),
(1600006,'Health Savings Account (HSA)'),
(1600007,'Health Reimbursement Arrangements (HRA)');

INSERT INTO Facility
VALUES
(101,'PCHC Administrative Office','9 a.m. to 4 p.m','Nursing Home','375 Allens Ave.','Providence','RI', '02905'),
(102,'PCHC Capitol Hill','9 a.m. to 4 p.m','Doctors Office','40 Candace St,','Providence','RI','02908'),
(103,'PCHC Central','9 a.m. to 4 p.m','Urgent Care Clinic.','239 Cranston St.','Providence','RI','02907'),
(104,'PCHC Chafee','9 a.m. to 4 p.m','Urgent Care Clinic','One Warren Way','Providence','RI','02905'),
(105,'PCHC Crossroads','9 a.m. to 4 p.m','Doctors Office','160 Broad Street','Providence','RI','02903'),
(106,'PCHC Dental','9 a.m. to 4 p.m','Urgent Care Clinic.', '335 R Prairie Avenue','Providence','RI','02905'),
(107,'PCHC Met School Clinic','9 a.m. to 4 p.m','Urgent Care Clinic.','325 Public St.','Providence','RI','02905'),
(108,'PCHC North Main','9 a.m. to 4 p.m','Urgent Care Clinic.','530 North Main Street','Providence','RI','02904');

INSERT INTO GeoLocation
VALUES
(01, 44.96,-94.42),
(02, 44.33,-89.13),
(03, 33.75,-97.35),
(04, 33.84,-97.54),
(05, 44.92,-93.44),
(06, 44.24,-91.49),
(07, 44.96,-94.41),
(08, 44.33,-89.13),
(09, 33.75,-97.36);

INSERT INTO Title
VALUES
(01,'Registered Nurse (RN) Emergency Room', 31.00),
(02,'Staff Nurse', 32.00),
(03, 'Doctor', 70.00),
(04,'Doctor assistant', 44.00),
(05,'Patient Care Technician', 14.00),
(06,'Pharmacy Technician',16.00),
(07,'Administrative Assistant',18.00),
(08,'Patient Care Assistant (PCA)',14.00),
(09,'Primary Care Registered Nurse (RN)',31.00),
(10,'Pharmacist',56.00),
(11,'Unit Secretary',14.00);

INSERT INTO patient
VALUES
(01,'John', 'Smith','M', STR_TO_DATE('09/15/1984', '%m/%d/%Y'),'54 Walnut Road', 'Cumberland', 'RI', '02864', 02, 1600002),
(02,'Dean','Scott','M', STR_TO_DATE('10/05/1949','%m/%d/%Y'),'345 Walker Path', 'Smithfield', 'RI', '02896',05, 1600006),
(03,'Thomas','Morgan','M', STR_TO_DATE('02/28/2000','%m/%d/%Y'),'33 Forest Way', 'Bristol', 'RI' ,'02809',04, 1600007),
(04,'Layna','Roy','F',STR_TO_DATE('02/07/1978','%m/%d/%Y'),'12 Maple Avenue', 'Woonsocket', 'RI', '02895', 02, 1600002),
(05,'Singh','Arjun','F', STR_TO_DATE('05/16/1968','%m/%d/%Y'),'675 Kelsey Drive', 'Warren', 'RI','02885' ,01, 1600004),
(06,'Janet','Dante','F',STR_TO_DATE('10/03/1956', '%m/%d/%Y'),'37 Northview Apartments', 'North Providence', 'RI', '02904' ,02, 1600003),
(07,'Samuel','Asante','M',STR_TO_DATE('11/26/2003','%m/%d/%Y'),'41 Ocean View Road', 'Newport', 'RI', '02840',03, 1600002),
(08,'Veneta','Amanda','F',STR_TO_DATE('03/30/2001','%m/%d/%Y'),'96 Pleasant Valley Road', 'Warwick', 'RI', '02888',03, 1600005),
(09,'Adam','Samuel','M',STR_TO_DATE('07/12/1972','%m/%d/%Y'),'8 Kennedy Lane', 'Narragansett', 'RI', '02874', 07, 1600006),
(10,'Salley','Hayden','F',STR_TO_DATE('08/07/1991','%m/%d/%Y'),'85 Crimson Place', 'Coventry', 'RI', '02816', 08, 1600001);

INSERT INTO Staff
VALUES
(01, 'Becky', 'Cruz',STR_TO_DATE('07/23/1989','%m/%d/%Y'),STR_TO_DATE('09/22/2010','%m/%d/%Y'),'43 Nutmeg Drive', 'Smithfield', 'RI', '02919', 01),
(02, 'Lawrence', 'McGill',STR_TO_DATE('07/23/1991','%m/%d/%Y'),STR_TO_DATE('01/17/2018','%m/%d/%Y'),'56 Elkwood Lane', 'Coventry', 'RI', '02816', 02),
(03, 'Steve', 'Wester',STR_TO_DATE('07/23/1953','%m/%d/%Y'),STR_TO_DATE('06/20/1989','%m/%d/%Y'),'343 Stonehill Drive', 'Kingston', 'RI', '02852', 04),
(04, 'Amanda', 'Flint',STR_TO_DATE('07/23/1967','%m/%d/%Y'),STR_TO_DATE('02/09/2019','%m/%d/%Y'),'53 Paul Revere Lane', 'Cumberland', 'RI', '02421', 08),
(05, 'Grace', 'Birch',STR_TO_DATE('07/23/1956','%m/%d/%Y'),STR_TO_DATE('05/23/1999','%m/%d/%Y'),'76 Tyson Drive', 'Warwick', 'RI', '02889', 11),
(06, 'Greg', 'Francis',STR_TO_DATE('07/23/1987','%m/%d/%Y'),STR_TO_DATE('07/07/2006','%m/%d/%Y'),'90 Harrison Alley', 'Pawtucket', 'RI', '02860',10),
(07, 'Aziz', 'Hassan',STR_TO_DATE('07/23/1982','%m/%d/%Y'),STR_TO_DATE('04/01/2003','%m/%d/%Y'),'12 Emerald Road', 'Johnston', 'RI', '02919', 06),
(08, 'Taylor', 'Walker',STR_TO_DATE('07/23/1978','%m/%d/%Y'),STR_TO_DATE('01/31/2020','%m/%d/%Y'),'39 Lime Lane', 'Scituate', 'RI', '02857', 09),
(09, 'Angie', 'Opal',STR_TO_DATE('07/23/1976','%m/%d/%Y'),STR_TO_DATE('08/19/1999','%m/%d/%Y'),'31 Atlantic Way', 'Cranston', 'RI', '02907', 07),
(10, 'Flynn', 'Thomas',STR_TO_DATE('07/23/1990','%m/%d/%Y'),STR_TO_DATE('07/25/2013','%m/%d/%Y'),'82 St.Patricks Lane', 'Exeter', 'RI', '02822', 03);


INSERT INTO Appointment
VALUES
(01, STR_TO_DATE('09/22/20','%m/%d/%Y'),'Coughing','Positive','Respiratory Solution', 01, 07, 107),
(02, STR_TO_DATE('05/06/20','%m/%d/%Y'),'N/A','Positive','Isolation', 02, 03, 101),
(03, STR_TO_DATE('10/15/20','%m/%d/%Y'),'N/A','Negative','N/A', 03, 05, 103),
(04, STR_TO_DATE('06/24/20','%m/%d/%Y'),'Loss of Taste','Positive','Isolation', 04, 06, 102),
(05, STR_TO_DATE('08/18/20','%m/%d/%Y'),'N/A','Positive','Isolation', 05, 07, 105),
(06, STR_TO_DATE('07/04/20','%m/%d/%Y'),'Fever','Positive','Medication',06, 10, 106),
(07, STR_TO_DATE('06/10/20','%m/%d/%Y'),'Coughing','Positive','Respiratory Solution', 07, 02, 102),
(08, STR_TO_DATE('11/03/20','%m/%d/%Y'),'N/A','Negative','N/A', 07, 01, 106),
(09, STR_TO_DATE('05/04/20','%m/%d/%Y'),'Fatigue','Positive','I/V', 08, 03, 107),
(10, STR_TO_DATE('08/06/20','%m/%d/%Y'),'N/A','Positive','Isolation', 09, 06, 101)
