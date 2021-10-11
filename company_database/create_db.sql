-- To create the company database and the admin user

CREATE DATABASE company;

CREATE USER 'company'@'localhost' IDENTIFIED BY 'admin123';

GRANT ALL PRIVILEGES ON company.* TO 'company'@'localhost';
