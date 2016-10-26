--Team Name: Uber
--Team Members: Leslie Moore, Ryan Colaco, Melanie Plattner

USE Uber; 

-- SQL Queries
--1 Select all colums from all of the tables
Select * From Customers;
Select * From Drivers;
Select * From Payment_Info;
Select * From Trips;

--2 Find the average fare per customer
Select T.CustomerID, avg(T.Fare) AS 'Average Fare' 
From Trips as T
Group by CustomerID

--3 Find the fare for each trip
Select T.TripID, C.First_Name, C.Last_Name, T.Fare
From Trips AS T
Inner Join Customers AS C
On T.CustomerID = C.CustomerID

--4 Find the fare for each trip, even if there is no customer data 
Insert Into Trips(TripID, DriverID, CustomerID, Start_Address, Start_City, Start_State, Destination_Address, Destination_City, Destination_State, Fare, Distance, Time_, Driver_Rating, Customer_Rating) VALUES 
(31, 10, null , '13 13st Street', 'Detroit', 'Michigan', '20 40th Street', 'Detroit','Michigan', 60, 5, 20, 4, 3);

Select T.TripID, C.First_Name, C.Last_Name, T.Fare
From Trips AS T
Left Join Customers AS C
On T.CustomerID = C.CustomerID
-- Left Join is necessary because it returns all values from the first table and the corresponding values from the seconds table. 
-- When a value in the second table is null using an inner join will not indicate that there was a column in the first table that has a null for that value.
-- We had to use Left Join because there is a value in the first table which contains a null value and prohibits the trip from having a matching customer. 
-- and we wanted to see all values for the trip regardless of having complete data.


--5 Show all columns of those trips that start in Boston of which the total fare is great than the average total fare of all the trips that also start in Boston. 
select *
from Trips
where Start_City like 'Boston'
and Fare>
(select avg(Fare)
from Trips
where Start_City like 'Boston'
);
