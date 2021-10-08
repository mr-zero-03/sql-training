-- To create the student table, and alterate it to add a new field

\! echo '-- Creating the table:';
CREATE TABLE student (
  id INT AUTO_INCREMENT,
  identification_document INT NOT NULL,
  name VARCHAR(30) NOT NULL,
  grade TINYINT(2) UNSIGNED,
  favorite_subject VARCHAR(30) DEFAULT 'No favorite',

  PRIMARY KEY(id),
  UNIQUE( identification_document )
);
DESCRIBE student;

\! echo '-- Adding the birthday_date field:';
ALTER TABLE student ADD birthday_date DATE;
DESCRIBE student;

\! echo '-- Adding the sex field:';
ALTER TABLE student ADD sex CHAR(1);
DESCRIBE student;
