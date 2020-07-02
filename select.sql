# 1.Query the existence of 1 course
SELECT * FROM course WHERE id=1

# 2.Query the presence of both 1 and 2 courses
SELECT a.* FROM course a,course b WHERE a.id=1 AND b.id=2
UNION
SELECT b.* FROM course a,course b WHERE a.id=1 AND b.id=2

# 3.Query the student number and student name and average score of students whose average score is 60 or higher.
SELECT a.id,NAME,AVG(score) FROM student a,student_course b WHERE a.id=b.studentId GROUP BY a.id,NAME HAVING AVG(score)>=60

# 4.Query the SQL statement of student information that does not have grades in the student_course table
SELECT * FROM student WHERE id NOT IN (SELECT studentId FROM student_course)

# 5.Query all SQL with grades
SELECT * FROM student WHERE id IN (SELECT studentId FROM student_course)

# 6.Inquire about the information of classmates who have numbered 1 and also studied the course numbered 2
SELECT * FROM student WHERE id IN (SELECT a.studentId FROM student_course a,student_course b WHERE a.studentId=b.studentId AND a.courseId=1 AND b.courseId=2)

# 7.Retrieve 1 student score with less than 60 scores in descending order
SELECT a.id,a.name,b.score FROM student a,student_course b WHERE a.id=b.studentId AND courseId=2 AND score<=60 ORDER BY score DESC

# 8.Query the average grade of each course. The results are ranked in descending order of average grade. When the average grades are the same, they are sorted in ascending order by course number.
SELECT courseId,NAME,AVG(score) FROM course a,student_course b WHERE a.id=b.courseId GROUP BY courseId,NAME ORDER BY AVG(score) DESC,courseId ASC

# 9.Query the name and score of a student whose course name is "Math" and whose score is less than 60
SELECT a.name,score FROM student a,course b,student_course c WHERE a.id=c.studentId AND b.id=c.courseId  AND b.name='Math' AND c.score<60