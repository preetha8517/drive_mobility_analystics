-- Create table for 100K trips — 16 columns 
CREATE TABLE trips (
    trip_id VARCHAR(20) PRIMARY KEY,
    car_id VARCHAR(20),
    car_model VARCHAR(20),
    pickup_location VARCHAR(50),
    dropoff_location VARCHAR(50),
    customer_id VARCHAR(20),
    acquisition_channel VARCHAR(50),
    trip_date DATE,
    trip_duration_min INT,
    distance_km FLOAT,
    revenue_aed FLOAT,
    fuel_cost_aed FLOAT,
    net_revenue_aed FLOAT,
    rating INT,
    trip_status VARCHAR(20),
    payment_method VARCHAR(20)
);

SELECT * FROM trips LIMIT 1;