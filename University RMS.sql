-- Database Development for a University's new Student Records Management System (RMS)

--Create the students table. Students should have unique student emails and phone numbers.
CREATE TABLE students(
	student_id INT PRIMARY KEY IDENTITY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	date_of_birth DATE,
	email VARCHAR(100) UNIQUE,
	phone_number VARCHAR(15) UNIQUE
);

SELECT * FROM students;

-- Create the Courses Table
CREATE TABLE courses(
	course_id INT PRIMARY KEY IDENTITY,
	course_code VARCHAR(10) UNIQUE NOT NULL, -- The course codes should be unique to a course and must not be empty
	course_title VARCHAR(100) NOT NULL, -- The course title must not be empty
	credit_units INT NOT NULL --The credit units must not be empty
);


SELECT * FROM courses

--Create the enrollments table
CREATE TABLE enrolments(
	enrolment_id INT PRIMARY KEY IDENTITY, 
	student_ID INT REFERENCES students(student_ID),-- the students who enrolled.
	course_ID INT REFERENCES courses(course_ID), -- the courses the students are taking.
	grade CHAR(2) NULL
);

SELECT * FROM enrolments;

ALTER TABLE students
ADD registration_date DATE; -- added a new column, registration date to the students table.

SELECT * FROM students; -- to check if the students table came out as proposed.

ALTER TABLE courses
ADD department VARCHAR(50); -- added a new column called department to the courses table (designates which department is offering the course)

SELECT * FROM courses; -- to cross-check if the courses table is accurately designed.

DROP TABLE enrolments; -- the University Management no longer needs the enrolment table

ALTER TABLE students
ADD CONSTRAINT chk_student_age
CHECK (DATEDIFF(YEAR, date_of_birth, GETDATE()) >=18);

/*The CHECK constraint ensures that students must be at least 18 years when they enrol.
DATEDIFF is a SQL Server function that calculates the difference between two dates.
Syntax is DATEDIFF(datepart, startdate, enddate), where datepart is the unit of time (Year, Month, Day)
YEAR is also a SQL Server function to extract the year from a given date.
*/




