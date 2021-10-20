\! echo "Find the student subjects knowing the student ID (Student ID = 17)"
\! echo "--Here what you can see is that the nested SELECT enter more than one time to the tables"
SET @student_id = 17;
EXPLAIN SELECT subjects.name, groups.name, students.id, students.name, students.surname
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


\! echo "--The previous SELECT can be optimized:"
EXPLAIN SELECT subjects.name, groups.name, students.id, students.name, students.surname
FROM subjects, groups, students
WHERE subjects.grade_id = groups.grade_id
AND groups.id = students.group_id
AND students.id = @student_id;

SELECT subjects.name, groups.name, students.id, students.name, students.surname
FROM subjects, groups, students
WHERE subjects.grade_id = groups.grade_id
AND groups.id = students.group_id
AND students.id = @student_id;


\! echo "------The following SELECTs are also an optimized from the version in the select_tests file:\n"
\! echo "Find the student subjects topics knowing the student ID (Student ID = 17)"
SET @student_id = 17;
SELECT subject_topics.topic, subjects.name, groups.name, students.id, students.name, students.surname
FROM subject_topics, subjects, groups, students
WHERE subject_topics.subject_id = subjects.id
AND subjects.grade_id = groups.grade_id
AND groups.id = students.group_id
AND students.id = @student_id;


\! echo "Find the groups where a subject topic is teached (Topic ID = 10)"
SET @subject_topic = 10;
SELECT groups.name, subjects.name, subject_topics.topic
FROM subject_topics, subjects, groups
WHERE groups.grade_id = subjects.grade_id
AND subjects.id = subject_topics.subject_id
AND subject_topics.id = @subject_topic;


\! echo "Find the school_day from a student (Student ID = 17)"
SET @student_id = 17;
SELECT groups.school_day, groups.name, students.id, students.name, students.surname
FROM groups, students
WHERE groups.id = students.group_id
AND students.id = @student_id;


\! echo "Find the grades where a teacher teaches class (Teacher ID = 3)"
SET @teacher_id = 3;
SELECT grades.number, teachers.name
FROM subject_groups, groups, grades, teachers
WHERE grades.id = groups.grade_id
AND groups.id = subject_groups.group_id
AND subject_groups.teacher_id = teachers.id
AND teachers.id = @teacher_id
GROUP BY grades.number;
