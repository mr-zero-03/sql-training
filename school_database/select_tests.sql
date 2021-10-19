\! echo "Find the student subjects knowing the student ID (Student ID = 17)"
SET @student_id = 17;
SELECT subjects.name
FROM subjects
WHERE subjects.grade_id IN(
  SELECT groups.grade_id
  FROM groups
  WHERE id IN(
    SELECT students.group_id
    FROM students
    WHERE students.id = @student_id
  )
);


\! echo "Find the subjects and the groups where a teacher teaches class (Teacher ID = 4)"
SET @teacher_id = 4;
SELECT groups.name AS "Group", groups.school_day AS "School day", subjects.name AS "Subject", teachers.name AS "Teacher"
FROM subject_groups
INNER JOIN subjects
ON subject_groups.subject_id = subjects.id
INNER JOIN teachers
ON subject_groups.teacher_id = teachers.id
INNER JOIN groups
ON subject_groups.group_id = groups.id
WHERE teacher_id = 4;


\! echo "Find the groups where a subject topic is teached (Topic ID = 10)"
SET @subject_topic = 10;
SELECT groups.name
FROM groups
WHERE groups.grade_id IN(
  SELECT subjects.grade_id
  FROM subjects
  WHERE subjects.id IN(
    SELECT subject_topics.subject_id
    FROM subject_topics
    WHERE subject_topics.id = @subject_topic
  )
);


\! echo "Find the school_day from a student (Student ID = 17)"
SET @student_id = 17;
SELECT groups.school_day
FROM groups
WHERE groups.id IN(
  SELECT students.group_id
  FROM students
  WHERE students.id = @student_id
);


\! echo "Find the grades where a teacher teaches class (Teacher ID = 3)"
SET @teacher_id = 3;
SELECT grades.number
FROM grades
WHERE grades.id IN(
  SELECT groups.grade_id
  FROM groups
  WHERE groups.id IN(
    SELECT subject_groups.group_id
    FROM subject_groups
    WHERE subject_groups.teacher_id = @teacher_id
  )
);


\! echo "Find how many teachers and students have the surname 'López'"
SET @surname = "Gómez";
SELECT students.name, students.surname, "Students" AS "type"
FROM students
WHERE students.surname LIKE '%López%'
UNION
SELECT teachers.name, teachers.surname, "Teachers"
FROM teachers
WHERE teachers.surname LIKE '%López%';

SELECT COUNT(*) AS 'Count "López"'
FROM teachers, students
WHERE teachers.surname LIKE '%López%'
AND students.surname LIKE '%López%';


\! echo "Find in what groups does an teacher is director"
SET @director_id = 1;
SELECT groups.name
FROM groups
WHERE groups.director_id = @director_id;
