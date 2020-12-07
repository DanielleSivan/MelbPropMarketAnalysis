CREATE DATABASE IF NOT EXISTS melb_house_prices;

USE melb_house_prices;

CREATE TABLE IF NOT EXISTS sales_18_20
(date_sold DATE,
price INT,
suburb VARCHAR(30),
city CHAR(9),
state CHAR(3),
latitude DOUBLE,
longitude DOUBLE,
bedrooms INT,
property_type VARCHAR(30),
loc_pid VARCHAR(30),
lga_pid VARCHAR(30));

LOAD DATA INFILE 'melb_sales.csv'
INTO TABLE sales_18_20
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

CREATE TABLE sales_18_20_without_null
(date_sold DATE,
price INT,
suburb VARCHAR(30),
city CHAR(9),
state CHAR(3),
latitude DOUBLE,
longitude DOUBLE,
bedrooms INT,
property_type VARCHAR(30),
loc_pid VARCHAR(30),
lga_pid VARCHAR(30));

INSERT INTO sales_18_20_without_null (date_sold, price, suburb, city, state, latitude, longitude, bedrooms, property_type, loc_pid, lga_pid)
SELECT * 
FROM sales_18_20
WHERE latitude IS NOT NULL 
AND longitude IS NOT NULL
AND price IS NOT NULL;

SELECT * FROM sales_18_20_without_null;