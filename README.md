# Student Management Database Project

This project is a relational database system designed to manage student information, course enrollments, results, fees, and more. It includes SQL scripts for table creation, data insertion, triggers, procedures, views, and sample queries.

## 📁 Contents

- Database Tables
  - `students_db`: Student personal information
  - `teachers`: Information about teachers
  - `courses`: Course offerings and associated teacher
  - `enrollments` / `enrollment`: Student-course enrollments
  - `results`: Academic results of students
  - `fees` / `fee`: Student fee records

- Features
  - Data Insertion
  - Queries (SELECT, DELETE)
  - Triggers for automatic grading and date validation
  - Stored Procedure for safe enrollment
  - Views for reporting
  - Joins and aggregate queries
  - Permissions

---

## 🗃️ Tables and Relationships

- `students_db(student_id)` → Primary key
- `teachers(teacher_id)` → Primary key
- `courses(course_id)` → References `teachers(teacher_id)`
- `enrollments/enrollment(enrollment_id)` → References `students_db(student_id)` and `courses(course_id)`
- `results(result_id)` → References `students_db(student_id)` and `courses(course_id)`
- `fees/fee(fee_id)` → References `students_db(student_id)`

---

## 🔄 Triggers

### 1. `trg_auto_grade`
Automatically assigns a grade based on `marks_obtained` before inserting a result.

### 2. `check_enrollment_date`
Prevents enrollment with a future date.

---

## 🛠️ Procedure

### `enroll_student(p_student_id, p_course_id)`
Enrolls a student into a course only if not already enrolled. Uses `enrollments_seq` for generating unique enrollment IDs.

---

## 📊 Views

### `student_report`
Provides a concise report with student name, course, marks, and grade.

---

## 🔎 Sample Queries

- Fetch student info:
  ```sql
  SELECT * FROM students_db WHERE student_id = 5;


## 🖼 ER Diagram

See [`er-diagram.png`](![Student_management](https://github.com/user-attachments/assets/7749564c-aba8-4198-9765-f8c15b407d62)
) for entity relationships.



