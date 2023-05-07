-- ------------------------Exercise 1------------------

-- Create the database hospital

CREATE DATABASE hospital;



-- Create the doctor table

CREATE TABLE doctor(
doctor_id INT PRIMARY KEY,
doctor_name VARCHAR(40) NOT NULL,
doctor_specialization VARCHAR(20) NOT NULL,
doctor_age INT NOT NULL,
doctor_joining_date DATE NOT NULL
);



-- Inserting the data into the doctor table

INSERT INTO doctor VALUES(100, 'E.VINAY KUMAR', 'Cardiologist', 32, '2010-02-11');

INSERT INTO doctor VALUES(102, 'B.YASWANTH KUMAR', 'Anesthesiologists', 28, '2019-12-26');

INSERT INTO doctor VALUES(101, 'K.SURESH', 'Pathologist', 30, '2017-08-16');

INSERT INTO doctor VALUES(103, 'S.SUDHARSAN', 'Critical Car', 26, '2020-07-13');

INSERT INTO doctor VALUES(104, 'P.DILEEP', 'General Physican', 37, '2007-12-25');



-- Retrieve the data of doctor table

SELECT * FROM doctor;



-- Create the patient table

CREATE TABLE patient(
patient_id INT PRIMARY KEY,
patient_name VARCHAR(40) NOT NULL,
patient_age INT NOT NULL,
patient_address VARCHAR(50) NOT NULL
);



-- Insert the data into the patient table

INSERT INTO patient VALUES(500, 'venu', 40, 'Kadapa');

INSERT INTO patient VALUES(501, 'vamsi', 32, 'Kurnool');

INSERT INTO patient VALUES(502, 'siva', 35, 'Nandyal');

INSERT INTO patient VALUES(504, 'satya', 39, 'Hyderabad');

INSERT INTO patient VALUES(503, 'uday', 42, 'Hyderabad');

-- Retrieve the data of the patient table

SELECT * FROM patient;



-- Create the table appointments
CREATE TABLE appointments(
appointment_id INT PRIMARY KEY,
doctor_id INT NOT NULL,
patient_id INT NOT NULL,
appointment_date DATE NOT NULL,
FOREIGN KEY(doctor_id) REFERENCES doctor(doctor_id),
FOREIGN KEY(patient_id) REFERENCES patient(patient_id)
);

-- Insert the data into the appontments table

INSERT INTO appointments VALUES(200,101, 503, '2023-05-10'); 

INSERT INTO appointments VALUES(201,101, 500, '2023-05-09');

INSERT INTO appointments VALUES(203,102, 501, '2023-05-10');

INSERT INTO appointments VALUES(204,100, 502, '2023-05-10');

INSERT INTO appointments VALUES(202,104, 504, '2023-05-08');

-- Retrieve the data of appointments table

SELECT * FROM appointments;

-- Create the reviews table

CREATE TABLE reviews(
patient_id INT,
patient_review VARCHAR(40) NOT NULL,
FOREIGN KEY(patient_id) REFERENCES appointments(patient_id)
);

-- Insert the data into the reviews table

INSERT INTO reviews VALUES(501, 'Doctor is not interacting properly');

INSERT INTO reviews VALUES(500, 'Doctor is good');

INSERT INTO reviews VALUES(504, 'Doctor is having patienece');

INSERT INTO reviews VALUES(503, 'Doctor is interactive');

INSERT INTO reviews VALUES(502, 'Doctor is calm');

-- Reteieve the data into the reviews table

SELECT * FROM reviews;


-- ------------------------Exercise 2------------------

CREATE TABLE contact(
id INT PRIMARY KEY,
email VARCHAR(40) NOT NULL,
fname VARCHAR(35) NOT NULL,
lname VARCHAR(35) NOT NULL,
company VARCHAR(30) NOT NULL,
active_flag INT NOT NULL,
opt_out INT NOT NULL
);

INSERT INTO contact VALUES(123, 'a@a.com', 'Kian', 'Seth', 'ABC', 1, 1);

INSERT INTO contact VALUES(133, 'b@a.com', 'Neha', 'Seth', 'ABC', 1, 0);

INSERT INTO contact VALUES(234, 'c@c.com', 'Puru', 'Malik', 'CDF', 0, 0);

INSERT INTO contact VALUES(342, 'd@d.com', 'Sid', 'Maan', 'TEG', 1, 0);

-- 1 Select all columns from the contact table where the active flag is 1

SELECT * FROM contact WHERE active_flag = 1;

-- 2 Deactivate contacts who are opted out 
 DELETE FROM contact WHERE opt_out = 1;

-- 3 Delete all the contacts who have the company name as ‘ABC
DELETE FROM contact WHERE company = 'ABC';

-- 4 Insert a new row with id as 658, name as ‘mili’, email as ‘mili@gmail.com’, the company as ‘DGH’, active flag as 1, opt-out flag as 1
INSERT INTO contact VALUES(658, 'mili@gmail.com', 'mili', 'Seth', 'DGH', 1, 1);

-- 5 Pull out the unique values of the company column
SELECT DISTINCT(company) FROM contact;

-- 6 Update name “mili” to “niti”.
 UPDATE contact SET fname = 'niti' WHERE fname = 'mili';
SELECT * FROM contact;



-- ----------------------Exercise 3 -----------------------------
-- creating saleman table
CREATE TABLE salesman(
salesman_id INT PRIMARY KEY,
s_name VARCHAR(30) NOT NULL,
city VARCHAR(20) NOT NULL,
commission FLOAT NOT NULL
);

INSERT INTO salesman VALUES( 5002, 'Nail Knite', 'Paris',0.13), 
( 5001, 'James Hoog', 'New York' , 0.15),
(5005, 'Pit Alex', 'London', 0.11),
( 5006, 'Mc Lyon', 'Paris',  0.14), 
(  5007, 'Paul Adam', 'Rome', 0.13),
(5003, 'Lauson Hen', 'San Jose',  0.12);

-- creating table customner
CREATE TABLE customer(
customer_id INT PRIMARY KEY,
customer_name VARCHAR(30) NOT NULL,
city VARCHAR(20) NOT NULL,
grade INT,
salesman_id INT,
FOREIGN KEY(salesman_id) REFERENCES salesman(salesman_id) 
);

INSERT INTO customer VALUES( 3002, 'Nick Rimando', 'New York', 100, 5001), 
(3007, 'Brad Davis', 'New York', 200, 5001), 
( 3005, 'Graham Zusi', 'California', 200, 5002), 
( 3008, 'Julian Green', 'London', 300, 5002), 
( 3004, 'Fabian Johnson', 'Paris', 300,5006), 
( 3009, 'Geoff Cameron', 'Berlin', 100,5003), 
( 3003, 'Jozy Altidor', 'Moscow', 200, 5007),
(3001, 'Brad Guzan','London', 5005);

-- Write a SQL query to find those customers with a grade less than 100.
-- It should return cust_name, customer city, grade, salesman, and salesman city. The result should be ordered by ascending customer_id.
select customer_name,city,grade;
select c.customer_name, c.city, c.grade, s.s_name, s.city FROM customer as c, salesman as s WHERE grade <= 100 AND 
c.salesman_id = s.salesman_id ORDER BY customer_id;
