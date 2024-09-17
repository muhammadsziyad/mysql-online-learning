-- Insert data into User
INSERT INTO User (username, email, password, created_at, role) VALUES
('john_doe', 'john.doe@example.com', 'password123', NOW(), 'Student'),
('jane_smith', 'jane.smith@example.com', 'password456', NOW(), 'Instructor'),
('alice_jones', 'alice.jones@example.com', 'password789', NOW(), 'Student'),
('bob_brown', 'bob.brown@example.com', 'password000', NOW(), 'Admin'),
('charlie_davis', 'charlie.davis@example.com', 'password111', NOW(), 'Student');

-- Insert data into Course
INSERT INTO Course (course_name, description, created_at, instructor_id) VALUES
('Introduction to Programming', 'Learn the basics of programming.', NOW(), 2),
('Advanced Database Systems', 'Deep dive into complex database systems.', NOW(), 2),
('Web Development Fundamentals', 'Understanding the core concepts of web development.', NOW(), 2),
('Data Science with Python', 'Introduction to data science using Python.', NOW(), 2),
('Machine Learning Basics', 'An introductory course on machine learning.', NOW(), 2);

-- Insert data into Enrollment
INSERT INTO Enrollment (user_id, course_id, enrollment_date) VALUES
(1, 1, NOW()),
(3, 1, NOW()),
(5, 3, NOW()),
(1, 4, NOW()),
(4, 5, NOW());

-- Insert data into Assignment
INSERT INTO Assignment (course_id, title, description, due_date) VALUES
(1, 'Programming Basics Assignment', 'Complete the basic programming exercises.', '2024-10-01'),
(2, 'Database Design Assignment', 'Design a database schema for a given scenario.', '2024-10-15'),
(3, 'Web Development Project', 'Build a small web application.', '2024-11-01'),
(4, 'Data Analysis Report', 'Analyze a dataset and write a report.', '2024-11-15'),
(5, 'ML Model Evaluation', 'Evaluate and report on a machine learning model.', '2024-12-01');

-- Insert data into Submission
INSERT INTO Submission (assignment_id, user_id, submission_date, content) VALUES
(1, 1, NOW(), 'Completed the basic exercises.'),
(2, 3, NOW(), 'Database schema designed and documented.'),
(3, 5, NOW(), 'Web application built and deployed.'),
(4, 1, NOW(), 'Data analysis and report completed.'),
(5, 2, NOW(), 'ML model evaluation and results shared.');

-- Insert data into Grade
INSERT INTO Grade (submission_id, grade, feedback) VALUES
(1, 90.00, 'Great job on the exercises!'),
(2, 85.00, 'Good design, but needs some improvements.'),
(3, 95.00, 'Excellent web application!'),
(4, 88.00, 'Good analysis, but could use more detail.'),
(5, 92.00, 'Well-evaluated model with thorough explanation.');

-- Insert data into CourseMaterial
INSERT INTO CourseMaterial (course_id, material_type, material_url) VALUES
(1, 'Lecture', 'http://example.com/lectures/programming_basics.pdf'),
(2, 'Reading', 'http://example.com/readings/database_design.pdf'),
(3, 'Video', 'http://example.com/videos/web_dev_intro.mp4'),
(4, 'Lecture', 'http://example.com/lectures/data_analysis.pdf'),
(5, 'Reading', 'http://example.com/readings/ml_basics.pdf');

-- Insert data into Discussion
INSERT INTO Discussion (course_id, user_id, content, created_at) VALUES
(1, 1, 'What’s the best way to start with programming?', NOW()),
(2, 3, 'Can someone explain the normalization process?', NOW()),
(3, 5, 'Looking for resources on web development best practices.', NOW()),
(4, 1, 'Any tips for analyzing large datasets?', NOW()),
(5, 2, 'What are the latest techniques in machine learning?', NOW());

-- Insert data into Announcement
INSERT INTO Announcement (course_id, content, created_at) VALUES
(1, 'New programming resources available!', NOW()),
(2, 'Assignment deadline approaching.', NOW()),
(3, 'Web development project guidelines updated.', NOW()),
(4, 'Reminder: Data analysis report due next week.', NOW()),
(5, 'Machine learning model evaluation due soon.', NOW());

-- Insert data into Quiz
INSERT INTO Quiz (course_id, title, created_at) VALUES
(1, 'Programming Basics Quiz', NOW()),
(2, 'Database Systems Quiz', NOW()),
(3, 'Web Development Fundamentals Quiz', NOW()),
(4, 'Data Science with Python Quiz', NOW()),
(5, 'Machine Learning Basics Quiz', NOW());

-- Insert data into Question
INSERT INTO Question (quiz_id, question_text) VALUES
(1, 'What is a variable in programming?'),
(2, 'Explain the concept of normalization.'),
(3, 'What is a RESTful API?'),
(4, 'Describe the process of data cleaning.'),
(5, 'What is overfitting in machine learning?');

-- Insert data into Answer
INSERT INTO Answer (question_id, user_id, answer_text) VALUES
(1, 1, 'A variable is a storage location for data.'),
(2, 3, 'Normalization is the process of organizing data to reduce redundancy.'),
(3, 5, 'A RESTful API is an interface for web services based on REST principles.'),
(4, 1, 'Data cleaning involves removing or correcting inaccuracies in the data.'),
(5, 2, 'Overfitting occurs when a model learns the training data too well and performs poorly on new 
data.');

-- Insert data into Review
INSERT INTO Review (course_id, user_id, rating, comment, review_date) VALUES
(1, 1, 5, 'Excellent course on programming basics!', NOW()),
(2, 3, 4, 'Very informative, but could be more detailed.', NOW()),
(3, 5, 5, 'Great introduction to web development.', NOW()),
(4, 1, 3, 'The course is good, but the content is a bit outdated.', NOW()),
(5, 2, 4, 'Good course on machine learning fundamentals.', NOW());

-- Insert data into Feedback
INSERT INTO Feedback (course_id, user_id, feedback_text, created_at) VALUES
(1, 1, 'The course was very helpful for beginners.', NOW()),
(2, 3, 'The reading materials were great, but the lectures need improvement.', NOW()),
(3, 5, 'The project was a good challenge and very educational.', NOW()),
(4, 1, 'Would like to see more practical examples.', NOW()),
(5, 2, 'The course provided a solid foundation in machine learning.', NOW());

-- Insert data into UserProfile
INSERT INTO UserProfile (user_id, bio, profile_picture_url) VALUES
(1, 'A passionate student of programming.', 'http://example.com/profiles/john_doe.jpg'),
(2, 'Experienced instructor in computer science.', 'http://example.com/profiles/jane_smith.jpg'),
(3, 'Enthusiastic learner with a focus on web development.', 
'http://example.com/profiles/alice_jones.jpg'),
(4, 'Admin with a background in education.', 'http://example.com/profiles/bob_brown.jpg'),
(5, 'Student interested in data science and machine learning.', 
'http://example.com/profiles/charlie_davis.jpg');

-- Insert data into Certificate
INSERT INTO Certificate (user_id, course_id, issue_date, certificate_url) VALUES
(1, 1, NOW(), 'http://example.com/certificates/john_doe_programming.pdf'),
(3, 3, NOW(), 'http://example.com/certificates/alice_jones_web_dev.pdf'),
(5, 4, NOW(), 'http://example.com/certificates/charlie_davis_data_science.pdf');

-- Insert data into CourseTag
INSERT INTO CourseTag (course_id, tag_name) VALUES
(1, 'Programming'),
(2, 'Database'),
(3, 'Web Development'),
(4, 'Data Science'),
(5, 'Machine Learning');

