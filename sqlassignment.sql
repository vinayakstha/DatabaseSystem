create database schoolDatabase;
use schoolDatabase;

CREATE TABLE Teachers (
    Teacher_id INT PRIMARY KEY,
    TeacherName VARCHAR(255),
    DateOfBirth DATE,
    Gender VARCHAR(255),
    Phone VARCHAR(255),
    Salary VARCHAR(255),
    address_id INT,
    FOREIGN KEY (address_id) REFERENCES address(address_id)
);

create table address(
address_id int primary key,
City VARCHAR(255),
    WardNo INT,
    District VARCHAR(255),
    Province VARCHAR(255)
);

INSERT INTO address (address_id, City, WardNo, District, Province) VALUES
(1, 'Tansen', 8, 'Palpa', 'Lumbini'),
(2, 'Bhairahawa', 1, 'Rupandehi', 'Lumbini'),
(3, 'Butwal', 12, 'Rupandehi', 'Lumbini'),
(4, 'Butwal', 12, 'Rupandehi', 'Lumbini'),
(5, 'Tansen', 8, 'Palpa', 'Lumbini');

-- Inserting addresses from Students table
INSERT INTO address (address_id, City, WardNo, District, Province) VALUES
(6, 'Butwal', 10, 'Rupandehi', 'Lumbini'),
(7, 'Taulihawa', 5, 'Kapilvastu', 'Lumbini'),
(8, 'Siddharthanagar', 12, 'Rupandehi', 'Lumbini');


select * from address;

INSERT INTO Teachers (Teacher_id, TeacherName, DateOfBirth, Gender, Phone, Salary, address_id) VALUES
(1, 'Ashok Aryal', '1980-09-05', 'Male', '9867389098', 'NPR 40,000', 1),
(2, 'Basanta Poudel', '1975-04-25', 'Male', '9876787887', 'NPR 45,000', 2),
(3, 'Lekhnath Panta', '1985-01-28', 'Male', '9856788993', 'NPR 60,000', 3),
(4, 'Roman Shrestha', '1990-06-02', 'Male', '9843678567', 'NPR 55,000', 4),
(5, 'Ritika Banjade', '1992-05-11', 'Female', '9841678939', 'NPR 50,000', 5);

select * from Teachers;

CREATE TABLE Students (
    Student_id INT PRIMARY KEY,
    StudentName VARCHAR(255),
    DateOfBirth DATE,
    Gender VARCHAR(50),
    guardian_id INT,
    address_id INT,
    FOREIGN KEY (guardian_id) REFERENCES Guardians(guardian_id),
    FOREIGN KEY (address_id) REFERENCES address(address_id)
);
-- Insert data into the Students table with correct guardian_id and address_id
INSERT INTO Students (Student_id, StudentName, DateOfBirth, Gender, guardian_id, address_id) VALUES
(101, 'Ramesh Acharya', '2005-03-15', 'Male', 1, 6),
(102, 'Sita Sharma', '2006-06-20', 'Female', 2, 7),
(103, 'Asha Rai', '2004-11-10', 'Female', 3, 8);

select * from students;

CREATE TABLE Guardians (
    guardian_id INT PRIMARY KEY,
    GuardianName VARCHAR(255),
    GuardianPhone VARCHAR(20)
);

-- Insert data into the Guardians table
INSERT INTO Guardians (guardian_id, GuardianName, GuardianPhone) VALUES
(1, 'Gita Acharya', '9847011111'),
(2, 'Ram Sharma', '9816412121'),
(3, 'Hari Rai', '9867066700');

select * from Guardians;

CREATE TABLE Attendance (
    Attendance_id INT PRIMARY KEY,
    Student_id INT,
    Date DATE,
    Status VARCHAR(50)
);

INSERT INTO Attendance 
VALUES 
    (1, 101, '2023-07-01', 'Present'),
    (2, 102, '2023-07-02', 'Absent'),
    (3, 103, '2023-07-03', 'Present'),
    (4, 101, '2023-07-01', 'Present'),
    (5, 102, '2023-07-02', 'Present'),
    (6, 103, '2023-07-03', 'Absent');

select * from Attendance;

CREATE TABLE Fees (
    Fees_id INT PRIMARY KEY,
    Class_id VARCHAR(10),
    Class VARCHAR(50),
    Amount VARCHAR(50)
);

INSERT INTO Fees 
VALUES 
    (1, 'NUR', 'Nursery', 'NPR 1,500'),
    (2, 'KG', 'KG', 'NPR 2,000'),
    (3, '1', '1', 'NPR 2,500'),
    (4, '2', '2', 'NPR 3,000'),
    (5, '3', '3', 'NPR 3,500'),
    (6, '4', '4', 'NPR 4,000'),
    (7, '5', '5', 'NPR 4,500'),
    (8, '6', '6', 'NPR 5,000'),
    (9, '7', '7', 'NPR 5,500'),
    (10, '8', '8', 'NPR 6,000'),
    (11, '9', '9', 'NPR 6,500'),
    (12, '10', '10', 'NPR 7,000');

select * from Fees;

CREATE TABLE Payment (
    Payment_id INT PRIMARY KEY,
    Student_id INT,
    Amount VARCHAR(50),
    PaymentDate DATE
);

INSERT INTO Payment 
VALUES 
(1, 101, 'NPR 5,500', '2080-04-10'),
(2, 102, 'NPR 6,500', '2080-04-10'),
(3, 103, 'NPR 5,500', '2080-04-05');

select * from Payment;


CREATE TABLE Subject (
    Subject_id INT PRIMARY KEY,
    SubjectName VARCHAR(255),
    Class_id INT
);

INSERT INTO Subject 
VALUES 
(1, 'Mathematics', 10),
(2, 'Science', 10),
(3, 'English', 9),
(4, 'Social Studies', 9);

select * from Subject;

CREATE TABLE Results (
    Result_id INT PRIMARY KEY,
    Student_id INT,
    ExamName VARCHAR(255),
    Date DATE,
    Score INT
);

INSERT INTO Results 
VALUES 
    (1, 101, 'Mathematics', '2023-06-15', 85),
    (2, 102, 'Science', '2023-06-20', 78),
    (3, 103, 'Nepali', '2023-06-25', 92),
    (4, 102, 'Sanskrit', '2023-06-15', 78),
    (5, 103, 'English', '2023-06-20', 90),
    (6, 103, 'Mathematics', '2023-06-25', 65);

select * from Results;


SELECT
    Student_id,
    ExamName,
    SUM(Score) AS TotalMarks,
    ROUND((SUM(Score) * 100.0 / (SELECT SUM(Score) FROM Results)), 2) AS Percentage
FROM Results
GROUP BY Student_id, ExamName
ORDER BY Student_id, ExamName;


SELECT
    Student_id,
    SUM(Score) AS TotalMarks
FROM Results
GROUP BY Student_id
ORDER BY Student_id;




CREATE TABLE Events (
    Event_id INT PRIMARY KEY,
    EventName VARCHAR(255),
    Date DATE,
    Location VARCHAR(255)
);

INSERT INTO Events 
VALUES 
    (1, 'Annual Day', '2023-08-10', 'School Grounds'),
    (2, 'Sports Day', '2023-09-20', 'Sports Complex'),
    (3, 'Science Fair', '2023-10-15', 'Science Lab'),
    (4, 'Parent-Teacher Meeting', '2023-07-30', 'School Auditorium');
    
select * from Events;


CREATE TABLE LibraryRecords (
    RecordID INT PRIMARY KEY,
    Student_id INT,
    BookTitle VARCHAR(255),
    Author VARCHAR(255),
    IssueDate DATE,
    ReturnDate DATE
);

INSERT INTO LibraryRecords 
VALUES 
    (1, 103, 'Java the complete reference (12th edition)', 'Herbert Schildt', '2023-07-05', '2023-07-20'),
    (2, 102, 'Spidering HACKS', 'Tara Calishain', '2023-06-30', '2023-07-10'),
    (3, 103, 'Windows System Programming', 'Johnson M. Hart', '2023-07-10', '2023-07-25'),
    (4, 103, 'C# in Depth', 'Jon Skeet', '2023-07-15', '2023-07-25');

select * from LibraryRecords;

CREATE TABLE Class (
    Class_id INT PRIMARY KEY,
    Class VARCHAR(255)
);


INSERT INTO Class (Class_id, Class)
VALUES
    (1, 'Nursery'),
    (2, 'KG'),
    (3, '1'),
    (4, '2'),
    (5, '3'),
    (6, '4'),
    (7, '5'),
    (8, '6'),
    (9, '7'),
    (10, '8'),
    (11, '9'),
    (12, '10');

select * from Class;
select * from fees;

UPDATE Fees
SET amount = CONCAT('NPR ', 
CAST(REPLACE(TRIM(REPLACE(amount, 'NPR ', '')),
 ',', '') * 1.2 AS DECIMAL(10, 2)));

select * from Fees;


select * from Attendance;

TRUNCATE table Attendance;

insert into Attendance
values(9, 103, '2023-07-24', 'Present');

insert into Address
Values(9,"Kathmandu",3,"Kathmandu","Bagmati");

insert into Guardians
Values(4,"Vinayak Shrestha","9808880750");

insert into Students
Values(104,"Cristiano Ronaldo","2004-09-23","Male",4,9);
select * from Students;
select * from Guardians;
select * from Address;


select * from Attendance;

SELECT 
    r.Student_id,
    s.StudentName,
    r.ExamName,
    SUM(r.Score) AS TotalMarks,
    ROUND((SUM(r.Score) * 100.0 / (SELECT SUM(Score) FROM Results WHERE Student_id = r.Student_id)), 2) 
AS Percentage
FROM 
    Results r
JOIN 
    Students s ON r.Student_id = s.Student_id
GROUP BY 
    r.Student_id, s.StudentName, r.ExamName
ORDER BY 
    r.Student_id, r.ExamName;

SELECT 
    r.Student_id,
    s.StudentName,
    SUM(r.Score) AS TotalMarks,
    ROUND((SUM(r.Score) * 100.0 / (SELECT SUM(Score) FROM Results)), 2) AS OverallPercentage
FROM 
    Results r
JOIN 
    Students s ON r.Student_id = s.Student_id
GROUP BY 
    r.Student_id, s.StudentName
ORDER BY 
    r.Student_id;
    

START TRANSACTION;

UPDATE Results
SET Score = Score * 0.90;

COMMIT;

SELECT * FROM Results;

SELECT 
    Students.StudentName,
    Results.ExamName,
    Results.Score,
    Subject.SubjectName,
    Guardians.GuardianName
FROM 
    Students
JOIN 
    Results ON Students.Student_id = Results.Student_id
JOIN 
    Subject ON Results.ExamName = Subject.SubjectName
JOIN 
    Guardians ON Students.guardian_id = Guardians.guardian_id
WHERE 
    Results.Score > 70
ORDER BY 
    Students.StudentName, Results.ExamName;
    
    
delete from attendance 
where Attendance_id = 9;
select * from Students;

-- Question 4
-- Insert Absent records for 10 consecutive days
INSERT INTO Attendance (Attendance_id, Student_id, Date, Status) VALUES
(9, 104, '2023-07-01', 'Absent'),
(10, 104, '2023-07-02', 'Absent'),
(11, 104, '2023-07-03', 'Absent'),
(12, 104, '2023-07-04', 'Absent'),
(13, 104, '2023-07-05', 'Absent'),
(14, 104, '2023-07-06', 'Absent'),
(15, 104, '2023-07-07', 'Absent'),
(16, 104, '2023-07-08', 'Absent'),
(17, 104, '2023-07-09', 'Absent'),
(18, 104, '2023-07-10', 'Absent');


CREATE TEMPORARY TABLE TempConsecutiveAbsences AS
SELECT 
    ca.Student_id,
    MIN(ca.Date) AS StartDate,
    MAX(ca.Date) AS EndDate,
    COUNT(*) AS ConsecutiveDays
FROM 
    (SELECT 
        a.Student_id,
        a.Date,
        a.Status,
        ROW_NUMBER() OVER (PARTITION BY a.Student_id ORDER BY a.Date) AS rn,
        DATE_SUB(a.Date, INTERVAL ROW_NUMBER() OVER (PARTITION BY a.Student_id ORDER BY a.Date) DAY) AS grp
     FROM 
        Attendance a
     WHERE
        a.Status = 'Absent'
    ) ca
GROUP BY 
    ca.Student_id, ca.grp
HAVING 
    COUNT(*) >= 10;
    
select * from TempConsecutiveAbsences;    

DELETE a
FROM Attendance a
JOIN TempConsecutiveAbsences tca
ON a.Student_id = tca.Student_id
WHERE a.Date BETWEEN tca.StartDate AND tca.EndDate;

DROP TEMPORARY TABLE TempConsecutiveAbsences;
select * from attendance;



