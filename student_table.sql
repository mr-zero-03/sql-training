-- To create the student table, and alterate it to add a new field

CREATE TABLE student (
  id INT,
  identification_document INT NOT NULL,
  name VARCHAR(30) NOT NULL,
  grade TINYINT(2) UNSIGNED,
  favorite_subject VARCHAR(30) DEFAULT 'No favorite',

  PRIMARY KEY(id),
  UNIQUE( identification_document )
);
DESCRIBE student;

ALTER TABLE student ADD birthday_date DATE;
DESCRIBE student;

ALTER TABLE student ADD sex CHAR(1);
DESCRIBE student;
