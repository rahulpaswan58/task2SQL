CREATE TABLE Schools (
    SchoolID INT PRIMARY KEY,
    SchoolName VARCHAR(255) NOT NULL,
    SchoolAddress VARCHAR(255) NOT NULL,
    SchoolType VARCHAR(50) DEFAULT 'Public',
    IsActive BOOLEAN DEFAULT TRUE
);

INSERT INTO Schools (SchoolID, SchoolName, SchoolAddress, SchoolType, IsActive) VALUES
(1, 'Sunrise High School', '123 Main St, Anytown', 'Public', TRUE),
(2, 'Sunset Private School', '456 Oak Ave, Somecity', 'Private', TRUE),
(3, 'City Charter School', '789 Pine Ln, Othertown', 'Charter', FALSE),
(4, 'Green Valley School', '101 Elm St, Villagetown', 'Public', TRUE);

SELECT * FROM Schools;

CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    FirstName VARCHAR(100) NOT NULL,
    LastName VARCHAR(100) NOT NULL,
    DateOfBirth DATE NOT NULL,
    Gender VARCHAR(10) NOT NULL,
    SchoolID INT,
    GradeLevel INT NOT NULL,
    CONSTRAINT FK_Student_SchoolID FOREIGN KEY (SchoolID) REFERENCES Schools(SchoolID),
    CONSTRAINT CHK_GradeLevel CHECK (GradeLevel BETWEEN 1 AND 12),  -- Added grade level constraint
    CONSTRAINT CHK_Gender CHECK (Gender IN ('Male', 'Female', 'Other'))
);

INSERT INTO Students (StudentID, FirstName, LastName, DateOfBirth, Gender, SchoolID, GradeLevel) VALUES
(101, 'Priya', 'Sharma', '2005-08-15', 'Female', 1, 10),
(102, 'Rahul', 'Verma', '2006-03-20', 'Male', 1, 9),
(103, 'Anika', 'Patel', '2007-11-01', 'Male', 2, 8),
(104, 'Arjun', 'Reddy', '2004-06-10', 'Female', 1, 11),
(105, 'Diya', 'Kapoor', '2008-09-22', 'Male', 3, 7),
(106, 'Aryan', 'Singh', '2005-12-05', 'Female', 2, 10);

SELECT * FROM Students;

CREATE TABLE Teachers (
    TeacherID INT PRIMARY KEY,
    FirstName VARCHAR(100) NOT NULL,
    LastName VARCHAR(100) NOT NULL,
    SubjectTaught VARCHAR(100) NOT NULL,
    SchoolID INT,
    HireDate DATE NOT NULL,
    CONSTRAINT FK_Teacher_SchoolID FOREIGN KEY (SchoolID) REFERENCES Schools(SchoolID)
);

INSERT INTO Teachers (TeacherID, FirstName, LastName, SubjectTaught, SchoolID, HireDate) VALUES
(201, 'Meera', 'Sharma', 'Mathematics', 1, '2020-08-01'),
(202, 'Amit', 'Verma', 'Science', 1, '2018-09-01'),
(203, 'Pooja', 'Patel', 'English', 2, '2022-01-15'),
(204, 'Raj', 'Reddy', 'History', 2, '2021-05-01');

SELECT * FROM Teachers;

CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(255) NOT NULL,
    Credits INT NOT NULL,
    TeacherID INT,
    SchoolID INT,
    CONSTRAINT FK_Course_TeacherID FOREIGN KEY (TeacherID) REFERENCES Teachers(TeacherID),
    CONSTRAINT FK_Course_SchoolID FOREIGN KEY (SchoolID) REFERENCES Schools(SchoolID)
);

INSERT INTO Courses (CourseID, CourseName, Credits, TeacherID, SchoolID) VALUES
(301, 'Algebra I', 3, 201, 1),
(302, 'Biology', 4, 202, 1),
(303, 'World Literature', 3, 203, 2),
(304, 'US History', 4, 204, 2),
(305, 'Geometry', 3, 201, 1),
(306, 'Chemistry', 4, 202, 1);

SELECT * FROM Courses;

CREATE TABLE Enrollment (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT NOT NULL,
    CourseID INT NOT NULL,
    EnrollmentDate DATE NOT NULL,
    Grade VARCHAR(2),
    CONSTRAINT FK_Enrollment_StudentID FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    CONSTRAINT FK_Enrollment_CourseID FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

INSERT INTO Enrollment (EnrollmentID, StudentID, CourseID, EnrollmentDate, Grade) VALUES
(401, 101, 301, '2024-01-10', 'A'),
(402, 101, 302, '2024-01-10', 'B'),
(403, 102, 302, '2024-01-15', 'C'),
(404, 103, 303, '2024-01-20', 'A'),
(405, 104, 301, '2024-01-25', 'B+'),
(406, 105, 304, '2024-02-01', 'A-'),
(407, 106, 301, '2024-02-05', 'A');

SELECT * FROM Enrollment;

