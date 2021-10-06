-- To create the student table, and alterate it to add a new field

CREATE TABLE student (
  id INT,
  name VARCHAR(30),
  grade TINYINT(2) UNSIGNED,

  PRIMARY KEY(id)
);
DESCRIBE student;

ALTER TABLE student ADD birthday_date DATE;
DESCRIBE student;

ALTER TABLE student ADD sex CHAR(1);
DESCRIBE student;
