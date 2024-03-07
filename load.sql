-- Insert data into Suppliers table
INSERT INTO Suppliers (supplier_comp_name, contact_name, sup_address,sup_phone, sup_email)
SELECT DISTINCT supplier_comp_name, contact_name, sup_address,sup_phone, sup_email
FROM rawtable;

-- Insert data into Products table
INSERT INTO Products (product_name, description, unit_price, weight)
SELECT DISTINCT product_name, description, unit_price, weight
FROM rawtable 

-- Insert data into Orders and Order_Details tables
INSERT INTO Orders (order_date, supplier_id, total)
SELECT DISTINCT order_date, s.supplier_id, total
FROM rawtable r
INNER JOIN Suppliers s ON r.supplier_comp_name = s.supplier_comp_name;

INSERT INTO Order_Details (order_id, product_id, od_quantity, unit_price)
SELECT o.order_id, p.product_id, o.total as od_quantity, p.unit_price
FROM rawtable r
INNER JOIN Products p ON r.product_name = p.product_name
INNER JOIN Orders o ON r.order_id = o.order_id;

-- Insert data into Warehouse and Inventory tables
INSERT INTO Warehouse (warehouse_name, ware_address)
SELECT DISTINCT warehouse_name, ware_address
FROM rawtable;

INSERT INTO Inventory (warehouse_id, product_id, inv_quantity)
SELECT DISTINCT w.warehouse_id, p.product_id, sum(total)*2 as inv_quantity
FROM rawtable r
INNER JOIN Warehouse w ON r.warehouse_name = w.warehouse_name
INNER JOIN Products p ON r.product_name = p.product_name
GROUP BY w.warehouse_id, p.product_id;

-- Insert data into Supplier_Inventory table
INSERT INTO Supplier_Inventory (supplier_id, inventory_id, sup_quantity)
SELECT DISTINCT s.supplier_id, i.inventory_id, sum(r.total) as sup_quantity
FROM rawtable r
INNER JOIN Suppliers s ON r.supplier_comp_name = s.supplier_comp_name
INNER JOIN Products p ON r.product_name = p.product_name
INNER JOIN Inventory i ON p.product_id = i.product_id
GROUP BY s.supplier_id, i.inventory_id;



