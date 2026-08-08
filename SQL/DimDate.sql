-- DimDate
CREATE TABLE Gold.DimDate(
datekey INT NOT NULL PRIMARY KEY ,
full_date DATE NOT NULL,
[year] INT NOT NULL,
[quarter] INT NOT NULL,
[month] INT NOT NULL,
month_name VARCHAR(20) NOT NULL,
[day] INT NOT NULL,
day_name VARCHAR(20) NOT NULL,
is_weekend BIT NOT NULL );
GO

DECLARE @start_date DATE ,@end_date DATE ,@current_date DATE


SELECT 
@start_date = MIN(trans_date_trans_time),
@end_date = MAX(trans_date_trans_time)
FROM Silver.Transactions;
SET @current_date = @start_date
SELECT @start_date , @end_date ,@current_date

WHILE  @current_date <= @end_date
BEGIN 
INSERT INTO Gold.DimDate(
datekey ,
full_date ,
[year] ,
[quarter] ,
[month] ,
month_name ,
[day],
day_name,
is_weekend)
VALUES(
CAST(FORMAT(@current_date , 'yyyyMMdd') AS INT),
@current_date,
YEAR(@current_date),
DATEPART(QUARTER,@current_date),
MONTH(@current_date),
DATENAME(MONTH,@current_date),
DAY(@current_date),
DATENAME(WEEKDAY,@current_date),
CASE 
    WHEN DATEPART(WEEKDAY,@current_date) IN (1,7)
    THEN 1 ELSE 0 
END
);
SET @current_date = DATEADD(DAY,1 ,@current_date)
END;

SELECT * FROM Gold.DimDate;