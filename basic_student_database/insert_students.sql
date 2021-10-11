-- Insert (create) info in the table

INSERT INTO 
  student( identification_document, name, grade, favorite_subject, birthday_date, sex )
VALUES
  ( 234567891, 'Olivia', 4, 'Mathematics', '2012-02-02', 'F' ),
  ( 345678912, 'Pedro', 1, NULL, '2015-03-03', 'M' );

INSERT INTO student( identification_document, name, sex )
  VALUES( 123456789, 'Alberto', 'M' );

INSERT INTO student( identification_document, name, grade, favorite_subject, sex )
  VALUES( 456789123, 'Olivia', 9, 'Computer Science', 'F' );

SELECT * FROM student;
