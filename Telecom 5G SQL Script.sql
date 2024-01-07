# Creating View for table fact_atliqo_metrics

SELECT * FROM fact_atliqo_metrics;
DESCRIBE fact_atliqo_metrics;

DROP VIEW fact_atliqo_metrics_t;
CREATE VIEW fact_atliqo_metrics_t
AS
(
SELECT			CAST(STR_TO_DATE(date, '%d-%b-%y') AS DATE) `date`, CAST(city_code as char(8)) city_code, company,
				ROUND(atliqo_revenue_crores*10000000,0) AS revenue, CAST(arpu as double) arpu, CONVERT(active_users_lakhs*100000, UNSIGNED) AS active_users, 
                CONVERT(unsubscribed_users_lakhs*100000, UNSIGNED) AS unsubscribed_users
FROM			fact_atliqo_metrics
);

SELECT * FROM fact_atliqo_metrics_t;
DESCRIBE fact_atliqo_metrics_t;

# Creating View for table fact_market_share

SELECT * FROM fact_market_share;
DESCRIBE fact_market_share;

DROP VIEW fact_market_share_t;
CREATE VIEW fact_market_share_t
AS
(
SELECT			CAST(STR_TO_DATE(date, '%d-%b-%y') AS DATE) `date`, CAST(city_code as char(8)) city_code, ROUND(tmv_city_crores*10000000,0) AS market_value, company
FROM			fact_market_share
);

SELECT * FROM fact_market_share_t;
DESCRIBE fact_market_share_t;

# Creating View for table fact_plan_revenue

SELECT * FROM fact_plan_revenue;
DESCRIBE fact_plan_revenue;

DROP VIEW IF EXISTS fact_plan_revenue_t;
CREATE VIEW fact_plan_revenue_t
AS
(
SELECT			CAST(STR_TO_DATE(date, '%d-%b-%y') AS DATE) `date`, CAST(city_code as char(8)) city_code, plans, ROUND(plan_revenue_crores*10000000,0) plan_revenue
FROM			fact_plan_revenue
);

SELECT * FROM fact_plan_revenue_t;
DESCRIBE fact_plan_revenue_t;

# Creating View for table dim_date

SELECT * FROM dim_date;
DESCRIBE dim_date;

CREATE VIEW dim_date_t
AS
(
SELECT			CAST(STR_TO_DATE(date, '%d-%b-%y') AS DATE) `date`, month_name, `before/after_5g`, CONVERT(time_period, UNSIGNED) AS time_period
FROM			dim_date
);

SELECT * FROM dim_date_t;
DESCRIBE dim_date_t;

# Creating View for table dim_cities

SELECT * FROM dim_cities;
DESCRIBE dim_cities;

CREATE VIEW dim_cities_t
AS
(
SELECT			CAST(city_code as CHAR(8)) city_code, cast(city_name as CHAR(40)) city_name
FROM			dim_cities
);

SELECT * FROM dim_cities_t;
DESCRIBE dim_cities_t;