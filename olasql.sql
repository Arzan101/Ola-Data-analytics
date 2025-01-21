use ola;
-- 1. Retrieve all successful bookings:
select * from bookings
where Booking_Status = 'Success';
-- 2. Find the average ride distance for each vehicle type:
select Vehicle_Type ,avg(Ride_Distance) as Avg_Distance 
from bookings
group by Vehicle_Type;
-- 3. Get the total number of cancelled rides by customers:
select count(*) from bookings
where Booking_Status = 'Canceled by Customer';
-- 4. List the top 5 customers who booked the highest number of rides:
select Customer_ID , Count(Booking_ID) as Total_ride
from bookings 
group by Customer_ID
order by Total_ride Desc limit 5;

-- 5. Get the number of rides cancelled by drivers due to personal and car-related issues:
select count(*) from bookings
where Canceled_Rides_by_Driver = 'Personal & Car related issue';
-- 6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
SELECT max(Driver_Ratings) as Max_rating,
min(Driver_Ratings) as Min_rating from bookings 
where Vehicle_Type = 'Prime_Sedan';
-- 7. Retrieve all rides where payment was made using UPI:
select * from bookings 
where Payment_Method = 'UPI';
-- 8. Find the average customer rating per vehicle type:
select Vehicle_Type, avg(Customer_Rating) as Average
from bookings 
group by Vehicle_Type;
-- 9. Calculate the total booking value of rides completed successfully:
select sum(Booking_value) as Total_Value 
from bookings 
where Booking_Status = 'Success';
-- 10. List all incomplete rides along with the reason:

select Booking_ID, incomplete_Rides_Reason 
from bookings
where incomplete_Rides = 'Yes';
