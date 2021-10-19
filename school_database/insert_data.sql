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
INSERT INTO subject_topics( subject_id, topic_number, topic ) VALUES
  -- 10 grade
  ( 1, 1, 'Linear Equations' ),  -- Algebra
  ( 1, 2, 'Inequalities' ),
  ( 1, 3, 'Functions' ),

  ( 2, 1, 'History of the country' ),  -- Social Sciences
  ( 2, 2, 'Social Movements' ),
  ( 2, 3, 'Human Rights' ),

  ( 3, 1, 'Sine(sin) and Cosine(cos)' ),  -- Trigonometry
  ( 3, 2, 'Tangent(tan) and Cotangent(cot)' ),
  ( 3, 3, 'Secant(sec) and Cosecant(csc)' ),

  -- 11 grade
  ( 4, 1, 'Limits and Continuity' ),  -- Calculus
  ( 4, 2, 'Integrals' ),
  ( 4, 3, 'Series' ),

  ( 5, 1, 'Spaces and Vectors' ),  -- Linear Algebra
  ( 5, 2, 'Matrix Transformations' ),
  ( 5, 3, 'Bases' ),

  ( 6, 1, 'Existentialism' ),  -- Philosphy
  ( 6, 2, 'Stoicism' ),
  ( 6, 3, 'Logic and Argumentation' );


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
