DELETE FROM teachers;
INSERT INTO teachers( citizenship_card, name, surname, sex ) VALUES
  ( 12345, 'Hugo Ernesto', 'Francois Rosas', 'M' ),
  ( 23451, 'Ava', 'García Hernandez', 'F' ),
  ( 34512, 'Lucas Nicolas', 'Gómez Lopez', 'M' ),
  ( 45123, 'Alba María', 'Sánchez Pérez', 'F' ),
  ( 51234, 'Walter Sebastián', 'López Gómez', 'M' ),
  ( 13524, 'Ainara', 'Rosas Céspedes', 'F' );


DELETE FROM grades;
INSERT INTO grades( number ) VALUES ( 10 ), ( 11 );


DELETE FROM subjects;
INSERT INTO subjects( name, grade_id, coordinator_id ) VALUES
  ( 'Algebra', 1, 5 ),
  ( 'Social Sciences', 1, 4 ),
  ( 'Trigonometry ', 1, 3 ),

  ( 'Calculus', 2, 5 ),
  ( 'Linear Algebra', 2, 5 ),
  ( 'Philosophy', 2, 4 );


DELETE FROM subject_topics;
INSERT INTO subject_topics( subject_id, topic_number, topic, semester ) VALUES
  -- 10 grade
  ( 1, 1, 'Linear Equations', 1 ),  -- Algebra
  ( 1, 2, 'Inequalities', 2 ),
  ( 1, 3, 'Functions', 3 ),

  ( 2, 1, 'History of the country', 1 ),  -- Social Sciences
  ( 2, 2, 'Social Movements', 2 ),
  ( 2, 3, 'Human Rights', 3 ),

  ( 3, 1, 'Sine(sin) and Cosine(cos)', 1 ),  -- Trigonometry
  ( 3, 2, 'Tangent(tan) and Cotangent(cot)', 2 ),
  ( 3, 3, 'Secant(sec) and Cosecant(csc)', 3 ),

  -- 11 grade
  ( 4, 1, 'Limits and Continuity', 1 ),  -- Calculus
  ( 4, 2, 'Integrals', 2 ),
  ( 4, 3, 'Series', 3 ),

  ( 5, 1, 'Spaces and Vectors', 1 ),  -- Linear Algebra
  ( 5, 2, 'Matrix Transformations', 2 ),
  ( 5, 3, 'Bases', 3 ),

  ( 6, 1, 'Existentialism', 1 ),  -- Philosphy
  ( 6, 2, 'Stoicism', 2 ),
  ( 6, 3, 'Logic and Argumentation', 3 );


DELETE FROM groups;
INSERT INTO groups( name, grade_id, school_day, director_id ) VALUES
  ( '10A-M', 1, 'MORNING', 1 ),
  ( '10B-M', 1, 'MORNING', 2 ),
  ( '10A-A', 1, 'AFTERNOON', 2 ),
  ( '10B-A', 1, 'AFTERNOON', 3 ),

  ( '11A-M', 2, 'MORNING', 6 ),
  ( '11B-M', 2, 'MORNING', 5 ),
  ( '11A-A', 2, 'AFTERNOON', 4 ),
  ( '11B-A', 2, 'AFTERNOON', 1 );


DELETE FROM students;
INSERT INTO students( identity_card, name, surname, sex, group_id ) VALUES
  ( 912345678, 'Ximena', 'Barbosa Gaitan', 'M', 1 ),  -- 10 grade
  ( 456789123, 'Manuel Esteban', 'Palacio Calderón', 'M', 1 ),
  ( 678912345, 'Karla Sofia', 'Pedraza Rojas', 'F', 1 ),

  ( 345678912, 'Glendel Joubert', 'Fyne Acosta', 'M', 2 ),
  ( 123456789, 'Daniel Santiago', 'Pérez Ducuara', 'M', 2 ),
  ( 789123456, 'Alejandra', 'Viera Rojas', 'F', 2 ),
  ( 234567891, 'Julian David', 'Galindo León', 'M', 2 ),

  ( 891234567, 'Nicol Alejandra', 'Ducuara Tocora', 'F', 3 ),
  ( 123456798, 'Laura', 'Pérez Osorio', 'F', 3 ),
  ( 123456879, 'Mia', 'Rodriguez Pedraza', 'M', 3 ),

  ( 987654321, 'Elizabeth Sofia', 'Acosta Figueroa', 'F', 4 ),
  ( 876543219, 'Kevin', 'León Patiño', 'M', 4 ),
  ( 765432198, 'Sara Alejandra', 'Osorio León', 'F', 4 ),

  ( 654321987, 'Cesar Adrián', 'Pérez Osorio', 'M', 5 ),  -- 11 grade
  ( 543219876, 'Gabriel Felipe', 'Patiño López', 'M', 5 ),
  ( 432198765, 'Héctor Iván', 'Martínez Sánchez', 'M', 5 ),

  ( 321987654, 'Lily', 'Sánchez Restrepo', 'F', 6 ),
  ( 219876543, 'Sara Isabella', 'Tocora Pino', 'F', 6 ),

  ( 198765432, 'Jaime', 'Velez López', 'M', 7 ),
  ( 102030405, 'Omar', 'Guerra Molina', 'M', 7 ),
  ( 203040500, 'Chloe', 'Molina Osorio', 'F', 7 ),

  ( 906040805, 'Alessia Sara', 'Toro Estrada', 'F', 8 ),
  ( 105070903, 'Miguel Angel', 'Piedrahita Castro', 'M', 8 );


DELETE FROM subject_groups;
INSERT INTO subject_groups( group_id, subject_id, teacher_id, monitor_id ) VALUES
  -- 10 grade
  ( 1, 1, 1, 1 ),  -- 10A-M
  ( 1, 2, 2, 1 ),
  ( 1, 3, 5, 2 ),

  ( 2, 1, 6, 4 ),  -- 10B-M
  ( 2, 2, 4, 5 ),
  ( 2, 3, 3, 6 ),

  ( 3, 1, 6, 8 ),  -- 10A-A
  ( 3, 2, 2, 8 ),
  ( 3, 3, 6, 8 ),

  ( 4, 1, 1, 11 ),  -- 10B-A
  ( 4, 2, 2, 13 ),
  ( 4, 3, 3, 12 ),

  -- 11 grade
  ( 5, 4, 5, 15 ),  -- 11A-M
  ( 5, 5, 1, 16 ),
  ( 5, 6, 2, 16 ),

  ( 6, 4, 6, 17 ),  -- 11B-M
  ( 6, 5, 6, 17 ),
  ( 6, 6, 4, 18 ),

  ( 7, 4, 1, 20 ),  -- 11A-A
  ( 7, 5, 1, 20 ),
  ( 7, 6, 2, 21 ),

  ( 8, 4, 3, 22 ),  -- 11B-A
  ( 8, 5, 5, 23 ),
  ( 8, 6, 4, 23 );


DELETE FROM student_notes;
INSERT INTO student_notes( student_id, topic_id, note ) VALUES
  -- 10 grade
  ( 1, 1, 5.0 ), ( 1, 2, 1.5 ), ( 1, 3, 4.5 ), ( 1, 4, 3.6 ), ( 1, 5, 4.2 ), ( 1, 6, 4.3 ), ( 1, 7, 2.6 ), ( 1, 8, 2.9 ), ( 1, 9, 1.9 ),
  ( 2, 1, 1.3 ), ( 2, 2, 4.5 ), ( 2, 3, 4.2 ), ( 2, 4, 4.2 ), ( 2, 5, 4.2 ), ( 2, 6, 3.3 ), ( 2, 7, 0.6 ), ( 2, 8, 4.8 ), ( 2, 9, 4.8 ),
  ( 3, 1, 4.9 ), ( 3, 2, 4.9 ), ( 3, 3, 3.1 ), ( 3, 4, 0.7 ), ( 3, 5, 2.7 ), ( 3, 6, 4.7 ), ( 3, 7, 0.3 ), ( 3, 8, 2.4 ), ( 3, 9, 4.2 ),
  ( 4, 1, 1.7 ), ( 4, 2, 3.8 ), ( 4, 3, 2.2 ), ( 4, 4, 0.8 ), ( 4, 5, 0.7 ), ( 4, 6, 0.6 ), ( 4, 7, 1.3 ), ( 4, 8, 0.1 ), ( 4, 9, 3.6 ),
  ( 5, 1, 2.0 ), ( 5, 2, 0.2 ), ( 5, 3, 0.2 ), ( 5, 4, 2.3 ), ( 5, 5, 4.5 ), ( 5, 6, 3.5 ), ( 5, 7, 1.8 ), ( 5, 8, 1.5 ), ( 5, 9, 3.5 ),
  ( 6, 1, 0.7 ), ( 6, 2, 3.5 ), ( 6, 3, 3.1 ), ( 6, 4, 2.6 ), ( 6, 5, 2.3 ), ( 6, 6, 1.0 ), ( 6, 7, 4.2 ), ( 6, 8, 2.8 ), ( 6, 9, 4.4 ),
  ( 7, 1, 2.4 ), ( 7, 2, 2.4 ), ( 7, 3, 4.2 ), ( 7, 4, 4.7 ), ( 7, 5, 0.2 ), ( 7, 6, 4.2 ), ( 7, 7, 0.3 ), ( 7, 8, 2.3 ), ( 7, 9, 4.2 ),
  ( 8, 1, 0.5 ), ( 8, 2, 0.2 ), ( 8, 3, 4.4 ), ( 8, 4, 0.8 ), ( 8, 5, 3.7 ), ( 8, 6, 0.4 ), ( 8, 7, 4.3 ), ( 8, 8, 3.1 ), ( 8, 9, 3.4 ),
  ( 9, 1, 3.6 ), ( 9, 2, 2.0 ), ( 9, 3, 1.5 ), ( 9, 4, 3.7 ), ( 9, 5, 0.6 ), ( 9, 6, 2.5 ), ( 9, 7, 4.0 ), ( 9, 8, 0.5 ), ( 9, 9, 1.2 ),
  ( 10, 1, 2.2 ), ( 10, 2, 2.5 ), ( 10, 3, 0.7 ), ( 10, 4, 3.1 ), ( 10, 5, 0.2 ), ( 10, 6, 0.6 ), ( 10, 7, 0.7 ), ( 10, 8, 4.6 ), ( 10, 9, 1.5 ),
  ( 11, 1, 4.5 ), ( 11, 2, 1.8 ), ( 11, 3, 2.2 ), ( 11, 4, 5.0 ), ( 11, 5, 1.5 ), ( 11, 6, 3.2 ), ( 11, 7, 1.2 ), ( 11, 8, 2.1 ), ( 11, 9, 2.7 ),
  ( 12, 1, 1.7 ), ( 12, 2, 3.6 ), ( 12, 3, 3.2 ), ( 12, 4, 0.5 ), ( 12, 5, 3.3 ), ( 12, 6, 5.0 ), ( 12, 7, 4.0 ), ( 12, 8, 3.2 ), ( 12, 9, 0.4 ),
  ( 13, 1, 1.9 ), ( 13, 2, 3.9 ), ( 13, 3, 3.3 ), ( 13, 4, 0.5 ), ( 13, 5, 1.7 ), ( 13, 6, 2.1 ), ( 13, 7, 1.9 ), ( 13, 8, 0.3 ), ( 13, 9, 0.1 ),
  -- 11 grade
  ( 14, 10, 0.6 ), ( 14, 11, 4.1 ), ( 14, 12, 0.9 ), ( 14, 13, 2.8 ), ( 14, 14, 1.0 ), ( 14, 15, 3.3 ), ( 14, 16, 3.3 ), ( 14, 17, 0.2 ), ( 14, 18, 2.5 ),
  ( 15, 10, 2.3 ), ( 15, 11, 0.5 ), ( 15, 12, 4.9 ), ( 15, 13, 1.7 ), ( 15, 14, 4.5 ), ( 15, 15, 4.7 ), ( 15, 16, 1.0 ), ( 15, 17, 2.1 ), ( 15, 18, 0.6 ),
  ( 16, 10, 2.6 ), ( 16, 11, 4.7 ), ( 16, 12, 4.8 ), ( 16, 13, 4.1 ), ( 16, 14, 2.9 ), ( 16, 15, 0.8 ), ( 16, 16, 1.6 ), ( 16, 17, 3.3 ), ( 16, 18, 3.5 ),
  ( 17, 10, 4.8 ), ( 17, 11, 4.2 ), ( 17, 12, 4.6 ), ( 17, 13, 1.7 ), ( 17, 14, 1.0 ), ( 17, 15, 2.6 ), ( 17, 16, 0.8 ), ( 17, 17, 4.9 ), ( 17, 18, 4.5 ),
  ( 18, 10, 0.2 ), ( 18, 11, 3.6 ), ( 18, 12, 2.0 ), ( 18, 13, 2.6 ), ( 18, 14, 1.5 ), ( 18, 15, 2.9 ), ( 18, 16, 1.2 ), ( 18, 17, 2.3 ), ( 18, 18, 3.1 ),
  ( 19, 10, 4.1 ), ( 19, 11, 4.8 ), ( 19, 12, 4.0 ), ( 19, 13, 4.2 ), ( 19, 14, 3.2 ), ( 19, 15, 1.6 ), ( 19, 16, 0.7 ), ( 19, 17, 2.4 ), ( 19, 18, 0.3 ),
  ( 20, 10, 2.7 ), ( 20, 11, 2.7 ), ( 20, 12, 4.6 ), ( 20, 13, 1.2 ), ( 20, 14, 1.6 ), ( 20, 15, 2.0 ), ( 20, 16, 1.0 ), ( 20, 17, 2.1 ), ( 20, 18, 1.8 ),
  ( 21, 10, 0.5 ), ( 21, 11, 2.2 ), ( 21, 12, 0.8 ), ( 21, 13, 0.7 ), ( 21, 14, 3.3 ), ( 21, 15, 2.3 ), ( 21, 16, 1.7 ), ( 21, 17, 3.8 ), ( 21, 18, 2.8 ),
  ( 22, 10, 1.6 ), ( 22, 11, 3.6 ), ( 22, 12, 2.7 ), ( 22, 13, 0.3 ), ( 22, 14, 3.1 ), ( 22, 15, 1.7 ), ( 22, 16, 0.6 ), ( 22, 17, 4.5 ), ( 22, 18, 2.3 ),
  ( 23, 10, 0.5 ), ( 23, 11, 4.4 ), ( 23, 12, 0.5 ), ( 23, 13, 0.1 ), ( 23, 14, 4.5 ), ( 23, 15, 0.9 ), ( 23, 16, 1.1 ), ( 23, 17, 1.2 ), ( 23, 18, 1.1 );
