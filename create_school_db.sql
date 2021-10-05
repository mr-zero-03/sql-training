-- To create the school database and the admin user

CREATE DATABASE school;

CREATE USER 'school'@'localhost' IDENTIFIED BY 'school_admin';

GRANT ALL PRIVILEGES ON school.* TO 'school'@'localhost';
