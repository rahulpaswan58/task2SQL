CREATE TABLE departments (
    department_id SERIAL PRIMARY KEY,
    department_name VARCHAR NOT NULL UNIQUE,
    location VARCHAR
);

INSERT INTO departments (department_name, location)
VALUES
    ('Sales', 'Mumbai'),
    ('Marketing', 'Delhi'),
    ('Engineering', 'Bangalore'),
    ('Finance', 'Mumbai'),
    ('HR', 'Delhi');

CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,
    first_name VARCHAR NOT NULL,
    last_name VARCHAR NOT NULL,
    email VARCHAR UNIQUE,
    phone_number VARCHAR,
    hire_date DATE,
    job_id VARCHAR,
    salary DECIMAL(10, 2),
    department_id INTEGER,
    CONSTRAINT fk_employee_department FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

INSERT INTO employees (first_name, last_name, email, phone_number, hire_date, job_id, salary, department_id)
VALUES
    ('Amit', 'Sharma', 'amit.sharma@example.com', '9876543210', '2023-08-15', 'Sales Manager', 60000.00, 1),
    ('Priya', 'Verma', 'priya.verma@example.com', '8765432109', '2022-11-20', 'Marketing Analyst', 55000.00, 2),
    ('Rahul', 'Kumar', 'rahul.kumar@example.com', '7654321098', '2024-01-10', 'Software Engineer', 70000.00, 3),
    ('Deepika', 'Gupta', 'deepika.gupta@example.com', '6543210987', '2023-05-01', 'Accountant', 58000.00, 4),
    ('Suresh', 'Yadav', 'suresh.yadav@example.com', '5432109876', '2024-03-25', 'HR Specialist', 52000.00, 5),
    ('Neha', 'Singh', 'neha.singh@example.com', '9988776655', '2023-09-01', 'Sales Representative', 48000.00, 1),
    ('Vikram', 'Patel', 'vikram.patel@example.com', '8877665544', '2022-07-01', 'Marketing Manager', 65000.00, 2);

SELECT * FROM departments;
SELECT * FROM employees;