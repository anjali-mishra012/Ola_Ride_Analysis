create database ola_ride;

CREATE TABLE OLA_RIDE(
    Date DATE,
    Time TEXT,
    Booking_ID TEXT,
    Booking_Status TEXT,
    Customer_ID TEXT,
    Vehicle_Type TEXT,
    Pickup_Location TEXT,
    Drop_Location TEXT,
    V_TAT NUMERIC,
    C_TAT NUMERIC,
    Canceled_Rides_by_Customer TEXT,
    Canceled_Rides_by_Driver TEXT,
    Incomplete_Rides TEXT,
    Incomplete_Rides_Reason TEXT,
    Booking_Value INT,
    Payment_Method TEXT,
    Ride_Distance INT,
    Driver_Ratings NUMERIC,
    Customer_Rating NUMERIC,
    Vehicle_Images TEXT
);

SELECT *FROM OLA_RIDE

SELECT COUNT(*) FROM OLA_RIDE;

--1. Retrieve all successful bookings.
SELECT *
FROM ola_ride
WHERE Booking_Status = 'Success';

--2. Find the average ride distance for each vehicle type.
SELECT Vehicle_Type, ROUND(AVG(Ride_Distance),2) AS avg_distance
FROM ola_ride
GROUP BY Vehicle_Type;


--3. Get the total number of cancelled rides by customers.
SELECT COUNT(*) AS total_customer_cancellations
FROM ola_ride
WHERE Booking_Status = 'Canceled by Customer';

--4. List the top 5 customers who booked the highest number of rides.
SELECT Customer_ID, COUNT(*) AS total_rides
FROM ola_ride
GROUP BY Customer_ID
ORDER BY total_rides DESC
LIMIT 5;

--5. Get the number of rides cancelled by drivers due to personal and car-related issues.
SELECT COUNT(*) AS driver_cancellations
FROM ola_ride
WHERE Booking_Status = 'Canceled by Driver'
  AND Canceled_Rides_by_Driver = 'Personal & Car related issue';


--6. Find the maximum and minimum driver ratings for Prime Sedan bookings
SELECT MAX(Driver_Ratings) AS max_rating,
MIN(Driver_Ratings) AS min_rating
FROM ola_ride
WHERE Vehicle_Type = 'Prime Sedan';


--7. Retrieve all rides where payment was made using UPI.
SELECT *
FROM ola_ride
WHERE Payment_Method = 'UPI';

--8. Find the average customer rating per vehicle type.
SELECT Vehicle_Type, ROUND(AVG(Customer_Rating),2) AS avg_customer_rating
FROM ola_ride
GROUP BY Vehicle_Type;

--9. Calculate the total booking value of rides completed successfully.
SELECT SUM(Booking_Value) AS total_success_revenue
FROM ola_ride
WHERE Booking_Status = 'Success';


--10. List all incomplete rides along with the reason.
SELECT Booking_ID, Incomplete_Rides, Incomplete_Rides_Reason
FROM ola_ride
WHERE Incomplete_Rides = 'Yes';


