          DATA GENERATION
We used a custom python code with faker to generate the production dataset and

we built the tables with the above-mentioned schema.
Here we generated 1000 rows of supplier data, ,5000 rows products data, 200000
rows of orders data and 1000 order dates then we created 7 different tables 
using data. Now the raw data generated from the above faker consists of 
200,000 rows of data. 

Now the inventory table consists of 1,92,286 rows of data, the order details
table consists of 1,99,912 tuples of data, the order table contains 1,99,912
tuples of data. The products table contains 5000 rows of data, the supplier 
inventory table consists of 77,14,112 rows of data (here we got huge amounts
of data in one table because we combined two different foreign keys to act 
as a primary key.), the supplier table consists of 1000 rows of data and 
the warehouses table consists of 500 rows of data. 

We attached the custom python code that we used to generate the data in the
zip file.


--
We have to inject the data into postgre and then to create the raw data table
we have to run the raw data sql file and then to create tables respectively, we
have to run the create.sql file.