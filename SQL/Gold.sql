--DIMUSER
SELECT *
INTO Gold.DimCustomers
FROM Silver.Customers;

SELECT * FROM Gold.DimCustomers
ALTER TABLE Gold.DimCustomers ALTER COLUMN customer_id INT NOT NULL;
ALTER TABLE Gold.DimCustomers ADD CONSTRAINT PK_Dimcustomer PRIMARY KEY(customer_id );
  ----DimMerchant

SELECT *
INTO Gold.DimMerchants
FROM Silver.Merchants;

SELECT * FROM Gold.DimMerchants
ALTER TABLE Gold.DimMerchants ALTER COLUMN merchant_id INT NOT NULL;
ALTER TABLE Gold.DimMerchants ADD CONSTRAINT PK_DimMerchant PRIMARY KEY(merchant_id );



--FactTransaction
SELECT 
transaction_id,
CAST(FORMAT([trans_date_trans_time],'yyyyMMdd')AS INT) AS date_key ,
trans_year,trans_month,customer_id,TRY_CAST(merchant_id  AS INT) AS merchant_id ,
category,amt,tax_amt,discount_amt,currency,
payment_method,channel,entry_mode,device_type,
transaction_status,trans_num,session_id,unix_time,
is_fraud

INTO Gold.FactTransaction
FROM [Silver].[Transactions];

ALTER TABLE Gold.FactTransaction ALTER COLUMN transaction_id INT NOT NULL;
ALTER TABLE Gold.FactTransaction ADD CONSTRAINT PK_FactTransaction PRIMARY KEY(transaction_id );

--- ForeignKeys
ALTER TABLE Gold.FactTransaction 
ADD CONSTRAINT FK_Fact_DimDate FOREIGN KEY (date_key)
REFERENCES Gold.DimDate (Datekey);

ALTER TABLE Gold.FactTransaction 
ADD CONSTRAINT FK_DimCustomers FOREIGN KEY (customer_id)
REFERENCES Gold.DimCustomers (customer_id);

ALTER TABLE Gold.FactTransaction
ADD CONSTRAINT FK_DimMerchants FOREIGN KEY (merchant_id)
REFERENCES Gold.DimMerchants(merchant_id);


CREATE INDEX IX_Fact_DateKey ON Gold.FactTransaction (date_key);
CREATE INDEX IX_Fact_CustomerId ON Gold.FactTransaction (customer_id)
CREATE INDEX IX_Fact_MerchantId ON Gold.FactTransaction (merchant_id)

SELECT* 
FROM Silver.Transactions;

