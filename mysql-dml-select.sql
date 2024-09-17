-- Task 1: Retrieve all users who are instructors.
SELECT * FROM User WHERE role = 'Instructor';

-- Task 2: Find all courses created by a specific instructor.
SELECT course_name, description FROM Course WHERE instructor_id = (SELECT user_id FROM User WHERE username 
= 'jane_smith');

-- Task 3: List all students enrolled in a specific course.
SELECT u.username, u.email FROM Enrollment e
JOIN User u ON e.user_id = u.user_id
WHERE e.course_id = (SELECT course_id FROM Course WHERE course_name = 'Introduction to Programming');

-- Task 4: Get the details of all assignments for a given course.
SELECT title, description, due_date FROM Assignment WHERE course_id = (SELECT course_id FROM Course WHERE 
course_name = 'Introduction to Programming');

-- Task 5: Find the average grade for each assignment.
SELECT a.title, AVG(g.grade) AS average_grade FROM Assignment a
JOIN Submission s ON a.assignment_id = s.assignment_id
JOIN Grade g ON s.submission_id = g.submission_id
GROUP BY a.assignment_id;

-- Task 6: Retrieve all course materials for a specific course.
SELECT material_type, material_url FROM CourseMaterial WHERE course_id = (SELECT course_id FROM Course 
WHERE course_name = 'Web Development Fundamentals');

-- Task 7: List all discussions related to a specific course.
SELECT u.username, d.content, d.created_at FROM Discussion d
JOIN User u ON d.user_id = u.user_id
WHERE d.course_id = (SELECT course_id FROM Course WHERE course_name = 'Data Science with Python');

-- Task 8: Find all quizzes for a specific course.
SELECT title FROM Quiz WHERE course_id = (SELECT course_id FROM Course WHERE course_name = 'Machine 
Learning Basics');

-- Task 9: Retrieve all questions for a specific quiz.
SELECT question_text FROM Question WHERE quiz_id = (SELECT quiz_id FROM Quiz WHERE title = 'Machine 
Learning Basics Quiz');

-- Task 10: List all answers provided by a specific user.
SELECT q.question_text, a.answer_text FROM Answer a
JOIN Question q ON a.question_id = q.question_id
WHERE a.user_id = (SELECT user_id FROM User WHERE username = 'john_doe');

-- Task 11: Get all reviews for a specific course and order them by rating.
SELECT u.username, r.rating, r.comment FROM Review r
JOIN User u ON r.user_id = u.user_id
WHERE r.course_id = (SELECT course_id FROM Course WHERE course_name = 'Advanced Database Systems')
ORDER BY r.rating DESC;

-- Task 12: Retrieve all feedback for a specific course.
SELECT u.username, f.feedback_text, f.created_at FROM Feedback f
JOIN User u ON f.user_id = u.user_id
WHERE f.course_id = (SELECT course_id FROM Course WHERE course_name = 'Data Science with Python');

-- Task 13: List all users who have completed a specific course.
SELECT u.username, u.email FROM Certificate c
JOIN User u ON c.user_id = u.user_id
WHERE c.course_id = (SELECT course_id FROM Course WHERE course_name = 'Introduction to Programming');

-- Task 14: Find the top 5 most popular courses based on the number of enrollments.
SELECT c.course_name, COUNT(e.enrollment_id) AS enrollment_count FROM Course c
JOIN Enrollment e ON c.course_id = e.course_id
GROUP BY c.course_id
ORDER BY enrollment_count DESC
LIMIT 5;

-- Task 15: Get all assignments that are overdue.
SELECT title, description FROM Assignment WHERE due_date < CURDATE() AND assignment_id NOT IN (SELECT 
assignment_id FROM Submission);

-- Task 16: List all courses that have associated tags.
SELECT DISTINCT c.course_name FROM Course c
JOIN CourseTag t ON c.course_id = t.course_id;

-- Task 17: Find all users who have not enrolled in any course.
SELECT u.username, u.email FROM User u
LEFT JOIN Enrollment e ON u.user_id = e.user_id
WHERE e.user_id IS NULL;

-- Task 18: Retrieve the profile information for all instructors.
SELECT u.username, p.bio, p.profile_picture_url FROM User u
JOIN UserProfile p ON u.user_id = p.user_id
WHERE u.role = 'Instructor';

-- Task 19: List all assignments and their submission status for a specific user.
SELECT a.title, IFNULL(s.submission_date, 'Not Submitted') AS submission_status FROM Assignment a
LEFT JOIN Submission s ON a.assignment_id = s.assignment_id AND s.user_id = (SELECT user_id FROM User 
WHERE username = 'alice_jones')
WHERE a.course_id = (SELECT course_id FROM Course WHERE course_name = 'Introduction to Programming');

-- Task 20: Get all courses along with their associated materials and quizzes.
SELECT c.course_name, cm.material_type, cm.material_url, q.title AS quiz_title FROM Course c
LEFT JOIN CourseMaterial cm ON c.course_id = cm.course_id
LEFT JOIN Quiz q ON c.course_id = q.course_id
ORDER BY c.course_name, q.title;


