USE tech
SHOW TABLES

-- Create a table by the name of courses having field named "CourseID","CourseName","Course_duration_months","CourseFee"
CREATE TABLE Courses(
	CourseID INT AUTO_INCREMENT,
    CourseName VARCHAR(50) NOT NULL,
    Course_duration_months INT NOT NULL,
    CourseFee INT NOT NULL,
    PRIMARY KEY	(CourseID)
    )

INSERT INTO Courses(CourseName,Course_duration_months,CourseFee) VALUES("The Complete Excel Mastery Course",3,1499);
INSERT INTO Courses(CourseName,Course_duration_months,CourseFee) VALUES("DSA For Interview Preparation",2,4999);
INSERT INTO Courses(CourseName,Course_duration_months,CourseFee) VALUES("SQL Bootcamp",1,2999);

CREATE TABLE Learners(
	LearnerID INT AUTO_INCREMENT,
    LearnerFirstName VARCHAR(50) NOT NULL,
    LearnerLastName VARCHAR(50) NOT NULL,
    LearnerPhoneNo VARCHAR(50) NOT NULL,
    LearnerEmailID VARCHAR(50) NOT NULL,
    LearnerEnrollmentDate TIMESTAMP NOT NULL,
    SelectedCourses INT NOT NULL,
    YearOfExperimence INT NOT NULL,x
    LearnerCompany VARCHAR(50),
    SourceOfJoining VARCHAR(50) NOT NULL,
	Batch_Start_Date TIMESTAMP NOT NULL,
    Location VARCHAR(50) NOT NULL,
    PRIMARY KEY(LearnerID),
    UNIQUE KEY(LearnerEmailID),
    FOREIGN KEY(SelectedCourses) REFERENCES Courses(CourseID)
    );
    
    -- insert the details of learners in learners table 
    -- Batch Start date '1'-'2024-02-29'
    -- Batch Start date '2'-'2024-01-16'
    -- Batch Start date '3'-'2024-03-25'
INSERT INTO Learners(LearnerFirstName,LearnerLastName,LearnerPhoneNo,LearnerEmailID,LearnerEnrollmentDate,SelectedCourses,YearOfExperimence,LearnerCompany,SourceOfJoining,Batch_Start_Date,Location) VALUES("Akash","Mishra",8085085255,"akash@gmail.com",'2024-01-21',1,4,"Amazon","Linkeldn",'2024-02-29',"Bengaluru");
INSERT INTO Learners(LearnerFirstName,LearnerLastName,LearnerPhoneNo,LearnerEmailID,LearnerEnrollmentDate,SelectedCourses,YearOfExperimence,LearnerCompany,SourceOfJoining,Batch_Start_Date,Location) VALUES("Rishikesh","Joshi",8005085256,"carjkop@gmail.com",'2024-03-19',3,2,"HCL","Youtube",'2024-03-25',"Chennai");
INSERT INTO Learners(LearnerFirstName,LearnerLastName,LearnerPhoneNo,LearnerEmailID,LearnerEnrollmentDate,SelectedCourses,YearOfExperimence,LearnerCompany,SourceOfJoining,Batch_Start_Date,Location) VALUES("Jeevan","Hegde",8085065450,"jeevanhegde@yahoo.co.in",'2024-01-15',2,0,"Zensar","Linkeldn",'2024-01-16',"Noida");
INSERT INTO Learners(LearnerFirstName,LearnerLastName,LearnerPhoneNo,LearnerEmailID,LearnerEnrollmentDate,SelectedCourses,YearOfExperimence,LearnerCompany,SourceOfJoining,Batch_Start_Date,Location) VALUES("Akhil","George",8078985255,"akhilgeorge@gmail.com",'2024-03-13',3,4,"Accenture","Community",'2024-03-25',"Indore");
INSERT INTO Learners(LearnerFirstName,LearnerLastName,LearnerPhoneNo,LearnerEmailID,LearnerEnrollmentDate,SelectedCourses,YearOfExperimence,LearnerCompany,SourceOfJoining,Batch_Start_Date,Location) VALUES("Sidhish","Kumar",808256255,"sidhiskumar@gmail.com",'2024-01-10',1,4,"Meta","Youtube",'2024-03-29',"Mumbai");
INSERT INTO Learners(LearnerFirstName,LearnerLastName,LearnerPhoneNo,LearnerEmailID,LearnerEnrollmentDate,SelectedCourses,YearOfExperimence,LearnerCompany,SourceOfJoining,Batch_Start_Date,Location) VALUES("NagSai","Sreedhar",8085045655,"saisreedhar@gmail.com",'2024-03-17',3,4,"TCS","Community",'2024-03-25',"Bengaluru");

SELECT * FROM Learners

-- Data Analysis [Employee,Course,Learner]
-- 1.Give me the record of Employee getting highest salary

SELECT * From employee
ORDER BY Salary DESC
LIMIT 1

SELECT * From employee
WHERE Salary=(
	SELECT MAX(Salary)
    FROM employee
)

-- 2. Give me the record of the employee  getting highest salary and age is bigger than 30

SELECT * From employee
WHERE Age> 30
ORDER BY Salary DESC
LIMIT 1

-- 3. Display the number of enrollments in website of tech 

SELECT COUNT(*) as num_of_enrollments
From Learners

-- 4. Display the number of enrollments for the courseID=3 (SQL Bootcamp)

SELECT COUNT(*) as num_of_enrollments_SQL
From Learners
WHERE SelectedCourses=3

-- 5. Count the number of learners enrolled in month of january
SELECT COUNT(*) as num_learners_jan
FROM Learners
WHERE LearnerEnrollmentDate LIKE'%-01-%'

-- 6. Update the jeevan data with years of experience as 1 and Learner company as 'Amazon'

UPDATE  Learners
SET YearOfExperimence=2,LearnerCompany='Amazon'
WHERE LearnerID=4

-- 7. Count the number of companies where Learners currently doing their job
-- Unique count of companies

SELECT COUNT(DISTINCT LearnerCompany) as distinct_companies
From Learners