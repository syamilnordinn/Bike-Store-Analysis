--Define foreign key in order table
ALTER TABLE portfolioproject.dbo.orders
ADD CONSTRAINT fk_orders_customers
FOREIGN KEY (customer_id) REFERENCES customers(customer_id);

ALTER TABLE portfolioproject.dbo.orders
ADD CONSTRAINT fk_orders_stores
FOREIGN KEY (store_id) REFERENCES stores(store_id);

ALTER TABLE portfolioproject.dbo.orders
ADD CONSTRAINT fk_orders_staffs
FOREIGN KEY (staff_id) REFERENCES staffs(staff_id);

--Define foreign key in staffs table
ALTER TABLE portfolioproject.dbo.staffs
ADD CONSTRAINT fk_staffs_stores
FOREIGN KEY (staff_id) REFERENCES staffs(staff_id);

--Define foreign key in order_items table
ALTER TABLE portfolioproject.dbo.order_items
ADD CONSTRAINT fk_orderitems_orders
FOREIGN KEY (order_id) REFERENCES orders(order_id);

ALTER TABLE portfolioproject.dbo.order_items
ADD CONSTRAINT fk_orderitems_products
FOREIGN KEY (product_id) REFERENCES products(product_id);

--Define foreign key in products table
ALTER TABLE portfolioproject.dbo.products
ADD CONSTRAINT fk_products_brands
FOREIGN KEY (brand_id) REFERENCES brands(brand_id);

ALTER TABLE portfolioproject.dbo.products
ADD CONSTRAINT fk_products_categories
FOREIGN KEY (category_id) REFERENCES categories(category_id);

--Define foreign key in stocks table
ALTER TABLE portfolioproject.dbo.stocks
ADD CONSTRAINT fk_stocks_stores
FOREIGN KEY (store_id) REFERENCES stores(store_id);

ALTER TABLE portfolioproject.dbo.stocks
ADD CONSTRAINT fk_stocks_products
FOREIGN KEY (product_id) REFERENCES products(product_id);







