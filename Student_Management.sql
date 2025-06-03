-- Students
CREATE TABLE students_db (
  student_id NUMBER PRIMARY KEY,
  first_name VARCHAR2(50),
  last_name VARCHAR2(50),
  dob DATE,
  gender VARCHAR2(10),
  phone VARCHAR2(15)
);

-- Courses
CREATE TABLE courses (
  course_id NUMBER PRIMARY KEY,
  course_name VARCHAR2(100),
  duration_months NUMBER,
  teacher_id NUMBER
);

-- Teachers
CREATE TABLE teachers (
  teacher_id NUMBER PRIMARY KEY,
  teacher_name VARCHAR2(100),
  department VARCHAR2(50)
);

-- Enrollments
CREATE TABLE enrollments (
  enrollment_id NUMBER PRIMARY KEY,
  student_id NUMBER REFERENCES students(student_id),
  course_id NUMBER REFERENCES courses(course_id),
  enroll_date DATE
);

-- Results
CREATE TABLE results (
  result_id NUMBER PRIMARY KEY,
  student_id NUMBER REFERENCES students_db(student_id),
  course_id NUMBER REFERENCES courses(course_id),
  marks_obtained NUMBER(5,2),
  grade VARCHAR2(2)
);

-- Fees
CREATE TABLE fees (
  fee_id NUMBER PRIMARY KEY,
  student_id NUMBER REFERENCES students_db(student_id),
  amount_paid NUMBER(8,2),
  payment_date DATE,
  mode_of_payment VARCHAR2(20)
);

---- Students_db table ----

INSERT INTO students_db VALUES (1, 'Rahul', 'Sharma', TO_DATE('2005-04-10','YYYY-MM-DD'), 'Male', '9876543210');
INSERT INTO students_db VALUES (2, 'Abhinav', 'Mehta', TO_DATE('2004-05-10','YYYY-MM-DD'), 'Male', '9876543209');
INSERT INTO students_db VALUES (3, 'Shekhar', 'Gupta', TO_DATE('2005-07-17','YYYY-MM-DD'), 'Male', '9876543208');
INSERT INTO students_db VALUES (4, 'Abhishek', 'Yadav', TO_DATE('2004-09-01','YYYY-MM-DD'), 'Male', '9876543207');
INSERT INTO students_db VALUES (5, 'Deepak', 'Khandelwal', TO_DATE('2006-11-10','YYYY-MM-DD'), 'Male', '9876543206');
INSERT INTO students_db VALUES (6, 'Ritik', 'Rajput', TO_DATE('2004-04-04','YYYY-MM-DD'), 'Male', '9876543205');
INSERT INTO students_db VALUES (7, 'Sakshi', 'Sharma', TO_DATE('2006-05-15','YYYY-MM-DD'), 'Female', '9876543204');
INSERT INTO students_db VALUES (8, 'Ishika', 'Novhal', TO_DATE('2004-06-02','YYYY-MM-DD'), 'Female', '9876543203');
INSERT INTO students_db VALUES (9, 'Aarti', 'Saxena', TO_DATE('2004-12-11','YYYY-MM-DD'), 'Female', '9876543202');
INSERT INTO students_db VALUES (10, 'Sapna', 'Singh', TO_DATE('2006-04-22','YYYY-MM-DD'), 'Female', '9876543201');

-- Teachers Table ---


INSERT INTO teachers VALUES (1, 'Mrs. Kapoor', 'Mathematics');
INSERT INTO teachers VALUES (2, 'Mr. Das', 'Science');
INSERT INTO teachers VALUES (3, 'Ms. Iqbal', 'Computer Science');

--- Courses table ---

INSERT INTO courses VALUES (101, 'Maths Level 1', 6, 1);
INSERT INTO courses VALUES (102, 'Physics Basics', 4, 2);
INSERT INTO courses VALUES (103, 'Python Programming', 3, 3);

-- enrollments table --


INSERT INTO enrollments VALUES (1001, 1, 101, TO_DATE('2024-01-10','YYYY-MM-DD'));
INSERT INTO enrollments VALUES (1002, 2, 102, TO_DATE('2024-02-12','YYYY-MM-DD'));
INSERT INTO enrollments VALUES (1003, 3, 101, TO_DATE('2024-01-15','YYYY-MM-DD'));
INSERT INTO enrollments VALUES (1004, 4, 103, TO_DATE('2024-03-01','YYYY-MM-DD'));
INSERT INTO enrollments VALUES (1005, 5, 102, TO_DATE('2024-02-25','YYYY-MM-DD'));



-- results table --


INSERT INTO results VALUES (1, 1, 101, 88.5, 'A');
INSERT INTO results VALUES (2, 2, 102, 76, 'B');
INSERT INTO results VALUES (3, 3, 101, 91, 'A');
INSERT INTO results VALUES (4, 4, 103, 65.5, 'C');
INSERT INTO results VALUES (5, 5, 102, 81, 'B');


-- where command --


SELECT * FROM students_db WHERE student_id = 5;
SELECT * FROM courses WHERE course_id = 102;

select * from enrollment;
select * from courses;
select * from teachers;


-- Delete query --

DELETE FROM enrollments WHERE enrollment_id = 1001;
DELETE FROM enrollments WHERE enrollment_id = 1002;
DELETE FROM enrollments WHERE enrollment_id = 1003;
DELETE FROM enrollments WHERE enrollment_id = 1004;
DELETE FROM enrollments WHERE enrollment_id = 1005;

INSERT INTO enrollments VALUES (2001, 1, 101, TO_DATE('2024-01-10','YYYY-MM-DD'));
INSERT INTO enrollments VALUES (2002, 2, 102, TO_DATE('2024-02-12','YYYY-MM-DD'));
INSERT INTO enrollments VALUES (2003, 3, 101, TO_DATE('2024-01-15','YYYY-MM-DD'));
INSERT INTO enrollments VALUES (2004, 4, 103, TO_DATE('2024-03-01','YYYY-MM-DD'));
INSERT INTO enrollments VALUES (2005, 5, 102, TO_DATE('2024-02-25','YYYY-MM-DD'));


--- delete query for complete table --
delete enrollments;

-- Again create the table --
CREATE TABLE enrollment (
  enrollment_id NUMBER PRIMARY KEY,
  student_id NUMBER REFERENCES students_db(student_id),
  course_id NUMBER REFERENCES courses(course_id),
  enroll_date DATE
);

INSERT INTO enrollment VALUES (2001, 1, 101, TO_DATE('2024-01-10','YYYY-MM-DD'));
INSERT INTO enrollment VALUES (2002, 2, 102, TO_DATE('2024-02-12','YYYY-MM-DD'));
INSERT INTO enrollment VALUES (2003, 3, 101, TO_DATE('2024-01-15','YYYY-MM-DD'));
INSERT INTO enrollment VALUES (2004, 4, 103, TO_DATE('2024-03-01','YYYY-MM-DD'));
INSERT INTO enrollment VALUES (2005, 5, 102, TO_DATE('2024-02-25','YYYY-MM-DD'));


delete fees;


CREATE TABLE fee (
  fee_id NUMBER PRIMARY KEY,
  student_id NUMBER REFERENCES students_db(student_id),
  amount_paid NUMBER(8,2),
  payment_date DATE,
  mode_of_payment VARCHAR2(20)
);


-- fee table --


INSERT INTO fee VALUES (501, 1, 12000, TO_DATE('2024-01-20','YYYY-MM-DD'), 'UPI');
INSERT INTO fee VALUES (502, 2, 9500, TO_DATE('2024-02-15','YYYY-MM-DD'), 'Cash');
INSERT INTO fee VALUES (503, 3, 12000, TO_DATE('2024-01-22','YYYY-MM-DD'), 'Card');
INSERT INTO fee VALUES (504, 4, 8000, TO_DATE('2024-03-05','YYYY-MM-DD'), 'UPI');
INSERT INTO fee VALUES (505, 5, 9500, TO_DATE('2024-03-01','YYYY-MM-DD'), 'Online');



-- select query --

select * from enrollment;
select * from fee;
select * from students_db;


--Triggers --


CREATE OR REPLACE TRIGGER trg_auto_grade
BEFORE INSERT ON results
FOR EACH ROW
BEGIN
  IF :NEW.marks_obtained >= 90 THEN
    :NEW.grade := 'A';
  ELSIF :NEW.marks_obtained >= 75 THEN
    :NEW.grade := 'B';
  ELSIF :NEW.marks_obtained >= 60 THEN
    :NEW.grade := 'C';
  ELSE
    :NEW.grade := 'D';
  END IF;
END;
/

DESC results;



--- Second triggers -- 


CREATE OR REPLACE TRIGGER check_enrollment_date
BEFORE INSERT ON enrollment
FOR EACH ROW
BEGIN
  IF :new.enroll_date > SYSDATE THEN
    RAISE_APPLICATION_ERROR(-20001, 'Enrollment date cannot be in the future.');
  END IF;
END;
/

DESC enrollment;

----  Proccedures -----


CREATE OR REPLACE PROCEDURE enroll_student (
  p_student_id IN NUMBER,
  p_course_id IN NUMBER
) AS
  v_exists NUMBER;
BEGIN
  -- Check if already enrolled
  SELECT COUNT(*) INTO v_exists
  FROM enrollment
  WHERE student_id = p_student_id AND course_id = p_course_id;

  IF v_exists = 0 THEN
    INSERT INTO enrollment (
      enrollment_id, student_id, course_id, enroll_date
    ) VALUES (
      enrollments_seq.NEXTVAL, p_student_id, p_course_id, SYSDATE
    );
    DBMS_OUTPUT.PUT_LINE('Student enrolled successfully.');
  ELSE
    DBMS_OUTPUT.PUT_LINE('Student already enrolled.');
  END IF;
END;
/


delete fees;

SELECT table_name FROM user_tables;
SELECT * FROM students_db;
SELECT table_name FROM user_tables;




--- View --

CREATE OR REPLACE VIEW student_report AS
SELECT s.student_id, s.first_name || ' ' || s.last_name AS full_name,
       c.course_name, r.marks_obtained, r.grade
FROM students_db s
JOIN results r ON s.student_id = r.student_id
JOIN courses c ON r.course_id = c.course_id;


--- joins --


SELECT s.first_name, s.last_name, c.course_name
FROM students_db s
JOIN enrollment e ON s.student_id = e.student_id
JOIN courses c ON e.course_id = c.course_id;


SELECT s.first_name, SUM(f.amount_paid) AS total_paid
FROM students_db s
JOIN fee f ON s.student_id = f.student_id
WHERE s.student_id = 1
GROUP BY s.first_name;



SELECT s.first_name || ' ' || s.last_name AS student, 
       c.course_name, r.marks_obtained, r.grade
FROM results r
JOIN students_db s ON r.student_id = s.student_id
JOIN courses c ON r.course_id = c.course_id;


SELECT * 
FROM enrollment
WHERE enroll_date >= SYSDATE - 7;



GRANT SELECT ON suman.students_db TO suman;
GRANT SELECT ON suman.results TO suman;
GRANT SELECT ON suman.courses TO suman;

SELECT * FROM USER_SYS_PRIVS WHERE PRIVILEGE = 'CREATE VIEW';

SELECT owner, table_name
FROM all_tables
WHERE table_name IN ('STUDENTS_DB', 'RESULTS', 'COURSES');