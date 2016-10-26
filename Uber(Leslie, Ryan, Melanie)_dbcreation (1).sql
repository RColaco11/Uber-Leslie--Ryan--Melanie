--Team Name: Uber
--Team Members: Leslie Moore, Ryan Colaco, Melanie Plattner
CREATE DATABASE Uber;
GO

USE Uber;
GO

--Create the Customer and Driver tables
CREATE TABLE Customers(
	CustomerID bigint NOT NULL Primary Key,
	First_Name varchar(50) NOT NULL,
	Last_Name varchar(50) NOT NULL,
	Phone bigint NOT NULL,
	Average_Rating float NOT NULL,
	Gender varchar(50) NOT NULL,
	Age int NOT NULL);

CREATE TABLE Drivers(
  DriverID bigint NOT NULL PRIMARY KEY,
  First_Name varchar(50) NOT NULL,
  Last_Name varchar(50) NOT NULL,
  Phone bigint NOT NULL,
  Car_Model varchar(50) NOT NULL,
  Car_LicensePlate varchar(50) NOT NULL,
  Average_Rating float NOT NULL,
  Region varchar(50) NOT NULL,
  Account_Number bigint NOT NULL);

CREATE TABLE Payment_Info(
  PaymentID bigint NOT NULL PRIMARY KEY,
  CustomerID bigint NOT NULL,
  Card_Type varchar(50) NOT NULL,
  Card_Number bigint NOT NULL,
  Expiration_Date datetime NOT NULL,
  CVV_Code int NOT NULL,
  Name_On_Card varchar(50) NOT NULL,
  Bank varchar(50) NOT NULL);

CREATE TABLE Trips(
	TripID bigint NOT NULL PRIMARY KEY,
	DriverID bigint NOT NULL,
	CustomerID bigint,
	Start_Address varchar(50) NOT NULL,
	Start_City varchar(50) NOT NULL,
	Start_State varchar(50) NOT NULL,
	Destination_Address varchar(50) NOT NULL,
	Destination_City varchar(50) NOT NULL,
	Destination_State varchar(50) NOT NULL,
	Fare money NOT NULL,
	Distance float NOT NULL,
	Time_ int NOT NULL,
	Driver_Rating float NOT NULL,
	Customer_Rating float NOT NULL);
  GO

  -- Create the relationship: the first FK in Payment_Info
ALTER TABLE Payment_Info ADD CONSTRAINT FK_Payment_Info_Customers 
FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID);
GO

 -- Create the relationship: the second FK in Trips
ALTER TABLE Trips ADD CONSTRAINT FK_Trips_Customers 
FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID);
GO

-- Create the relationship: the third FK in Trips
ALTER TABLE Trips ADD CONSTRAINT FK_Trips_Drivers
FOREIGN KEY (DriverID) REFERENCES Drivers(DriverID);
GO

-- Add a few customers
INSERT INTO Customers (CustomerID, First_Name, Last_Name, Phone, Average_Rating, Gender, Age) VALUES 
(1, 'Rachel', 'Burstiner', 1112223333, 4, 'Female', 19),
(2, 'Ryan', 'Colaco', 2223334444, 10, 'Male', 20),
(3, 'Julia', 'Harrigan', 3334445555, 5, 'Female', 20),
(4, 'Jillian', 'Klinvex', 4445556666, 7, 'Female', 21),
(5, 'Mark', 'Koerner', 5556667777, 2, 'Male', 16),
(6, 'Anne', 'McCormack', 6667778888, 8, 'Female', 22),
(7, 'Julie', 'Zhou', 7778889999, 5, 'Female', 20),
(8, 'Li', 'Liang', 8889990000, 4.7, 'Female', 20),
(9, 'Meaghan', 'Merullo', 0001112222, 8.9, 'Female', 22),
(10, 'Theresia', 'Susanto', 1234567890, 6.4, 'Female', 18);

--Add a few drivers
INSERT INTO Drivers (DriverID, First_Name, Last_Name, Phone, Car_Model, Car_LicensePlate, Average_Rating, Region, Account_Number) VALUES
(1, 'Bob', 'Smith', 7563963857, 'Honda Civic', 'HGE 24T', 3.8, 'Boston', 284637),
(2, 'Jill', 'Park', 1947582094, 'Toyota Corolla', 'NGM 837', 7.9, 'San Diego', 273645),
(3, 'Mike', 'Lin', 1947563528, 'Suburu Legacy', 'FHG KN5', 4.7, 'New York City', 103846),
(4, 'Bill', 'Murry', 1029463725, 'Honda Accord', 'LDK 4H5', 8.9, 'Boston', 947386),
(5, 'Mary', 'McDonald', 1837462519, 'Toyota Tacoma', 'DGE HE3', 6.5, 'Dallas', 283746),
(6, 'Megan', 'Hood', 2938471980, 'GMC Envoy', 'DHF HEY', 9.3, 'Houston', 172635),
(7, 'Ben', 'Crawford', 1938472645, 'Toyota Prius', 'HFG 264', 2.1, 'Seattle', 183746),
(8, 'Jen', 'Eng', 9876567849, 'Honda Accord', 'JDF 726', 5.6, 'Seattle', 987654),
(9, 'Jack', 'Decker', 2635471827, 'Honda Accord', 'FJ5 HG7', 7.8, 'Boston', 273645),
(10, 'Patrick', 'Dunn', 0987654321, 'Suburu Legacy', '67H HG7', 10, 'Detroit', 173625);

INSERT INTO Payment_Info (PaymentID, CustomerID, Card_Type, Card_Number, Expiration_Date , CVV_Code, Name_On_Card, Bank) VALUES
(1, 2, 'Debit', 123456789, 2016-07-31, 567, 'Ryan Colaco', 'Visa'),
(2, 4, 'Debit', 234567890, 2018-04-30, 321, 'Jillian Klinvex', 'Wells Fargo'),
(3, 9, 'Credit',445678901, 2019-05-30, 432, 'Meaghan Merullo' , 'Visa'),
(4, 2, 'Credit',456789012, 2040-08-30, 789, 'Ryan Colaco', 'MasterCard'),
(5, 5, 'Debit', 409876543, 2020-01-31, 897, 'Mark Koerner', 'MasterCard'),
(6, 7, 'Credit',876543748, 2009-05-30, 782, 'Julie Zhou', 'Santanders'),
(7, 4, 'Credit', 875273822, 2015-12-31, 345, 'Jillian Klinvex', 'Visa'),
(8,10, 'Debit', 625372382, 2018-09-31, 123, 'Theresia Susanto', 'Visa'),
(9, 6, 'Debit', 765238232, 2016-06-30, 444, 'Anne McCormack', 'Wells Fargo'),
(10, 4,'Credit',567899223, 2015-02-31, 237, 'Jillian Klinvex', 'Visa');

-- Add a few trips
INSERT INTO Trips(TripID, DriverID, CustomerID, Start_Address, Start_City, Start_State, Destination_Address, Destination_City, Destination_State, Fare, Distance, Time_, Driver_Rating, Customer_Rating) VALUES 
(20, 10, 2, '1 1st Street', 'Detroit', 'Michigan', '10 10th Street', 'Detroit','Michigan', 100, 2.5, 10, 5, 2),
(21, 2, 4, '2 2nd Street', 'San Diego', 'California', '9 9th Street','San Diego','California', 120, 5.6, 44, 4, 4),
(23, 1, 10, '3 3rd Street', 'Boston', 'Massachusetts', '8 8th Street','Boston','Massachusetts', 20, 10.5, 55, 4, 5),
(24, 6, 8, '4 4th Street', 'Houston', 'Texas', '7 7th Street','Austin', 'Texas', 50, 60, 47, 2, 1),
(25, 4, 5, '5 5th Street','Boston', 'Massachusetts','6 6th Street','Wellesley', 'Massachusetts', 20, 40, 24, 4, 3),
(26, 7, 2, '6 6th Street', 'Seattle', 'Washington','5 5th Street','Forks', 'Washington', 50, 70, 43, 5, 5),
(27, 9, 7, '7 7th Street', 'Boston', 'Massachusetts','4 4th Street','Newton', 'Massachusetts', 100, 50.3, 19, 5, 5),
(28, 3, 9, '8 8th Street', 'Brooklyn','New York','3 3rd Street', 'Bronx', 'New York', 50, 60.4, 10, 4, 4),
(29, 5, 1, '9 9th Street', 'Dallas','Texas','2 2nd Street', 'Fort Worth', 'Texas', 60, 50.2, 33, 4, 5),
(30, 8, 10, '10 10th Street', 'Seattle','Washington','1 1st Street', 'Seattle', 'Washington', 100, 40.2, 14, 3, 5);
GO
