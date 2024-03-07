CREATE TABLE Suppliers (
    supplier_id SERIAL PRIMARY KEY,
    supplier_comp_name VARCHAR(50),
    contact_name VARCHAR(50),
    sup_address VARCHAR(100),
    sup_phone VARCHAR(20),
    sup_email VARCHAR(50));

CREATE TABLE Orders (
    order_id SERIAL PRIMARY KEY,
    order_date DATE,
    supplier_id INTEGER,
    total INTEGER,
    FOREIGN KEY (supplier_id) REFERENCES Suppliers(supplier_id) ON DELETE CASCADE);
	
CREATE TABLE Products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(50),
    description VARCHAR(100),
    unit_price INTEGER,
    weight INTEGER)

CREATE TABLE Order_Details (
    order_detail_id SERIAL PRIMARY KEY,
    order_id INTEGER,
    product_id INTEGER,
    od_quantity INTEGER,
    unit_price INTEGER,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES Products(product_id) ON DELETE CASCADE);

CREATE TABLE Warehouse (
    warehouse_id SERIAL PRIMARY KEY,
    warehouse_name VARCHAR(50),
    ware_address VARCHAR(100));

CREATE TABLE Inventory (
    inventory_id SERIAL PRIMARY KEY,
    warehouse_id INTEGER,
    product_id INTEGER,
    inv_quantity INTEGER,
    FOREIGN KEY (warehouse_id) REFERENCES Warehouse(warehouse_id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES Products(product_id) ON DELETE CASCADE);

CREATE TABLE Supplier_Inventory (
    supplier_id INTEGER,
    inventory_id INTEGER,
    sup_quantity INTEGER,
    PRIMARY KEY (supplier_id, inventory_id),
    FOREIGN KEY (supplier_id) REFERENCES Suppliers (supplier_id),
    FOREIGN KEY (inventory_id) REFERENCES Inventory (inventory_id)
);


-- Drop table order_details
-- drop table Inventory
-- drop table warehouse 
-- drop table orders
-- drop table suppliers
-- drop table products
-- drop table supplier_inventory
