CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    first_name VARCHAR NOT NULL,
    last_name VARCHAR NOT NULL,
    email VARCHAR UNIQUE,
    phone_number VARCHAR,
    address VARCHAR
);

INSERT INTO customers (first_name, last_name, email, phone_number, address)
VALUES
    ('Priya', 'Sharma', 'priya.sharma@example.com', '9876543210', '123 Main St, Anytown'),
    ('Amit', 'Verma', 'amit.verma@example.com', '8765432109', '456 Oak Ave, Somecity'),
    ('Sneha', 'Patel', 'sneha.patel@example.com', '7654321098', '789 Pine Ln, Otherville'),
    ('Rohan', 'Jadhav', 'rohan.jadhav@example.com', '6543210987', '101 Elm Rd, Anytown'),
    ('Kavita', 'Deshmukh', 'kavita.deshmukh@example.com', '5432109876', '222 Willow Dr, Somecity');

CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    order_date DATE NOT NULL,
    total_amount DECIMAL(10, 2) NOT NULL,
    customer_id INTEGER,
    CONSTRAINT fk_order_customer FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO orders (order_date, total_amount, customer_id)
VALUES
    ('2024-04-01', 125.50, 1),
    ('2024-04-05', 78.99, 3),
    ('2024-04-10', 210.00, 1),
    ('2024-04-12', 45.75, 2),
    ('2024-04-18', 92.20, 4),
    ('2024-04-20', 155.80, 1),
    ('2024-04-25', 300.50, 5),
    ('2024-04-28', 61.15, 3);

SELECT * FROM customers;
SELECT * FROM orders;