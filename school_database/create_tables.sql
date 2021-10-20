SET foreign_key_checks = 0; -- Inactivate the foreign key check to rewrite the tables

--
-- Teacher table
DROP TABLE IF EXISTS teachers;
CREATE TABLE teachers (
  id INT AUTO_INCREMENT,
  citizenship_card INT NOT NULL,
  name VARCHAR( 30 ) NOT NULL,
  surname VARCHAR( 30 ) NOT NULL,
  sex CHAR( 1 ),

  PRIMARY KEY( id ),
  UNIQUE( citizenship_card )
);

--
-- Grades table
DROP TABLE IF EXISTS grades;
CREATE TABLE grades (
  id INT AUTO_INCREMENT,
  number INT NOT NULL,

  PRIMARY KEY( id ),
  UNIQUE( number )
);

--
-- Subject table
DROP TABLE IF EXISTS subjects;
CREATE TABLE subjects (
  id INT AUTO_INCREMENT,
  name VARCHAR( 30 ) NOT NULL,
  grade_id INT NOT NULL,
  coordinator_id INT,

  PRIMARY KEY( id ),
  FOREIGN KEY( grade_id ) REFERENCES grades( id ),
  FOREIGN KEY( coordinator_id ) REFERENCES teachers( id )
);

--
-- Subject topics table
DROP TABLE IF EXISTS subject_topics;
CREATE TABLE subject_topics (
  id INT AUTO_INCREMENT,
  subject_id INT NOT NULL,
  topic_number INT NOT NULL,
  topic VARCHAR( 50 ),

  PRIMARY KEY( id ),
  CONSTRAINT subject_topics UNIQUE( subject_id, topic_number ),
  FOREIGN KEY( subject_id ) REFERENCES subjects( id )
);

--
-- Groups table
DROP TABLE IF EXISTS groups;
CREATE TABLE groups (
  id INT AUTO_INCREMENT,
  name VARCHAR( 20 ) NOT NULL,
  grade_id INT NOT NULL,
  school_day VARCHAR( 10 ) NOT NULL,
  director_id INT,

  PRIMARY KEY( id ),
  CONSTRAINT groups UNIQUE( name, grade_id, school_day ),
  FOREIGN KEY( grade_id ) REFERENCES grades( id ),
  FOREIGN KEY( director_id ) REFERENCES teachers( id )
);

--
-- Student table
DROP TABLE IF EXISTS students;
CREATE TABLE students (
  id INT AUTO_INCREMENT,
  identity_card INT NOT NULL,
  name VARCHAR( 30 ) NOT NULL,
  surname VARCHAR( 30 ) NOT NULL,
  sex CHAR( 1 ),
  group_id INT,

  PRIMARY KEY( id ),
  UNIQUE( identity_card ),
  FOREIGN KEY( group_id ) REFERENCES groups( id )
);

--
-- Subject_groups table (Conection between subjects and groups tables)
DROP TABLE IF EXISTS subject_groups;
CREATE TABLE subject_groups (
  id INT AUTO_INCREMENT,
  group_id INT NOT NULL,
  subject_id INT NOT NULL,
  teacher_id INT,
  monitor_id INT,

  PRIMARY KEY( id ),
  UNIQUE( subject_id, group_id ),
  FOREIGN KEY( group_id ) REFERENCES groups( id ),
  FOREIGN KEY( subject_id ) REFERENCES subjects( id ),
  FOREIGN KEY( teacher_id ) REFERENCES teachers( id ),
  FOREIGN KEY( monitor_id ) REFERENCES students( id )
);

SET foreign_key_checks = 1;

--
-- Student_notes table
DROP TABLE IF EXISTS student_notes;
CREATE TABLE student_notes (
  id INT AUTO_INCREMENT,
  student_id INT NOT NULL,
  topic_id INT NOT NULL,
  note FLOAT,

  PRIMARY KEY( id ),
  CONSTRAINT student_topic UNIQUE( topic_id, student_id ),
  FOREIGN KEY( student_id ) REFERENCES students( id ),
  FOREIGN KEY( topic_id ) REFERENCES subject_topics( id )
);
