\! echo "Find the student subjects knowing the student ID (Student ID = 17)"
SET @student_id = 17;
SELECT subjects.name, groups.name, students.id, students.name, students.surname
FROM subjects, students, groups
WHERE subjects.grade_id IN(
  SELECT groups.grade_id
  FROM groups
  WHERE id IN(
    SELECT students.group_id
    FROM students
    WHERE students.id = @student_id
  )
)
AND students.id = @student_id
AND groups.id IN(
  SELECT students.group_id
  FROM students
  WHERE students.id = @student_id
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
SELECT groups.name, subjects.name, subject_topics.topic
FROM groups, subject_topics, subjects
WHERE groups.grade_id IN(
  SELECT subjects.grade_id
  FROM subjects
  WHERE subjects.id IN(
    SELECT subject_topics.subject_id
    FROM subject_topics
    WHERE subject_topics.id = @subject_topic
  )
)
AND subject_topics.id = @subject_topic
AND subjects.id IN(
  SELECT subject_topics.subject_id
  FROM subject_topics
  WHERE subject_topics.id = @subject_topic
);


\! echo "Find the school_day from a student (Student ID = 17)"
SET @student_id = 17;
SELECT groups.school_day, groups.name, students.id, students.name, students.surname
FROM groups, students
WHERE groups.id IN(
  SELECT students.group_id
  FROM students
  WHERE students.id = @student_id
) AND students.id = @student_id;


\! echo "Find the grades where a teacher teaches class (Teacher ID = 3)"
SET @teacher_id = 3;
SELECT grades.number, teachers.name
FROM grades, teachers
WHERE grades.id IN(
  SELECT groups.grade_id
  FROM groups
  WHERE groups.id IN(
    SELECT subject_groups.group_id
    FROM subject_groups
    WHERE subject_groups.teacher_id = @teacher_id
  )
) AND teachers.id = @teacher_id;


\! echo "Find how many teachers and students have the surname 'L??pez'"
SET @surname = "G??mez";
SELECT "Students" AS "type", students.id, students.name, students.surname
FROM students
WHERE students.surname LIKE '%L??pez%'
UNION
SELECT "Teachers", teachers.id, teachers.name, teachers.surname
FROM teachers
WHERE teachers.surname LIKE '%L??pez%';

SELECT COUNT(*) AS 'Count "L??pez"'
FROM teachers, students
WHERE teachers.surname LIKE '%L??pez%'
AND students.surname LIKE '%L??pez%';


\! echo "Find in what groups does an teacher is director"
SET @director_id = 1;
SELECT groups.name, teachers.id, teachers.name
FROM groups
JOIN teachers
ON groups.director_id = teachers.id
WHERE groups.director_id = @director_id;


\! echo "Find the students with note > 3.5, but < 5.0 and order it to the less to the greatest note"
SET @greaterThanNote = 3.5; SET @smallerThanNote = 5.0;
SELECT students.name, subjects.name AS subject, subject_topics.topic, student_notes.note
FROM student_notes
INNER JOIN students ON student_notes.student_id = students.id
INNER JOIN subject_topics ON student_notes.topic_id = subject_topics.id
INNER JOIN subjects ON subject_topics.subject_id = subjects.id
WHERE note > @greaterThanNote AND note < @smallerThanNote
ORDER BY note;


\! echo "Find the notes obtained by the students in a topic (Topic ID = 10)"
SET @topic_id = 10;
SELECT students.name, subjects.name AS subject, subject_topics.topic, student_notes.note
FROM student_notes
INNER JOIN students ON student_notes.student_id = students.id
INNER JOIN subject_topics ON student_notes.topic_id = subject_topics.id
INNER JOIN subjects ON subject_topics.subject_id = subjects.id
WHERE subject_topics.id = @topic_id;


\! echo "Find the gpa obtained by a student in every subject (Student ID = 1)"
SET @student_id = 1;
SELECT *
FROM student_grade_point_average
WHERE student_id = @student_id;


\! echo "Find the students with gpa equal or greater than 3.0 in Calculus in the group 11A-A"
SET @gpa = 3.0;
SET @subject_name = "Calculus";
SET @groups = "11A-A";
SELECT *
FROM student_grade_point_average
WHERE gpa >= @gpa AND subject_name = @subject_name AND groups = @groups;
