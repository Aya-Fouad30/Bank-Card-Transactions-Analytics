SELECT
customer_id,cc_num,first_name,last_name,gender,street,city,state,
ISNULL(zip,'')                                            AS zip,
lat,long,city_pop,ISNULL(job,'')                          AS job, 
dob,
DATEDIFF(year,dob,GETDATE())                              AS age,
CASE
    WHEN DATEDIFF(YEAR,dob,GETDATE()) < 18 THEN 'Under 18'
    WHEN DATEDIFF(YEAR,dob,GETDATE()) BETWEEN 18 AND 25 THEN '18-25'
    WHEN DATEDIFF(YEAR,dob,GETDATE()) BETWEEN 26 AND 35 THEN '26-35'
    WHEN DATEDIFF(YEAR,dob,GETDATE()) BETWEEN 36 AND 45 THEN '36-45'
    WHEN DATEDIFF(YEAR,dob,GETDATE()) BETWEEN 46 AND 60 THEN '46-60'
    ELSE '60+'
END AS age_groups, 
ISNULL(loyalty_tier,'')                                   AS loyality_tier,
email_domain,signup_date,YEAR(signup_date) AS signup_year ,
MONTH(signup_date) AS signup_month
INTO Silver.Customers
FROM Bronze.Customers;

ALTER TABLE Silver.Customers ALTER COLUMN customer_id INT NOT NULL ;
ALTER TABLE Silver.Customers ADD CONSTRAINT PK_Silver_customer PRIMARY KEY(customer_id );

SELECT *
FROM Silver.Customers;


SELECT merchant_id,RIGHT(merchant_name,len(merchant_name)-CHARINDEX('_',merchant_name)) AS merchant_name
,dominant_category,merchant_city,merchant_state,merchant_lat,merchant_long,merchant_since,
YEAR(merchant_since) AS since_year,
MONTH(merchant_since) AS since_month,is_active
INTO Silver.Merchants
FROM Bronze.Merchants;

ALTER TABLE Silver.Merchants ALTER COLUMN merchant_id INT NOT NULL ;
ALTER TABLE Silver.Merchants ADD CONSTRAINT PK_Silver_merchant PRIMARY KEY(merchant_id );

SELECT *
FROM Silver.Merchants;



SELECT transaction_id,trans_date_trans_time,
YEAR(trans_date_trans_time) AS trans_year,
MONTH(trans_date_trans_time) AS trans_month,
customer_id ,merchant_id,category,amt,tax_amt,discount_amt,
currency,payment_method,channel,entry_mode,device_type,
transaction_status,trans_num,ISNULL(session_id,'') AS session_id,
unix_time,is_fraud

INTO Silver.Transactions
FROM Bronze.Transactions;

ALTER TABLE Silver.Transactions ALTER COLUMN transaction_id INT NOT NULL ;
ALTER TABLE Silver.Transactions ADD CONSTRAINT PK_Silver_transaction PRIMARY KEY(transaction_id );

SELECT *
FROM Silver.Transactions;