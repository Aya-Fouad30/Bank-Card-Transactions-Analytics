USE BankCard;
GO



--USER 
SELECT * FROM Bronze.Customers;
--=============NULLS==============

SELECT 
SUM(CASE WHEN customer_id is NULL OR customer_id='' THEN 1 ELSE 0 END ) AS blank_id ,
SUM(CASE WHEN cc_num is NULL OR cc_num='' THEN 1 ELSE 0 END ) AS blank_cc_num,
SUM(CASE WHEN first_name is NULL OR first_name ='' THEN 1 ELSE 0 END ) AS blank_first_name ,
SUM(CASE WHEN last_name is NULL OR last_name='' THEN 1 ELSE 0 END ) AS blank_last_name ,
SUM(CASE WHEN gender is NULL OR gender='' THEN 1 ELSE 0 END ) AS blank_gender ,
SUM(CASE WHEN street is NULL OR street='' THEN 1 ELSE 0 END ) AS blank_street ,
SUM(CASE WHEN city is NULL OR city='' THEN 1 ELSE 0 END ) AS blank_city ,
SUM(CASE WHEN state is NULL OR state='' THEN 1 ELSE 0 END ) AS blank_state ,
SUM(CASE WHEN zip is NULL  THEN 1 ELSE 0 END ) AS blank_zip ,
SUM(CASE WHEN lat is NULL OR lat='' THEN 1 ELSE 0 END ) AS blank_lat,
SUM(CASE WHEN long is NULL OR long='' THEN 1 ELSE 0 END ) AS blank_long ,
SUM(CASE WHEN city_pop is NULL OR city_pop='' THEN 1 ELSE 0 END ) AS blank_city_pop ,
SUM(CASE WHEN job is NULL OR job='' THEN 1 ELSE 0 END ) AS blank_job ,
SUM(CASE WHEN dob is NULL OR dob='' THEN 1 ELSE 0 END ) AS blank_dob,
SUM(CASE WHEN loyalty_tier is NULL OR loyalty_tier='' THEN 1 ELSE 0 END ) AS blank_loyalty_tier ,
SUM(CASE WHEN email_domain is NULL OR email_domain='' THEN 1 ELSE 0 END ) AS blank_email_domain ,
SUM(CASE WHEN signup_date is NULL OR signup_date='' THEN 1 ELSE 0 END ) AS blank_signup_date
FROM Bronze.Customers;


--=============INCONSISTENT CATEGORICAL TYPES==============
SELECT DISTINCT gender,COUNT(*) AS gender_count
FROM Bronze.Customers 
GROUP BY (gender);

SELECT loyalty_tier,COUNT(*) AS loyalty_count
FROM Bronze.Customers 
GROUP BY loyalty_tier
HAVING COUNT(*)>1;

SELECT email_domain,COUNT(*) AS email_count
FROM Bronze.Customers 
GROUP BY email_domain
HAVING COUNT(*)>1;

--=============DUPLICATED IDs==============
SELECT customer_id,COUNT(*) AS id_count
FROM Bronze.Customers 
GROUP BY customer_id
HAVING COUNT(*)>1;

--=============ROWS NUM==============

SELECT COUNT(*) AS CustomersNum FROM Bronze.Customers;



--Merchants 
SELECT * FROM Bronze.Merchants;
--=============NULLS==============
SELECT 
SUM(CASE WHEN merchant_id is NULL OR merchant_id ='' THEN 1 ELSE 0 END ) AS blank_id ,
SUM(CASE WHEN merchant_name is NULL OR merchant_name='' THEN 1 ELSE 0 END ) AS blank_merchant_name,
SUM(CASE WHEN dominant_category is NULL OR dominant_category ='' THEN 1 ELSE 0 END ) AS blank_dominant_category ,
SUM(CASE WHEN merchant_city is NULL OR merchant_city='' THEN 1 ELSE 0 END ) AS blank_merchant_city ,
SUM(CASE WHEN merchant_state is NULL OR merchant_state='' THEN 1 ELSE 0 END ) AS blank_merchant_state ,
SUM(CASE WHEN merchant_lat is NULL OR merchant_lat ='' THEN 1 ELSE 0 END ) AS blank_merchant_lat  ,
SUM(CASE WHEN merchant_long is NULL OR merchant_long='' THEN 1 ELSE 0 END ) AS blank_merchant_long ,
SUM(CASE WHEN merchant_since is NULL OR merchant_since='' THEN 1 ELSE 0 END ) AS blank_merchant_since ,
SUM(CASE WHEN is_active is NULL THEN 1 ELSE 0 END ) AS blank_is_active
FROM Bronze.Merchants


--=============DUPLICATED ==============
SELECT merchant_id,COUNT(*) AS id_count
FROM Bronze.Merchants 
GROUP BY merchant_id
HAVING COUNT(*)>1;



--=============INCONSISTENT CATEGORICAL TYPES==============

SELECT dominant_category,COUNT(*) AS category_count
FROM Bronze.Merchants 
GROUP BY dominant_category;


SELECT is_active,COUNT(*) AS is_active_count
FROM Bronze.Merchants 
GROUP BY is_active;

--=============ROWS NUM==============

SELECT COUNT(*) AS MerchantsNum FROM Bronze.Merchants;


--Transactions 
SELECT * FROM Bronze.Transactions;

--=============NULLS==============
SELECT 
SUM(CASE WHEN transaction_id is NULL OR transaction_id ='' THEN 1 ELSE 0 END ) AS blank_id ,
SUM(CASE WHEN trans_date_trans_time is NULL OR trans_date_trans_time='' THEN 1 ELSE 0 END ) AS blank_date,
SUM(CASE WHEN customer_id is NULL OR customer_id  ='' THEN 1 ELSE 0 END ) AS blank_customer_id,
SUM(CASE WHEN merchant_id is NULL OR merchant_id='' THEN 1 ELSE 0 END ) AS blank_merchant_id,
SUM(CASE WHEN category is NULL OR category='' THEN 1 ELSE 0 END ) AS blank_category ,
SUM(CASE WHEN amt is NULL  THEN 1 ELSE 0 END ) AS blank_amt  ,
SUM(CASE WHEN tax_amt is NULL  THEN 1 ELSE 0 END ) AS blank_tax_amt ,
SUM(CASE WHEN discount_amt is NULL  THEN 1 ELSE 0 END ) AS blank_discount_amt ,
SUM(CASE WHEN currency IS NULL OR currency='' THEN 1 ELSE 0 END ) AS blank_currency,
SUM(CASE WHEN payment_method is NULL OR payment_method ='' THEN 1 ELSE 0 END ) AS blank_method ,
SUM(CASE WHEN channel is NULL OR channel='' THEN 1 ELSE 0 END ) AS blank_channel,
SUM(CASE WHEN entry_mode is NULL OR entry_mode  ='' THEN 1 ELSE 0 END ) AS blank_entry_mode,
SUM(CASE WHEN device_type is NULL OR device_type='' THEN 1 ELSE 0 END ) AS blank_device_type,
SUM(CASE WHEN transaction_status is NULL OR transaction_status='' THEN 1 ELSE 0 END ) AS blank_status ,
SUM(CASE WHEN trans_num is NULL OR trans_num ='' THEN 1 ELSE 0 END ) AS blank_trans_num  ,
SUM(CASE WHEN session_id is NULL OR session_id='' THEN 1 ELSE 0 END ) AS blank_session_id ,
SUM(CASE WHEN unix_time is NULL OR unix_time='' THEN 1 ELSE 0 END ) AS blank_unix_time ,
SUM(CASE WHEN is_fraud IS NULL THEN 1 ELSE 0 END ) AS blank_is_fraud


FROM Bronze.Transactions


--=============DUPLICATED ==============
SELECT transaction_id,COUNT(*) AS id_count
FROM Bronze.Transactions 
GROUP BY transaction_id
HAVING COUNT(*)>1;



--=============INCONSISTENT CATEGORICAL TYPES==============

SELECT currency,COUNT(*) AS currency_count
FROM Bronze.Transactions 
GROUP BY currency;


SELECT payment_method,COUNT(*) AS payment_method_count
FROM Bronze.Transactions 
GROUP BY payment_method;

SELECT channel,COUNT(*) AS channel_count
FROM Bronze.Transactions 
GROUP BY channel;

SELECT entry_mode,COUNT(*) AS mode_count
FROM Bronze.Transactions 
GROUP BY entry_mode;

SELECT device_type,COUNT(*) AS device_count
FROM Bronze.Transactions 
GROUP BY device_type;

SELECT transaction_status,COUNT(*) AS status_count
FROM Bronze.Transactions 
GROUP BY transaction_status;

SELECT is_fraud,COUNT(*) AS is_fraud_count
FROM Bronze.Transactions 
GROUP BY is_fraud;

SELECT *
FROM Bronze.Transactions AS t
LEFT JOIN Bronze.Customers AS c
ON t.customer_id = c.customer_id
WHERE c.customer_id IS NULL;


SELECT t.merchant_id,m.merchant_id
FROM Bronze.Transactions AS t
LEFT JOIN Bronze.Merchants AS m
ON t.merchant_id = m.merchant_id
WHERE m.merchant_id IS NULL;

SELECT customer_id,COUNT(DISTINCT cc_num) AS cc_count
FROM Bronze.Customers
GROUP BY customer_id
HAVING COUNT(DISTINCT cc_num) > 1;
--=============ROWS NUM==============

SELECT COUNT(*) AS TransactionsNum FROM Bronze.Transactions;


--===========================

