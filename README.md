# Designing a Robust Student Records Management System  
*A Structured Database Approach*

Efficient student-record management is critical for universities. Without a well-organized system, institutions struggle with data inconsistency, slow retrieval and updates, and weak links between students, courses, and grades.  
To solve these issues, this Student Records Management System (SRMS) adopts a **relational database model**, ensuring structured storage, seamless access, and strong data integrity.

---

## 1. System Requirements and Objectives

### 1.1 Student Information Management  
The **Students** entity stores personal details and assigns each learner a unique identifier.

| Attribute | Purpose |
|-----------|---------|
| *student_id* | Primary key for unambiguous tracking |
| *first_name*, *last_name* | Personal names |
| *date_of_birth* | Enables age-based policies (e.g., ≥ 18 years) |
| *email* | Unique contact channel |
| *phone_number* | Optional unique contact number |
| *registration_date* | Official enrolment date |

---

### 1.2 Course Information Management  
The **Courses** entity catalogues every course and links it to its academic unit.

| Attribute | Purpose |
|-----------|---------|
| *course_id* | Primary key |
| *course_code* | Short, unique identifier (e.g., *CSC101*) |
| *course_title* | Full course name |
| *credit_units* | Academic weight |
| *department* | Organising faculty or discipline |

---

### 1.3 Enrollment and Academic Records  
The **Enrollments** entity connects students to the courses they take and records performance.

| Attribute | Purpose |
|-----------|---------|
| *enrollment_id* | Primary key |
| *student_id* | References **Students** |
| *course_id* | References **Courses** |
| *grade* | Final grade (optional until assigned) |

*Relationship overview*:  
*Students* ↔️ *Enrollments* ↔️ *Courses* form a classic many-to-many link, realised through the Enrollments junction.

---

## 2. Technical Approach & Implementation

- **Schema definition** via standard SQL DDL (`CREATE`, `ALTER`, `DROP`)  
- **Normalization** to eliminate redundancy  
- **Foreign-key constraints** to enforce referential integrity  
- **Validation rules** (e.g., age ≥ 18) to ensure business requirements are met  
- **Cascading actions** so deleting a student or course automatically removes dependent enrollments

---

## 3. Database Integrity & Maintenance

1. **Referential integrity** prevents orphaned records.  
2. **Cascade delete** guarantees that removing a student also deletes their enrollment rows (and similarly for courses).  
3. **Indexed keys** on IDs, course codes, and emails speed up lookups.  
4. **Periodic schema reviews** allow the model to evolve with academic policy changes.

---

## 4. Schema Evolution Examples

- **Adding columns** (e.g., *registration_date* on Students, *department* on Courses) supports richer reporting.  
- **Dropping obsolete tables** (such as Enrollments if the university migrates to a new tracking method) removes clutter and prevents stale links.

---

## 5. Business Rule: Minimum Age Requirement

To comply with policy, only applicants **18 years or older** may enroll. The rule is enforced at the database level so invalid data cannot be inserted.

---

## Conclusion

The proposed SRMS schema delivers a **robust, scalable, and policy-compliant** foundation for handling student, course, and enrollment data. By combining normalization, strict integrity rules, and flexible schema evolution, universities gain reliable operations and a clear path for future growth.
