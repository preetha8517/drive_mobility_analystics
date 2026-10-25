SELECT COUNT(*) FROM trips;

--total Revenue

SELECT SUM(revenue_aed) AS total_revenue FROM trips;
--RESULT total_revenue 319358529 AED

-- Revenue by pickup_location — Top location 

SELECT pickup_location, COUNT(*) AS trips, SUM(revenue_aed) AS revenue
FROM trips
WHERE trip_status = 'Completed'
GROUP BY pickup_location
ORDER BY revenue DESC;

/* RESULT
"pickup_location"	"trips"	"revenue"
"International City"	7923	2534762.989999998
"JLT"	7918	2532106.6900000125
"Sports City"	7865	2518034.089999998
"Al Barsha"	7703	2483646.7500000023
"Downtown"	7795	2483368.909999985
"Bur Dubai"	7727	2479275.3199999942
"Motor City"	7716	2475410.420000004
"Marina"	7643	2465046.150000009
"Silicon Oasis"	7788	2453016.569999999
"Business Bay"	7728	2451314.5200000033
"Discovery Gardens"	7672	2430113.630000002
"Deira"	7639	2424832.160000005
*/

--Revenue by car model-Top Model
SELECT car_model,COUNT(*) AS trips,SUM(revenue_aed) AS revenue
FROM trips
WHERE trip_status = 'Completed'
GROUP BY car_model
ORDER BY revenue DESC;

/*RESULT
"car_model"	"trips"	"revenue"
" Toyota Camry"	14410	4603541.2300000265
" Hyundai Tucson"	14366	4594041.060000022
"Kia Cerato"	14319	4587353.8600000255
"Kia Picanto"	14316	4571249.909999986
" Toyota Yaris"	14289	4568453.63
" Nissan Sunny"	14263	4541270.7500000065
" Hyundai Accent"	14037	4469919.240000012
*/
-- Cancellation Rate — Operational metric
SELECT trip_status,COUNT(*) AS count,
  ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM trips), 2) AS pct
FROM trips
GROUP BY trip_status;
--RESULT: Completed 93.11%, Cancelled 6.88% — Industry standard — Good

-- Daily revenue — For Daily_Report sheet — Time series analysis
SELECT trip_date, COUNT(*) AS trips, SUM(revenue_aed) AS daily_revenue
FROM trips
WHERE trip_status = 'Completed'
GROUP BY trip_date
ORDER BY trip_date;

-- Fleet Utilisation % 
SELECT 
  car_id,
  SUM(trip_duration_min)/60.0 AS rented_hours,
  COUNT(*) AS trips,
  ROUND(SUM(trip_duration_min)/60.0 / (24*600) *100, 2) AS utilisation_pct
FROM trips
WHERE trip_status = 'Completed'
GROUP BY car_id
ORDER BY utilisation_pct DESC
LIMIT 10;


-- Revenue by acquisition_channel — Marketing analysis — Which channel best
SELECT acquisition_channel, COUNT(DISTINCT customer_id) AS customers, COUNT(*) AS trips, SUM(revenue_aed) AS revenue
FROM trips
WHERE trip_status = 'Completed'
GROUP BY acquisition_channel
ORDER BY revenue DESC;
-- Result: Top Partnerships / Google Ads — Insight

--Avg trip duration by location — Operational efficiency
SELECT pickup_location, AVG(trip_duration_min) AS avg_duration_min, AVG(distance_km) AS avg_distance_km
FROM trips
WHERE trip_status = 'Completed'
GROUP BY pickup_location
ORDER BY avg_duration_min DESC;

-- Top 10 customers by revenue
SELECT customer_id, COUNT(*) AS trips, SUM(revenue_aed) AS total_spent, AVG(rating) AS avg_rating
FROM trips
WHERE trip_status = 'Completed'
GROUP BY customer_id
ORDER BY total_spent DESC
LIMIT 10;
-- Result: Top customer spent AED 5000+ — Loyalty insight

-- Monthly revenue 
SELECT DATE_TRUNC('month', trip_date) AS month, COUNT(*) AS trips, SUM(revenue_aed) AS revenue
FROM trips
WHERE trip_status = 'Completed'
GROUP BY month
ORDER BY month;
-- Result: Monthly trend Jan 2024 to Aug 2025 — 20 months

