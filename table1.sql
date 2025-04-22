CREATE TABLE college (
    id INT PRIMARY KEY,
    name VARCHAR NOT NULL,
    address VARCHAR NOT NULL,
    grade VARCHAR DEFAULT 'D',
    isActive BOOLEAN DEFAULT TRUE
);

INSERT INTO college (id, name, address, grade, isActive) VALUES (1, 'col1', 'add1', 'A', TRUE);
INSERT INTO college (id, name, address, grade, isActive) VALUES (2, 'col2', 'add2', 'B', TRUE);
INSERT INTO college (id, name, address, isActive) VALUES (3, 'col3', 'add3', FALSE);
INSERT INTO college (id, name, address) VALUES (4, 'col4', 'add4');
INSERT INTO college VALUES (5, 'col5', 'add5', 'C', TRUE);

SELECT * FROM college;

CREATE TABLE student011 (
    id SERIAL PRIMARY KEY,
    name VARCHAR NOT NULL,
    mob BIGINT DEFAULT 0,
    gender VARCHAR NOT NULL,
    col_id INT,
    CONSTRAINT fk_student_college_id FOREIGN KEY (col_id) REFERENCES college(id)
);

SELECT * FROM student011;

INSERT INTO student011 (name, mob, gender, col_id) VALUES ('std1', 1234567890, 'male', 1);
INSERT INTO student011 (name, mob, gender, col_id) VALUES ('std2', 9876543210, 'female', 2);
INSERT INTO student011 (name, mob, gender, col_id) VALUES ('std3', 5551234567, 'male', 4);
INSERT INTO student011 (name, mob, gender, col_id) VALUES ('Anjali', 9871234560, 'female', 2);

SELECT * FROM student011;