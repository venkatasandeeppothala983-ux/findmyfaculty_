-- ============================================================================
-- FINDMYFACULTY DATABASE EXPORT & SCHEMA SCRIPT
-- Project Expo 2026 · SCSVMV University · CSE Domain (FinTech Lab)
-- Team: Pothala Venkata Sandeep (11249A290), Pulavarthy Aditya (11249A301),
--       Palla Yugandhar (11249A266), Rampalli Manikanta Anirudh (11249A312),
--       Bhardwaj (11249A268), Koushik (11249A435)
-- Mentor: Dr. R. Sivaramakrishnan | Featured Faculty: Dr. R. Prema
-- Compatible with: SQLite 3, DB Browser for SQLite, DBeaver, TablePlus
-- ============================================================================

PRAGMA foreign_keys = ON;

BEGIN TRANSACTION;
CREATE TABLE announcements(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  by_user_id INTEGER REFERENCES users(id),
  title TEXT,
  body TEXT,
  target_role TEXT DEFAULT 'ALL',
  created_at TEXT
);
INSERT INTO "announcements" VALUES(1,1,'Welcome to FindMyFaculty (Odd Sem 2026)','Real-time faculty locator and timetable tracking is now live across CSE, ECE, and other blocks.','ALL','2026-09-23T20:51:01.553409+05:30');
CREATE TABLE appointments(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  student_id INTEGER REFERENCES users(id),
  faculty_id INTEGER REFERENCES faculty(id),
  on_date TEXT,
  start TEXT,
  end TEXT,
  status TEXT DEFAULT 'REQUESTED',
  reason TEXT,
  created_at TEXT,
  decided_at TEXT
);
INSERT INTO "appointments" VALUES(1,2,12,'2026-09-24','10:00','10:30','ACCEPTED','Project review on FindMyFaculty','2026-09-23T22:17:27.991290+05:30','2026-09-23T22:17:27.998091+05:30');
INSERT INTO "appointments" VALUES(2,2,12,'2026-09-24','10:00','10:30','ACCEPTED','Project review on FindMyFaculty','2026-09-23T22:17:44.588035+05:30','2026-09-23T22:17:44.595258+05:30');
INSERT INTO "appointments" VALUES(3,2,12,'2026-09-24','10:00','10:30','ACCEPTED','Project review on FindMyFaculty','2026-09-23T22:21:32.726911+05:30','2026-09-23T22:21:32.734372+05:30');
INSERT INTO "appointments" VALUES(4,2,12,'2026-09-24','10:00','10:30','ACCEPTED','Project review on FindMyFaculty','2026-09-23T22:27:26.056276+05:30','2026-09-23T22:27:26.062654+05:30');
INSERT INTO "appointments" VALUES(5,2,12,'2026-09-24','10:00','10:30','ACCEPTED','Project review on FindMyFaculty','2026-09-23T22:32:06.610260+05:30','2026-09-23T22:32:06.616081+05:30');
INSERT INTO "appointments" VALUES(6,2,12,'2026-09-24','10:00','10:30','ACCEPTED','Project review on FindMyFaculty','2026-09-23T22:39:01.552755+05:30','2026-09-23T22:39:01.558777+05:30');
INSERT INTO "appointments" VALUES(7,2,12,'2026-09-24','10:00','10:30','ACCEPTED','Project review on FindMyFaculty','2026-09-23T22:42:56.560920+05:30','2026-09-23T22:42:56.566391+05:30');
INSERT INTO "appointments" VALUES(101,2,11,'2026-09-24','10:00','10:30','REQUESTED','NLP Project Review & Architecture Guidance (FindMyFaculty Team)','2026-09-23 17:19:33',NULL);
INSERT INTO "appointments" VALUES(102,53,11,'2026-09-24','11:30','12:15','ACCEPTED','Machine Learning Algorithm Doubt Clearing','2026-09-23 17:19:33','2026-09-23 17:19:33');
CREATE TABLE departments(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  code TEXT UNIQUE NOT NULL,
  name TEXT NOT NULL,
  block TEXT NOT NULL,
  hod TEXT,
  faculty_count INTEGER DEFAULT 0,
  student_count INTEGER DEFAULT 0
);
INSERT INTO "departments" VALUES(1,'CSE','Computer Science & Engineering','CSE Block','Dr. V. Geetha',38,540);
INSERT INTO "departments" VALUES(2,'ECE','Electronics & Communication Engineering','ECE Block','Dr. Arun Kumar',18,280);
INSERT INTO "departments" VALUES(3,'EEE','Electrical & Electronics Engineering','Ramanujan Academic Block','Dr. S. Karthik',12,160);
INSERT INTO "departments" VALUES(4,'MECH','Mechanical Engineering','Mechanical Block','Dr. M. Natarajan',14,180);
INSERT INTO "departments" VALUES(5,'CIVIL','Civil Engineering','Main Block','Dr. P. Venkatesh',8,90);
INSERT INTO "departments" VALUES(6,'IT','Information Technology','CSE Block — 3rd Floor','Dr. R. Sundar',10,140);
INSERT INTO "departments" VALUES(7,'AIDS','Artificial Intelligence & Data Science','CSE Block — 4th Floor','Dr. Priya Sharma',6,120);
INSERT INTO "departments" VALUES(8,'MBA','Management Studies','Admin Block — 2nd Floor','Dr. K. Ramesh',6,90);
CREATE TABLE entries(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  sid TEXT,
  day TEXT,
  p_from INTEGER,
  p_to INTEGER,
  start TEXT,
  end TEXT,
  subject TEXT,
  venue TEXT,
  line TEXT,
  UNIQUE(sid, day, p_from, p_to)
);
INSERT INTO "entries" VALUES(1,'IV-VII-S1','MON',1,1,'08:10','09:10','CB','','CB');
INSERT INTO "entries" VALUES(2,'IV-VII-S1','MON',2,2,'09:10','10:10','Open Elective-I','','Digital / Marketing/ / Disaster');
INSERT INTO "entries" VALUES(3,'IV-VII-S1','MON',3,4,'10:20','12:20','MOOC Course','','MOOC COURSE');
INSERT INTO "entries" VALUES(4,'IV-VII-S1','MON',5,5,'12:20','13:20','Project Work Phase-I','','Project Work / P-I');
INSERT INTO "entries" VALUES(5,'IV-VII-S1','MON',6,7,'14:10','16:10','Project Work Phase-I','','Project Work P-I');
INSERT INTO "entries" VALUES(6,'IV-VII-S1','TUE',1,1,'08:10','09:10','Open Elective-I','','Digital / Marketing/ / Disaster');
INSERT INTO "entries" VALUES(7,'IV-VII-S1','TUE',2,2,'09:10','10:10','Industrial Training & Practice (ITP)','','ITP');
INSERT INTO "entries" VALUES(8,'IV-VII-S1','TUE',3,3,'10:20','11:20','CA / VUL','','CA/VUL');
INSERT INTO "entries" VALUES(9,'IV-VII-S1','TUE',4,4,'11:20','12:20','Industrial Training & Practice (ITP)','','ITP');
INSERT INTO "entries" VALUES(10,'IV-VII-S1','TUE',5,5,'12:20','13:20','Project Work Phase-I','','Project Work / P-I');
INSERT INTO "entries" VALUES(11,'IV-VII-S1','TUE',6,6,'14:10','15:10','CA / VUL','','CA/VUL');
INSERT INTO "entries" VALUES(12,'IV-VII-S1','TUE',7,7,'15:10','16:10','Project Work Phase-I','','Project Work / P-I');
INSERT INTO "entries" VALUES(13,'IV-VII-S1','WED',1,1,'08:10','09:10','Open Elective-I','','Digital / Marketing/ / Disaster');
INSERT INTO "entries" VALUES(14,'IV-VII-S1','WED',2,3,'09:10','11:20','Industrial Training & Practice (ITP)','','ITP');
INSERT INTO "entries" VALUES(15,'IV-VII-S1','WED',4,4,'11:20','12:20','CB','','CB');
INSERT INTO "entries" VALUES(16,'IV-VII-S1','WED',5,5,'12:20','13:20','Project Work Phase-I','','Project Work / P-I');
INSERT INTO "entries" VALUES(17,'IV-VII-S1','WED',6,7,'14:10','16:10','Project Work Phase-I','','Project Work P-I');
INSERT INTO "entries" VALUES(18,'IV-VII-S1','FRI',1,2,'08:10','10:10','Project Work Phase-I','','Project Work P-I');
INSERT INTO "entries" VALUES(19,'IV-VII-S1','FRI',3,3,'10:20','11:20','CA / VUL','','CA/VUL');
INSERT INTO "entries" VALUES(20,'IV-VII-S1','FRI',4,5,'11:20','13:20','Project Work Phase-I','','Project Work P-I');
INSERT INTO "entries" VALUES(21,'IV-VII-S1','FRI',6,7,'14:10','16:10','Project Work Phase-I','','Project Work P-I');
INSERT INTO "entries" VALUES(22,'IV-VII-S2','MON',1,1,'08:10','09:10','IoT / Project','','IOT/Project');
INSERT INTO "entries" VALUES(23,'IV-VII-S2','MON',2,2,'09:10','10:10','Open Elective-I','','Digital / Marketing/ / Disaster');
INSERT INTO "entries" VALUES(24,'IV-VII-S2','MON',3,4,'10:20','12:20','MOOC Course','','MOOC COURSE');
INSERT INTO "entries" VALUES(25,'IV-VII-S2','MON',5,5,'12:20','13:20','Robotics Lab','','ROBOTIC LAB');
INSERT INTO "entries" VALUES(26,'IV-VII-S2','MON',6,7,'14:10','16:10','IoT / Robotics Lab','','IOT/ROBOTIC LAB');
INSERT INTO "entries" VALUES(27,'IV-VII-S2','TUE',1,1,'08:10','09:10','Open Elective-I','','Digital / Marketing/ / Disaster');
INSERT INTO "entries" VALUES(28,'IV-VII-S2','TUE',2,2,'09:10','10:10','Industrial Training & Practice (ITP)','','ITP');
INSERT INTO "entries" VALUES(29,'IV-VII-S2','TUE',3,3,'10:20','11:20','CA / VUL / IoT','','CA/VUL/IOT');
INSERT INTO "entries" VALUES(30,'IV-VII-S2','TUE',4,5,'11:20','13:20','Industrial Training & Practice (ITP)','','ITP');
INSERT INTO "entries" VALUES(31,'IV-VII-S2','TUE',6,6,'14:10','15:10','CA / VUL / IoT','','CA/VUL/IOT');
INSERT INTO "entries" VALUES(32,'IV-VII-S2','TUE',7,7,'15:10','16:10','Project Work Phase-I','','Project Work / P-I');
INSERT INTO "entries" VALUES(33,'IV-VII-S2','WED',1,1,'08:10','09:10','Open Elective-I','','Digital / Marketing/ / Disaster');
INSERT INTO "entries" VALUES(34,'IV-VII-S2','WED',2,2,'09:10','10:10','CB / MC','','CB/MC');
INSERT INTO "entries" VALUES(35,'IV-VII-S2','WED',3,5,'10:20','13:20','Project Work Phase-I','','Project Work P-I');
INSERT INTO "entries" VALUES(36,'IV-VII-S2','WED',6,7,'14:10','16:10','Project Work Phase-I','','Project Work P-I');
INSERT INTO "entries" VALUES(37,'IV-VII-S2','FRI',1,1,'08:10','09:10','CB / MC','','CB/MC');
INSERT INTO "entries" VALUES(38,'IV-VII-S2','FRI',2,2,'09:10','10:10','Industrial Training & Practice (ITP)','','ITP');
INSERT INTO "entries" VALUES(39,'IV-VII-S2','FRI',3,3,'10:20','11:20','CA / VUL / IoT','','CA/VUL/IOT');
INSERT INTO "entries" VALUES(40,'IV-VII-S2','FRI',4,4,'11:20','12:20','Industrial Training & Practice (ITP)','','ITP');
INSERT INTO "entries" VALUES(41,'IV-VII-S2','FRI',5,5,'12:20','13:20','Project Work Phase-I','','Project Work / P-I');
INSERT INTO "entries" VALUES(42,'IV-VII-S2','FRI',6,7,'14:10','16:10','Project Work Phase-I','','Project Work P-I');
INSERT INTO "entries" VALUES(43,'III-V-S1','MON',1,1,'08:10','09:10','Automata Theory','','Automata / Theory');
INSERT INTO "entries" VALUES(44,'III-V-S1','MON',2,4,'09:10','12:20','Computer Networks Lab','Computer Lab -2','Computer Networks Lab');
INSERT INTO "entries" VALUES(45,'III-V-S1','MON',5,5,'12:20','13:20','Natural Language Processing','','Natural / Language / Processing');
INSERT INTO "entries" VALUES(46,'III-V-S1','MON',6,7,'14:10','16:10','Soft Skill','','Soft Skill');
INSERT INTO "entries" VALUES(47,'III-V-S1','TUE',1,1,'08:10','09:10','Professional Elective-I','','Professional / Elective-I');
INSERT INTO "entries" VALUES(48,'III-V-S1','TUE',2,2,'09:10','10:10','Automata Theory','','Automata / Theory');
INSERT INTO "entries" VALUES(49,'III-V-S1','TUE',3,3,'10:20','11:20','Programming in Java','','Programming / in Java');
INSERT INTO "entries" VALUES(50,'III-V-S1','TUE',4,4,'11:20','12:20','Computer Networks','','Computer / Networks');
INSERT INTO "entries" VALUES(51,'III-V-S1','TUE',5,5,'12:20','13:20','DBMS Lab','','DBMS Lab');
INSERT INTO "entries" VALUES(52,'III-V-S1','TUE',6,7,'14:10','16:10','DBMS Lab','Computer Lab -3','DBMS Lab');
INSERT INTO "entries" VALUES(53,'III-V-S1','WED',1,1,'08:10','09:10','Computer Networks','','Computer / Networks');
INSERT INTO "entries" VALUES(54,'III-V-S1','WED',2,4,'09:10','12:20','Programming in Java Lab','MAD Lab','Programming in JAVA Lab');
INSERT INTO "entries" VALUES(55,'III-V-S1','WED',5,5,'12:20','13:20','CI','','CI');
INSERT INTO "entries" VALUES(56,'III-V-S1','WED',6,6,'14:10','15:10','DBMS','','DBMS');
INSERT INTO "entries" VALUES(57,'III-V-S1','WED',7,7,'15:10','16:10','Yoga','','YOGA');
INSERT INTO "entries" VALUES(58,'III-V-S1','FRI',1,1,'08:10','09:10','DBMS','','DBMS');
INSERT INTO "entries" VALUES(59,'III-V-S1','FRI',2,2,'09:10','10:10','Computer Networks','','Computer / Networks');
INSERT INTO "entries" VALUES(60,'III-V-S1','FRI',3,3,'10:20','11:20','Professional Elective-I','','Professional / Elective-I');
INSERT INTO "entries" VALUES(61,'III-V-S1','FRI',4,4,'11:20','12:20','Natural Language Processing','','Natural / Language / Processing');
INSERT INTO "entries" VALUES(62,'III-V-S1','FRI',5,5,'12:20','13:20','Automata Theory','','Automata / Theory');
INSERT INTO "entries" VALUES(63,'III-V-S1','FRI',6,6,'14:10','15:10','Programming in Java','','Programming / in Java');
INSERT INTO "entries" VALUES(64,'III-V-S1','FRI',7,7,'15:10','16:10','Automata Theory','','Automata / Theory');
INSERT INTO "entries" VALUES(65,'III-V-S2','MON',1,1,'08:10','09:10','Programming in Java','','Programming / in Java');
INSERT INTO "entries" VALUES(66,'III-V-S2','MON',2,4,'09:10','12:20','DBMS Lab','Computer Lab -3','DBMS Lab');
INSERT INTO "entries" VALUES(67,'III-V-S2','MON',5,5,'12:20','13:20','Computer Networks','','Computer / Networks');
INSERT INTO "entries" VALUES(68,'III-V-S2','MON',6,6,'14:10','15:10','Automata Theory','','Automata / Theory');
INSERT INTO "entries" VALUES(69,'III-V-S2','MON',7,7,'15:10','16:10','Natural Language Processing','','Natural / Language / Processing');
INSERT INTO "entries" VALUES(70,'III-V-S2','TUE',1,1,'08:10','09:10','Professional Elective-I','','Professional / Elective-I');
INSERT INTO "entries" VALUES(71,'III-V-S2','TUE',2,2,'09:10','10:10','Natural Language Processing','','Natural / Language / Processing');
INSERT INTO "entries" VALUES(72,'III-V-S2','TUE',3,3,'10:20','11:20','DBMS','','DBMS');
INSERT INTO "entries" VALUES(73,'III-V-S2','TUE',4,4,'11:20','12:20','Computer Networks','','Computer / Networks');
INSERT INTO "entries" VALUES(74,'III-V-S2','TUE',5,5,'12:20','13:20','Programming in Java Lab','','JAVA Lab');
INSERT INTO "entries" VALUES(75,'III-V-S2','TUE',6,7,'14:10','16:10','Programming in Java Lab','MAD Lab','Programming in JAVA Lab');
INSERT INTO "entries" VALUES(76,'III-V-S2','WED',1,1,'08:10','09:10','Automata Theory','','Automata / Theory');
INSERT INTO "entries" VALUES(77,'III-V-S2','WED',2,2,'09:10','10:10','DBMS','','DBMS');
INSERT INTO "entries" VALUES(78,'III-V-S2','WED',3,3,'10:20','11:20','Automata Theory','','Automata / Theory');
INSERT INTO "entries" VALUES(79,'III-V-S2','WED',4,4,'11:20','12:20','Programming in Java','','Programming / in Java');
INSERT INTO "entries" VALUES(80,'III-V-S2','WED',5,5,'12:20','13:20','Yoga','','YOGA');
INSERT INTO "entries" VALUES(81,'III-V-S2','WED',6,7,'14:10','16:10','Soft Skill','','Soft Skill');
INSERT INTO "entries" VALUES(82,'III-V-S2','FRI',1,1,'08:10','09:10','Computer Networks','','Computer / Networks');
INSERT INTO "entries" VALUES(83,'III-V-S2','FRI',2,2,'09:10','10:10','Programming in Java','','Programming / in Java');
INSERT INTO "entries" VALUES(84,'III-V-S2','FRI',3,3,'10:20','11:20','Professional Elective-I','','Professional / Elective-I');
INSERT INTO "entries" VALUES(85,'III-V-S2','FRI',4,4,'11:20','12:20','DBMS','','DBMS');
INSERT INTO "entries" VALUES(86,'III-V-S2','FRI',5,5,'12:20','13:20','NLP Lab','','NLP Lab');
INSERT INTO "entries" VALUES(87,'III-V-S2','FRI',6,7,'14:10','16:10','NLP Lab','DELL Lab','NLP Lab');
INSERT INTO "entries" VALUES(88,'III-V-S3','MON',1,1,'08:10','09:10','Automata Theory','','Automata / Theory');
INSERT INTO "entries" VALUES(89,'III-V-S3','MON',2,2,'09:10','10:10','DBMS','','DBMS');
INSERT INTO "entries" VALUES(90,'III-V-S3','MON',3,3,'10:20','11:20','Automata Theory','','Automata / Theory');
INSERT INTO "entries" VALUES(91,'III-V-S3','MON',4,4,'11:20','12:20','Natural Language Processing','','Natural / Language / Processing');
INSERT INTO "entries" VALUES(92,'III-V-S3','MON',5,5,'12:20','13:20','CI','','CI');
INSERT INTO "entries" VALUES(93,'III-V-S3','MON',6,6,'14:10','15:10','Programming in Java','','Programming / in Java');
INSERT INTO "entries" VALUES(94,'III-V-S3','MON',7,7,'15:10','16:10','Yoga','','YOGA');
INSERT INTO "entries" VALUES(95,'III-V-S3','TUE',1,1,'08:10','09:10','Professional Elective-I','','Professional / Elective-I');
INSERT INTO "entries" VALUES(96,'III-V-S3','TUE',2,4,'09:10','12:20','Computer Networks Lab','Computer Lab -2','Computer Networks Lab');
INSERT INTO "entries" VALUES(97,'III-V-S3','TUE',5,5,'12:20','13:20','Natural Language Processing','','Natural / Language / Processing');
INSERT INTO "entries" VALUES(98,'III-V-S3','TUE',6,7,'14:10','16:10','Soft Skill','','Soft Skill');
INSERT INTO "entries" VALUES(99,'III-V-S3','WED',1,1,'08:10','09:10','Computer Networks','','Computer / Networks');
INSERT INTO "entries" VALUES(100,'III-V-S3','WED',2,4,'09:10','12:20','NLP Lab','DELL Lab','NLP Lab');
INSERT INTO "entries" VALUES(101,'III-V-S3','WED',5,5,'12:20','13:20','Programming in Java','','Programming / in Java');
INSERT INTO "entries" VALUES(102,'III-V-S3','WED',6,6,'14:10','15:10','Natural Language Processing','','Natural / Language / Processing');
INSERT INTO "entries" VALUES(103,'III-V-S3','WED',7,7,'15:10','16:10','DBMS','','DBMS');
INSERT INTO "entries" VALUES(104,'III-V-S3','FRI',1,1,'08:10','09:10','DBMS','','DBMS');
INSERT INTO "entries" VALUES(105,'III-V-S3','FRI',2,2,'09:10','10:10','Automata Theory','','Automata / Theory');
INSERT INTO "entries" VALUES(106,'III-V-S3','FRI',3,3,'10:20','11:20','Professional Elective-I','','Professional / Elective-I');
INSERT INTO "entries" VALUES(107,'III-V-S3','FRI',4,4,'11:20','12:20','Computer Networks','','Computer / Networks');
INSERT INTO "entries" VALUES(108,'III-V-S3','FRI',5,5,'12:20','13:20','DBMS Lab','','DBMS Lab');
INSERT INTO "entries" VALUES(109,'III-V-S3','FRI',6,7,'14:10','16:10','DBMS Lab','Computer Lab -3','DBMS Lab');
INSERT INTO "entries" VALUES(110,'III-V-S4','MON',1,1,'08:10','09:10','Natural Language Processing','','Natural / Language / Processing');
INSERT INTO "entries" VALUES(111,'III-V-S4','MON',2,2,'09:10','10:10','Computer Networks','','Computer / Networks');
INSERT INTO "entries" VALUES(112,'III-V-S4','MON',3,3,'10:20','11:20','Automata Theory','','Automata / Theory');
INSERT INTO "entries" VALUES(113,'III-V-S4','MON',4,4,'11:20','12:20','Programming in Java','','Programming / in Java');
INSERT INTO "entries" VALUES(114,'III-V-S4','MON',5,5,'12:20','13:20','Computer Networks Lab','','CN LAB');
INSERT INTO "entries" VALUES(115,'III-V-S4','MON',6,7,'14:10','16:10','Computer Networks Lab','Computer Lab -2','Computer Networks Lab');
INSERT INTO "entries" VALUES(116,'III-V-S4','TUE',1,1,'08:10','09:10','Professional Elective-I','','Professional / Elective-I');
INSERT INTO "entries" VALUES(117,'III-V-S4','TUE',2,4,'09:10','12:20','Programming in Java Lab','MAD Lab','Programming in JAVA Lab');
INSERT INTO "entries" VALUES(118,'III-V-S4','TUE',5,5,'12:20','13:20','DBMS','','DBMS');
INSERT INTO "entries" VALUES(119,'III-V-S4','TUE',6,6,'14:10','15:10','Natural Language Processing','','Natural / Language / Processing');
INSERT INTO "entries" VALUES(120,'III-V-S4','TUE',7,7,'15:10','16:10','CI','','CI');
INSERT INTO "entries" VALUES(121,'III-V-S4','WED',1,1,'08:10','09:10','DBMS','','DBMS');
INSERT INTO "entries" VALUES(122,'III-V-S4','WED',2,2,'09:10','10:10','Programming in Java','','Programming / in Java');
INSERT INTO "entries" VALUES(123,'III-V-S4','WED',3,3,'10:20','11:20','Automata Theory','','Automata / Theory');
INSERT INTO "entries" VALUES(124,'III-V-S4','WED',4,4,'11:20','12:20','Computer Networks','','Computer / Networks');
INSERT INTO "entries" VALUES(125,'III-V-S4','WED',5,5,'12:20','13:20','NLP Lab','','NLP Lab');
INSERT INTO "entries" VALUES(126,'III-V-S4','WED',6,7,'14:10','16:10','NLP Lab','DELL Lab','NLP Lab');
INSERT INTO "entries" VALUES(127,'III-V-S4','FRI',1,1,'08:10','09:10','Automata Theory','','Automata / Theory');
INSERT INTO "entries" VALUES(128,'III-V-S4','FRI',2,2,'09:10','10:10','Natural Language Processing','','Natural / Language / Processing');
INSERT INTO "entries" VALUES(129,'III-V-S4','FRI',3,3,'10:20','11:20','Professional Elective-I','','Professional / Elective-I');
INSERT INTO "entries" VALUES(130,'III-V-S4','FRI',4,4,'11:20','12:20','DBMS','','DBMS');
INSERT INTO "entries" VALUES(131,'III-V-S4','FRI',5,5,'12:20','13:20','Computer Networks','','Computer / Networks');
INSERT INTO "entries" VALUES(132,'III-V-S4','FRI',6,7,'14:10','16:10','Soft Skill','','Soft Skill');
INSERT INTO "entries" VALUES(133,'III-V-S5','MON',1,1,'08:10','09:10','Natural Language Processing','','Natural / Language / Processing');
INSERT INTO "entries" VALUES(134,'III-V-S5','MON',2,2,'09:10','10:10','Professional Elective-I','','Professional / Elective-I');
INSERT INTO "entries" VALUES(135,'III-V-S5','MON',3,3,'10:20','11:20','Automata Theory','','Automata / Theory');
INSERT INTO "entries" VALUES(136,'III-V-S5','MON',4,4,'11:20','12:20','Professional Elective-I','','Professional / Elective-I');
INSERT INTO "entries" VALUES(137,'III-V-S5','MON',5,5,'12:20','13:20','Yoga','','YOGA');
INSERT INTO "entries" VALUES(138,'III-V-S5','MON',6,6,'14:10','15:10','DBMS','','DBMS');
INSERT INTO "entries" VALUES(139,'III-V-S5','MON',7,7,'15:10','16:10','Programming in Java','','Programming / in Java');
INSERT INTO "entries" VALUES(140,'III-V-S5','TUE',1,1,'08:10','09:10','Computer Networks','','Computer / Networks');
INSERT INTO "entries" VALUES(141,'III-V-S5','TUE',2,2,'09:10','10:10','Automata Theory','','Automata / Theory');
INSERT INTO "entries" VALUES(142,'III-V-S5','TUE',3,3,'10:20','11:20','DBMS','','DBMS');
INSERT INTO "entries" VALUES(143,'III-V-S5','TUE',4,4,'11:20','12:20','Natural Language Processing','','Natural / Language / Processing');
INSERT INTO "entries" VALUES(144,'III-V-S5','TUE',5,5,'12:20','13:20','Computer Networks Lab','','CN LAB');
INSERT INTO "entries" VALUES(145,'III-V-S5','TUE',6,7,'14:10','16:10','Computer Networks Lab','Computer Lab -2','Computer Networks Lab');
INSERT INTO "entries" VALUES(146,'III-V-S5','WED',1,1,'08:10','09:10','Professional Elective-I','','Professional / Elective-I');
INSERT INTO "entries" VALUES(147,'III-V-S5','WED',2,4,'09:10','12:20','DBMS Lab','Computer Lab -3','DBMS Lab');
INSERT INTO "entries" VALUES(148,'III-V-S5','WED',5,5,'12:20','13:20','CI','','CI');
INSERT INTO "entries" VALUES(149,'III-V-S5','WED',6,6,'14:10','15:10','Programming in Java','','Programming / in Java');
INSERT INTO "entries" VALUES(150,'III-V-S5','WED',7,7,'15:10','16:10','DBMS','','DBMS');
INSERT INTO "entries" VALUES(151,'III-V-S5','FRI',1,1,'08:10','09:10','Programming in Java','','Programming / in Java');
INSERT INTO "entries" VALUES(152,'III-V-S5','FRI',2,2,'09:10','10:10','Natural Language Processing','','Natural / Language / Processing');
INSERT INTO "entries" VALUES(153,'III-V-S5','FRI',3,3,'10:20','11:20','Computer Networks','','Computer / Networks');
INSERT INTO "entries" VALUES(154,'III-V-S5','FRI',4,4,'11:20','12:20','Automata Theory','','Automata / Theory');
INSERT INTO "entries" VALUES(155,'III-V-S5','FRI',5,5,'12:20','13:20','Programming in Java Lab','','JAVA Lab');
INSERT INTO "entries" VALUES(156,'III-V-S5','FRI',6,7,'14:10','16:10','Programming in Java Lab','MAD Lab','Programming in JAVA Lab');
INSERT INTO "entries" VALUES(157,'III-V-S6','MON',1,1,'08:10','09:10','DBMS','','DBMS');
INSERT INTO "entries" VALUES(158,'III-V-S6','MON',2,2,'09:10','10:10','Professional Elective-I','','Professional / Elective-I');
INSERT INTO "entries" VALUES(159,'III-V-S6','MON',3,3,'10:20','11:20','Computer Networks','','Computer / Networks');
INSERT INTO "entries" VALUES(160,'III-V-S6','MON',4,4,'11:20','12:20','Professional Elective-I','','Professional / Elective-I');
INSERT INTO "entries" VALUES(161,'III-V-S6','MON',5,5,'12:20','13:20','NLP Lab','','NLP LAB \ / Computer / Lab-3');
INSERT INTO "entries" VALUES(162,'III-V-S6','MON',6,7,'14:10','16:10','Data Visualization Lab','DELL Lab','Data Visualization Lab');
INSERT INTO "entries" VALUES(163,'III-V-S6','TUE',1,1,'08:10','09:10','Natural Language Processing','','Natural / Language / Processing');
INSERT INTO "entries" VALUES(164,'III-V-S6','TUE',2,4,'09:10','12:20','DBMS Lab','Computer Lab -3','DBMS Lab');
INSERT INTO "entries" VALUES(165,'III-V-S6','TUE',5,5,'12:20','13:20','CI','','CI');
INSERT INTO "entries" VALUES(166,'III-V-S6','TUE',6,6,'14:10','15:10','Automata Theory','','Automata / Theory');
INSERT INTO "entries" VALUES(167,'III-V-S6','TUE',7,7,'15:10','16:10','Yoga','','YOGA');
INSERT INTO "entries" VALUES(168,'III-V-S6','WED',1,1,'08:10','09:10','Professional Elective-I','','Professional / Elective-I');
INSERT INTO "entries" VALUES(169,'III-V-S6','WED',2,2,'09:10','10:10','Programming in Java','','Programming / in Java');
INSERT INTO "entries" VALUES(170,'III-V-S6','WED',3,3,'10:20','11:20','DBMS','','DBMS');
INSERT INTO "entries" VALUES(171,'III-V-S6','WED',4,4,'11:20','12:20','Automata Theory','','Automata / Theory');
INSERT INTO "entries" VALUES(172,'III-V-S6','WED',5,5,'12:20','13:20','Computer Networks Lab','','CN LAB');
INSERT INTO "entries" VALUES(173,'III-V-S6','WED',6,7,'14:10','16:10','Computer Networks Lab','Computer Lab -2','Computer Networks Lab');
INSERT INTO "entries" VALUES(174,'III-V-S6','FRI',1,1,'08:10','09:10','Computer Networks','','Computer / Networks');
INSERT INTO "entries" VALUES(175,'III-V-S6','FRI',2,2,'09:10','10:10','Automata Theory','','Automata / Theory');
INSERT INTO "entries" VALUES(176,'III-V-S6','FRI',3,3,'10:20','11:20','DBMS','','DBMS');
INSERT INTO "entries" VALUES(177,'III-V-S6','FRI',4,5,'11:20','13:20','Soft Skill','','Soft Skill');
INSERT INTO "entries" VALUES(178,'III-V-S6','FRI',6,6,'14:10','15:10','Natural Language Processing','','Natural / Language / Processing');
INSERT INTO "entries" VALUES(179,'III-V-S6','FRI',7,7,'15:10','16:10','Programming in Java','','Programming / in Java');
INSERT INTO "entries" VALUES(180,'III-V-S7-CSE','MON',1,1,'08:10','09:10','Computer Networks','','Computer / Networks');
INSERT INTO "entries" VALUES(181,'III-V-S7-CSE','MON',2,2,'09:10','10:10','Professional Elective-I','','Professional / Elective-I');
INSERT INTO "entries" VALUES(182,'III-V-S7-CSE','MON',3,3,'10:20','11:20','Automata Theory','','Automata / Theory');
INSERT INTO "entries" VALUES(183,'III-V-S7-CSE','MON',4,4,'11:20','12:20','Professional Elective-I','','Professional / Elective-I');
INSERT INTO "entries" VALUES(184,'III-V-S7-CSE','MON',5,5,'12:20','13:20','NLP / Data Visualization Lab','','NLP / DV LAB /');
INSERT INTO "entries" VALUES(185,'III-V-S7-CSE','MON',6,7,'14:10','16:10','Database & Network Security Lab','DELL Lab,MAD Lab','Database & Network Security / Lab / Lab-3 / /');
INSERT INTO "entries" VALUES(186,'III-V-S7-CSE','TUE',1,1,'08:10','09:10','Honours','','Honors');
INSERT INTO "entries" VALUES(187,'III-V-S7-CSE','TUE',2,2,'09:10','10:10','Programming in Java','','Programming / in Java');
INSERT INTO "entries" VALUES(188,'III-V-S7-CSE','TUE',3,3,'10:20','11:20','Computer Networks','','Computer / Networks');
INSERT INTO "entries" VALUES(189,'III-V-S7-CSE','TUE',4,5,'11:20','13:20','Soft Skill','','Soft Skill');
INSERT INTO "entries" VALUES(190,'III-V-S7-CSE','TUE',6,6,'14:10','15:10','Automata Theory','','Automata / Theory');
INSERT INTO "entries" VALUES(191,'III-V-S7-CSE','TUE',7,7,'15:10','16:10','DBMS','','DBMS');
INSERT INTO "entries" VALUES(192,'III-V-S7-CSE','WED',1,1,'08:10','09:10','Professional Elective-I','','Professional / Elective-I');
INSERT INTO "entries" VALUES(193,'III-V-S7-CSE','WED',2,4,'09:10','12:20','Computer Networks Lab','Computer Lab -2','Computer Networks Lab');
INSERT INTO "entries" VALUES(194,'III-V-S7-CSE','WED',5,5,'12:20','13:20','Automata Theory','','Automata / Theory');
INSERT INTO "entries" VALUES(195,'III-V-S7-CSE','WED',6,6,'14:10','15:10','Programming in Java','','Programming / in Java');
INSERT INTO "entries" VALUES(196,'III-V-S7-CSE','WED',7,7,'15:10','16:10','CI','','CI');
INSERT INTO "entries" VALUES(197,'III-V-S7-CSE','FRI',1,1,'08:10','09:10','DBMS','','DBMS');
INSERT INTO "entries" VALUES(198,'III-V-S7-CSE','FRI',2,4,'09:10','12:20','Programming in Java Lab','MAD Lab','Programming in JAVA Lab');
INSERT INTO "entries" VALUES(199,'III-V-S7-CSE','FRI',5,5,'12:20','13:20','Yoga','','YOGA');
INSERT INTO "entries" VALUES(200,'III-V-S7-CSE','FRI',6,6,'14:10','15:10','Honours','','Honors');
INSERT INTO "entries" VALUES(201,'III-V-S7-CSE','FRI',7,7,'15:10','16:10','Programming in Java','','Programming / in Java');
INSERT INTO "entries" VALUES(202,'III-V-S7-IT','MON',1,1,'08:10','09:10','Computer Networks','','Computer / Networks');
INSERT INTO "entries" VALUES(203,'III-V-S7-IT','MON',2,2,'09:10','10:10','Principle of Communication','','Principle of / Communication');
INSERT INTO "entries" VALUES(204,'III-V-S7-IT','MON',3,3,'10:20','11:20','Automata Theory','','Automata / Theory');
INSERT INTO "entries" VALUES(205,'III-V-S7-IT','MON',4,4,'11:20','12:20','Principle of Communication','','Principle of / Communication');
INSERT INTO "entries" VALUES(206,'III-V-S7-IT','MON',5,5,'12:20','13:20','NLP / Data Visualization Lab','','NLP / DV LAB /');
INSERT INTO "entries" VALUES(207,'III-V-S7-IT','MON',6,7,'14:10','16:10','Database & Network Security Lab','DELL Lab,MAD Lab','Database & Network Security / Lab / Lab-3 / /');
INSERT INTO "entries" VALUES(208,'III-V-S7-IT','TUE',1,1,'08:10','09:10','Honours','','Honors');
INSERT INTO "entries" VALUES(209,'III-V-S7-IT','TUE',2,2,'09:10','10:10','Programming in Java','','Programming / in Java');
INSERT INTO "entries" VALUES(210,'III-V-S7-IT','TUE',3,3,'10:20','11:20','Computer Networks','','Computer / Networks');
INSERT INTO "entries" VALUES(211,'III-V-S7-IT','TUE',4,5,'11:20','13:20','Soft Skill','','Soft Skill');
INSERT INTO "entries" VALUES(212,'III-V-S7-IT','TUE',6,6,'14:10','15:10','Automata Theory','','Automata / Theory');
INSERT INTO "entries" VALUES(213,'III-V-S7-IT','TUE',7,7,'15:10','16:10','DBMS','','DBMS');
INSERT INTO "entries" VALUES(214,'III-V-S7-IT','WED',1,1,'08:10','09:10','Principle of Communication','','Principle of / Communication');
INSERT INTO "entries" VALUES(215,'III-V-S7-IT','WED',2,4,'09:10','12:20','IT Workshop','Computer Lab - 3,SCi Lab','IT Workshop ()');
INSERT INTO "entries" VALUES(216,'III-V-S7-IT','WED',5,5,'12:20','13:20','Automata Theory','','Automata / Theory');
INSERT INTO "entries" VALUES(217,'III-V-S7-IT','WED',6,6,'14:10','15:10','Programming in Java','','Programming / in Java');
INSERT INTO "entries" VALUES(218,'III-V-S7-IT','WED',7,7,'15:10','16:10','CI','','CI');
INSERT INTO "entries" VALUES(219,'III-V-S7-IT','FRI',1,1,'08:10','09:10','DBMS','','DBMS');
INSERT INTO "entries" VALUES(220,'III-V-S7-IT','FRI',2,4,'09:10','12:20','Programming in Java Lab','MAD Lab','Programming in JAVA Lab');
INSERT INTO "entries" VALUES(221,'III-V-S7-IT','FRI',5,5,'12:20','13:20','Yoga','','YOGA');
INSERT INTO "entries" VALUES(222,'III-V-S7-IT','FRI',6,6,'14:10','15:10','Honours','','Honors');
INSERT INTO "entries" VALUES(223,'III-V-S7-IT','FRI',7,7,'15:10','16:10','Programming in Java','','Programming / in Java');
INSERT INTO "entries" VALUES(224,'II-III-S1','MON',1,1,'08:10','09:10','Fundamentals of Machine Learning','','Fundamentals / of ML');
INSERT INTO "entries" VALUES(225,'II-III-S1','MON',2,2,'09:10','10:10','Data Structures & Algorithms','','Data Structures / and Algorithms');
INSERT INTO "entries" VALUES(226,'II-III-S1','MON',3,3,'10:20','11:20','Computer Organization & Architecture','','Computer / Organization / & Architecture');
INSERT INTO "entries" VALUES(227,'II-III-S1','MON',4,4,'11:20','12:20','CI','','CI');
INSERT INTO "entries" VALUES(228,'II-III-S1','MON',5,5,'12:20','13:20','DLD / COA Lab','','DLD \ COA / LAB');
INSERT INTO "entries" VALUES(229,'II-III-S1','MON',6,7,'14:10','16:10',NULL,'Computer Lab-4','Digital Logic Design / / Computer Organization & / Architecture');
INSERT INTO "entries" VALUES(230,'II-III-S1','TUE',1,1,'08:10','09:10','Computer Organization & Architecture','','Computer / Organization / & Architecture');
INSERT INTO "entries" VALUES(231,'II-III-S1','TUE',2,2,'09:10','10:10','Probability & Statistics','','Probability / and Statistics');
INSERT INTO "entries" VALUES(232,'II-III-S1','TUE',3,3,'10:20','11:20','Digital Logic Design','','Digital Logic / Design');
INSERT INTO "entries" VALUES(233,'II-III-S1','TUE',4,4,'11:20','12:20','Fundamentals of Machine Learning','','Fundamentals of / ML');
INSERT INTO "entries" VALUES(234,'II-III-S1','TUE',5,5,'12:20','13:20','DLD / COA Lab','','DLD \ COA / LAB');
INSERT INTO "entries" VALUES(235,'II-III-S1','TUE',6,7,'14:10','16:10',NULL,'Computer Lab-4','Digital Logic Design / / Computer Organization & / Architecture');
INSERT INTO "entries" VALUES(236,'II-III-S1','WED',1,3,'08:10','11:20','Data Structures & Algorithms','Computer Lab - 1','Data Structures and Algorithms');
INSERT INTO "entries" VALUES(237,'II-III-S1','WED',4,4,'11:20','12:20','Intelligent Systems','','Intelligent / Systems');
INSERT INTO "entries" VALUES(238,'II-III-S1','WED',5,5,'12:20','13:20','Probability & Statistics','','Probability / and Statistics');
INSERT INTO "entries" VALUES(239,'II-III-S1','WED',6,6,'14:10','15:10','Data Structures & Algorithms','','Data Structures / and Algorithms');
INSERT INTO "entries" VALUES(240,'II-III-S1','WED',7,7,'15:10','16:10','Yoga','','YOGA');
INSERT INTO "entries" VALUES(241,'II-III-S1','FRI',1,1,'08:10','09:10','Digital Logic Design','','Digital Logic / Design');
INSERT INTO "entries" VALUES(242,'II-III-S1','FRI',2,2,'09:10','10:10','Probability & Statistics','','Probability / and Statistics');
INSERT INTO "entries" VALUES(243,'II-III-S1','FRI',3,3,'10:20','11:20','Computer Organization & Architecture','','Computer / Organization / & Architecture');
INSERT INTO "entries" VALUES(244,'II-III-S1','FRI',4,5,'11:20','13:20','Soft Skills-II','','Soft Skills-II');
INSERT INTO "entries" VALUES(245,'II-III-S1','FRI',6,6,'14:10','15:10','Intelligent Systems','','Intelligent / Systems');
INSERT INTO "entries" VALUES(246,'II-III-S1','FRI',7,7,'15:10','16:10','Intelligent Systems','','Intelligent / Systems');
INSERT INTO "entries" VALUES(247,'II-III-S2','MON',1,1,'08:10','09:10','Fundamentals of Machine Learning','','Fundamentals / of ML');
INSERT INTO "entries" VALUES(248,'II-III-S2','MON',2,2,'09:10','10:10','Probability & Statistics','','Probability / and Statistics');
INSERT INTO "entries" VALUES(249,'II-III-S2','MON',3,3,'10:20','11:20','Fundamentals of Machine Learning','','Fundamentals / of ML');
INSERT INTO "entries" VALUES(250,'II-III-S2','MON',4,4,'11:20','12:20','Data Structures & Algorithms','','Data Structures / and Algorithms');
INSERT INTO "entries" VALUES(251,'II-III-S2','MON',5,5,'12:20','13:20','Computer Organization & Architecture','','Computer / Organization / & Architecture');
INSERT INTO "entries" VALUES(252,'II-III-S2','MON',6,6,'14:10','15:10','Digital Logic Design','','Digital Logic / Design');
INSERT INTO "entries" VALUES(253,'II-III-S2','MON',7,7,'15:10','16:10','Yoga','','YOGA');
INSERT INTO "entries" VALUES(254,'II-III-S2','TUE',1,1,'08:10','09:10','Probability & Statistics','','Probability / and Statistics');
INSERT INTO "entries" VALUES(255,'II-III-S2','TUE',2,2,'09:10','10:10','Digital Logic Design','','Digital Logic / Design');
INSERT INTO "entries" VALUES(256,'II-III-S2','TUE',3,3,'10:20','11:20','Data Structures & Algorithms','','Data Structures / and Algorithms');
INSERT INTO "entries" VALUES(257,'II-III-S2','TUE',4,4,'11:20','12:20','CI','','CI');
INSERT INTO "entries" VALUES(258,'II-III-S2','TUE',5,5,'12:20','13:20','DSA Lab','','DSA Lab');
INSERT INTO "entries" VALUES(259,'II-III-S2','TUE',6,7,'14:10','16:10','Data Structures & Algorithms','Computer Lab - 1','Data Structures and Algorithms');
INSERT INTO "entries" VALUES(260,'II-III-S2','WED',1,1,'08:10','09:10','Digital Logic Design','','Digital Logic / Design');
INSERT INTO "entries" VALUES(261,'II-III-S2','WED',2,2,'09:10','10:10','Computer Organization & Architecture','','Computer / Organization / & Architecture');
INSERT INTO "entries" VALUES(262,'II-III-S2','WED',3,3,'10:20','11:20','Fundamentals of Machine Learning','','Fundamentals / of ML');
INSERT INTO "entries" VALUES(263,'II-III-S2','WED',4,4,'11:20','12:20','Intelligent Systems','','Intelligent / Systems');
INSERT INTO "entries" VALUES(264,'II-III-S2','WED',5,5,'12:20','13:20','FML Lab','','FML LAB');
INSERT INTO "entries" VALUES(265,'II-III-S2','WED',6,7,'14:10','16:10','Fundamentals of Machine Learning','Computer Lab - 5','Fundamentals of Machine / Learning');
INSERT INTO "entries" VALUES(266,'II-III-S2','FRI',1,1,'08:10','09:10','Probability & Statistics','','Probability / and Statistics');
INSERT INTO "entries" VALUES(267,'II-III-S2','FRI',2,4,'09:10','12:20',NULL,'Computer Lab-4','Digital Logic Design / / Computer Organization & Architecture');
INSERT INTO "entries" VALUES(268,'II-III-S2','FRI',5,5,'12:20','13:20','Probability & Statistics','','Probability / and Statistics');
INSERT INTO "entries" VALUES(269,'II-III-S2','FRI',6,6,'14:10','15:10','Intelligent Systems','','Intelligent / Systems');
INSERT INTO "entries" VALUES(270,'II-III-S2','FRI',7,7,'15:10','16:10','Intelligent Systems','','Intelligent / Systems');
INSERT INTO "entries" VALUES(271,'II-III-S3','MON',1,1,'08:10','09:10','Digital Logic Design','','Digital Logic / Design');
INSERT INTO "entries" VALUES(272,'II-III-S3','MON',2,2,'09:10','10:10','Probability & Statistics','','Probability / and Statistics');
INSERT INTO "entries" VALUES(273,'II-III-S3','MON',3,3,'10:20','11:20','Fundamentals of Machine Learning','','Fundamentals / of ML');
INSERT INTO "entries" VALUES(274,'II-III-S3','MON',4,4,'11:20','12:20','Data Structures & Algorithms','','Data Structures / and Algorithms');
INSERT INTO "entries" VALUES(275,'II-III-S3','MON',5,5,'12:20','13:20','DSA Lab','','DSA Lab');
INSERT INTO "entries" VALUES(276,'II-III-S3','MON',6,7,'14:10','16:10','Data Structures & Algorithms','Computer Lab - 1','Data Structures and Algorithms');
INSERT INTO "entries" VALUES(277,'II-III-S3','TUE',1,1,'08:10','09:10','Fundamentals of Machine Learning','','Fundamentals / of ML');
INSERT INTO "entries" VALUES(278,'II-III-S3','TUE',2,4,'09:10','12:20',NULL,'Computer Lab-4','Digital Logic Design / / Computer Organization & Architecture');
INSERT INTO "entries" VALUES(279,'II-III-S3','TUE',5,5,'12:20','13:20','Probability & Statistics','','Probability / and Statistics');
INSERT INTO "entries" VALUES(280,'II-III-S3','TUE',6,6,'14:10','15:10','Computer Organization & Architecture','','Computer / Organization / & Architecture');
INSERT INTO "entries" VALUES(281,'II-III-S3','TUE',7,7,'15:10','16:10','Yoga','','YOGA');
INSERT INTO "entries" VALUES(282,'II-III-S3','WED',1,1,'08:10','09:10','Probability & Statistics','','Probability / and Statistics');
INSERT INTO "entries" VALUES(283,'II-III-S3','WED',2,2,'09:10','10:10','Digital Logic Design','','Digital Logic / Design');
INSERT INTO "entries" VALUES(284,'II-III-S3','WED',3,3,'10:20','11:20','Data Structures & Algorithms','','Data Structures / and Algorithms');
INSERT INTO "entries" VALUES(285,'II-III-S3','WED',4,4,'11:20','12:20','Honours','','*Honors');
INSERT INTO "entries" VALUES(286,'II-III-S3','WED',5,5,'12:20','13:20','CI','','CI');
INSERT INTO "entries" VALUES(287,'II-III-S3','WED',6,7,'14:10','16:10','Soft Skills-II','','Soft Skills-II');
INSERT INTO "entries" VALUES(288,'II-III-S3','FRI',1,1,'08:10','09:10','Honours','','*Honors');
INSERT INTO "entries" VALUES(289,'II-III-S3','FRI',2,2,'09:10','10:10','Probability & Statistics','','Probability / and Statistics');
INSERT INTO "entries" VALUES(290,'II-III-S3','FRI',3,3,'10:20','11:20','Digital Logic Design','','Digital Logic / Design');
INSERT INTO "entries" VALUES(291,'II-III-S3','FRI',4,4,'11:20','12:20','Fundamentals of Machine Learning','','Fundamentals / of ML');
INSERT INTO "entries" VALUES(292,'II-III-S3','FRI',5,5,'12:20','13:20','DLD / COA Lab','','DLD \ COA LAB');
INSERT INTO "entries" VALUES(293,'II-III-S3','FRI',6,7,'14:10','16:10',NULL,'Computer Lab-4','Digital Logic Design / / Computer Organization & / Architecture');
INSERT INTO "entries" VALUES(294,'II-III-S4','MON',1,1,'08:10','09:10','Probability & Statistics','','Probability / and Statistics');
INSERT INTO "entries" VALUES(295,'II-III-S4','MON',2,4,'09:10','12:20','Data Structures & Algorithms','Computer Lab - 1','Data Structures and Algorithms');
INSERT INTO "entries" VALUES(296,'II-III-S4','MON',5,5,'12:20','13:20','Honours','','*Honors');
INSERT INTO "entries" VALUES(297,'II-III-S4','MON',6,6,'14:10','15:10','Digital Logic Design','','Digital Logic / Design');
INSERT INTO "entries" VALUES(298,'II-III-S4','MON',7,7,'15:10','16:10','CI','','CI');
INSERT INTO "entries" VALUES(299,'II-III-S4','TUE',1,1,'08:10','09:10','Digital Logic Design','','Digital Logic / Design');
INSERT INTO "entries" VALUES(300,'II-III-S4','TUE',2,2,'09:10','10:10','Honours','','*Honors');
INSERT INTO "entries" VALUES(301,'II-III-S4','TUE',3,3,'10:20','11:20','Computer Organization & Architecture','','Computer / Organization / & Architecture');
INSERT INTO "entries" VALUES(302,'II-III-S4','TUE',4,4,'11:20','12:20','Fundamentals of Machine Learning','','Fundamentals / of ML');
INSERT INTO "entries" VALUES(303,'II-III-S4','TUE',5,5,'12:20','13:20','Probability & Statistics','','Probability / and Statistics');
INSERT INTO "entries" VALUES(304,'II-III-S4','TUE',6,7,'14:10','16:10','Soft Skills-II','','Soft Skills-II');
INSERT INTO "entries" VALUES(305,'II-III-S4','WED',1,1,'08:10','09:10','Computer Organization & Architecture','','Computer / Organization / & Architecture');
INSERT INTO "entries" VALUES(306,'II-III-S4','WED',2,4,'09:10','12:20',NULL,'Computer Lab-4','Digital Logic Design / / Computer Organization & Architecture');
INSERT INTO "entries" VALUES(307,'II-III-S4','WED',5,5,'12:20','13:20','Yoga','','YOGA');
INSERT INTO "entries" VALUES(308,'II-III-S4','WED',6,6,'14:10','15:10','Probability & Statistics','','Probability / and Statistics');
INSERT INTO "entries" VALUES(309,'II-III-S4','WED',7,7,'15:10','16:10','Data Structures & Algorithms','','Data Structures / and Algorithms');
INSERT INTO "entries" VALUES(310,'II-III-S4','FRI',1,1,'08:10','09:10','Fundamentals of Machine Learning','','Fundamentals / of ML');
INSERT INTO "entries" VALUES(311,'II-III-S4','FRI',2,2,'09:10','10:10','Honours','','*Honors');
INSERT INTO "entries" VALUES(312,'II-III-S4','FRI',3,3,'10:20','11:20','Data Structures & Algorithms','','Data Structures / and Algorithms');
INSERT INTO "entries" VALUES(313,'II-III-S4','FRI',4,4,'11:20','12:20','Computer Organization & Architecture','','Computer / Organization / & Architecture');
INSERT INTO "entries" VALUES(314,'II-III-S4','FRI',5,5,'12:20','13:20','FML Lab','','FML LAB');
INSERT INTO "entries" VALUES(315,'II-III-S4','FRI',6,7,'14:10','16:10','Fundamentals of Machine Learning','Computer Lab - 5','Fundamentals of Machine / Learning');
INSERT INTO "entries" VALUES(316,'II-III-S5','MON',1,1,'08:10','09:10','Computer Organization & Architecture','','Computer / Organization / & Architecture');
INSERT INTO "entries" VALUES(317,'II-III-S5','MON',2,2,'09:10','10:10','Probability & Statistics','','Probability / and Statistics');
INSERT INTO "entries" VALUES(318,'II-III-S5','MON',3,3,'10:20','11:20','Fundamentals of Machine Learning','','Fundamentals / of ML');
INSERT INTO "entries" VALUES(319,'II-III-S5','MON',4,5,'11:20','13:20','Soft Skills-II','','Soft Skills-II');
INSERT INTO "entries" VALUES(320,'II-III-S5','MON',6,6,'14:10','15:10','Computer Organization & Architecture','','Computer / Organization / & Architecture');
INSERT INTO "entries" VALUES(321,'II-III-S5','MON',7,7,'15:10','16:10','CI','','CI');
INSERT INTO "entries" VALUES(322,'II-III-S5','TUE',1,1,'08:10','09:10','Digital Logic Design','','Digital Logic / Design');
INSERT INTO "entries" VALUES(323,'II-III-S5','TUE',2,4,'09:10','12:20','Data Structures & Algorithms','Computer Lab - 1','Data Structures and Algorithms');
INSERT INTO "entries" VALUES(324,'II-III-S5','TUE',5,5,'12:20','13:20','Yoga','','YOGA');
INSERT INTO "entries" VALUES(325,'II-III-S5','TUE',6,6,'14:10','15:10','Data Structures & Algorithms','','Data Structures / and Algorithms');
INSERT INTO "entries" VALUES(326,'II-III-S5','TUE',7,7,'15:10','16:10','Computer Organization & Architecture','','Computer / Organization / & Architecture');
INSERT INTO "entries" VALUES(327,'II-III-S5','WED',1,3,'08:10','11:20','Fundamentals of Machine Learning','Computer Lab - 5','Fundamentals of Machine Learning');
INSERT INTO "entries" VALUES(328,'II-III-S5','WED',4,4,'11:20','12:20','Cyber Space Operations','','Cyber Space / Operations');
INSERT INTO "entries" VALUES(329,'II-III-S5','WED',5,5,'12:20','13:20','Probability & Statistics','','Probability / and Statistics');
INSERT INTO "entries" VALUES(330,'II-III-S5','WED',6,6,'14:10','15:10','Fundamentals of Machine Learning','','Fundamentals / of ML');
INSERT INTO "entries" VALUES(331,'II-III-S5','WED',7,7,'15:10','16:10','Digital Logic Design','','Digital Logic / Design');
INSERT INTO "entries" VALUES(332,'II-III-S5','FRI',1,1,'08:10','09:10','Probability & Statistics','','Probability / and Statistics');
INSERT INTO "entries" VALUES(333,'II-III-S5','FRI',2,4,'09:10','12:20',NULL,'Computer Lab-4','Digital Logic Design / / Computer Organization & Architecture');
INSERT INTO "entries" VALUES(334,'II-III-S5','FRI',5,5,'12:20','13:20','Data Structures & Algorithms','','Data Structures / and Algorithms');
INSERT INTO "entries" VALUES(335,'II-III-S5','FRI',6,6,'14:10','15:10','Cyber Space Operations','','Cyber Space / Operations');
INSERT INTO "entries" VALUES(336,'II-III-S5','FRI',7,7,'15:10','16:10','Cyber Space Operations','','Cyber Space / Operations');
INSERT INTO "entries" VALUES(337,'II-III-S6','MON',1,1,'08:10','09:10','Data Structures & Algorithms','','Data Structures / and Algorithms');
INSERT INTO "entries" VALUES(338,'II-III-S6','MON',2,4,'09:10','12:20',NULL,'Computer Lab-4','Digital Logic Design / / Computer Organization & Architecture');
INSERT INTO "entries" VALUES(339,'II-III-S6','MON',5,5,'12:20','13:20','Fundamentals of Machine Learning','','Fundamentals / of ML');
INSERT INTO "entries" VALUES(340,'II-III-S6','MON',6,6,'14:10','15:10','Digital Logic Design','','Digital Logic / Design');
INSERT INTO "entries" VALUES(341,'II-III-S6','MON',7,7,'15:10','16:10','CI','','CI');
INSERT INTO "entries" VALUES(342,'II-III-S6','TUE',1,1,'08:10','09:10','Computer Organization & Architecture','','Computer / Organization / & Architecture');
INSERT INTO "entries" VALUES(343,'II-III-S6','TUE',2,2,'09:10','10:10','Digital Logic Design','','Digital Logic / Design');
INSERT INTO "entries" VALUES(344,'II-III-S6','TUE',3,3,'10:20','11:20','Data Structures & Algorithms','','Data Structures / and Algorithms');
INSERT INTO "entries" VALUES(345,'II-III-S6','TUE',4,4,'11:20','12:20','Probability & Statistics','','Probability / and Statistics');
INSERT INTO "entries" VALUES(346,'II-III-S6','TUE',5,5,'12:20','13:20','DLD / COA Lab','','DLD \ COA / LAB');
INSERT INTO "entries" VALUES(347,'II-III-S6','TUE',6,7,'14:10','16:10',NULL,'Computer Lab-4','Digital Logic Design / / Computer Organization & / Architecture');
INSERT INTO "entries" VALUES(348,'II-III-S6','WED',1,1,'08:10','09:10','Digital Logic Design','','Digital Logic / Design');
INSERT INTO "entries" VALUES(349,'II-III-S6','WED',2,2,'09:10','10:10','Fundamentals of Machine Learning','','Fundamentals / of ML');
INSERT INTO "entries" VALUES(350,'II-III-S6','WED',3,3,'10:20','11:20','Probability & Statistics','','Probability / and Statistics');
INSERT INTO "entries" VALUES(351,'II-III-S6','WED',4,5,'11:20','13:20','Soft Skills-II','','Soft Skills-II');
INSERT INTO "entries" VALUES(352,'II-III-S6','WED',6,6,'14:10','15:10','Intelligent Systems','','Intelligent / Systems');
INSERT INTO "entries" VALUES(353,'II-III-S6','WED',7,7,'15:10','16:10','Data Structures & Algorithms','','Data Structures / and Algorithms');
INSERT INTO "entries" VALUES(354,'II-III-S6','FRI',1,1,'08:10','09:10','Probability & Statistics','','Probability / and Statistics');
INSERT INTO "entries" VALUES(355,'II-III-S6','FRI',2,4,'09:10','12:20','Fundamentals of Machine Learning','Computer Lab - 5','Fundamentals of Machine Learning');
INSERT INTO "entries" VALUES(356,'II-III-S6','FRI',5,5,'12:20','13:20','Intelligent Systems','','Intelligent / Systems');
INSERT INTO "entries" VALUES(357,'II-III-S6','FRI',6,6,'14:10','15:10','Computer Organization & Architecture','','Computer / Organization / & Architecture');
INSERT INTO "entries" VALUES(358,'II-III-S6','FRI',7,7,'15:10','16:10','Yoga','','YOGA');
INSERT INTO "entries" VALUES(359,'II-III-S7','MON',1,1,'08:10','09:10','Digital Logic Design','','Digital Logic / Design');
INSERT INTO "entries" VALUES(360,'II-III-S7','MON',2,2,'09:10','10:10','Intelligent Systems','','Intelligent / Systems');
INSERT INTO "entries" VALUES(361,'II-III-S7','MON',3,3,'10:20','11:20','Data Structures & Algorithms','','Data Structures / and Algorithms');
INSERT INTO "entries" VALUES(362,'II-III-S7','MON',4,4,'11:20','12:20','Probability & Statistics','','Probability / and Statistics');
INSERT INTO "entries" VALUES(363,'II-III-S7','MON',5,5,'12:20','13:20','DLD / COA Lab','','DLD \ COA / LAB');
INSERT INTO "entries" VALUES(364,'II-III-S7','MON',6,7,'14:10','16:10',NULL,'Computer Lab-4','Digital Logic Design / / Computer Organization & / Architecture');
INSERT INTO "entries" VALUES(365,'II-III-S7','TUE',1,1,'08:10','09:10','Data Structures & Algorithms','','Data Structures / and Algorithms');
INSERT INTO "entries" VALUES(366,'II-III-S7','TUE',2,2,'09:10','10:10','Probability & Statistics','','Probability / and Statistics');
INSERT INTO "entries" VALUES(367,'II-III-S7','TUE',3,3,'10:20','11:20','Fundamentals of Machine Learning','','Fundamentals / of ML');
INSERT INTO "entries" VALUES(368,'II-III-S7','TUE',4,4,'11:20','12:20','Digital Logic Design','','Digital Logic / Design');
INSERT INTO "entries" VALUES(369,'II-III-S7','TUE',5,5,'12:20','13:20','FML Lab','','FML LAB');
INSERT INTO "entries" VALUES(370,'II-III-S7','TUE',6,7,'14:10','16:10','Fundamentals of Machine Learning','Computer Lab - 5','Fundamentals of Machine / Learning');
INSERT INTO "entries" VALUES(371,'II-III-S7','WED',1,1,'08:10','09:10','Probability & Statistics','','Probability / and Statistics');
INSERT INTO "entries" VALUES(372,'II-III-S7','WED',2,4,'09:10','12:20',NULL,'Computer Lab-4','Digital Logic Design / / Computer Organization & Architecture');
INSERT INTO "entries" VALUES(373,'II-III-S7','WED',5,5,'12:20','13:20','Intelligent Systems','','Intelligent / Systems');
INSERT INTO "entries" VALUES(374,'II-III-S7','WED',6,6,'14:10','15:10','Computer Organization & Architecture','','Computer / Organization / & Architecture');
INSERT INTO "entries" VALUES(375,'II-III-S7','WED',7,7,'15:10','16:10','Fundamentals of Machine Learning','','Fundamentals / of ML');
INSERT INTO "entries" VALUES(376,'II-III-S7','FRI',1,1,'08:10','09:10','Intelligent Systems','','Intelligent / Systems');
INSERT INTO "entries" VALUES(377,'II-III-S7','FRI',2,4,'09:10','12:20','Data Structures & Algorithms','Computer Lab - 1','Data Structures and Algorithms');
INSERT INTO "entries" VALUES(378,'II-III-S7','FRI',5,5,'12:20','13:20','Fundamentals of Machine Learning','','Fundamentals / of ML');
INSERT INTO "entries" VALUES(379,'II-III-S7','FRI',6,6,'14:10','15:10','Data Structures & Algorithms','','Data Structures / and Algorithms');
INSERT INTO "entries" VALUES(380,'II-III-S7','FRI',7,7,'15:10','16:10','Digital Logic Design','','Digital Logic / Design');
INSERT INTO "entries" VALUES(381,'II-III-S8','MON',1,1,'08:10','09:10','Data Structures & Algorithms','','Data Structures / and Algorithms');
INSERT INTO "entries" VALUES(382,'II-III-S8','MON',2,2,'09:10','10:10','Digital Logic Design','','Digital Logic / Design');
INSERT INTO "entries" VALUES(383,'II-III-S8','MON',3,3,'10:20','11:20','Computer Organization & Architecture','','Computer / Organization / & Architecture');
INSERT INTO "entries" VALUES(384,'II-III-S8','MON',4,4,'11:20','12:20','Probability & Statistics','','Probability / and Statistics');
INSERT INTO "entries" VALUES(385,'II-III-S8','MON',5,5,'12:20','13:20','FML Lab','','FML LAB');
INSERT INTO "entries" VALUES(386,'II-III-S8','MON',6,7,'14:10','16:10','Fundamentals of Machine Learning','Computer Lab - 5','Fundamentals of Machine / Learning');
INSERT INTO "entries" VALUES(387,'II-III-S8','TUE',1,1,'08:10','09:10','Fundamentals of Machine Learning','','Fundamentals / of ML');
INSERT INTO "entries" VALUES(388,'II-III-S8','TUE',2,4,'09:10','12:20',NULL,'Computer Lab-4','Digital Logic Design / / Computer Organization & Architecture');
INSERT INTO "entries" VALUES(389,'II-III-S8','TUE',5,5,'12:20','13:20','Probability & Statistics','','Probability / and Statistics');
INSERT INTO "entries" VALUES(390,'II-III-S8','TUE',6,6,'14:10','15:10','Fundamentals of Machine Learning','','Fundamentals / of ML');
INSERT INTO "entries" VALUES(391,'II-III-S8','TUE',7,7,'15:10','16:10','CI','','CI');
INSERT INTO "entries" VALUES(392,'II-III-S8','WED',1,1,'08:10','09:10','Digital Logic Design','','Digital Logic / Design');
INSERT INTO "entries" VALUES(393,'II-III-S8','WED',2,2,'09:10','10:10','Computer Organization & Architecture','','Computer / Organization / & Architecture');
INSERT INTO "entries" VALUES(394,'II-III-S8','WED',3,3,'10:20','11:20','Data Structures & Algorithms','','Data Structures / and Algorithms');
INSERT INTO "entries" VALUES(395,'II-III-S8','WED',4,4,'11:20','12:20','Honours','','*Honors');
INSERT INTO "entries" VALUES(396,'II-III-S8','WED',5,5,'12:20','13:20','DLD / COA Lab','','DLD \ COA / LAB');
INSERT INTO "entries" VALUES(397,'II-III-S8','WED',6,7,'14:10','16:10',NULL,'Computer Lab-4','Digital Logic Design / / Computer Organization & / Architecture');
INSERT INTO "entries" VALUES(398,'II-III-S8','FRI',1,1,'08:10','09:10','Honours','','*Honors');
INSERT INTO "entries" VALUES(399,'II-III-S8','FRI',2,2,'09:10','10:10','Digital Logic Design','','Digital Logic / Design');
INSERT INTO "entries" VALUES(400,'II-III-S8','FRI',3,3,'10:20','11:20','Probability & Statistics','','Probability / and Statistics');
INSERT INTO "entries" VALUES(401,'II-III-S8','FRI',4,4,'11:20','12:20','Computer Organization & Architecture','','Computer / Organization / & Architecture');
INSERT INTO "entries" VALUES(402,'II-III-S8','FRI',5,5,'12:20','13:20','Yoga','','YOGA');
INSERT INTO "entries" VALUES(403,'II-III-S8','FRI',6,7,'14:10','16:10','Soft Skills-II','','Soft Skills-II');
INSERT INTO "entries" VALUES(404,'II-III-S9','MON',1,1,'08:10','09:10','Probability & Statistics','','Probability / and Statistics');
INSERT INTO "entries" VALUES(405,'II-III-S9','MON',2,4,'09:10','12:20','Fundamentals of Machine Learning','Computer Lab - 5','Fundamentals of Machine Learning');
INSERT INTO "entries" VALUES(406,'II-III-S9','MON',5,5,'12:20','13:20','Yoga','','YOGA');
INSERT INTO "entries" VALUES(407,'II-III-S9','MON',6,6,'14:10','15:10','AI & Machine Learning','','AI and / Machine / Learning');
INSERT INTO "entries" VALUES(408,'II-III-S9','MON',7,7,'15:10','16:10','CI','','CI');
INSERT INTO "entries" VALUES(409,'II-III-S9','TUE',1,1,'08:10','09:10','Computer Organization & Architecture','','Computer / Organization / & Architecture');
INSERT INTO "entries" VALUES(410,'II-III-S9','TUE',2,2,'09:10','10:10','AI & Machine Learning','','AI and / Machine / Learning');
INSERT INTO "entries" VALUES(411,'II-III-S9','TUE',3,3,'10:20','11:20','Data Structures & Algorithms','','Data Structures / and Algorithms');
INSERT INTO "entries" VALUES(412,'II-III-S9','TUE',4,5,'11:20','13:20','Soft Skills-II','','Soft Skills-II');
INSERT INTO "entries" VALUES(413,'II-III-S9','TUE',6,6,'14:10','15:10','AI & Machine Learning','','AI and / Machine / Learning');
INSERT INTO "entries" VALUES(414,'II-III-S9','TUE',7,7,'15:10','16:10','Probability & Statistics','','Probability / and Statistics');
INSERT INTO "entries" VALUES(415,'II-III-S9','WED',1,1,'08:10','09:10','Data Structures & Algorithms','','Data Structures / and Algorithms');
INSERT INTO "entries" VALUES(416,'II-III-S9','WED',2,2,'09:10','10:10','Fundamentals of Machine Learning','','Fundamentals / of ML');
INSERT INTO "entries" VALUES(417,'II-III-S9','WED',3,3,'10:20','11:20','Computer Organization & Architecture','','Computer / Organization / & Architecture');
INSERT INTO "entries" VALUES(418,'II-III-S9','WED',4,4,'11:20','12:20','Digital Logic Design','','Digital Logic / Design');
INSERT INTO "entries" VALUES(419,'II-III-S9','WED',5,5,'12:20','13:20','DSA Lab','','DSA Lab');
INSERT INTO "entries" VALUES(420,'II-III-S9','WED',6,7,'14:10','16:10','Data Structures & Algorithms','Computer Lab - 1','Data Structures and Algorithms');
INSERT INTO "entries" VALUES(421,'II-III-S9','FRI',1,1,'08:10','09:10','Digital Logic Design','','Digital Logic / Design');
INSERT INTO "entries" VALUES(422,'II-III-S9','FRI',2,2,'09:10','10:10','Probability & Statistics','','Probability / and Statistics');
INSERT INTO "entries" VALUES(423,'II-III-S9','FRI',3,3,'10:20','11:20','Fundamentals of Machine Learning','','Fundamentals / of ML');
INSERT INTO "entries" VALUES(424,'II-III-S9','FRI',4,4,'11:20','12:20','Data Structures & Algorithms','','Data Structures / and Algorithms');
INSERT INTO "entries" VALUES(425,'II-III-S9','FRI',5,5,'12:20','13:20','DLD / COA Lab','','DLD \ COA / LAB');
INSERT INTO "entries" VALUES(426,'II-III-S9','FRI',6,7,'14:10','16:10',NULL,'Computer Lab-4','Digital Logic Design / / Computer Organization & / Architecture');
CREATE TABLE entry_faculty(
  entry_id INTEGER REFERENCES entries(id) ON DELETE CASCADE,
  faculty_id INTEGER REFERENCES faculty(id) ON DELETE CASCADE,
  PRIMARY KEY(entry_id, faculty_id)
);
INSERT INTO "entry_faculty" VALUES(2,28);
INSERT INTO "entry_faculty" VALUES(4,4);
INSERT INTO "entry_faculty" VALUES(5,4);
INSERT INTO "entry_faculty" VALUES(6,28);
INSERT INTO "entry_faculty" VALUES(7,4);
INSERT INTO "entry_faculty" VALUES(9,4);
INSERT INTO "entry_faculty" VALUES(10,4);
INSERT INTO "entry_faculty" VALUES(12,4);
INSERT INTO "entry_faculty" VALUES(13,28);
INSERT INTO "entry_faculty" VALUES(14,4);
INSERT INTO "entry_faculty" VALUES(16,4);
INSERT INTO "entry_faculty" VALUES(17,4);
INSERT INTO "entry_faculty" VALUES(18,4);
INSERT INTO "entry_faculty" VALUES(20,4);
INSERT INTO "entry_faculty" VALUES(21,4);
INSERT INTO "entry_faculty" VALUES(23,28);
INSERT INTO "entry_faculty" VALUES(27,28);
INSERT INTO "entry_faculty" VALUES(28,4);
INSERT INTO "entry_faculty" VALUES(30,4);
INSERT INTO "entry_faculty" VALUES(32,4);
INSERT INTO "entry_faculty" VALUES(33,28);
INSERT INTO "entry_faculty" VALUES(35,4);
INSERT INTO "entry_faculty" VALUES(36,4);
INSERT INTO "entry_faculty" VALUES(38,4);
INSERT INTO "entry_faculty" VALUES(40,4);
INSERT INTO "entry_faculty" VALUES(41,4);
INSERT INTO "entry_faculty" VALUES(42,4);
INSERT INTO "entry_faculty" VALUES(44,18);
INSERT INTO "entry_faculty" VALUES(45,5);
INSERT INTO "entry_faculty" VALUES(47,33);
INSERT INTO "entry_faculty" VALUES(49,10);
INSERT INTO "entry_faculty" VALUES(50,18);
INSERT INTO "entry_faculty" VALUES(51,31);
INSERT INTO "entry_faculty" VALUES(52,31);
INSERT INTO "entry_faculty" VALUES(53,18);
INSERT INTO "entry_faculty" VALUES(54,10);
INSERT INTO "entry_faculty" VALUES(56,31);
INSERT INTO "entry_faculty" VALUES(58,31);
INSERT INTO "entry_faculty" VALUES(59,18);
INSERT INTO "entry_faculty" VALUES(60,33);
INSERT INTO "entry_faculty" VALUES(61,5);
INSERT INTO "entry_faculty" VALUES(63,10);
INSERT INTO "entry_faculty" VALUES(65,24);
INSERT INTO "entry_faculty" VALUES(66,31);
INSERT INTO "entry_faculty" VALUES(67,16);
INSERT INTO "entry_faculty" VALUES(69,11);
INSERT INTO "entry_faculty" VALUES(70,33);
INSERT INTO "entry_faculty" VALUES(71,11);
INSERT INTO "entry_faculty" VALUES(72,31);
INSERT INTO "entry_faculty" VALUES(73,16);
INSERT INTO "entry_faculty" VALUES(74,10);
INSERT INTO "entry_faculty" VALUES(75,10);
INSERT INTO "entry_faculty" VALUES(77,31);
INSERT INTO "entry_faculty" VALUES(79,24);
INSERT INTO "entry_faculty" VALUES(82,16);
INSERT INTO "entry_faculty" VALUES(83,24);
INSERT INTO "entry_faculty" VALUES(84,33);
INSERT INTO "entry_faculty" VALUES(85,31);
INSERT INTO "entry_faculty" VALUES(86,11);
INSERT INTO "entry_faculty" VALUES(87,11);
INSERT INTO "entry_faculty" VALUES(89,1);
INSERT INTO "entry_faculty" VALUES(91,11);
INSERT INTO "entry_faculty" VALUES(93,6);
INSERT INTO "entry_faculty" VALUES(95,33);
INSERT INTO "entry_faculty" VALUES(96,7);
INSERT INTO "entry_faculty" VALUES(97,11);
INSERT INTO "entry_faculty" VALUES(99,12);
INSERT INTO "entry_faculty" VALUES(100,11);
INSERT INTO "entry_faculty" VALUES(101,6);
INSERT INTO "entry_faculty" VALUES(102,11);
INSERT INTO "entry_faculty" VALUES(103,1);
INSERT INTO "entry_faculty" VALUES(104,1);
INSERT INTO "entry_faculty" VALUES(106,33);
INSERT INTO "entry_faculty" VALUES(107,12);
INSERT INTO "entry_faculty" VALUES(108,30);
INSERT INTO "entry_faculty" VALUES(109,30);
INSERT INTO "entry_faculty" VALUES(110,5);
INSERT INTO "entry_faculty" VALUES(111,7);
INSERT INTO "entry_faculty" VALUES(113,19);
INSERT INTO "entry_faculty" VALUES(114,7);
INSERT INTO "entry_faculty" VALUES(115,7);
INSERT INTO "entry_faculty" VALUES(116,33);
INSERT INTO "entry_faculty" VALUES(117,19);
INSERT INTO "entry_faculty" VALUES(118,1);
INSERT INTO "entry_faculty" VALUES(119,5);
INSERT INTO "entry_faculty" VALUES(121,1);
INSERT INTO "entry_faculty" VALUES(122,19);
INSERT INTO "entry_faculty" VALUES(124,7);
INSERT INTO "entry_faculty" VALUES(125,5);
INSERT INTO "entry_faculty" VALUES(126,5);
INSERT INTO "entry_faculty" VALUES(128,5);
INSERT INTO "entry_faculty" VALUES(129,33);
INSERT INTO "entry_faculty" VALUES(130,1);
INSERT INTO "entry_faculty" VALUES(131,7);
INSERT INTO "entry_faculty" VALUES(133,35);
INSERT INTO "entry_faculty" VALUES(134,33);
INSERT INTO "entry_faculty" VALUES(136,33);
INSERT INTO "entry_faculty" VALUES(138,33);
INSERT INTO "entry_faculty" VALUES(139,19);
INSERT INTO "entry_faculty" VALUES(140,21);
INSERT INTO "entry_faculty" VALUES(142,33);
INSERT INTO "entry_faculty" VALUES(143,35);
INSERT INTO "entry_faculty" VALUES(144,21);
INSERT INTO "entry_faculty" VALUES(145,21);
INSERT INTO "entry_faculty" VALUES(146,33);
INSERT INTO "entry_faculty" VALUES(147,33);
INSERT INTO "entry_faculty" VALUES(149,19);
INSERT INTO "entry_faculty" VALUES(150,33);
INSERT INTO "entry_faculty" VALUES(151,19);
INSERT INTO "entry_faculty" VALUES(152,35);
INSERT INTO "entry_faculty" VALUES(153,21);
INSERT INTO "entry_faculty" VALUES(155,19);
INSERT INTO "entry_faculty" VALUES(156,19);
INSERT INTO "entry_faculty" VALUES(157,23);
INSERT INTO "entry_faculty" VALUES(158,33);
INSERT INTO "entry_faculty" VALUES(159,21);
INSERT INTO "entry_faculty" VALUES(160,33);
INSERT INTO "entry_faculty" VALUES(161,26);
INSERT INTO "entry_faculty" VALUES(162,26);
INSERT INTO "entry_faculty" VALUES(163,26);
INSERT INTO "entry_faculty" VALUES(164,23);
INSERT INTO "entry_faculty" VALUES(168,33);
INSERT INTO "entry_faculty" VALUES(169,24);
INSERT INTO "entry_faculty" VALUES(170,23);
INSERT INTO "entry_faculty" VALUES(172,21);
INSERT INTO "entry_faculty" VALUES(173,21);
INSERT INTO "entry_faculty" VALUES(174,21);
INSERT INTO "entry_faculty" VALUES(176,23);
INSERT INTO "entry_faculty" VALUES(178,26);
INSERT INTO "entry_faculty" VALUES(179,24);
INSERT INTO "entry_faculty" VALUES(180,8);
INSERT INTO "entry_faculty" VALUES(181,33);
INSERT INTO "entry_faculty" VALUES(183,33);
INSERT INTO "entry_faculty" VALUES(185,24);
INSERT INTO "entry_faculty" VALUES(187,6);
INSERT INTO "entry_faculty" VALUES(188,8);
INSERT INTO "entry_faculty" VALUES(191,23);
INSERT INTO "entry_faculty" VALUES(192,33);
INSERT INTO "entry_faculty" VALUES(193,8);
INSERT INTO "entry_faculty" VALUES(195,6);
INSERT INTO "entry_faculty" VALUES(197,23);
INSERT INTO "entry_faculty" VALUES(198,6);
INSERT INTO "entry_faculty" VALUES(201,6);
INSERT INTO "entry_faculty" VALUES(202,8);
INSERT INTO "entry_faculty" VALUES(207,24);
INSERT INTO "entry_faculty" VALUES(209,6);
INSERT INTO "entry_faculty" VALUES(210,8);
INSERT INTO "entry_faculty" VALUES(213,23);
INSERT INTO "entry_faculty" VALUES(215,26);
INSERT INTO "entry_faculty" VALUES(217,6);
INSERT INTO "entry_faculty" VALUES(219,23);
INSERT INTO "entry_faculty" VALUES(220,6);
INSERT INTO "entry_faculty" VALUES(223,6);
INSERT INTO "entry_faculty" VALUES(224,22);
INSERT INTO "entry_faculty" VALUES(225,29);
INSERT INTO "entry_faculty" VALUES(226,8);
INSERT INTO "entry_faculty" VALUES(226,17);
INSERT INTO "entry_faculty" VALUES(230,8);
INSERT INTO "entry_faculty" VALUES(230,17);
INSERT INTO "entry_faculty" VALUES(232,15);
INSERT INTO "entry_faculty" VALUES(233,22);
INSERT INTO "entry_faculty" VALUES(236,29);
INSERT INTO "entry_faculty" VALUES(237,23);
INSERT INTO "entry_faculty" VALUES(239,29);
INSERT INTO "entry_faculty" VALUES(241,15);
INSERT INTO "entry_faculty" VALUES(243,8);
INSERT INTO "entry_faculty" VALUES(243,17);
INSERT INTO "entry_faculty" VALUES(245,23);
INSERT INTO "entry_faculty" VALUES(246,23);
INSERT INTO "entry_faculty" VALUES(247,12);
INSERT INTO "entry_faculty" VALUES(249,12);
INSERT INTO "entry_faculty" VALUES(250,29);
INSERT INTO "entry_faculty" VALUES(251,27);
INSERT INTO "entry_faculty" VALUES(251,32);
INSERT INTO "entry_faculty" VALUES(252,2);
INSERT INTO "entry_faculty" VALUES(255,2);
INSERT INTO "entry_faculty" VALUES(256,29);
INSERT INTO "entry_faculty" VALUES(259,29);
INSERT INTO "entry_faculty" VALUES(260,2);
INSERT INTO "entry_faculty" VALUES(261,27);
INSERT INTO "entry_faculty" VALUES(261,32);
INSERT INTO "entry_faculty" VALUES(262,12);
INSERT INTO "entry_faculty" VALUES(263,5);
INSERT INTO "entry_faculty" VALUES(265,12);
INSERT INTO "entry_faculty" VALUES(269,5);
INSERT INTO "entry_faculty" VALUES(270,5);
INSERT INTO "entry_faculty" VALUES(271,14);
INSERT INTO "entry_faculty" VALUES(273,35);
INSERT INTO "entry_faculty" VALUES(274,1);
INSERT INTO "entry_faculty" VALUES(276,1);
INSERT INTO "entry_faculty" VALUES(277,35);
INSERT INTO "entry_faculty" VALUES(280,18);
INSERT INTO "entry_faculty" VALUES(280,32);
INSERT INTO "entry_faculty" VALUES(283,14);
INSERT INTO "entry_faculty" VALUES(284,1);
INSERT INTO "entry_faculty" VALUES(290,14);
INSERT INTO "entry_faculty" VALUES(291,35);
INSERT INTO "entry_faculty" VALUES(295,34);
INSERT INTO "entry_faculty" VALUES(297,3);
INSERT INTO "entry_faculty" VALUES(299,3);
INSERT INTO "entry_faculty" VALUES(301,17);
INSERT INTO "entry_faculty" VALUES(301,32);
INSERT INTO "entry_faculty" VALUES(302,12);
INSERT INTO "entry_faculty" VALUES(305,17);
INSERT INTO "entry_faculty" VALUES(305,32);
INSERT INTO "entry_faculty" VALUES(309,34);
INSERT INTO "entry_faculty" VALUES(310,12);
INSERT INTO "entry_faculty" VALUES(312,34);
INSERT INTO "entry_faculty" VALUES(313,17);
INSERT INTO "entry_faculty" VALUES(313,32);
INSERT INTO "entry_faculty" VALUES(315,12);
INSERT INTO "entry_faculty" VALUES(316,16);
INSERT INTO "entry_faculty" VALUES(316,32);
INSERT INTO "entry_faculty" VALUES(318,30);
INSERT INTO "entry_faculty" VALUES(320,16);
INSERT INTO "entry_faculty" VALUES(320,32);
INSERT INTO "entry_faculty" VALUES(322,9);
INSERT INTO "entry_faculty" VALUES(323,34);
INSERT INTO "entry_faculty" VALUES(325,34);
INSERT INTO "entry_faculty" VALUES(326,16);
INSERT INTO "entry_faculty" VALUES(326,32);
INSERT INTO "entry_faculty" VALUES(327,30);
INSERT INTO "entry_faculty" VALUES(328,21);
INSERT INTO "entry_faculty" VALUES(330,30);
INSERT INTO "entry_faculty" VALUES(331,9);
INSERT INTO "entry_faculty" VALUES(334,34);
INSERT INTO "entry_faculty" VALUES(335,21);
INSERT INTO "entry_faculty" VALUES(336,21);
INSERT INTO "entry_faculty" VALUES(337,27);
INSERT INTO "entry_faculty" VALUES(339,25);
INSERT INTO "entry_faculty" VALUES(340,20);
INSERT INTO "entry_faculty" VALUES(342,17);
INSERT INTO "entry_faculty" VALUES(343,20);
INSERT INTO "entry_faculty" VALUES(344,27);
INSERT INTO "entry_faculty" VALUES(348,20);
INSERT INTO "entry_faculty" VALUES(349,25);
INSERT INTO "entry_faculty" VALUES(352,26);
INSERT INTO "entry_faculty" VALUES(353,27);
INSERT INTO "entry_faculty" VALUES(355,25);
INSERT INTO "entry_faculty" VALUES(356,26);
INSERT INTO "entry_faculty" VALUES(357,17);
INSERT INTO "entry_faculty" VALUES(359,9);
INSERT INTO "entry_faculty" VALUES(360,26);
INSERT INTO "entry_faculty" VALUES(361,27);
INSERT INTO "entry_faculty" VALUES(365,27);
INSERT INTO "entry_faculty" VALUES(367,36);
INSERT INTO "entry_faculty" VALUES(368,9);
INSERT INTO "entry_faculty" VALUES(370,36);
INSERT INTO "entry_faculty" VALUES(373,26);
INSERT INTO "entry_faculty" VALUES(374,8);
INSERT INTO "entry_faculty" VALUES(374,32);
INSERT INTO "entry_faculty" VALUES(375,36);
INSERT INTO "entry_faculty" VALUES(376,26);
INSERT INTO "entry_faculty" VALUES(377,27);
INSERT INTO "entry_faculty" VALUES(378,36);
INSERT INTO "entry_faculty" VALUES(379,27);
INSERT INTO "entry_faculty" VALUES(380,9);
INSERT INTO "entry_faculty" VALUES(381,37);
INSERT INTO "entry_faculty" VALUES(382,13);
INSERT INTO "entry_faculty" VALUES(383,16);
INSERT INTO "entry_faculty" VALUES(383,32);
INSERT INTO "entry_faculty" VALUES(386,35);
INSERT INTO "entry_faculty" VALUES(387,35);
INSERT INTO "entry_faculty" VALUES(390,35);
INSERT INTO "entry_faculty" VALUES(392,13);
INSERT INTO "entry_faculty" VALUES(393,16);
INSERT INTO "entry_faculty" VALUES(393,32);
INSERT INTO "entry_faculty" VALUES(394,37);
INSERT INTO "entry_faculty" VALUES(399,13);
INSERT INTO "entry_faculty" VALUES(401,16);
INSERT INTO "entry_faculty" VALUES(401,32);
INSERT INTO "entry_faculty" VALUES(405,36);
INSERT INTO "entry_faculty" VALUES(407,25);
INSERT INTO "entry_faculty" VALUES(409,18);
INSERT INTO "entry_faculty" VALUES(409,27);
INSERT INTO "entry_faculty" VALUES(410,25);
INSERT INTO "entry_faculty" VALUES(411,37);
INSERT INTO "entry_faculty" VALUES(413,25);
INSERT INTO "entry_faculty" VALUES(415,37);
INSERT INTO "entry_faculty" VALUES(416,36);
INSERT INTO "entry_faculty" VALUES(417,18);
INSERT INTO "entry_faculty" VALUES(417,27);
INSERT INTO "entry_faculty" VALUES(418,20);
INSERT INTO "entry_faculty" VALUES(420,37);
INSERT INTO "entry_faculty" VALUES(421,20);
INSERT INTO "entry_faculty" VALUES(423,36);
INSERT INTO "entry_faculty" VALUES(424,37);
CREATE TABLE faculty(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT UNIQUE NOT NULL,
  code TEXT,
  user_id INTEGER REFERENCES users(id),
  dept_code TEXT DEFAULT 'CSE',
  designation TEXT DEFAULT 'Assistant Professor',
  cabin TEXT DEFAULT 'CSE Block — Room 204',
  subjects_taught TEXT DEFAULT 'Computer Networks, DBMS',
  email TEXT,
  phone TEXT,
  office_hours TEXT DEFAULT '10:00 AM – 04:00 PM',
  is_active INTEGER DEFAULT 1
);
INSERT INTO "faculty" VALUES(1,'Dr. D. Thamaraiselvi','F001',6,'CSE','Associate Professor & Timetable Coordinator','CSE Block — Room 201','Computer Science Core, Labs','f001@scsvmv.ac.in','+91 94431 10001','10:00 AM – 04:00 PM',1);
INSERT INTO "faculty" VALUES(2,'Dr. J. Vinothkumar','F002',7,'CSE','Associate Professor','CSE Block — Room 202','Object Oriented Analysis, Python','f002@scsvmv.ac.in','+91 94431 10002','10:00 AM – 04:00 PM',1);
INSERT INTO "faculty" VALUES(3,'Dr. K. Anitha','F003',8,'CSE','Associate Professor','CSE Block — Room 203','Computer Science Core, Labs','f003@scsvmv.ac.in','+91 94431 10003','10:00 AM – 04:00 PM',1);
INSERT INTO "faculty" VALUES(4,'Dr. K. Balachandran','F004',9,'CSE','Associate Professor','CSE Block — Room 204','Computer Science Core, Labs','f004@scsvmv.ac.in','+91 94431 10004','10:00 AM – 04:00 PM',1);
INSERT INTO "faculty" VALUES(5,'Dr. M. Gayathri','F005',10,'CSE','Associate Professor','CSE Block — Room 205','Computer Science Core, Labs','f005@scsvmv.ac.in','+91 94431 10005','10:00 AM – 04:00 PM',1);
INSERT INTO "faculty" VALUES(6,'Dr. M. Saraswathi','F006',11,'CSE','Associate Professor','CSE Block — Room 206','Computer Science Core, Labs','f006@scsvmv.ac.in','+91 94431 10006','10:00 AM – 04:00 PM',1);
INSERT INTO "faculty" VALUES(7,'Dr. M. Senthilkumaran','F007',12,'CSE','Professor & Head of Department (HOD)','CSE Block — Room 207','Computer Science Core, Labs','f007@scsvmv.ac.in','+91 94431 10007','10:00 AM – 04:00 PM',1);
INSERT INTO "faculty" VALUES(8,'Dr. N.C.A. Boovarahan','F008',13,'CSE','Associate Professor','CSE Block — Room 208','Computer Science Core, Labs','f008@scsvmv.ac.in','+91 94431 10008','10:00 AM – 04:00 PM',1);
INSERT INTO "faculty" VALUES(9,'Dr. P. Rajalakshmi','F009',14,'CSE','Associate Professor','CSE Block — Room 209','Computer Science Core, Labs','f009@scsvmv.ac.in','+91 94431 10009','10:00 AM – 04:00 PM',1);
INSERT INTO "faculty" VALUES(10,'Dr. P. Shanmugapriya','F010',15,'CSE','Associate Professor','CSE Block — Room 210','Computer Science Core, Labs','f010@scsvmv.ac.in','+91 94431 10010','10:00 AM – 04:00 PM',1);
INSERT INTO "faculty" VALUES(11,'Dr. R. Prema','F011',16,'CSE','Associate Professor','CSE Block — 2nd Floor — Room 211','Natural Language Processing (NLP), Python Programming, Machine Learning, NLP Lab','dr.r.prema@scsvmv.ac.in','+91 94431 10011','10:00 AM – 04:30 PM',1);
INSERT INTO "faculty" VALUES(12,'Dr. R. Sivaramakrishnan','F012',17,'CSE','Associate Professor & Class Incharge (III CSE S3)','CSE Block — Room 212','Computer Science Core, Labs','f012@scsvmv.ac.in','+91 94431 10012','10:00 AM – 04:00 PM',1);
INSERT INTO "faculty" VALUES(13,'Dr. S. Bharathi','F013',18,'CSE','Associate Professor','CSE Block — Room 213','Computer Science Core, Labs','f013@scsvmv.ac.in','+91 94431 10013','10:00 AM – 04:00 PM',1);
INSERT INTO "faculty" VALUES(14,'Dr. S. Selvakumar','F014',19,'CSE','Associate Professor','CSE Block — Room 214','Computer Science Core, Labs','f014@scsvmv.ac.in','+91 94431 10014','10:00 AM – 04:00 PM',1);
INSERT INTO "faculty" VALUES(15,'Dr. S. Vijayaraghavan','F015',20,'CSE','Associate Professor','CSE Block — Room 215','Computer Science Core, Labs','f015@scsvmv.ac.in','+91 94431 10015','10:00 AM – 04:00 PM',1);
INSERT INTO "faculty" VALUES(16,'Dr. T. Dineshkumar','F016',21,'CSE','Associate Professor','CSE Block — Room 216','Computer Science Core, Labs','f016@scsvmv.ac.in','+91 94431 10016','10:00 AM – 04:00 PM',1);
INSERT INTO "faculty" VALUES(17,'Dr. T. Lakshmibai','F017',22,'CSE','Associate Professor','CSE Block — Room 217','Computer Science Core, Labs','f017@scsvmv.ac.in','+91 94431 10017','10:00 AM – 04:00 PM',1);
INSERT INTO "faculty" VALUES(18,'Dr. T. Sundar','F018',23,'CSE','Associate Professor','CSE Block — Room 218','Computer Science Core, Labs','f018@scsvmv.ac.in','+91 94431 10018','10:00 AM – 04:00 PM',1);
INSERT INTO "faculty" VALUES(19,'Dr. V. Geetha','F019',24,'CSE','Professor & Head of Department','CSE Block — HOD Cabin (Room 101)','Machine Learning, Neural Networks','f019@scsvmv.ac.in','+91 94431 10019','10:00 AM – 04:00 PM',1);
INSERT INTO "faculty" VALUES(20,'Dr. V. Malathi','F020',25,'CSE','Associate Professor','CSE Block — Room 220','Computer Science Core, Labs','f020@scsvmv.ac.in','+91 94431 10020','10:00 AM – 04:00 PM',1);
INSERT INTO "faculty" VALUES(21,'Mr. B. Karthikeyan','F021',26,'CSE','Assistant Professor','CSE Block — Room 221','Computer Science Core, Labs','f021@scsvmv.ac.in','+91 94431 10021','10:00 AM – 04:00 PM',1);
INSERT INTO "faculty" VALUES(22,'Mr. D. Harshawardhan','F022',27,'CSE','Assistant Professor','CSE Block — Room 222','Computer Science Core, Labs','f022@scsvmv.ac.in','+91 94431 10022','10:00 AM – 04:00 PM',1);
INSERT INTO "faculty" VALUES(23,'Mr. D. Jeevan Kumar','F023',28,'CSE','Assistant Professor','CSE Block — Room 223','Computer Science Core, Labs','f023@scsvmv.ac.in','+91 94431 10023','10:00 AM – 04:00 PM',1);
INSERT INTO "faculty" VALUES(24,'Mr. E. Sankar','F024',29,'CSE','Assistant Professor','CSE Block — Room 224','Computer Science Core, Labs','f024@scsvmv.ac.in','+91 94431 10024','10:00 AM – 04:00 PM',1);
INSERT INTO "faculty" VALUES(25,'Mr. K. Harshawardhan','F025',30,'CSE','Assistant Professor','CSE Block — Room 200','Computer Science Core, Labs','f025@scsvmv.ac.in','+91 94431 10025','10:00 AM – 04:00 PM',1);
INSERT INTO "faculty" VALUES(26,'Mr. P. Ramesh Chandra','F026',31,'CSE','Assistant Professor','CSE Block — Room 201','Computer Science Core, Labs','f026@scsvmv.ac.in','+91 94431 10026','10:00 AM – 04:00 PM',1);
INSERT INTO "faculty" VALUES(27,'Mr. R. Manikkavasagam','F027',32,'CSE','Assistant Professor','CSE Block — Room 202','Computer Science Core, Labs','f027@scsvmv.ac.in','+91 94431 10027','10:00 AM – 04:00 PM',1);
INSERT INTO "faculty" VALUES(28,'Mr. Sreesha (Civil Dept.)','F028',33,'CSE','Assistant Professor','CSE Block — Room 203','Computer Science Core, Labs','f028@scsvmv.ac.in','+91 94431 10028','10:00 AM – 04:00 PM',1);
INSERT INTO "faculty" VALUES(29,'Mr. Sureshkumar Bhadram','F029',34,'CSE','Assistant Professor','CSE Block — Room 204','Computer Science Core, Labs','f029@scsvmv.ac.in','+91 94431 10029','10:00 AM – 04:00 PM',1);
INSERT INTO "faculty" VALUES(30,'Mr. T. Prakash','F030',35,'CSE','Assistant Professor','CSE Block — Room 205','Computer Science Core, Labs','f030@scsvmv.ac.in','+91 94431 10030','10:00 AM – 04:00 PM',1);
INSERT INTO "faculty" VALUES(31,'Mr. V. Balu','F031',36,'CSE','Assistant Professor','CSE Block — Room 206','Computer Science Core, Labs','f031@scsvmv.ac.in','+91 94431 10031','10:00 AM – 04:00 PM',1);
INSERT INTO "faculty" VALUES(32,'Mrs. T. Bhuvaneswari','F032',37,'CSE','Assistant Professor','CSE Block — Room 207','Computer Science Core, Labs','f032@scsvmv.ac.in','+91 94431 10032','10:00 AM – 04:00 PM',1);
INSERT INTO "faculty" VALUES(33,'Ms. Hema Poorani','F033',38,'CSE','Assistant Professor','CSE Block — Room 208','Computer Science Core, Labs','f033@scsvmv.ac.in','+91 94431 10033','10:00 AM – 04:00 PM',1);
INSERT INTO "faculty" VALUES(34,'Ms. R. Preethi','F034',39,'CSE','Assistant Professor','CSE Block — Room 209','Computer Science Core, Labs','f034@scsvmv.ac.in','+91 94431 10034','10:00 AM – 04:00 PM',1);
INSERT INTO "faculty" VALUES(35,'Ms. R. Radhika','F035',40,'CSE','Assistant Professor','CSE Block — Room 210','Computer Science Core, Labs','f035@scsvmv.ac.in','+91 94431 10035','10:00 AM – 04:00 PM',1);
INSERT INTO "faculty" VALUES(36,'Ms. R. Rajalakshmi','F036',41,'CSE','Assistant Professor','CSE Block — Room 211','Computer Science Core, Labs','f036@scsvmv.ac.in','+91 94431 10036','10:00 AM – 04:00 PM',1);
INSERT INTO "faculty" VALUES(37,'Ms. S.E. Viswapriya','F037',42,'CSE','Assistant Professor','CSE Block — Room 212','Computer Science Core, Labs','f037@scsvmv.ac.in','+91 94431 10037','10:00 AM – 04:00 PM',1);
INSERT INTO "faculty" VALUES(38,'Dr. Ravi Kumar','F038',43,'CSE','Associate Professor','CSE Block — Room 204','DBMS, Operating Systems, Data Structures','ravikumar@scsvmv.ac.in','+91 94431 20401','10:00 AM – 04:00 PM',1);
INSERT INTO "faculty" VALUES(39,'Dr. Priya Sharma','F039',44,'CSE','Assistant Professor','CSE Block — Room 301','Java Programming, Python for AI, Web Tech','priyasharma@scsvmv.ac.in','+91 94431 30102','10:00 AM – 04:00 PM',1);
INSERT INTO "faculty" VALUES(40,'Dr. Arun Kumar','F040',45,'ECE','Associate Professor','Admin Block — Room 108','Digital Signal Processing, VLSI Design','arunkumar@scsvmv.ac.in','+91 94431 10803','10:00 AM – 04:00 PM',1);
INSERT INTO "faculty" VALUES(41,'Dr. C.K. Gomathy','F041',46,'CSE','Associate Professor','CSE Block — Room 207','Software Engineering, Cloud Computing','ckgomathy@scsvmv.ac.in','9943589333','Mon-Fri 09:00 - 16:30',1);
INSERT INTO "faculty" VALUES(42,'Dr. R. Govindarajan','F042',47,'CSE','Assistant Professor','CSE Block — Room 215','Database Management Systems, Python','rgovindarajan@scsvmv.ac.in','9092027018','Mon-Fri 09:00 - 16:30',1);
INSERT INTO "faculty" VALUES(43,'Dr. M.A. Archana','F043',48,'CSE','Associate Professor','CSE Block — Room 203','Artificial Intelligence, Deep Learning','maarchana@scsvmv.ac.in','9444012345','Mon-Fri 09:00 - 16:30',1);
INSERT INTO "faculty" VALUES(44,'Dr. P. Vithya','F044',49,'ECE','Associate Professor','ECE Block — Room 104','IoT, Embedded Systems','pvithya@scsvmv.ac.in','9840123456','Mon-Fri 09:00 - 16:30',1);
CREATE TABLE faculty_state(
  faculty_id INTEGER PRIMARY KEY REFERENCES faculty(id),
  last_derived TEXT,
  changed_at TEXT
);
CREATE TABLE feedback(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  student_id INTEGER REFERENCES users(id),
  student_name TEXT,
  dept_code TEXT,
  q1_difficulty TEXT,
  q2_how_find TEXT,
  q3_useful_feature TEXT,
  q4_rating INTEGER,
  q5_would_use TEXT,
  q6_improvement TEXT,
  created_at TEXT
);
INSERT INTO "feedback" VALUES(1,NULL,'Sandeep Kumar · 21CSE042','CSE','Frequently','Visiting cabins, WhatsApp groups','Real-time Live Status',5,'Yes, definitely','Adding directions to the cabin was a great idea! Very smooth.','2026-09-23T20:51:01.553409+05:30');
INSERT INTO "feedback" VALUES(2,NULL,'Pooja Verma · 21CSE088','CSE','Sometimes','Visiting cabins, Asking friends','Cabin & Room Location',5,'Yes, definitely','Saves so much walking between floors.','2026-09-23T20:51:01.553409+05:30');
INSERT INTO "feedback" VALUES(3,NULL,'Rahul Sharma · 22ECE015','ECE','Frequently','Looking in lecture halls','Timetable Lookup',4,'Likely','Please include all lab technician cabins too.','2026-09-23T20:51:01.553409+05:30');
INSERT INTO "feedback" VALUES(4,NULL,'Ananya Iyer · 21CSE012','CSE','Sometimes','WhatsApp groups','Availability Status',5,'Yes, definitely','Accurate status reporting is super helpful during project review days.','2026-09-23T20:51:01.553409+05:30');
INSERT INTO "feedback" VALUES(5,NULL,'Vignesh R · 23MECH004','MECH','Frequently','Visiting cabins','Next Availability prediction',5,'Yes, definitely','Huge time saver when trying to submit assignments.','2026-09-23T20:51:01.553409+05:30');
INSERT INTO "feedback" VALUES(6,NULL,'Pothala Venkata Sandeep','CSE','Frequently','Ask other staff / Check department noticeboard','Real-time Available Now status',5,'Daily','Campus indoor maps and instant notification alerts','2026-09-23T22:16:28.624170+05:30');
INSERT INTO "feedback" VALUES(7,2,'Pothala Venkata Sandeep','CSE','Frequently','Ask other staff / Check department noticeboard','Real-time Available Now status',5,'Daily','Campus indoor maps and instant notification alerts','2026-09-23T22:17:28.001147+05:30');
INSERT INTO "feedback" VALUES(8,2,'Pothala Venkata Sandeep','CSE','Frequently','Ask other staff / Check department noticeboard','Real-time Available Now status',5,'Daily','Campus indoor maps and instant notification alerts','2026-09-23T22:17:44.598697+05:30');
INSERT INTO "feedback" VALUES(9,2,'Pothala Venkata Sandeep','CSE','Frequently','Ask other staff / Check department noticeboard','Real-time Available Now status',5,'Daily','Campus indoor maps and instant notification alerts','2026-09-23T22:21:32.737814+05:30');
INSERT INTO "feedback" VALUES(10,2,'Pothala Venkata Sandeep','CSE','Frequently','Ask other staff / Check department noticeboard','Real-time Available Now status',5,'Daily','Campus indoor maps and instant notification alerts','2026-09-23T22:27:26.065294+05:30');
INSERT INTO "feedback" VALUES(11,2,'Pothala Venkata Sandeep','CSE','Frequently','Ask other staff / Check department noticeboard','Real-time Available Now status',5,'Daily','Campus indoor maps and instant notification alerts','2026-09-23T22:32:06.618845+05:30');
INSERT INTO "feedback" VALUES(12,2,'Pothala Venkata Sandeep','CSE','Frequently','Ask other staff / Check department noticeboard','Real-time Available Now status',5,'Daily','Campus indoor maps and instant notification alerts','2026-09-23T22:39:01.561397+05:30');
INSERT INTO "feedback" VALUES(13,2,'Pothala Venkata Sandeep','CSE','Frequently','Ask other staff / Check department noticeboard','Real-time Available Now status',5,'Daily','Campus indoor maps and instant notification alerts','2026-09-23T22:42:56.568736+05:30');
CREATE TABLE meta(k TEXT PRIMARY KEY, v TEXT);
INSERT INTO "meta" VALUES('seed_faculty','{
"Dr. D. Thamaraiselvi": "dr.d.thamaraiselvi",
"Dr. J. Vinothkumar": "dr.j.vinothkumar",
"Dr. K. Anitha": "dr.k.anitha",
"Dr. K. Balachandran": "dr.k.balachandran",
"Dr. M. Gayathri": "dr.m.gayathri",
"Dr. M. Saraswathi": "dr.m.saraswathi",
"Dr. M. Senthilkumaran": "dr.m.senthilkumaran",
"Dr. N.C.A. Boovarahan": "dr.n.c.a.boovarahan",
"Dr. P. Rajalakshmi": "dr.p.rajalakshmi",
"Dr. P. Shanmugapriya": "dr.p.shanmugapriya",
"Dr. R. Prema": "dr.r.prema",
"Dr. R. Sivaramakrishnan": "dr.r.sivaramakrishnan",
"Dr. S. Bharathi": "dr.s.bharathi",
"Dr. S. Selvakumar": "dr.s.selvakumar",
"Dr. S. Vijayaraghavan": "dr.s.vijayaraghavan",
"Dr. T. Dineshkumar": "dr.t.dineshkumar",
"Dr. T. Lakshmibai": "dr.t.lakshmibai",
"Dr. T. Sundar": "dr.t.sundar",
"Dr. V. Geetha": "dr.v.geetha",
"Dr. V. Malathi": "dr.v.malathi",
"Mr. B. Karthikeyan": "mr.b.karthikeyan",
"Mr. D. Harshawardhan": "mr.d.harshawardhan",
"Mr. D. Jeevan Kumar": "mr.d.jeevankumar",
"Mr. E. Sankar": "mr.e.sankar",
"Mr. K. Harshawardhan": "mr.k.harshawardhan",
"Mr. P. Ramesh Chandra": "mr.p.rameshchandra",
"Mr. R. Manikkavasagam": "mr.r.manikkavasagam",
"Mr. Sreesha (Civil Dept.)": "mr.sreeshacivildept.",
"Mr. Sureshkumar Bhadram": "mr.sureshkumarbhadram",
"Mr. T. Prakash": "mr.t.prakash",
"Mr. V. Balu": "mr.v.balu",
"Mrs. T. Bhuvaneswari": "mrs.t.bhuvaneswari",
"Ms. Hema Poorani": "ms.hemapoorani",
"Ms. R. Preethi": "ms.r.preethi",
"Ms. R. Radhika": "ms.r.radhika",
"Ms. R. Rajalakshmi": "ms.r.rajalakshmi",
"Ms. S.E. Viswapriya": "ms.s.e.viswapriya",
"Dr. Ravi Kumar": "dr.ravikumar",
"Dr. Priya Sharma": "dr.priyasharma",
"Dr. Arun Kumar": "dr.arunkumar"
}');
INSERT INTO "meta" VALUES('seeded_at','2026-09-23T20:51:01.553409+05:30');
CREATE TABLE notifications(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  user_id INTEGER REFERENCES users(id),
  title TEXT,
  body TEXT,
  link TEXT,
  is_read INTEGER DEFAULT 0,
  created_at TEXT
);
CREATE TABLE sections(
  sid TEXT PRIMARY KEY,
  dept_code TEXT DEFAULT 'CSE',
  year TEXT,
  sem TEXT,
  section TEXT,
  incharge TEXT,
  label TEXT
);
INSERT INTO "sections" VALUES('IV-VII-S1','CSE','IV','VII','S1','Dr.V.Geetha','IV / VII / S1');
INSERT INTO "sections" VALUES('IV-VII-S2','CSE','IV','VII','S2','Dr.T.Lakshmibai','IV / VII / S2');
INSERT INTO "sections" VALUES('III-V-S1','CSE','III','V','S1','Dr.T.Sundar','III / V / S1');
INSERT INTO "sections" VALUES('III-V-S2','CSE','III','V','S2','Dr.T.Dineshkumar','III / V / S2');
INSERT INTO "sections" VALUES('III-V-S3','CSE','III','V','S3','Dr.R.Sivaramakrishnan','III / V / S3');
INSERT INTO "sections" VALUES('III-V-S4','CSE','III','V','S4','Dr.D.Thamaraiselvi','III / V / S4');
INSERT INTO "sections" VALUES('III-V-S5','CSE','III','V','S5','Mr.SureshkumarBhadram','III / V / S5');
INSERT INTO "sections" VALUES('III-V-S6','CSE','III','V','S6','Mr.E.Sankar','III / V / S6');
INSERT INTO "sections" VALUES('III-V-S7-CSE','CSE','III','V','S7-CSE','Dr.N.C.A.Boovarahan','III / V / S7-CSE');
INSERT INTO "sections" VALUES('III-V-S7-IT','CSE','III','V','S7-IT','Dr.N.C.A.Boovarahan','III / V / S7-IT');
INSERT INTO "sections" VALUES('II-III-S1','CSE','II','III','S1','Mr.D Jeevan Kumar','II / III / S1');
INSERT INTO "sections" VALUES('II-III-S2','CSE','II','III','S2','Dr.M.Gayathri','II / III / S2');
INSERT INTO "sections" VALUES('II-III-S3','CSE','II','III','S3','Ms.R.Radhika','II / III / S3');
INSERT INTO "sections" VALUES('II-III-S4','CSE','II','III','S4','Ms.R.Preethi','II / III / S4');
INSERT INTO "sections" VALUES('II-III-S5','CSE','II','III','S5','Mr.B.Karthikeyan','II / III / S5');
INSERT INTO "sections" VALUES('II-III-S6','CSE','II','III','S6','Mr.V.Balu','II / III / S6');
INSERT INTO "sections" VALUES('II-III-S7','CSE','II','III','S7','Dr.R.Prema','II / III / S7');
INSERT INTO "sections" VALUES('II-III-S8','CSE','II','III','S8','Ms.S.E.Viswapriya','II / III / S8');
INSERT INTO "sections" VALUES('II-III-S9','CSE','II','III','S9','Ms.R.Rajalakshmi','II / III / S9');
CREATE TABLE sessions(
  token TEXT PRIMARY KEY,
  user_id INTEGER REFERENCES users(id),
  created_at TEXT,
  expires_at TEXT
);
INSERT INTO "sessions" VALUES('144f01e2070ffb3ecff2c2acecd0f64ccf1652c035bd8a51',3,'2026-09-23T20:51:02.161404+05:30','2026-10-07T20:51:02.161404+05:30');
INSERT INTO "sessions" VALUES('f389d32157c56327c35988a93c889ab14543da551eab608d',24,'2026-09-23T20:51:02.177123+05:30','2026-10-07T20:51:02.177123+05:30');
INSERT INTO "sessions" VALUES('18accf70d05109d01279f1df9a470fc9834f77240f9e5a5b',1,'2026-09-23T20:51:02.192522+05:30','2026-10-07T20:51:02.192522+05:30');
INSERT INTO "sessions" VALUES('27f36213eec3bbc3113622e71ee7b2a69d9c0de3de9a4c73',2,'2026-09-23T20:51:23.928332+05:30','2026-10-07T20:51:23.928332+05:30');
INSERT INTO "sessions" VALUES('65c55c04cb6ff7460af20fdf895149d621edce2f07ae56f2',2,'2026-09-23T20:51:44.990497+05:30','2026-10-07T20:51:44.990497+05:30');
INSERT INTO "sessions" VALUES('734a393ccc0d9ae79ece7053fe715f3fcf08a194395bd00c',2,'2026-09-23T21:07:05.956867+05:30','2026-10-07T21:07:05.956867+05:30');
INSERT INTO "sessions" VALUES('39e8382a89794bfffbb17c228e555d936e8d775cbed6709a',1,'2026-09-23T22:16:28.545773+05:30','2026-10-07T22:16:28.545773+05:30');
INSERT INTO "sessions" VALUES('6c6779202ab1d54e249e56f622a492500ea1e2d09532aaa9',2,'2026-09-23T22:17:27.863775+05:30','2026-10-07T22:17:27.863775+05:30');
INSERT INTO "sessions" VALUES('9d6b74acf8e9d72c781d5dc2d2106f611d99288c1e559bea',17,'2026-09-23T22:17:27.887661+05:30','2026-10-07T22:17:27.887661+05:30');
INSERT INTO "sessions" VALUES('0d7748631e7bf13c2e27734c70e3195d723fe443122ec6e1',1,'2026-09-23T22:17:27.912320+05:30','2026-10-07T22:17:27.912320+05:30');
INSERT INTO "sessions" VALUES('650a36cd70817707eb2413eab1c2324f87eb17a759ab4f12',1,'2026-09-23T22:17:35.579394+05:30','2026-10-07T22:17:35.579394+05:30');
INSERT INTO "sessions" VALUES('8f0d3908721b510f2709ee7fff84e91d279ef7a3d1db19d2',2,'2026-09-23T22:17:44.484546+05:30','2026-10-07T22:17:44.484546+05:30');
INSERT INTO "sessions" VALUES('454e61a0ccdfbbc4e8a522dae30f7aa9c2c062fd026411ab',17,'2026-09-23T22:17:44.499963+05:30','2026-10-07T22:17:44.499963+05:30');
INSERT INTO "sessions" VALUES('06872126d0118d41fcdd3527f8590ae61bfed46dd6efb9c0',1,'2026-09-23T22:17:44.514784+05:30','2026-10-07T22:17:44.514784+05:30');
INSERT INTO "sessions" VALUES('53672956fe59203b27ef4c63b5144b9b53fe6bc4a5a4b08d',2,'2026-09-23T22:21:32.624457+05:30','2026-10-07T22:21:32.624457+05:30');
INSERT INTO "sessions" VALUES('bd2d162345ba947b154ca1dd116f389e513bd50a263317a7',17,'2026-09-23T22:21:32.639151+05:30','2026-10-07T22:21:32.639151+05:30');
INSERT INTO "sessions" VALUES('e5bd6d2627d615f8fdcaf0349446c959874a15d9bdeb0a81',1,'2026-09-23T22:21:32.654099+05:30','2026-10-07T22:21:32.654099+05:30');
INSERT INTO "sessions" VALUES('13b5f378bb17ca118e5b80b32a19b8008eba0234c05d7f1a',2,'2026-09-23T22:27:25.955311+05:30','2026-10-07T22:27:25.955311+05:30');
INSERT INTO "sessions" VALUES('b61d9b8d1b13dfd83ecf12f7502bf5ea23c2f4656c6a32de',17,'2026-09-23T22:27:25.970312+05:30','2026-10-07T22:27:25.970312+05:30');
INSERT INTO "sessions" VALUES('766f62c389f5a1be431fd927f51be430dd20aa920d163ba9',1,'2026-09-23T22:27:25.985187+05:30','2026-10-07T22:27:25.985187+05:30');
INSERT INTO "sessions" VALUES('d4f42d8bbaa3d537cbc1beb53508f24c21d82a60cfead7bf',2,'2026-09-23T22:32:06.509624+05:30','2026-10-07T22:32:06.509624+05:30');
INSERT INTO "sessions" VALUES('d15ae4aaedf4465e1c6606710c21ec33ee256463445e7e64',17,'2026-09-23T22:32:06.523377+05:30','2026-10-07T22:32:06.523377+05:30');
INSERT INTO "sessions" VALUES('6ddaa6bb2e35974a5b848ee680ab15ed0b5975cf8471941d',1,'2026-09-23T22:32:06.537494+05:30','2026-10-07T22:32:06.537494+05:30');
INSERT INTO "sessions" VALUES('0b43d868d0625d8ec18f5139b6e5985316706c9f6a73619b',2,'2026-09-23T22:38:51.822421+05:30','2026-10-07T22:38:51.822421+05:30');
INSERT INTO "sessions" VALUES('2367b7ca370140f112f9dad2cb5516a95d66691384d594d7',2,'2026-09-23T22:38:51.836857+05:30','2026-10-07T22:38:51.836857+05:30');
INSERT INTO "sessions" VALUES('ff52ddf43d7f612699589f48eeb8470e2f1bfecec0f6ea53',51,'2026-09-23T22:38:51.851035+05:30','2026-10-07T22:38:51.851035+05:30');
INSERT INTO "sessions" VALUES('aa9efed08130a65ef7fc965a99beb666e1218d1af873565b',51,'2026-09-23T22:38:51.864993+05:30','2026-10-07T22:38:51.864993+05:30');
INSERT INTO "sessions" VALUES('1ab603e7cf4aff5895e5ac55f5bba0616183678e31903115',52,'2026-09-23T22:38:51.879166+05:30','2026-10-07T22:38:51.879166+05:30');
INSERT INTO "sessions" VALUES('24d3d2341b2379afbf9813f06b8ab9fc5249fe39510f2ce1',52,'2026-09-23T22:38:51.893102+05:30','2026-10-07T22:38:51.893102+05:30');
INSERT INTO "sessions" VALUES('1a65f420d24478c59250bdf5d2012424b3eaf88f4b57f776',53,'2026-09-23T22:38:51.907121+05:30','2026-10-07T22:38:51.907121+05:30');
INSERT INTO "sessions" VALUES('2b46ae86f61c7d93714f23cbfe6335dff4c1634fd45ce6d6',53,'2026-09-23T22:38:51.920989+05:30','2026-10-07T22:38:51.920989+05:30');
INSERT INTO "sessions" VALUES('ab78646ea792d309b8fc4ce5e4627bbb17d3a780bb66cd4d',59,'2026-09-23T22:38:51.934907+05:30','2026-10-07T22:38:51.934907+05:30');
INSERT INTO "sessions" VALUES('23ed7ba9bf9b265a88046b5912d18b70a9c6f0cc221e99a8',59,'2026-09-23T22:38:51.949169+05:30','2026-10-07T22:38:51.949169+05:30');
INSERT INTO "sessions" VALUES('1d7d935b8643783bd3f79b9b004968c26d782c06ea4295e9',60,'2026-09-23T22:38:51.963029+05:30','2026-10-07T22:38:51.963029+05:30');
INSERT INTO "sessions" VALUES('48bccbc22d4531d16029376acb85b95a131d9550df5a21e6',60,'2026-09-23T22:38:51.977888+05:30','2026-10-07T22:38:51.977888+05:30');
INSERT INTO "sessions" VALUES('246658de552e963d3e35b649978ad4f3f1b3de4fb1679208',1,'2026-09-23T22:38:51.992014+05:30','2026-10-07T22:38:51.992014+05:30');
INSERT INTO "sessions" VALUES('9b0a99131116cdb5df2fdadcfe18af650fde50514f5556a6',1,'2026-09-23T22:38:58.695467+05:30','2026-10-07T22:38:58.695467+05:30');
INSERT INTO "sessions" VALUES('33b1d6a52e67053a1585d5272c3600bf693930d8ba9a91c0',2,'2026-09-23T22:39:01.439612+05:30','2026-10-07T22:39:01.439612+05:30');
INSERT INTO "sessions" VALUES('00d7818bc60bf18f30dabe92ad31db9182d39e5e85ca6ec3',17,'2026-09-23T22:39:01.455485+05:30','2026-10-07T22:39:01.455485+05:30');
INSERT INTO "sessions" VALUES('ac42807c54c51561d680233f2abf8d5f80513f393c42a9d2',1,'2026-09-23T22:39:01.473978+05:30','2026-10-07T22:39:01.473978+05:30');
INSERT INTO "sessions" VALUES('1674c1ba385ff758659b31cce1fd4aa5cec36864c6b74409',1,'2026-09-23T22:42:19.509361+05:30','2026-10-07T22:42:19.509361+05:30');
INSERT INTO "sessions" VALUES('7b06119cc9a53652b930058388edf54ea971c5217777ea1e',16,'2026-09-23T22:42:50.568299+05:30','2026-10-07T22:42:50.568299+05:30');
INSERT INTO "sessions" VALUES('3a5ff64f779f006ef5182f71547ff53f098a33b0ea4eab42',65,'2026-09-23T22:42:50.583462+05:30','2026-10-07T22:42:50.583462+05:30');
INSERT INTO "sessions" VALUES('b9e5f7556f1f0207f6620863715a38920539ff0fb1463dc9',2,'2026-09-23T22:42:56.445421+05:30','2026-10-07T22:42:56.445421+05:30');
INSERT INTO "sessions" VALUES('8f237d28cf89959f1704dc7a9a515829e343666f49fef53b',17,'2026-09-23T22:42:56.460856+05:30','2026-10-07T22:42:56.460856+05:30');
INSERT INTO "sessions" VALUES('709cd11d88e0da78d9b07f2918d5cf740b8952797541a722',1,'2026-09-23T22:42:56.474556+05:30','2026-10-07T22:42:56.474556+05:30');
CREATE TABLE statuses(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  faculty_id INTEGER REFERENCES faculty(id),
  status TEXT,
  reason TEXT,
  location TEXT,
  expected_return_at TEXT,
  noted_by INTEGER,
  noted_at TEXT
);
INSERT INTO "statuses" VALUES(1,12,'AVAILABLE','Office Hours & Student Mentoring (Computer Networks)','CSE Block — 2nd Floor — Room 212','17:00',1,'2026-09-23T10:00:00+05:30');
INSERT INTO "statuses" VALUES(2,7,'AVAILABLE','HOD Cabin Office Hours & Department Administration','CSE Block — HOD Cabin (Room 101)','17:00',1,'2026-09-23T10:00:00+05:30');
INSERT INTO "statuses" VALUES(3,1,'AVAILABLE','Academic Planning & Database Systems Mentoring','CSE Block — Room 201','17:00',1,'2026-09-23T10:00:00+05:30');
INSERT INTO "statuses" VALUES(4,11,'AVAILABLE','NLP Research & Student Consultation','CSE Block — Room 211','17:00',1,'2026-09-23T10:00:00+05:30');
INSERT INTO "statuses" VALUES(5,6,'AVAILABLE','Java Programming Office Hours','CSE Block — Room 206','17:00',1,'2026-09-23T10:00:00+05:30');
INSERT INTO "statuses" VALUES(6,41,'AVAILABLE','Software Engineering & Student Mentoring','CSE Block — Room 207','17:00',1,'2026-09-23T10:00:00+05:30');
INSERT INTO "statuses" VALUES(7,42,'AVAILABLE','Database Systems & Academic Mentoring','CSE Block — Room 215','17:00',1,'2026-09-23T10:00:00+05:30');
INSERT INTO "statuses" VALUES(8,38,'AVAILABLE','Free / Available for doubt clearing','CSE Block — Room 204','17:00',1,'2026-09-23T10:00:00+05:30');
INSERT INTO "statuses" VALUES(9,39,'TEACHING','Programming Lab Evaluation','CSE Block — Room 301','12:30',1,'2026-09-23T10:00:00+05:30');
INSERT INTO "statuses" VALUES(10,40,'MEETING','Academic Council Meeting','Admin Block — Board Room','13:00',1,'2026-09-23T10:00:00+05:30');
INSERT INTO "statuses" VALUES(11,12,'TEACHING','Computer Networks Lecture','CSE Block — Room 303','12:30',17,'2026-09-23T22:17:27.955329+05:30');
INSERT INTO "statuses" VALUES(12,12,'TEACHING','Computer Networks Lecture','CSE Block — Room 303','12:30',17,'2026-09-23T22:17:44.555691+05:30');
INSERT INTO "statuses" VALUES(13,12,'TEACHING','Computer Networks Lecture','CSE Block — Room 303','12:30',17,'2026-09-23T22:21:32.704822+05:30');
INSERT INTO "statuses" VALUES(14,12,'TEACHING','Computer Networks Lecture','CSE Block — Room 303','12:30',17,'2026-09-23T22:27:26.024032+05:30');
INSERT INTO "statuses" VALUES(15,12,'TEACHING','Computer Networks Lecture','CSE Block — Room 303','12:30',17,'2026-09-23T22:32:06.576118+05:30');
INSERT INTO "statuses" VALUES(16,12,'TEACHING','Computer Networks Lecture','CSE Block — Room 303','12:30',17,'2026-09-23T22:39:01.516964+05:30');
INSERT INTO "statuses" VALUES(17,12,'TEACHING','Computer Networks Lecture','CSE Block — Room 303','12:30',17,'2026-09-23T22:42:56.510464+05:30');
CREATE TABLE users(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  username TEXT UNIQUE NOT NULL,
  salt TEXT NOT NULL,
  pw TEXT NOT NULL,
  role TEXT NOT NULL CHECK(role IN ('student','faculty','admin')),
  name TEXT NOT NULL,
  dept_code TEXT DEFAULT 'CSE',
  year TEXT DEFAULT '3rd Year',
  section TEXT DEFAULT 'III CSE A',
  student_id TEXT,
  email TEXT,
  is_active INTEGER DEFAULT 1,
  created_at TEXT
);
INSERT INTO "users" VALUES(1,'admin','8be6a3ad5cd383b3edbf2afd8b6606d4','720033663ee51f8d05f39c5a5b86b5cfe18e6dc47234545953800a6d52679a8e','admin','System Administrator','ADMIN','','','ADM001','admin@scsvmv.ac.in',1,'2026-09-23T20:51:01.553409+05:30');
INSERT INTO "users" VALUES(2,'sandeep','1f1fda1be896f0dda8060d49120796a3','3e1168e09816ea44e6ca401586e7710411765cdb6acdb957d5f06dd8cfd7c61b','student','Pothala Venkata Sandeep','CSE','3rd Year','III CSE S3','11249A290','sandeep@scsvmv.ac.in',1,'2026-09-23T20:51:01.553409+05:30');
INSERT INTO "users" VALUES(3,'student1','7357d12523e978c4ee6cd89c6b8e7272','928a792cf3cdc6f0ef39ca6feda46b2d1ba634b741780ef7a2473a92236a8757','student','Sandeep Kumar · 21CSE042','CSE','3rd Year','III CSE A','21CSE042','student1@scsvmv.ac.in',1,'2026-09-23T20:51:01.553409+05:30');
INSERT INTO "users" VALUES(4,'student2','7357d12523e978c4ee6cd89c6b8e7272','928a792cf3cdc6f0ef39ca6feda46b2d1ba634b741780ef7a2473a92236a8757','student','Pooja Verma · 21CSE088','CSE','3rd Year','III CSE B','21CSE088','student2@scsvmv.ac.in',1,'2026-09-23T20:51:01.553409+05:30');
INSERT INTO "users" VALUES(5,'student3','7357d12523e978c4ee6cd89c6b8e7272','928a792cf3cdc6f0ef39ca6feda46b2d1ba634b741780ef7a2473a92236a8757','student','Rahul Sharma · 22ECE015','ECE','2nd Year','II ECE A','22ECE015','student3@scsvmv.ac.in',1,'2026-09-23T20:51:01.553409+05:30');
INSERT INTO "users" VALUES(6,'dr.d.thamaraiselvi','92df53a179c026705bf68e04c16e6998','a3972df130cd90ae5abc28a7b608bc57ba65f5d8b4dd1b1a85138056c6c644a3','faculty','Dr. D. Thamaraiselvi','CSE','','','F001','dr.d.thamaraiselvi@scsvmv.ac.in',1,'2026-09-23T20:51:01.553409+05:30');
INSERT INTO "users" VALUES(7,'dr.j.vinothkumar','92df53a179c026705bf68e04c16e6998','a3972df130cd90ae5abc28a7b608bc57ba65f5d8b4dd1b1a85138056c6c644a3','faculty','Dr. J. Vinothkumar','CSE','','','F002','dr.j.vinothkumar@scsvmv.ac.in',1,'2026-09-23T20:51:01.553409+05:30');
INSERT INTO "users" VALUES(8,'dr.k.anitha','92df53a179c026705bf68e04c16e6998','a3972df130cd90ae5abc28a7b608bc57ba65f5d8b4dd1b1a85138056c6c644a3','faculty','Dr. K. Anitha','CSE','','','F003','dr.k.anitha@scsvmv.ac.in',1,'2026-09-23T20:51:01.553409+05:30');
INSERT INTO "users" VALUES(9,'dr.k.balachandran','92df53a179c026705bf68e04c16e6998','a3972df130cd90ae5abc28a7b608bc57ba65f5d8b4dd1b1a85138056c6c644a3','faculty','Dr. K. Balachandran','CSE','','','F004','dr.k.balachandran@scsvmv.ac.in',1,'2026-09-23T20:51:01.553409+05:30');
INSERT INTO "users" VALUES(10,'dr.m.gayathri','92df53a179c026705bf68e04c16e6998','a3972df130cd90ae5abc28a7b608bc57ba65f5d8b4dd1b1a85138056c6c644a3','faculty','Dr. M. Gayathri','CSE','','','F005','dr.m.gayathri@scsvmv.ac.in',1,'2026-09-23T20:51:01.553409+05:30');
INSERT INTO "users" VALUES(11,'dr.m.saraswathi','92df53a179c026705bf68e04c16e6998','a3972df130cd90ae5abc28a7b608bc57ba65f5d8b4dd1b1a85138056c6c644a3','faculty','Dr. M. Saraswathi','CSE','','','F006','dr.m.saraswathi@scsvmv.ac.in',1,'2026-09-23T20:51:01.553409+05:30');
INSERT INTO "users" VALUES(12,'dr.m.senthilkumaran','92df53a179c026705bf68e04c16e6998','a3972df130cd90ae5abc28a7b608bc57ba65f5d8b4dd1b1a85138056c6c644a3','faculty','Dr. M. Senthilkumaran','CSE','','','F007','dr.m.senthilkumaran@scsvmv.ac.in',1,'2026-09-23T20:51:01.553409+05:30');
INSERT INTO "users" VALUES(13,'dr.n.c.a.boovarahan','92df53a179c026705bf68e04c16e6998','a3972df130cd90ae5abc28a7b608bc57ba65f5d8b4dd1b1a85138056c6c644a3','faculty','Dr. N.C.A. Boovarahan','CSE','','','F008','dr.n.c.a.boovarahan@scsvmv.ac.in',1,'2026-09-23T20:51:01.553409+05:30');
INSERT INTO "users" VALUES(14,'dr.p.rajalakshmi','92df53a179c026705bf68e04c16e6998','a3972df130cd90ae5abc28a7b608bc57ba65f5d8b4dd1b1a85138056c6c644a3','faculty','Dr. P. Rajalakshmi','CSE','','','F009','dr.p.rajalakshmi@scsvmv.ac.in',1,'2026-09-23T20:51:01.553409+05:30');
INSERT INTO "users" VALUES(15,'dr.p.shanmugapriya','92df53a179c026705bf68e04c16e6998','a3972df130cd90ae5abc28a7b608bc57ba65f5d8b4dd1b1a85138056c6c644a3','faculty','Dr. P. Shanmugapriya','CSE','','','F010','dr.p.shanmugapriya@scsvmv.ac.in',1,'2026-09-23T20:51:01.553409+05:30');
INSERT INTO "users" VALUES(16,'dr.r.prema','92df53a179c026705bf68e04c16e6998','a3972df130cd90ae5abc28a7b608bc57ba65f5d8b4dd1b1a85138056c6c644a3','faculty','Dr. R. Prema','CSE','','','F011','dr.r.prema@scsvmv.ac.in',1,'2026-09-23T20:51:01.553409+05:30');
INSERT INTO "users" VALUES(17,'dr.r.sivaramakrishnan','92df53a179c026705bf68e04c16e6998','a3972df130cd90ae5abc28a7b608bc57ba65f5d8b4dd1b1a85138056c6c644a3','faculty','Dr. R. Sivaramakrishnan','CSE','','','F012','dr.r.sivaramakrishnan@scsvmv.ac.in',1,'2026-09-23T20:51:01.553409+05:30');
INSERT INTO "users" VALUES(18,'dr.s.bharathi','92df53a179c026705bf68e04c16e6998','a3972df130cd90ae5abc28a7b608bc57ba65f5d8b4dd1b1a85138056c6c644a3','faculty','Dr. S. Bharathi','CSE','','','F013','dr.s.bharathi@scsvmv.ac.in',1,'2026-09-23T20:51:01.553409+05:30');
INSERT INTO "users" VALUES(19,'dr.s.selvakumar','92df53a179c026705bf68e04c16e6998','a3972df130cd90ae5abc28a7b608bc57ba65f5d8b4dd1b1a85138056c6c644a3','faculty','Dr. S. Selvakumar','CSE','','','F014','dr.s.selvakumar@scsvmv.ac.in',1,'2026-09-23T20:51:01.553409+05:30');
INSERT INTO "users" VALUES(20,'dr.s.vijayaraghavan','92df53a179c026705bf68e04c16e6998','a3972df130cd90ae5abc28a7b608bc57ba65f5d8b4dd1b1a85138056c6c644a3','faculty','Dr. S. Vijayaraghavan','CSE','','','F015','dr.s.vijayaraghavan@scsvmv.ac.in',1,'2026-09-23T20:51:01.553409+05:30');
INSERT INTO "users" VALUES(21,'dr.t.dineshkumar','92df53a179c026705bf68e04c16e6998','a3972df130cd90ae5abc28a7b608bc57ba65f5d8b4dd1b1a85138056c6c644a3','faculty','Dr. T. Dineshkumar','CSE','','','F016','dr.t.dineshkumar@scsvmv.ac.in',1,'2026-09-23T20:51:01.553409+05:30');
INSERT INTO "users" VALUES(22,'dr.t.lakshmibai','92df53a179c026705bf68e04c16e6998','a3972df130cd90ae5abc28a7b608bc57ba65f5d8b4dd1b1a85138056c6c644a3','faculty','Dr. T. Lakshmibai','CSE','','','F017','dr.t.lakshmibai@scsvmv.ac.in',1,'2026-09-23T20:51:01.553409+05:30');
INSERT INTO "users" VALUES(23,'dr.t.sundar','92df53a179c026705bf68e04c16e6998','a3972df130cd90ae5abc28a7b608bc57ba65f5d8b4dd1b1a85138056c6c644a3','faculty','Dr. T. Sundar','CSE','','','F018','dr.t.sundar@scsvmv.ac.in',1,'2026-09-23T20:51:01.553409+05:30');
INSERT INTO "users" VALUES(24,'dr.v.geetha','92df53a179c026705bf68e04c16e6998','a3972df130cd90ae5abc28a7b608bc57ba65f5d8b4dd1b1a85138056c6c644a3','faculty','Dr. V. Geetha','CSE','','','F019','dr.v.geetha@scsvmv.ac.in',1,'2026-09-23T20:51:01.553409+05:30');
INSERT INTO "users" VALUES(25,'dr.v.malathi','92df53a179c026705bf68e04c16e6998','a3972df130cd90ae5abc28a7b608bc57ba65f5d8b4dd1b1a85138056c6c644a3','faculty','Dr. V. Malathi','CSE','','','F020','dr.v.malathi@scsvmv.ac.in',1,'2026-09-23T20:51:01.553409+05:30');
INSERT INTO "users" VALUES(26,'mr.b.karthikeyan','92df53a179c026705bf68e04c16e6998','a3972df130cd90ae5abc28a7b608bc57ba65f5d8b4dd1b1a85138056c6c644a3','faculty','Mr. B. Karthikeyan','CSE','','','F021','mr.b.karthikeyan@scsvmv.ac.in',1,'2026-09-23T20:51:01.553409+05:30');
INSERT INTO "users" VALUES(27,'mr.d.harshawardhan','92df53a179c026705bf68e04c16e6998','a3972df130cd90ae5abc28a7b608bc57ba65f5d8b4dd1b1a85138056c6c644a3','faculty','Mr. D. Harshawardhan','CSE','','','F022','mr.d.harshawardhan@scsvmv.ac.in',1,'2026-09-23T20:51:01.553409+05:30');
INSERT INTO "users" VALUES(28,'mr.d.jeevankumar','92df53a179c026705bf68e04c16e6998','a3972df130cd90ae5abc28a7b608bc57ba65f5d8b4dd1b1a85138056c6c644a3','faculty','Mr. D. Jeevan Kumar','CSE','','','F023','mr.d.jeevankumar@scsvmv.ac.in',1,'2026-09-23T20:51:01.553409+05:30');
INSERT INTO "users" VALUES(29,'mr.e.sankar','92df53a179c026705bf68e04c16e6998','a3972df130cd90ae5abc28a7b608bc57ba65f5d8b4dd1b1a85138056c6c644a3','faculty','Mr. E. Sankar','CSE','','','F024','mr.e.sankar@scsvmv.ac.in',1,'2026-09-23T20:51:01.553409+05:30');
INSERT INTO "users" VALUES(30,'mr.k.harshawardhan','92df53a179c026705bf68e04c16e6998','a3972df130cd90ae5abc28a7b608bc57ba65f5d8b4dd1b1a85138056c6c644a3','faculty','Mr. K. Harshawardhan','CSE','','','F025','mr.k.harshawardhan@scsvmv.ac.in',1,'2026-09-23T20:51:01.553409+05:30');
INSERT INTO "users" VALUES(31,'mr.p.rameshchandra','92df53a179c026705bf68e04c16e6998','a3972df130cd90ae5abc28a7b608bc57ba65f5d8b4dd1b1a85138056c6c644a3','faculty','Mr. P. Ramesh Chandra','CSE','','','F026','mr.p.rameshchandra@scsvmv.ac.in',1,'2026-09-23T20:51:01.553409+05:30');
INSERT INTO "users" VALUES(32,'mr.r.manikkavasagam','92df53a179c026705bf68e04c16e6998','a3972df130cd90ae5abc28a7b608bc57ba65f5d8b4dd1b1a85138056c6c644a3','faculty','Mr. R. Manikkavasagam','CSE','','','F027','mr.r.manikkavasagam@scsvmv.ac.in',1,'2026-09-23T20:51:01.553409+05:30');
INSERT INTO "users" VALUES(33,'mr.sreeshacivildept.','92df53a179c026705bf68e04c16e6998','a3972df130cd90ae5abc28a7b608bc57ba65f5d8b4dd1b1a85138056c6c644a3','faculty','Mr. Sreesha (Civil Dept.)','CSE','','','F028','mr.sreeshacivildept.@scsvmv.ac.in',1,'2026-09-23T20:51:01.553409+05:30');
INSERT INTO "users" VALUES(34,'mr.sureshkumarbhadram','92df53a179c026705bf68e04c16e6998','a3972df130cd90ae5abc28a7b608bc57ba65f5d8b4dd1b1a85138056c6c644a3','faculty','Mr. Sureshkumar Bhadram','CSE','','','F029','mr.sureshkumarbhadram@scsvmv.ac.in',1,'2026-09-23T20:51:01.553409+05:30');
INSERT INTO "users" VALUES(35,'mr.t.prakash','92df53a179c026705bf68e04c16e6998','a3972df130cd90ae5abc28a7b608bc57ba65f5d8b4dd1b1a85138056c6c644a3','faculty','Mr. T. Prakash','CSE','','','F030','mr.t.prakash@scsvmv.ac.in',1,'2026-09-23T20:51:01.553409+05:30');
INSERT INTO "users" VALUES(36,'mr.v.balu','92df53a179c026705bf68e04c16e6998','a3972df130cd90ae5abc28a7b608bc57ba65f5d8b4dd1b1a85138056c6c644a3','faculty','Mr. V. Balu','CSE','','','F031','mr.v.balu@scsvmv.ac.in',1,'2026-09-23T20:51:01.553409+05:30');
INSERT INTO "users" VALUES(37,'mrs.t.bhuvaneswari','92df53a179c026705bf68e04c16e6998','a3972df130cd90ae5abc28a7b608bc57ba65f5d8b4dd1b1a85138056c6c644a3','faculty','Mrs. T. Bhuvaneswari','CSE','','','F032','mrs.t.bhuvaneswari@scsvmv.ac.in',1,'2026-09-23T20:51:01.553409+05:30');
INSERT INTO "users" VALUES(38,'ms.hemapoorani','92df53a179c026705bf68e04c16e6998','a3972df130cd90ae5abc28a7b608bc57ba65f5d8b4dd1b1a85138056c6c644a3','faculty','Ms. Hema Poorani','CSE','','','F033','ms.hemapoorani@scsvmv.ac.in',1,'2026-09-23T20:51:01.553409+05:30');
INSERT INTO "users" VALUES(39,'ms.r.preethi','92df53a179c026705bf68e04c16e6998','a3972df130cd90ae5abc28a7b608bc57ba65f5d8b4dd1b1a85138056c6c644a3','faculty','Ms. R. Preethi','CSE','','','F034','ms.r.preethi@scsvmv.ac.in',1,'2026-09-23T20:51:01.553409+05:30');
INSERT INTO "users" VALUES(40,'ms.r.radhika','92df53a179c026705bf68e04c16e6998','a3972df130cd90ae5abc28a7b608bc57ba65f5d8b4dd1b1a85138056c6c644a3','faculty','Ms. R. Radhika','CSE','','','F035','ms.r.radhika@scsvmv.ac.in',1,'2026-09-23T20:51:01.553409+05:30');
INSERT INTO "users" VALUES(41,'ms.r.rajalakshmi','92df53a179c026705bf68e04c16e6998','a3972df130cd90ae5abc28a7b608bc57ba65f5d8b4dd1b1a85138056c6c644a3','faculty','Ms. R. Rajalakshmi','CSE','','','F036','ms.r.rajalakshmi@scsvmv.ac.in',1,'2026-09-23T20:51:01.553409+05:30');
INSERT INTO "users" VALUES(42,'ms.s.e.viswapriya','92df53a179c026705bf68e04c16e6998','a3972df130cd90ae5abc28a7b608bc57ba65f5d8b4dd1b1a85138056c6c644a3','faculty','Ms. S.E. Viswapriya','CSE','','','F037','ms.s.e.viswapriya@scsvmv.ac.in',1,'2026-09-23T20:51:01.553409+05:30');
INSERT INTO "users" VALUES(43,'dr.ravikumar','92df53a179c026705bf68e04c16e6998','a3972df130cd90ae5abc28a7b608bc57ba65f5d8b4dd1b1a85138056c6c644a3','faculty','Dr. Ravi Kumar','CSE','','','F038','dr.ravikumar@scsvmv.ac.in',1,'2026-09-23T20:51:01.553409+05:30');
INSERT INTO "users" VALUES(44,'dr.priyasharma','92df53a179c026705bf68e04c16e6998','a3972df130cd90ae5abc28a7b608bc57ba65f5d8b4dd1b1a85138056c6c644a3','faculty','Dr. Priya Sharma','CSE','','','F039','dr.priyasharma@scsvmv.ac.in',1,'2026-09-23T20:51:01.553409+05:30');
INSERT INTO "users" VALUES(45,'dr.arunkumar','92df53a179c026705bf68e04c16e6998','a3972df130cd90ae5abc28a7b608bc57ba65f5d8b4dd1b1a85138056c6c644a3','faculty','Dr. Arun Kumar','ECE','','','F040','dr.arunkumar@scsvmv.ac.in',1,'2026-09-23T20:51:01.553409+05:30');
INSERT INTO "users" VALUES(46,'dr.c.k.gomathy','92df53a179c026705bf68e04c16e6998','a3972df130cd90ae5abc28a7b608bc57ba65f5d8b4dd1b1a85138056c6c644a3','faculty','Dr. C.K. Gomathy','CSE','3rd Year','III CSE A','F041','ckgomathy@scsvmv.ac.in',1,NULL);
INSERT INTO "users" VALUES(47,'dr.r.govindarajan','92df53a179c026705bf68e04c16e6998','a3972df130cd90ae5abc28a7b608bc57ba65f5d8b4dd1b1a85138056c6c644a3','faculty','Dr. R. Govindarajan','CSE','3rd Year','III CSE A','F042','rgovindarajan@scsvmv.ac.in',1,NULL);
INSERT INTO "users" VALUES(48,'dr.m.a.archana','92df53a179c026705bf68e04c16e6998','a3972df130cd90ae5abc28a7b608bc57ba65f5d8b4dd1b1a85138056c6c644a3','faculty','Dr. M.A. Archana','CSE','3rd Year','III CSE A','F043','maarchana@scsvmv.ac.in',1,NULL);
INSERT INTO "users" VALUES(49,'dr.p.vithya','92df53a179c026705bf68e04c16e6998','a3972df130cd90ae5abc28a7b608bc57ba65f5d8b4dd1b1a85138056c6c644a3','faculty','Dr. P. Vithya','ECE','3rd Year','III CSE A','F044','pvithya@scsvmv.ac.in',1,NULL);
INSERT INTO "users" VALUES(50,'11249a999','7357d12523e978c4ee6cd89c6b8e7272','928a792cf3cdc6f0ef39ca6feda46b2d1ba634b741780ef7a2473a92236a8757','student','Test New Student','CSE','3rd Year','III CSE S3','11249A999','11249a999@scsvmv.ac.in',1,'2026-09-23T22:16:28.639137+05:30');
INSERT INTO "users" VALUES(51,'aditya','94094631d7dc9e5338142cbbbdb8b01a','18e3be5276aba4e5e5cd9e8a019bd6a951fbf97298ae06f8b97ad2f395e27d8e','student','Pulavarthy Aditya','CSE','3rd Year','III CSE S3','11249A301','aditya@scsvmv.ac.in',1,NULL);
INSERT INTO "users" VALUES(52,'yugandhar','f0ea148ad0caebb5bea4597bd8e2e438','381878aaabdfbf05fa8724d2c349f6c53858ce2a2618e341e03e5ed3b031bac1','student','Palla Yugandhar','CSE','3rd Year','III CSE S3','11249A266','yugandhar@scsvmv.ac.in',1,NULL);
INSERT INTO "users" VALUES(53,'anirudh','5beba6ba65bbcc9e906d18ca037a34cf','40d036f9d327f0e4f62bad9ff8a8c9c9509ff54199db1ac3c68b5e8297235d97','student','Rampalli Manikanta Anirudh','CSE','3rd Year','III CSE S3','11249A312','anirudh@scsvmv.ac.in',1,NULL);
INSERT INTO "users" VALUES(54,'11249a998','ef210fcd4e94fe433693356b590b8c37','4b7a9286ae10709c01b19e979b1eac2eeb91af7453a133b78cc35e1564cb7c82','student','Test New Student 2','CSE','3rd Year','III CSE S3','11249A998','11249a998@scsvmv.ac.in',1,'2026-09-23T22:17:35.595801+05:30');
INSERT INTO "users" VALUES(55,'11249a064','32e614ad71a802bcfb11667f2edb4dbc','2df1e5fc9f78b37511a63bfee7686ac8364cf850f7334af5e58d2176a5e48965','student','Test New Student','CSE','3rd Year','III CSE S3','11249A064','11249a064@scsvmv.ac.in',0,'2026-09-23T22:17:44.614705+05:30');
INSERT INTO "users" VALUES(56,'11249a292','9e6ac590cd9214faea06ee4b56134cce','ba4240b483f05860ea590bf298fad355b5dabe2519ff3c1c644fd3372a5cfdbd','student','Test New Student','CSE','3rd Year','III CSE S3','11249A292','11249a292@scsvmv.ac.in',0,'2026-09-23T22:21:32.754048+05:30');
INSERT INTO "users" VALUES(57,'11249a646','2ab2ee6801fd87116bbeda97070df9ff','132298070890740c4107ba1b686cbeeff2c4d3a4d93b60cefea7967f0c89180c','student','Test New Student','CSE','3rd Year','III CSE S3','11249A646','11249a646@scsvmv.ac.in',0,'2026-09-23T22:27:26.080951+05:30');
INSERT INTO "users" VALUES(58,'11249a926','af27c344c99ecae10ebcd6780a236a2f','ca9014ff3171e289d346d215388a7b24a045728df355ffcc3963bdd6a52de6f6','student','Test New Student','CSE','3rd Year','III CSE S3','11249A926','11249a926@scsvmv.ac.in',0,'2026-09-23T22:32:06.633362+05:30');
INSERT INTO "users" VALUES(59,'bhardwaj','e86f692e4c153fe5','00ac4545ce8c7d9562e5d0837028cd74dfe8c179b7c95e9a3dbaaef0e7611cc7','student','Bhardwaj','CSE','3rd Year','III CSE S3','11249A268','bhardwaj@scsvmv.ac.in',1,'2026-09-23 17:05:46');
INSERT INTO "users" VALUES(60,'koushik','c923dca2199f8bb7','53d0dcddc2c6795b6e6ddbb81fcfe50c6b4969616e24f1ae578a4ceba7351ce9','student','Koushik','CSE','3rd Year','III CSE S4','11249A435','koushik@scsvmv.ac.in',1,'2026-09-23 17:05:46');
INSERT INTO "users" VALUES(61,'pooja','4d5eddbf9547aecd','a5cdb2e223c1ac62661e27e8bd54f0d3d0fdcbcd90635ec028f5c58bafd83c07','student','Pooja Verma','CSE','3rd Year','III CSE S2','11249A088','pooja@scsvmv.ac.in',1,'2026-09-23 17:05:46');
INSERT INTO "users" VALUES(62,'rahul','047f708976d4118c','349747fe83dea10ed75a20112bf0a46f407f247f4f772a33f396e363021ed5df','student','Rahul Sharma','ECE','2nd Year','II ECE S1','11249A015','rahul@scsvmv.ac.in',1,'2026-09-23 17:05:46');
INSERT INTO "users" VALUES(63,'ananya','9034bf00bd251dd1','c8c5ba00690946b2b5dfae47985b4fe504306fef064b51617691f83417e00620','student','Ananya Iyer','CSE','3rd Year','III CSE S1','11249A012','ananya@scsvmv.ac.in',1,'2026-09-23 17:05:46');
INSERT INTO "users" VALUES(64,'11249a341','5fa6bcf872e7e9c602df2a935c8d9fbc','4a5e70f116f995c751a591c4595022d1b170ba1f30fb7b930e0a4c2c39772091','student','Test New Student','CSE','3rd Year','III CSE S3','11249A341','11249a341@scsvmv.ac.in',0,'2026-09-23T22:39:01.577140+05:30');
INSERT INTO "users" VALUES(65,'prema','b271908f0131d5d6','98ea0ab40afb867c61a6bfe593c56728cbb7e076d18406f04dc14d1c3ad98411','faculty','Dr. R. Prema','CSE','3rd Year','III CSE A',NULL,'dr.r.prema@scsvmv.ac.in',1,'2026-09-23 17:12:33');
INSERT INTO "users" VALUES(66,'11249a576','1335de915770db4158812f5c1041b2e7','433c3122e53b12e9aa8a0b37c18ea76ae3ca674abb0f42f9d28eb18b530633e9','student','Test New Student','CSE','3rd Year','III CSE S3','11249A576','11249a576@scsvmv.ac.in',0,'2026-09-23T22:42:56.583672+05:30');
CREATE TABLE watchlist(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  user_id INTEGER REFERENCES users(id),
  faculty_id INTEGER REFERENCES faculty(id),
  active INTEGER DEFAULT 1,
  last_notify TEXT,
  created_at TEXT,
  UNIQUE(user_id, faculty_id)
);
INSERT INTO "watchlist" VALUES(1,3,21,1,NULL,'2026-09-23T20:51:02.363764+05:30');
COMMIT;
