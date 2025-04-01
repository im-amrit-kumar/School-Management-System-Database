USE SMS  ---DATABASE NAME


-------------Table Creation-------------------

-- Students Table
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DateOfBirth DATE,
    Gender CHAR(1),
    Address VARCHAR(100),
    PhoneNumber VARCHAR(15),
    Email VARCHAR(50),
);

-- Teachers Table
CREATE TABLE Teachers (
    TeacherID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DateOfBirth DATE,
    Gender CHAR(1),
    Address VARCHAR(100),
    PhoneNumber VARCHAR(15),
    Email VARCHAR(50),
    SubjectID INT
);

-- Classes Table
CREATE TABLE Classes (
    ClassID INT PRIMARY KEY,
    ClassName VARCHAR(20),
    Section VARCHAR(10),
    ClassTeacherID INT,
    FOREIGN KEY (ClassTeacherID) REFERENCES Teachers(TeacherID)
);

-- Subjects Table
CREATE TABLE Subjects (
    SubjectID INT PRIMARY KEY,
    SubjectName VARCHAR(50),
    ClassID INT,
    TeacherID INT,
    FOREIGN KEY (ClassID) REFERENCES Classes(ClassID),
    FOREIGN KEY (TeacherID) REFERENCES Teachers(TeacherID)
);

-- Exams Table
CREATE TABLE Exams (
    ExamID INT PRIMARY KEY,
    ExamName VARCHAR(50),
    ClassID INT,
    SubjectID INT,
    Date DATE,
    FOREIGN KEY (ClassID) REFERENCES Classes(ClassID),
    FOREIGN KEY (SubjectID) REFERENCES Subjects(SubjectID)
);

-- Results Table
CREATE TABLE Results (
    ResultID INT PRIMARY KEY,
    StudentID INT,
    ExamID INT,
    MarksObtained DECIMAL(5,2),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (ExamID) REFERENCES Exams(ExamID)
);

-- Attendance Table
CREATE TABLE Attendance (
    AttendanceID INT PRIMARY KEY,
    Date DATE,
    StudentID INT,
    Status VARCHAR(10),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID)
);

-- Fees Table
CREATE TABLE Fees (
    FeeID INT PRIMARY KEY,
    StudentID INT,
    Amount DECIMAL(10,2),
    DueDate DATE,
    Status VARCHAR(10),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID)
);

-- Parents Table
CREATE TABLE Parents (
    ParentID INT PRIMARY KEY,
    StudentID INT,
    ParentName VARCHAR(50),
    Relationship VARCHAR(20),
    PhoneNumber VARCHAR(15),
    Email VARCHAR(50),
    Address VARCHAR(100),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID)
);

-- Staff Table
CREATE TABLE Staff (
    StaffID INT PRIMARY KEY,
    Name VARCHAR(50),
    Role VARCHAR(20),
    PhoneNumber VARCHAR(15),
    Email VARCHAR(50),
    Address VARCHAR(100)
);


ALTER TABLE Students
ADD ClassID INT;

ALTER TABLE Students
ADD CONSTRAINT FK_Students_Classes
FOREIGN KEY (ClassID) REFERENCES Classes(ClassID);


----------------------Inserting Data in Tables--------------------------

-- Insert data into Students table
INSERT INTO Students (StudentID, FirstName, LastName, DateOfBirth, Gender, Address, PhoneNumber, Email) VALUES
(1, 'John', 'Doe', '2010-06-15', 'M', '123 Elm St', '555-1234', 'john.doe@example.com'),
(2, 'Jane', 'Smith', '2011-04-20', 'F', '456 Oak St', '555-5678', 'jane.smith@example.com'),
(3, 'Emily', 'Johnson', '2009-11-11', 'F', '789 Pine St', '555-8765', 'emily.j@example.com'),
(4, 'Michael', 'Brown', '2010-12-05', 'M', '321 Maple St', '555-6543', 'michael.b@example.com'),
(5, 'Sarah', 'Davis', '2011-09-14', 'F', '654 Birch St', '555-7890', 'sarah.d@example.com'),
(6, 'James', 'Wilson', '2012-02-23', 'M', '987 Cedar St', '555-3456', 'james.w@example.com'),
(7, 'Robert', 'Taylor', '2009-05-30', 'M', '159 Walnut St', '555-4321', 'robert.t@example.com'),
(8, 'Linda', 'Anderson', '2011-07-22', 'F', '753 Willow St', '555-6789', 'linda.a@example.com'),
(9, 'Patricia', 'Thomas', '2010-08-19', 'F', '852 Aspen St', '555-9876', 'patricia.t@example.com'),
(10, 'Charles', 'Jackson', '2009-01-17', 'M', '369 Poplar St', '555-2345', 'charles.j@example.com');



-- Assign ClassID to students
UPDATE Students SET ClassID = 1 WHERE StudentID = 1;
UPDATE Students SET ClassID = 2 WHERE StudentID = 2;
UPDATE Students SET ClassID = 3 WHERE StudentID = 3;
UPDATE Students SET ClassID = 4 WHERE StudentID = 4;
UPDATE Students SET ClassID = 5 WHERE StudentID = 5;
UPDATE Students SET ClassID = 6 WHERE StudentID = 6;
UPDATE Students SET ClassID = 7 WHERE StudentID = 7;
UPDATE Students SET ClassID = 8 WHERE StudentID = 8;
UPDATE Students SET ClassID = 9 WHERE StudentID = 9;
UPDATE Students SET ClassID = 10 WHERE StudentID = 10;



-- Insert data into Teachers table
INSERT INTO Teachers (TeacherID, FirstName, LastName, DateOfBirth, Gender, Address, PhoneNumber, Email, SubjectID) VALUES
(1, 'Alice', 'Green', '1980-03-12', 'F', '12 Ivy Rd', '555-1020', 'alice.g@example.com', 1),
(2, 'Brian', 'White', '1979-07-25', 'M', '34 Spruce Rd', '555-2030', 'brian.w@example.com', 2),
(3, 'Catherine', 'Martin', '1982-11-18', 'F', '56 Maple Dr', '555-3040', 'catherine.m@example.com', 3),
(4, 'David', 'Clark', '1981-05-22', 'M', '78 Elm Dr', '555-4050', 'david.c@example.com', 4),
(5, 'Eve', 'Lewis', '1983-02-02', 'F', '90 Oak Ave', '555-5060', 'eve.l@example.com', 5),
(6, 'Frank', 'Walker', '1984-08-10', 'M', '123 Pine Ln', '555-6070', 'frank.w@example.com', 6),
(7, 'Grace', 'Hall', '1985-09-15', 'F', '456 Cedar Ln', '555-7080', 'grace.h@example.com', 7),
(8, 'Henry', 'Adams', '1986-10-20', 'M', '789 Birch Ln', '555-8090', 'henry.a@example.com', 8),
(9, 'Isabella', 'Wright', '1980-12-31', 'F', '987 Willow Rd', '555-9010', 'isabella.w@example.com', 9),
(10, 'Jack', 'King', '1978-06-25', 'M', '654 Aspen Rd', '555-1100', 'jack.k@example.com', 10);

-- Insert data into Classes table
INSERT INTO Classes (ClassID, ClassName, Section, ClassTeacherID) VALUES
(1, 'Grade 1', 'A', 1),
(2, 'Grade 2', 'B', 2),
(3, 'Grade 3', 'A', 3),
(4, 'Grade 4', 'B', 4),
(5, 'Grade 5', 'A', 5),
(6, 'Grade 6', 'B', 6),
(7, 'Grade 7', 'A', 7),
(8, 'Grade 8', 'B', 8),
(9, 'Grade 9', 'A', 9),
(10, 'Grade 10', 'B', 10);

-- Insert data into Subjects table
INSERT INTO Subjects (SubjectID, SubjectName, ClassID, TeacherID) VALUES
(1, 'Mathematics', 1, 1),
(2, 'English', 2, 2),
(3, 'Science', 3, 3),
(4, 'History', 4, 4),
(5, 'Geography', 5, 5),
(6, 'Physics', 6, 6),
(7, 'Chemistry', 7, 7),
(8, 'Biology', 8, 8),
(9, 'Computer Science', 9, 9),
(10, 'Physical Education', 10, 10);

-- Insert data into Exams table
INSERT INTO Exams (ExamID, ExamName, ClassID, SubjectID, Date) VALUES
(1, 'Midterm Math', 1, 1, '2024-05-15'),
(2, 'Final Math', 1, 1, '2024-11-15'),
(3, 'Midterm English', 2, 2, '2024-05-16'),
(4, 'Final English', 2, 2, '2024-11-16'),
(5, 'Midterm Science', 3, 3, '2024-05-17'),
(6, 'Final Science', 3, 3, '2024-11-17'),
(7, 'Midterm History', 4, 4, '2024-05-18'),
(8, 'Final History', 4, 4, '2024-11-18'),
(9, 'Midterm Geography', 5, 5, '2024-05-19'),
(10, 'Final Geography', 5, 5, '2024-11-19');

-- Insert data into Results table
INSERT INTO Results (ResultID, StudentID, ExamID, MarksObtained) VALUES
(1, 1, 1, 85.50),
(2, 2, 2, 78.00),
(3, 3, 3, 90.00),
(4, 4, 4, 88.00),
(5, 5, 5, 92.00),
(6, 6, 6, 75.00),
(7, 7, 7, 80.00),
(8, 8, 8, 89.50),
(9, 9, 9, 77.00),
(10, 10, 10, 85.00);

-- Insert data into Attendance table
INSERT INTO Attendance (AttendanceID, Date, StudentID, Status) VALUES
(1, '2024-09-01', 1, 'Present'),
(2, '2024-09-01', 2, 'Present'),
(3, '2024-09-01', 3, 'Absent'),
(4, '2024-09-01', 4, 'Present'),
(5, '2024-09-01', 5, 'Present'),
(6, '2024-09-01', 6, 'Absent'),
(7, '2024-09-01', 7, 'Present'),
(8, '2024-09-01', 8, 'Present'),
(9, '2024-09-01', 9, 'Present'),
(10, '2024-09-01', 10, 'Absent');

-- Insert data into Fees table
INSERT INTO Fees (FeeID, StudentID, Amount, DueDate, Status) VALUES
(1, 1, 500.00, '2024-08-01', 'Paid'),
(2, 2, 600.00, '2024-08-01', 'Unpaid'),
(3, 3, 550.00, '2024-08-01', 'Paid'),
(4, 4, 500.00, '2024-08-01', 'Paid'),
(5, 5, 600.00, '2024-08-01', 'Unpaid'),
(6, 6, 550.00, '2024-08-01', 'Paid'),
(7, 7, 500.00, '2024-08-01', 'Paid'),
(8, 8, 600.00, '2024-08-01', 'Unpaid'),
(9, 9, 550.00, '2024-08-01', 'Paid'),
(10, 10, 500.00, '2024-08-01', 'Paid');

-- Insert data into Parents table
INSERT INTO Parents (ParentID, StudentID, ParentName, Relationship, PhoneNumber, Email, Address) VALUES
(1, 1, 'Anna Doe', 'Mother', '555-1111', 'anna.doe@example.com', '123 Elm St'),
(2, 2, 'Robert Smith', 'Father', '555-2222', 'robert.smith@example.com', '456 Oak St'),
(3, 3, 'Laura Johnson', 'Mother', '555-3333', 'laura.j@example.com', '789 Pine St'),
(4, 4, 'Peter Brown', 'Father', '555-4444', 'peter.b@example.com', '321 Maple St'),
(5, 5, 'Jessica Davis', 'Mother', '555-5555', 'jessica.d@example.com', '654 Birch St'),
(6, 6, 'George Wilson', 'Father', '555-6666', 'george.w@example.com', '987 Cedar St'),
(7, 7, 'Helen Taylor', 'Mother', '555-7777', 'helen.t@example.com', '159 Walnut St'),
(8, 8, 'Nancy Anderson', 'Mother', '555-8888', 'nancy.a@example.com', '753 Willow St'),
(9, 9, 'Rachel Thomas', 'Mother', '555-9999', 'rachel.t@example.com', '852 Aspen St'),
(10, 10, 'Oliver Jackson', 'Father', '555-0000', 'oliver.j@example.com', '369 Poplar St');

-- Insert data into Staff table
INSERT INTO Staff (StaffID, Name, Role, PhoneNumber, Email, Address) VALUES
(1, 'Paul Newman', 'Librarian', '555-1212', 'paul.n@example.com', '345 Elm Rd'),
(2, 'Lucy Miller', 'Clerk', '555-2323', 'lucy.m@example.com', '678 Oak Rd'),
(3, 'Mark Allen', 'Janitor', '555-3434', 'mark.a@example.com', '901 Pine Rd'),
(4, 'Emma Parker', 'Librarian', '555-4545', 'emma.p@example.com', '234 Maple St'),
(5, 'Ryan Hill', 'Clerk', '555-5656', 'ryan.h@example.com', '567 Cedar Rd'),
(6, 'Sophia Young', 'Janitor', '555-6767', 'sophia.y@example.com', '890 Birch Rd'),
(7, 'Liam Scott', 'Librarian', '555-7878', 'liam.s@example.com', '123 Spruce Rd'),
(8, 'Mason Nelson', 'Clerk', '555-8989', 'mason.n@example.com', '456 Aspen Rd'),
(9, 'Ava Lee', 'Janitor', '555-9090', 'ava.l@example.com', '789 Walnut Rd'),
(10, 'Ethan Carter', 'Librarian', '555-0101', 'ethan.c@example.com', '112 Willow Rd');

-------------Displaying all the Tables----------------------------------

-- Students table
SELECT * FROM Students;

-- Teachers table
SELECT * FROM Teachers;

-- Classes table
SELECT * FROM Classes;

-- Subjects table
SELECT * FROM Subjects;

-- Exams table
SELECT * FROM Exams;

-- Results table
SELECT * FROM Results;

-- Attendance table
SELECT * FROM Attendance;

-- Fees table
SELECT * FROM Fees;

-- Parents table
SELECT * FROM Parents;

-- Staff table
SELECT * FROM Staff;

-------------------Drop Table-----------------------------


DROP TABLE Attendance;
DROP TABLE Results;
DROP TABLE Exams;
DROP TABLE Fees;
DROP TABLE Parents;
DROP TABLE Students;
DROP TABLE Subjects;
DROP TABLE Classes;
DROP TABLE Teachers;
DROP TABLE Staff;


------------------------All the Tables Satisfies 1NF,2NF and 3NF. So no Normalization required--------------------------




----------------------------Queries--------------------------------------------------------

SELECT FirstName, LastName FROM Students WHERE FirstName LIKE 'A%';

SELECT FirstName, LastName FROM Teachers WHERE Gender = 'M';

SELECT ClassName, Section FROM Classes WHERE ClassTeacherID = (SELECT TeacherID FROM Teachers WHERE FirstName = 'Alice' AND LastName = 'Green');

SELECT SubjectName FROM Subjects WHERE TeacherID = (SELECT TeacherID FROM Teachers WHERE FirstName = 'Catherine' AND LastName = 'Martin');

SELECT FirstName, LastName FROM Students WHERE StudentID IN (SELECT StudentID FROM Fees WHERE Status = 'Unpaid');

SELECT ParentName FROM Parents WHERE StudentID IN (SELECT StudentID FROM Students WHERE ClassID = 1);

SELECT StudentID, MarksObtained FROM Results WHERE ExamID = 1 AND MarksObtained > 80;

SELECT FirstName, LastName FROM Students WHERE StudentID IN (SELECT StudentID FROM Attendance WHERE Date = '2024-09-01' AND Status = 'Absent');

SELECT SUM(Amount) FROM Fees WHERE Status = 'Paid';

SELECT ExamName FROM Exams WHERE ClassID = 3;



-----------------Implementing Joins and other Queries-------------------------------
-- Inner Join: Retrieve Students' details along with their exam marks by joining the Students and Results tables
SELECT 
    Students.StudentID, 
    Students.FirstName, 
    Students.LastName, 
    Results.MarksObtained
FROM 
    Students
INNER JOIN 
    Results ON Students.StudentID = Results.StudentID;

-- Left Join: Retrieve all students' details, including those who do not have a parent recorded in the Parents table
SELECT 
    Students.StudentID, 
    Students.FirstName, 
    Students.LastName, 
    Parents.ParentName, 
    Parents.Relationship
FROM 
    Students
LEFT JOIN 
    Parents ON Students.StudentID = Parents.StudentID;

-- Right Join: Retrieve details of all parents, including those whose children are not listed in the Students table
SELECT 
    Parents.ParentID, 
    Parents.ParentName, 
    Parents.Relationship, 
    Students.StudentID, 
    Students.FirstName
FROM 
    Students
RIGHT JOIN 
    Parents ON Students.StudentID = Parents.StudentID;

-- Outer Join (Full Outer Join): Retrieve all students and parents, including students without parents and parents without students
SELECT 
    Students.StudentID, 
    Students.FirstName, 
    Students.LastName, 
    Parents.ParentName, 
    Parents.Relationship
FROM 
    Students
FULL OUTER JOIN 
    Parents ON Students.StudentID = Parents.StudentID;

-- Self Join: Retrieve teacher pairs who teach different subjects in the same class
SELECT 
    T1.TeacherID AS TeacherID1, 
    T1.FirstName AS Teacher1Name, 
    T2.TeacherID AS TeacherID2, 
    T2.FirstName AS Teacher2Name, 
    T1.SubjectID AS SubjectID1, 
    T2.SubjectID AS SubjectID2
FROM 
    Teachers T1
JOIN 
    Teachers T2 ON T1.ClassID = T2.ClassID AND T1.TeacherID <> T2.TeacherID;







--Subqueries

SELECT FirstName, LastName
FROM Students
WHERE ClassID = (
    SELECT TOP 1 ClassID
    FROM Results
    JOIN Students ON Results.StudentID = Students.StudentID
    GROUP BY ClassID
    ORDER BY SUM(MarksObtained) DESC
);


SELECT FirstName, LastName
FROM Students
WHERE StudentID NOT IN (
    SELECT StudentID
    FROM Attendance
    WHERE Status = 'Absent'
);

SELECT ClassName
FROM Classes
WHERE ClassID NOT IN (
    SELECT ClassID
    FROM Students s
    JOIN Fees f ON s.StudentID = f.StudentID
    WHERE f.Status = 'Unpaid'
);

-------------------Transactions-------------------------------------------------------------------------

-- Transaction Query 1: Register a new student and assign to a class
BEGIN TRANSACTION;
INSERT INTO Students (StudentID, FirstName, LastName, DateOfBirth, Gender, Address, PhoneNumber, Email, ClassID) 
VALUES (11, 'Chris', 'Evans', '2012-05-20', 'M', '999 Sunset Blvd', '555-8888', 'chris.e@example.com', 3);
COMMIT;

-- Transaction Query 2: Update class teacher details
BEGIN TRANSACTION;
UPDATE Teachers
SET FirstName = 'Rebecca', LastName = 'Clark'
WHERE TeacherID = 4;
COMMIT;

-- Transaction Query 3: Remove a fee record and ensure balance update
BEGIN TRANSACTION;
DELETE FROM Fees WHERE FeeID = 2;
COMMIT;

-- Transaction Query 4: Add a new subject and link it to a teacher
BEGIN TRANSACTION;
INSERT INTO Subjects (SubjectID, SubjectName, ClassID, TeacherID)
VALUES (11, 'Art', 2, 3);
COMMIT;

-- Transaction Query 5: Enroll a new parent and link them to a student
BEGIN TRANSACTION;
INSERT INTO Parents (ParentID, StudentID, ParentName, Relationship, PhoneNumber, Email, Address)
VALUES (11, 1, 'Mike Doe', 'Father', '555-4444', 'mike.doe@example.com', '123 Elm St');
COMMIT;

----------------------------Stored Procedures------------------------------------------------------------------
--1
CREATE PROCEDURE GetStudentsByClass
    @ClassID INT
AS
BEGIN
    SELECT StudentID, FirstName, LastName
    FROM Students
    WHERE ClassID = @ClassID;
END;

EXEC GetStudentsByClass @ClassID = 1;



--2
CREATE PROCEDURE InsertStudent
    @FirstName VARCHAR(50),
    @LastName VARCHAR(50),
    @DateOfBirth DATE,
    @Gender CHAR(1),
    @Address VARCHAR(100),
    @PhoneNumber VARCHAR(15),
    @Email VARCHAR(50),
    @ClassID INT
AS
BEGIN
    INSERT INTO Students (FirstName, LastName, DateOfBirth, Gender, Address, PhoneNumber, Email, ClassID)
    VALUES (@FirstName, @LastName, @DateOfBirth, @Gender, @Address, @PhoneNumber, @Email, @ClassID);
END;

EXEC InsertStudent 'Alex', 'Johnson', '2012-05-10', 'M', '100 Oak St', '555-1010', 'alex.j@example.com', 2;


--3
CREATE PROCEDURE UpdateStudentAddress
    @StudentID INT,
    @NewAddress VARCHAR(100)
AS
BEGIN
    UPDATE Students
    SET Address = @NewAddress
    WHERE StudentID = @StudentID;
END;

EXEC UpdateStudentAddress @StudentID = 1, @NewAddress = '456 Elm St';


--4
CREATE PROCEDURE DeleteStudent
    @StudentID INT
AS
BEGIN
    DELETE FROM Students
    WHERE StudentID = @StudentID;
END;

EXEC DeleteStudent @StudentID = 5;


--5
CREATE PROCEDURE GetStudentsWithUnpaidFees
AS
BEGIN
    SELECT Students.StudentID, Students.FirstName, Students.LastName
    FROM Students
    INNER JOIN Fees ON Students.StudentID = Fees.StudentID
    WHERE Fees.Status = 'Unpaid';
END;

EXEC GetStudentsWithUnpaidFees;


----------------------------Functions--------------------------------------------------------------------------

-- Function Query 1: Find the total marks of a student
CREATE FUNCTION GetStudentTotalMarks(@StudentID INT)
RETURNS DECIMAL(10, 2)
AS
BEGIN
    DECLARE @TotalMarks DECIMAL(10, 2);
    SELECT @TotalMarks = SUM(MarksObtained) FROM Results WHERE StudentID = @StudentID;
    RETURN @TotalMarks;
END;

-- Function Query 2: Retrieve full name of a student
CREATE FUNCTION GetStudentFullName(@StudentID INT)
RETURNS VARCHAR(100)
AS
BEGIN
    DECLARE @FullName VARCHAR(100);
    SELECT @FullName = CONCAT(FirstName, ' ', LastName) FROM Students WHERE StudentID = @StudentID;
    RETURN @FullName;
END;

-- Function Query 3: Get the number of subjects taught by a teacher
CREATE FUNCTION GetSubjectsTaughtByTeacher(@TeacherID INT)
RETURNS INT
AS
BEGIN
    DECLARE @SubjectCount INT;
    SELECT @SubjectCount = COUNT(*) FROM Subjects WHERE TeacherID = @TeacherID;
    RETURN @SubjectCount;
END;

-- Function Query 4: Calculate attendance percentage of a student
CREATE FUNCTION GetAttendancePercentage(@StudentID INT)
RETURNS DECIMAL(5, 2)
AS
BEGIN
    DECLARE @Total INT, @Present INT;
    SELECT @Total = COUNT(*) FROM Attendance WHERE StudentID = @StudentID;
    SELECT @Present = COUNT(*) FROM Attendance WHERE StudentID = @StudentID AND Status = 'Present';
    RETURN CAST(@Present AS DECIMAL(5, 2)) / @Total * 100;
END;

-- Function Query 5: Get class name by student ID
CREATE FUNCTION GetClassNameByStudent(@StudentID INT)
RETURNS VARCHAR(50)
AS
BEGIN
    DECLARE @ClassName VARCHAR(50);
    SELECT @ClassName = c.ClassName
    FROM Students s
    JOIN Classes c ON s.ClassID = c.ClassID
    WHERE s.StudentID = @StudentID;
    RETURN @ClassName;
END;


---------------------------------------Cursors---------------------------------------
-- Cursor Query 1: Display all student names
DECLARE student_cursor CURSOR FOR
SELECT FirstName, LastName FROM Students;
OPEN student_cursor;
FETCH NEXT FROM student_cursor;
WHILE @@FETCH_STATUS = 0
BEGIN
    FETCH NEXT FROM student_cursor;
END;
CLOSE student_cursor;
DEALLOCATE student_cursor;

-- Cursor Query 2: Update all unpaid fees to "Pending Review"
DECLARE fee_cursor CURSOR FOR
SELECT FeeID FROM Fees WHERE Status = 'Unpaid';
OPEN fee_cursor;
FETCH NEXT FROM fee_cursor;
WHILE @@FETCH_STATUS = 0
BEGIN
    UPDATE Fees SET Status = 'Pending Review' WHERE FeeID = FeeID;
    FETCH NEXT FROM fee_cursor;
END;
CLOSE fee_cursor;
DEALLOCATE fee_cursor;

-- Cursor Query 3: Iterate through all teachers and print subject count
DECLARE teacher_cursor CURSOR FOR
SELECT TeacherID FROM Teachers;
OPEN teacher_cursor;
FETCH NEXT FROM teacher_cursor;
WHILE @@FETCH_STATUS = 0
BEGIN
    FETCH NEXT FROM teacher_cursor;
END;
CLOSE teacher_cursor;
DEALLOCATE teacher_cursor;

-- Cursor Query 4: Retrieve students with unpaid fees and notify
DECLARE notify_cursor CURSOR FOR
SELECT StudentID FROM Fees WHERE Status = 'Unpaid';
OPEN notify_cursor;
FETCH NEXT FROM notify_cursor;
WHILE @@FETCH_STATUS = 0
BEGIN
    PRINT 'Unpaid fee notification sent to student';
    FETCH NEXT FROM notify_cursor;
END;
CLOSE notify_cursor;
DEALLOCATE notify_cursor;

-- Cursor Query 5: Update attendance records based on student ID
DECLARE attendance_cursor CURSOR FOR
SELECT AttendanceID FROM Attendance WHERE Status = 'Absent';
OPEN attendance_cursor;
FETCH NEXT FROM attendance_cursor;
WHILE @@FETCH_STATUS = 0
BEGIN
    UPDATE Attendance SET Status = 'Reviewed' WHERE AttendanceID = AttendanceID;
    FETCH NEXT FROM attendance_cursor;
END;
CLOSE attendance_cursor;
DEALLOCATE attendance_cursor;

------------------------Triggers-----------------------------------------------
-- Trigger Query 1: Trigger after inserting into Fees to update payment status

CREATE TRIGGER trg_AfterInsertFee
ON Fees
AFTER INSERT
AS
BEGIN
    UPDATE Fees
    SET Status = 'Paid'
    WHERE FeeID IN (SELECT FeeID FROM INSERTED);
END;

-- Trigger Query 2: Trigger to ensure email is unique in Teachers table
CREATE TRIGGER trg_CheckUniqueTeacherEmail
ON Teachers
INSTEAD OF INSERT
AS
BEGIN
    IF EXISTS (SELECT Email FROM INSERTED WHERE Email IN (SELECT Email FROM Teachers))
    BEGIN
        PRINT 'Duplicate email found!';
        ROLLBACK TRANSACTION;
    END
    ELSE
    BEGIN
        INSERT INTO Teachers
        SELECT * FROM INSERTED;
    END;
END;

-- Trigger Query 3: Update the total marks of students in Results after an insert
CREATE TRIGGER trg_UpdateTotalMarks
ON Results
AFTER INSERT
AS
BEGIN
    PRINT 'Student marks updated successfully!';
END;

-- Trigger Query 4: Prevent deletion of a subject if linked to an exam
CREATE TRIGGER trg_PreventSubjectDelete
ON Subjects
INSTEAD OF DELETE
AS
BEGIN
    IF EXISTS (SELECT * FROM DELETED WHERE SubjectID IN (SELECT SubjectID FROM Exams))
    BEGIN
        PRINT 'Cannot delete subject linked to exams.';
        ROLLBACK TRANSACTION;
    END
    ELSE
    BEGIN
        DELETE FROM Subjects WHERE SubjectID IN (SELECT SubjectID FROM DELETED);
    END;
END;

-- Trigger Query 5: Auto-insert librarian staff when a teacher resigns
CREATE TRIGGER trg_AutoInsertLibrarian
ON Teachers
AFTER DELETE
AS
BEGIN
    INSERT INTO Staff (Name, Role, PhoneNumber, Email, Address)
    VALUES ('Auto-Generated', 'Librarian', 'N/A', 'N/A', 'Default Address');
END;

