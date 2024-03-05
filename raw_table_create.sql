CREATE TABLE rawtable (
  orderid INTEGER PRIMARY KEY,
  order_date DATE,
  sup_comp_name VARCHAR(50),
  sup_contact_name VARCHAR(50),
  sup_address VARCHAR(100),
  sup_phonenumber VARCHAR(20),
  sup_email VARCHAR(50),
  product_name VARCHAR(50),
  product_desc VARCHAR(100),
  product_quantity INTEGER,
  prod_unitprice INTEGER,
  prod_weight INTEGER,
  warehouse_name VARCHAR(50),
  warehouse_address VARCHAR(100)
);
