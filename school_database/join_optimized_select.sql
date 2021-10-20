\! echo "------Here are the same SELECTs from optimized_select but these use JOIN\n"

\! echo "Find the student subjects knowing the student ID (Student ID = 17)"
SET @student_id = 17;
SELECT subjects.name, groups.name, students.id, students.name, students.surname
FROM subjects
INNER JOIN groups ON subjects.grade_id = groups.grade_id
INNER JOIN students ON groups.id = students.group_id
WHERE students.id = @student_id;


\! echo "Find the student subjects topics knowing the student ID (Student ID = 17)"
SET @student_id = 17;
SELECT subject_topics.topic, subjects.name, groups.name, students.id, students.name, students.surname
FROM subject_topics
INNER JOIN subjects ON subject_topics.subject_id = subjects.id
INNER JOIN groups ON subjects.grade_id = groups.grade_id
INNER JOIN students ON groups.id = students.group_id
WHERE students.id = @student_id;


\! echo "Find the groups where a subject topic is teached (Topic ID = 10)"
SET @subject_topic = 10;
SELECT groups.name, subjects.name, subject_topics.topic
FROM subject_topics
INNER JOIN subjects ON subjects.id = subject_topics.subject_id
INNER JOIN groups ON groups.grade_id = subjects.grade_id
WHERE subject_topics.id = @subject_topic;


\! echo "Find the school_day from a student (Student ID = 17)"
SET @student_id = 17;
SELECT groups.school_day, groups.name, students.id, students.name, students.surname
FROM groups
INNER JOIN students ON groups.id = students.group_id
WHERE students.id = @student_id;


\! echo "Find the grades where a teacher teaches class (Teacher ID = 3)"
SET @teacher_id = 3;
SELECT grades.number, teachers.name
FROM grades
INNER JOIN groups ON grades.id = groups.grade_id
INNER JOIN subject_groups ON groups.id = subject_groups.group_id
INNER JOIN teachers ON subject_groups.teacher_id = teachers.id
WHERE teachers.id = @teacher_id
GROUP BY grades.number;
