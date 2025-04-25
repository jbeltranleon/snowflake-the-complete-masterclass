-- Rename data base & creating the table + meta data

ALTER DATABASE FIRST_DB RENAME TO OUR_FIRST_DB;

CREATE TABLE "OUR_FIRST_DB"."PUBLIC"."LOAN_PAYMENT" (
    "Loan_ID" STRING,
    "loan_status" STRING,
    "Principal" STRING,
    "terms" STRING,
    "effective_date" STRING,
    "due_date" STRING,
    "paid_off_time" STRING,
    "past_due_days" STRING,
    "age" STRING,
    "education" STRING,
    "Gender" STRING);


-- Check that table is empy
USE DATABASE OUR_FIRST_DB;

SELECT * FROM LOAN_PAYMENT;


-- Loading the data from S3 bucket

COPY INTO LOAN_PAYMENT
FROM s3://bucketsnowflakes3/Loan_payments_data.csv
file_format = (type = csv
               field_delimiter = ','
               skip_header=1);


-- Validate
SELECT * FROM LOAN_PAYMENT;


-- ASSESSMENT

CREATE OR REPLACE DATABASE COMPANY;
CREATE OR REPLACE SCHEMA COMPANY.RAW;

CREATE OR REPLACE TABLE COMPANY.RAW.CUSTOMERS (
    ID INT,
    first_name varchar,
    last_name varchar,
    email varchar,
    age int,
    city varchar
)
COMMENT = 'The company customers table';

COPY INTO COMPANY.RAW.CUSTOMERS
FROM s3://snowflake-assignments-mc/gettingstarted/customers.csv
file_format = (type = csv
               field_delimiter = ','
               skip_header=1);

SELECT COUNT(*) FROM COMPANY.RAW.CUSTOMERS;




