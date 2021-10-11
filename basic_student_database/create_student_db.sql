-- To create the school database and the admin user

CREATE DATABASE student;

CREATE USER 'student'@'localhost' IDENTIFIED BY 'student_admin';

GRANT ALL PRIVILEGES ON student.* TO 'student'@'localhost';
