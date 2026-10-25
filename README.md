udrive Mobility Analytics — Fleet & Revenue Performance Dashboard
Dubai Car-Sharing Data | 100,000 Trips | 2024-2025
Author: Preetha A M | Junior Data Analyst | Dubai, UAE
Repository: drive-mobility-analytics

Executive Summary
This project analyzes 100,000 car rental trips from Udrive's Dubai fleet to identify revenue drivers, fleet utilization patterns, and operational efficiency. The analysis reveals International City as the highest revenue-generating location and Toyota Camry as the top-performing model, with stable daily revenue of AED 40K-60K over 600+ days.

Key Metrics: 100K trips | AED 31.9M total revenue | 93.11% completion rate | 6.88% cancellation rate | 12 locations | 7 car models
Business Problem
Udrive, a leading car-sharing platform in Dubai, operates a flexible fleet across 12 locations. The business needs to answer:

Which pickup locations generate maximum trips and revenue?
Which car models are most profitable and should be prioritized for fleet expansion?
How does daily and monthly revenue trend over time?
Which acquisition channels deliver the highest ROI?
What is the operational health in terms of cancellation and fleet utilization?
Dataset
Source: Car_trips_100k_preetha.csv — Simulated operational data modeled on Udrive Dubai

File: data/raw/Car_trips_100k_preetha.csv | 100,000 rows | 16 columns | 2024-01 to 2025-08

Column	Type	Description
trip_id, car_id, customer_id	VARCHAR	Identifiers
car_model	VARCHAR	7 models: Toyota Camry, Hyundai Tucson, Kia Picanto, etc.
pickup_location, dropoff_location	VARCHAR	12 locations: International City, JLT, Sports City, etc.
acquisition_channel	VARCHAR	8 channels: Google Ads, Partnerships, Organic, etc.
trip_date	DATE	Daily granularity
trip_duration_min, distance_km	NUMERIC	Operational metrics
revenue_aed, fuel_cost_aed, net_revenue_aed	NUMERIC	Financial metrics
rating, trip_status, payment_method	VARCHAR	Quality & operations
Key Findings
1. Revenue by Location

International City: 7,923 trips | AED 2,534,762 revenue — Top location
JLT: 7,918 trips | AED 2,532,106
12 locations fairly balanced, all 7,600+ trips — Indicates uniform demand
2. Revenue by Car Model

Toyota Camry: 14,410 trips | AED 4,603,541 — Top model
Hyundai Tucson: 14,366 trips | AED 4,594,041
Top 3 models account for 43% revenue — Fleet focus recommendation
3. Daily & Monthly Trend

Daily revenue stable: AED 40K-60K across 600+ days — No seasonality drop
Monthly trend consistent Jan 2024 - Aug 2025 — Operational stability
4. Acquisition Channel

8 channels balanced — Partnerships and Google Ads lead at ~AED 4.2M each
No over-dependence on single channel — Marketing diversification healthy
5. Operational Health

Completed: 93.11% | Cancelled: 6.88% — Within industry standard (<10%)
Average trip: ~45 min, ~25 km

Recommendations
Fleet Allocation: Increase allocation in International City and JLT — Highest demand.
Model Procurement: Prioritize Toyota Camry and Hyundai Tucson for expansion.
Retention: Investigate cancellation reasons to reduce 6.88% further.
Marketing: Maintain balanced channel strategy; test uplift in top channels.

Tech Stack
Python (Pandas, NumPy): ETL — Raw CSV to 4 processed reports for Tableau
SQL (PostgreSQL): 12 business queries — Revenue analysis, fleet utilization, customer loyalty
Tableau: 5-chart dashboard, 4 filters, calculated fields, full-screen layout
Git: Version control, GitHub documentation

Project Structure
udrive-mobility-analytics/
├── data/
│   ├── raw/
│   │   └── udrive_trips_100k.csv          # 100K raw data (16 cols)
│   └── processed/
│       ├── fleet_location_report.csv      # Trips, revenue by location
│       ├── fleet_model_report.csv         # Trips, revenue by car model
│       ├── daily_report.csv               # Trips, revenue by date
│       └── acquisition_channel_report.csv # Trips, revenue by channel
├── sql/
│   ├── 01_table_creation.sql              # DDL: CREATE TABLE trips
│   └── 02_analysis_queries.sql            # 12 queries with results
├── python/
│   ├── automation.py                      # ETL script
│  
├── tableau/
│   ├── dashboard_screenshot.png           # Final dashboard image
│   └── Udrive_Mobility_Dashboard_Preetha.twbx  # Packaged workbook (5-15 MB)
└── README.md
Automation Workflow
Manual process (4 hours) → Automated (5 minutes) — 70% time reduction.

Raw CSV → Python (automation.py) → 4 processed CSVs → SQL analysis → Tableau Dashboard

SQL Analysis — 02_analysis_queries.sql
12 queries covering:

Total revenue: SUM(revenue_aed) = AED 31,935,852
Revenue by pickup_location — GROUP BY pickup_location ORDER BY revenue DESC
Revenue by car_model — GROUP BY car_model
Daily revenue — GROUP BY trip_date
Monthly revenue — DATE_TRUNC('month', trip_date)
Acquisition channel performance
Cancellation rate — trip_status breakdown
Fleet utilization — SUM(trip_duration_min)/available hours
Top 10 customers — ORDER BY total_spent DESC
Avg duration & distance by location

Tableau Dashboard Specification
Size: Automatic — Entire View — No scrollbar — Presentation mode (F7)
Charts:
Trips by Location — Bar — Pickup Location (Color), Trips (Label) — 12 colors
Revenue by Channel — Pie — Acquisition Channel (Color), Revenue (Label) — 8 colors
Revenue by Pickup Location — Bar — Revenue labels (e.g., 2.53M)
Revenue by Car Model — Bar — Blue palette — Revenue labels (e.g., 4.60M)
Daily Revenue — Area/Line — Trip Date (X), Revenue (Y) — Blue — 40K-60K stable
Filters (Right panel, Show): Pickup Location, Car Model, Trip Date (Month/Day/Year)

Title: Car Rental Analytics — Dubai Fleet Performance Dashboard | Subtitle with KPIs: International City leads 7,923 trips & AED 2.53M revenue | Toyota Camry 13,454 trips top model | Daily revenue stable AED 40K-60K

 Demonstrates end-to-end workflow: Data Ingestion → ETL → SQL Analysis → Tableau Visualization → Business Recommendations
