CREATE TABLE hospitals (
    hospital_id SERIAL PRIMARY KEY,
    hospital_name VARCHAR NOT NULL,
    location VARCHAR NOT NULL
);

INSERT INTO hospitals (hospital_name, location) VALUES
    ('Apollo Hospital', 'Chennai'),
    ('AIIMS Delhi', 'Delhi'),
    ('CMC Vellore', 'Vellore'),
    ('KEM Hospital', 'Mumbai'),
    ('NIMHANS Bangalore', 'Bangalore');

CREATE TABLE departments (
    department_id SERIAL PRIMARY KEY,
    department_name VARCHAR NOT NULL,
    hospital_ref INT,
    CONSTRAINT fk_departments_hospitals FOREIGN KEY (hospital_ref) REFERENCES hospitals(hospital_id)
);

INSERT INTO departments (department_name, hospital_ref) VALUES
    ('Cardiology', 1),
    ('Oncology', 2),
    ('Neurology', 3),
    ('Pediatrics', 4),
    ('Psychiatry', 5);

CREATE TABLE doctors (
    doctor_id SERIAL PRIMARY KEY,
    doctor_name VARCHAR NOT NULL,
    department_ref INT,
    CONSTRAINT fk_doctors_departments FOREIGN KEY (department_ref) REFERENCES departments(department_id)
);

INSERT INTO doctors (doctor_name, department_ref) VALUES
    ('Dr. Ramakrishnan', 1),
    ('Dr. Sharma', 2),
    ('Dr. Rao', 3),
    ('Dr. Patel', 4),
    ('Dr. Singh', 5);

CREATE TABLE patients (
    patient_id SERIAL PRIMARY KEY,
    patient_name VARCHAR NOT NULL,
    hospital_ref INT,
    CONSTRAINT fk_patients_hospitals FOREIGN KEY (hospital_ref) REFERENCES hospitals(hospital_id)
);

INSERT INTO patients (patient_name, hospital_ref) VALUES
    ('Arun Kumar', 1),
    ('Priya Desai', 2),
    ('Rohan Reddy', 3),
    ('Sneha Kapoor', 4),
    ('Vikram Singh', 5);

CREATE TABLE appointments (
    appointment_id SERIAL PRIMARY KEY,
    patient_ref INT,
    doctor_ref INT,
    appointment_date DATE NOT NULL,
    CONSTRAINT fk_appointments_patients FOREIGN KEY (patient_ref) REFERENCES patients(patient_id),
    CONSTRAINT fk_appointments_doctors FOREIGN KEY (doctor_ref) REFERENCES doctors(doctor_id)
);

INSERT INTO appointments (patient_ref, doctor_ref, appointment_date) VALUES
    (1, 1, '2025-05-01'),
    (2, 2, '2025-05-03'),
    (3, 3, '2025-05-05'),
    (4, 4, '2025-05-07'),
    (5, 5, '2025-05-09');

SELECT * FROM hospitals;
SELECT * FROM departments;
SELECT * FROM doctors;
SELECT * FROM patients;
SELECT * FROM appointments;
