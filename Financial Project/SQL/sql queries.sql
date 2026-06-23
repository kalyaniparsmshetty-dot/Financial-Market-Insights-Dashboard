
#------------------- vewing pl1_clean table---------------------------------
select * from pl1_clean;


#------------------------viewing pl2_clean table-----------------------------
select * from pl2_clean;


#-------------------------viewing cf_clean table--------------------------------
select * from cf_clean;


#--------------------------viewing bs_clean table---------------------------------
select * from bs_clean;


#-------------------------viewing r2_clean table---------------------------------
select * from r2_clean;


#-------------------------viewing r1_clean table---------------------------------
select * from r1_clean;


#--------------------------viewing price_clean table-------------------------------
select * from price_clean;


#-------------------------
describe pl1_clean;

#-----------------total companies-------------------------------------
select count(*) as total_companies from pl1_clean;


#-------------------Industry-wise company count-----------------------
select industry,count(*) as company_count from pl1_clean group by industry order by company_count DESC;


#----------------------top 10 companies by market_capitalization---------------------------
select name,industry,`Market Capitalization` from pl1_clean order by `Market Capitalization` Desc limit 10;


#-----------------------top 10 companies by current price-----------------------------------
select name,`Current Price` from pl1_clean order by `Current Price` DESC limit 10;


#-----------------------------------industry wise avg market capitalization---------------------
select industry,avg(`Market capitalization`) as avg_market_capitalization from pl1_clean group by industry order by avg_market_capitalization DESC;


#--------------------------------checking coomon columns from both tables---------------------
show columns from pl1_clean;
show columns from price_clean;


#----------------------------------industry-wise avg current price---------------------
select p.industry,avg(pr.`Current Price`) as avg_price from pl1_clean p join price_clean pr on p.join_key=pr.join_key group by p.industry order by avg_price desc;


#----------------------------------top 10 industries by total market capitalization----------------------
select industry ,SUM(`Market Capitalization`) as total_market_capitalization from pl1_clean group by industry order by total_market_capitalization Desc limit 10;


#-----------------------------company count by industry-------------------------------
select industry,count(*) as company_count from pl1_clean group by industry order by company_count DESC;


#---------------------------------top 10 companies in each industry by market capitalization---------------
select name,industry,`Market Capitalization` from pl1_clean order by `Market Capitalization` desc limit 10;


#------------------------industry above avg market capitalization----------------------------------
SELECT Industry,
       AVG(`Market Capitalization`) AS Avg_Market_Cap
FROM pl1_clean
GROUP BY Industry
HAVING AVG(`Market Capitalization`) >
(
    SELECT AVG(`Market Capitalization`)
    FROM pl1_clean
);


#-----------------------------top 10 companies by avg stock price---------------------------
SELECT Industry,AVG(`Current Price`) AS Avg_Price FROM pl1_clean GROUP BY Industry ORDER BY Avg_Price DESC LIMIT 10;


#----------------------companies with market capitalization above industry avg----------------
SELECT Name,
       Industry,
       `Market Capitalization`
FROM pl1_clean p
WHERE `Market Capitalization` >
(
    SELECT AVG(`Market Capitalization`)
    FROM pl1_clean
);