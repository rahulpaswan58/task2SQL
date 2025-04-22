CREATE TABLE students (
    student_id SERIAL PRIMARY KEY,
    name VARCHAR NOT NULL,
    email VARCHAR NOT NULL UNIQUE,
    major VARCHAR
);

INSERT INTO students (name, email, major)
VALUES
    ('Aarav Sharma', 'aarav.sharma@example.com', 'Computer Science'),
    ('Priya Patel', 'priya.patel@example.com', 'Engineering'),
    ('Rohan Singh', 'rohan.singh@example.com', 'Business'),
    ('Diya Kumar', 'diya.kumar@example.com', 'Medicine'),
    ('Vikram Verma', 'vikram.verma@example.com', 'Law');

CREATE TABLE enrollments (
    enrollment_id SERIAL,
    course_name VARCHAR NOT NULL,
    student_id INT,
    CONSTRAINT fk_student_enrollments FOREIGN KEY (student_id) REFERENCES students(student_id)
);

INSERT INTO enrollments (enrollment_id, course_name, student_id)
VALUES
    (101, 'Introduction to Programming', 1),
    (102, 'Data Structures', 1),
    (103, 'Circuit Analysis', 2),
    (104, 'Fluid Mechanics', 2),
    (105, 'Marketing Management', 3),
    (106, 'Corporate Finance', 3),
    (107, 'Human Anatomy', 4),
    (108, 'Organic Chemistry', 4),
    (109, 'Contract Law', 5),
    (110, 'Criminal Law', 5);

SELECT * FROM students;
SELECT * FROM enrollments;
