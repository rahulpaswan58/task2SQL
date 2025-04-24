CREATE TABLE student(
    student_id SERIAL PRIMARY KEY,
    name VARCHAR NOT NULL,
    email VARCHAR NOT NULL UNIQUE,
    major VARCHAR
);

INSERT INTO student (name, email, major) VALUES
    ('Aarav Sharma', 'aarav.sharma@example.com', 'Computer Science'),
    ('Priya Patel', 'priya.patel@example.com', 'Engineering'),
    ('Rohan Singh', 'rohan.singh@example.com', 'Business'),
    ('Diya Kumar', 'diya.kumar@example.com', 'Medicine'),
    ('Vikram Verma', 'vikram.verma@example.com', 'Law');

CREATE TABLE courses (
    course_id SERIAL PRIMARY KEY,
    course_name VARCHAR NOT NULL,
    instructor_id INT NOT NULL,
    CONSTRAINT fk_courses_students FOREIGN KEY (instructor_id) REFERENCES students(student_id)
);

INSERT INTO courses (course_name, instructor_id) VALUES
    ('Introduction to Programming', 1),
    ('Data Structures', 1),
    ('Circuit Analysis', 2),
    ('Fluid Mechanics', 2),
    ('Marketing Management', 3),
    ('Corporate Finance', 3),
    ('Human Anatomy', 4),
    ('Organic Chemistry', 4),
    ('Contract Law', 5),
    ('Criminal Law', 5);

CREATE TABLE assignments (
    assignment_id SERIAL PRIMARY KEY,
    assignment_name VARCHAR NOT NULL,
    due_date DATE NOT NULL,
    course_ref_id INT NOT NULL,
    CONSTRAINT fk_assignments_courses FOREIGN KEY (course_ref_id) REFERENCES courses(course_id)
);

INSERT INTO assignments (assignment_name, due_date, course_ref_id) VALUES
    ('Programming Assignment 1', '2025-03-20', 1),
    ('Programming Assignment 2', '2025-04-05', 1),
    ('Circuit Analysis Lab 1', '2025-03-22', 3),
    ('Fluid Mechanics Problem Set 1', '2025-04-01', 4),
    ('Marketing Plan Draft', '2025-03-25', 5),
    ('Financial Statement Analysis', '2025-04-10', 6),
    ('Anatomy Quiz 1', '2025-03-28', 7),
    ('Organic Chemistry Lab Report 1', '2025-04-03', 8),
    ('Contract Law Essay 1', '2025-03-27', 9),
    ('Criminal Law Case Brief 1', '2025-04-12', 10);

SELECT * FROM students;
SELECT * FROM courses;
SELECT * FROM assignments;
