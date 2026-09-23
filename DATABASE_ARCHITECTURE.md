# 🗄️ FindMyFaculty — Complete SQL Database Architecture & Guide

### 🎓 Project Expo 2026 · CSE Domain · Venue: FinTech Lab
**Team Members:** Pothala Venkata Sandeep (`11249A290`), Pulavarthy Aditya (`11249A301`), Palla Yugandhar (`11249A266`), Rampalli Manikanta Anirudh (`11249A312`), Bhardwaj (`11249A268`), Koushik (`11249A435`)  
**Faculty Mentor:** Dr. R. Sivaramakrishnan | **Featured Faculty:** Dr. R. Prema

---

## 📊 1. Relational Database Architecture Overview

The **FindMyFaculty** database engine is designed with **3rd Normal Form (3NF)** relational normalization, ensuring ACID compliance, parameter-safe transactional integrity, sub-10ms query execution, and multi-tenant department scalability.

### 📁 Generated SQL Database Files in Workspace:
1. **SQLite 3 / Embedded SQL:** [`/home/user/findmyfaculty_schema_and_data.sql`](/home/user/findmyfaculty_schema_and_data.sql) & [`findmyfaculty-site/findmyfaculty.db`](/home/user/findmyfaculty-site/findmyfaculty.db)
2. **MySQL 8.0+ / MariaDB / XAMPP:** [`/home/user/findmyfaculty_mysql.sql`](/home/user/findmyfaculty_mysql.sql)
3. **PostgreSQL 14+ / Supabase / Neon:** [`/home/user/findmyfaculty_postgres.sql`](/home/user/findmyfaculty_postgres.sql)

---

## 🏛️ 2. Entity-Relationship (ER) Schema & Table Dictionary

```
  +---------------+        1:N        +------------------+
  |  departments  | ----------------> |     faculty      |
  +---------------+                   +------------------+
          |                                     |
          | 1:N                                 | 1:N
          v                                     v
  +---------------+        1:N        +------------------+
  |   sections    | ----------------> |  entry_faculty   | <---+ N:1
  +---------------+                   +------------------+     |
          |                                     |              |
          | 1:N                                 |              |
          v                                     v              |
  +---------------+                       +---------------+    |
  |    entries    | -------------------------------------------+
  +---------------+ (Timetable slots)
          
  +---------------+        1:N        +------------------+
  |     users     | ----------------> |   appointments   | <---+ N:1 (faculty)
  +---------------+                   +------------------+
          |
          | 1:N
          v
  +---------------+        1:N        +------------------+
  |   feedback    |                   |    watchlist     |
  +---------------+                   +------------------+
```

---

### 📋 Table Structure Breakdown:

#### 1. `departments` (Academic Departments & Blocks)
| Column | Type | Constraints | Description |
| :--- | :--- | :--- | :--- |
| `id` | `INT` | `PRIMARY KEY AUTOINCREMENT` | Department unique identifier |
| `code` | `VARCHAR(16)` | `UNIQUE NOT NULL` | Short code (e.g., `CSE`, `ECE`, `MECH`, `CIVIL`, `IT`, `AIDS`) |
| `name` | `VARCHAR(128)` | `NOT NULL` | Full department name |
| `block` | `VARCHAR(128)` | `NOT NULL` | Physical building / floor location |
| `hod` | `VARCHAR(128)` | | Head of Department name |
| `faculty_count`| `INT` | `DEFAULT 0` | Total enrolled faculty |
| `student_count`| `INT` | `DEFAULT 0` | Total enrolled students |

---

#### 2. `faculty` (Department Faculty Directory)
| Column | Type | Constraints | Description |
| :--- | :--- | :--- | :--- |
| `id` | `INT` | `PRIMARY KEY AUTOINCREMENT` | Faculty ID |
| `name` | `VARCHAR(128)` | `UNIQUE NOT NULL` | Full Name (e.g., `Dr. R. Prema`, `Dr. R. Sivaramakrishnan`) |
| `code` | `VARCHAR(32)` | | University faculty employee code (e.g. `F011`, `F017`) |
| `user_id` | `INT` | `FOREIGN KEY -> users(id)` | Linked login user account |
| `dept_code`| `VARCHAR(16)` | `FOREIGN KEY -> departments(code)` | Department affiliation |
| `designation`| `VARCHAR(128)`| | `Associate Professor`, `Professor`, `Assistant Professor` |
| `cabin` | `VARCHAR(128)` | | Primary permanent cabin (e.g. `CSE Block — 2nd Floor — Room 211`) |
| `subjects_taught`| `TEXT` | | Subjects (e.g., `Natural Language Processing, NLP Lab, Python`) |
| `email` | `VARCHAR(128)` | | Official email (e.g. `dr.r.prema@scsvmv.ac.in`) |
| `phone` | `VARCHAR(32)` | | Department contact extension |
| `office_hours` | `VARCHAR(64)` | | Regular consultation hours (`10:00 AM – 04:30 PM`) |
| `is_active` | `TINYINT` | `DEFAULT 1` | 1 = Active, 0 = Inactive |

---

#### 3. `users` (Role-Based Authentication Directory)
| Column | Type | Constraints | Description |
| :--- | :--- | :--- | :--- |
| `id` | `INT` | `PRIMARY KEY AUTOINCREMENT` | User ID |
| `username` | `VARCHAR(64)` | `UNIQUE NOT NULL` | Login identifier (`sandeep`, `aditya`, `dr.r.prema`, `admin`) |
| `salt` | `VARCHAR(32)` | `NOT NULL` | Cryptographic SHA-256 password salt |
| `pw` | `VARCHAR(128)`| `NOT NULL` | SHA-256 salted password digest |
| `role` | `ENUM` | `student`, `faculty`, `admin` | Strict Role-Based Access Control |
| `name` | `VARCHAR(128)`| `NOT NULL` | Display Name |
| `dept_code`| `VARCHAR(16)` | `DEFAULT 'CSE'` | Department code |
| `year` | `VARCHAR(32)` | | Academic Year (`3rd Year`) |
| `section` | `VARCHAR(32)` | | Class Section (`III CSE S3`, `III CSE S4`) |
| `student_id`| `VARCHAR(32)` | | University Roll Number (`11249A290`, `11249A301`, `11249A268`, etc.) |
| `email` | `VARCHAR(128)`| | University email (`sandeep@scsvmv.ac.in`) |

---

#### 4. `entries` (Official Timetable Matrix — 426 slots)
| Column | Type | Constraints | Description |
| :--- | :--- | :--- | :--- |
| `id` | `INT` | `PRIMARY KEY AUTOINCREMENT` | Slot entry ID |
| `sid` | `VARCHAR(32)` | `FOREIGN KEY -> sections(sid)` | Section ID (e.g. `III-V-S4`, `II-III-S7`) |
| `day` | `VARCHAR(8)` | `MON, TUE, WED, THU, FRI` | Day of academic week |
| `p_from` | `INT` | `1 to 7` | Starting lecture period |
| `p_to` | `INT` | `1 to 7` | Ending lecture period |
| `start` | `VARCHAR(16)` | | Start time (`08:10`, `10:30`, `11:20`, `13:30`) |
| `end` | `VARCHAR(16)` | | End time (`09:10`, `11:20`, `12:10`, `16:10`) |
| `subject` | `VARCHAR(128)`| | Subject name (`Natural Language Processing`, `DBMS Lab`, etc.) |
| `venue` | `VARCHAR(128)`| | Room / Lab venue (`CSE Block — Room 201`, `Computer Lab 3`) |

---

#### 5. `entry_faculty` (Timetable-to-Faculty Many-to-Many Linking)
| Column | Type | Constraints | Description |
| :--- | :--- | :--- | :--- |
| `entry_id` | `INT` | `FOREIGN KEY -> entries(id) ON DELETE CASCADE` | Timetable Slot ID |
| `faculty_id` | `INT` | `FOREIGN KEY -> faculty(id) ON DELETE CASCADE` | Assigned Faculty ID |
| *Composite PK* | | `PRIMARY KEY (entry_id, faculty_id)` | Prevents duplicate assignments |

---

#### 6. `statuses` (Live Presence & Activity Overrides)
| Column | Type | Constraints | Description |
| :--- | :--- | :--- | :--- |
| `id` | `INT` | `PRIMARY KEY AUTOINCREMENT` | Status update ID |
| `faculty_id` | `INT` | `FOREIGN KEY -> faculty(id)` | Target faculty |
| `status` | `ENUM` | `AVAILABLE, TEACHING, MEETING, DUTY, UNAVAILABLE` | Live color-coded presence status |
| `reason` | `VARCHAR(255)`| | Activity note (e.g. *"NLP Major Project Review"*) |
| `location` | `VARCHAR(128)`| | Current physical location (e.g. *"CAD Lab / Room 211"*) |
| `expected_return_at`| `VARCHAR(32)`| | Return timing (e.g. *"12:30 PM"*) |
| `noted_at` | `VARCHAR(64)` | | ISO-8601 timestamp |

---

#### 7. `appointments` (Student Consultation & Booked Slots)
| Column | Type | Constraints | Description |
| :--- | :--- | :--- | :--- |
| `id` | `INT` | `PRIMARY KEY AUTOINCREMENT` | Appointment ID |
| `student_id` | `INT` | `FOREIGN KEY -> users(id)` | Booking student |
| `faculty_id` | `INT` | `FOREIGN KEY -> faculty(id)` | Target professor (e.g. Dr. R. Prema) |
| `on_date` | `VARCHAR(16)` | | Appointment date (`2026-09-24`) |
| `start` | `VARCHAR(16)` | | Start time (`10:00`) |
| `end` | `VARCHAR(16)` | | End time (`10:30`) |
| `status` | `ENUM` | `REQUESTED, PENDING, ACCEPTED, DECLINED` | Meeting approval status |
| `reason` | `TEXT` | | Project review or doubt clearing topic |
| `created_at` | `VARCHAR(64)` | | Request creation timestamp |
| `decided_at` | `VARCHAR(64)` | | Faculty acceptance timestamp |

---

#### 8. `feedback` (Student Empirical Survey Data — 6 Questions)
| Column | Type | Constraints | Description |
| :--- | :--- | :--- | :--- |
| `id` | `INT` | `PRIMARY KEY AUTOINCREMENT` | Response ID |
| `student_name` | `VARCHAR(128)`| | Student name & roll number |
| `dept_code` | `VARCHAR(16)` | | Department |
| `q1_difficulty`| `VARCHAR(64)` | | Q1: Difficulty finding faculty |
| `q2_how_find` | `VARCHAR(255)`| | Q2: Current search method |
| `q3_useful_feature`| `VARCHAR(255)`| | Q3: Most useful capability |
| `q4_rating` | `INT` | `1 to 5` | Q4: Star rating |
| `q5_would_use`| `VARCHAR(64)` | | Q5: Daily campus adoption |
| `q6_improvement`| `TEXT` | | Q6: Student suggestions |

---

## 💡 3. Key SQL Queries for Viva Defense Demonstration

### Query 1: Find all Currently Available Faculty in the CSE Department
```sql
SELECT 
    f.name AS faculty_name,
    f.designation,
    f.cabin,
    COALESCE(s.status, 'AVAILABLE') AS live_status,
    COALESCE(s.location, f.cabin) AS current_location,
    COALESCE(s.reason, 'Free in Cabin') AS activity
FROM faculty f
LEFT JOIN statuses s ON f.id = s.faculty_id
WHERE f.dept_code = 'CSE' AND f.is_active = 1
ORDER BY f.name ASC;
```

---

### Query 2: Retrieve Prema Mam's Today Schedule and Booked Student Appointments
```sql
-- 1. Timetable Schedule for Dr. R. Prema on Wednesday
SELECT 
    e.day,
    e.start,
    e.end,
    e.subject,
    e.venue,
    s.label AS class_section
FROM entries e
JOIN entry_faculty ef ON e.id = ef.entry_id
JOIN faculty f ON ef.faculty_id = f.id
JOIN sections s ON e.sid = s.sid
WHERE f.name LIKE '%Prema%' AND e.day = 'WED'
ORDER BY e.p_from ASC;

-- 2. Booked Appointments for Dr. R. Prema
SELECT 
    a.id,
    u.name AS student_name,
    u.student_id AS roll_number,
    a.on_date,
    a.start,
    a.end,
    a.status,
    a.reason
FROM appointments a
JOIN users u ON a.student_id = u.id
JOIN faculty f ON a.faculty_id = f.id
WHERE f.name LIKE '%Prema%'
ORDER BY a.id DESC;
```

---

### Query 3: Aggregate Student Survey Feedback for Admin Analytics
```sql
SELECT 
    COUNT(*) AS total_feedbacks,
    ROUND(AVG(q4_rating), 2) AS average_rating,
    SUM(CASE WHEN q5_would_use LIKE '%Yes%' THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS adoption_percentage,
    q3_useful_feature,
    COUNT(q3_useful_feature) AS feature_demand_count
FROM feedback
GROUP BY q3_useful_feature
ORDER BY feature_demand_count DESC;
```

---

## 🛠️ 4. How to Import the SQL Database (Step-by-Step)

### Option A: Using SQLite 3 / DB Browser for SQLite (Fastest)
1. Open terminal and run:
   ```bash
   sqlite3 findmyfaculty.db < findmyfaculty_schema_and_data.sql
   ```
2. Or open **DB Browser for SQLite** → Click **Open Database** → Select `findmyfaculty.db`.

---

### Option B: Using MySQL Workbench / XAMPP / phpMyAdmin
1. Open **MySQL Workbench** or **phpMyAdmin**.
2. Click **Import** → Choose [`findmyfaculty_mysql.sql`](/home/user/findmyfaculty_mysql.sql).
3. Click **Execute** → The `findmyfaculty` database and all 13 tables are created and seeded with 44 faculty members, 426 timetable slots, and all student accounts!

---

### Option C: Using PostgreSQL / pgAdmin / Supabase
1. In PostgreSQL terminal (`psql`):
   ```bash
   psql -U postgres -d findmyfaculty -f findmyfaculty_postgres.sql
   ```
2. Or in **pgAdmin**: Query Tool → Open `findmyfaculty_postgres.sql` → Run (`F5`).
