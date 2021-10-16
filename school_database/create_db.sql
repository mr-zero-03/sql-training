CREATE DATABASE school;

CREATE USER 'school'@'localhost' IDENTIFIED BY 'admin123';

GRANT ALL PRIVILEGES ON school.* TO 'school'@'localhost';
