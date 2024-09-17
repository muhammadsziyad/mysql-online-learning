-- Create the User table
CREATE TABLE User (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) NOT NULL UNIQUE,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    role ENUM('Student', 'Instructor', 'Admin') NOT NULL
);

-- Create the Course table
CREATE TABLE Course (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(255) NOT NULL,
    description TEXT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    instructor_id INT,
    FOREIGN KEY (instructor_id) REFERENCES User(user_id)
);

-- Create the Enrollment table
CREATE TABLE Enrollment (
    enrollment_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    course_id INT,
    enrollment_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES User(user_id),
    FOREIGN KEY (course_id) REFERENCES Course(course_id)
);

-- Create the Assignment table
CREATE TABLE Assignment (
    assignment_id INT AUTO_INCREMENT PRIMARY KEY,
    course_id INT,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    due_date DATE,
    FOREIGN KEY (course_id) REFERENCES Course(course_id)
);

-- Create the Submission table
CREATE TABLE Submission (
    submission_id INT AUTO_INCREMENT PRIMARY KEY,
    assignment_id INT,
    user_id INT,
    submission_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    content TEXT,
    FOREIGN KEY (assignment_id) REFERENCES Assignment(assignment_id),
    FOREIGN KEY (user_id) REFERENCES User(user_id)
);

-- Create the Grade table
CREATE TABLE Grade (
    grade_id INT AUTO_INCREMENT PRIMARY KEY,
    submission_id INT,
    grade DECIMAL(5, 2),
    feedback TEXT,
    FOREIGN KEY (submission_id) REFERENCES Submission(submission_id)
);

-- Create the CourseMaterial table
CREATE TABLE CourseMaterial (
    material_id INT AUTO_INCREMENT PRIMARY KEY,
    course_id INT,
    material_type ENUM('Lecture', 'Reading', 'Video'),
    material_url VARCHAR(255),
    FOREIGN KEY (course_id) REFERENCES Course(course_id)
);

-- Create the Discussion table
CREATE TABLE Discussion (
    discussion_id INT AUTO_INCREMENT PRIMARY KEY,
    course_id INT,
    user_id INT,
    content TEXT NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (course_id) REFERENCES Course(course_id),
    FOREIGN KEY (user_id) REFERENCES User(user_id)
);

-- Create the Announcement table
CREATE TABLE Announcement (
    announcement_id INT AUTO_INCREMENT PRIMARY KEY,
    course_id INT,
    content TEXT NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (course_id) REFERENCES Course(course_id)
);

-- Create the Quiz table
CREATE TABLE Quiz (
    quiz_id INT AUTO_INCREMENT PRIMARY KEY,
    course_id INT,
    title VARCHAR(255) NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (course_id) REFERENCES Course(course_id)
);

-- Create the Question table
CREATE TABLE Question (
    question_id INT AUTO_INCREMENT PRIMARY KEY,
    quiz_id INT,
    question_text TEXT NOT NULL,
    FOREIGN KEY (quiz_id) REFERENCES Quiz(quiz_id)
);

-- Create the Answer table
CREATE TABLE Answer (
    answer_id INT AUTO_INCREMENT PRIMARY KEY,
    question_id INT,
    user_id INT,
    answer_text TEXT NOT NULL,
    FOREIGN KEY (question_id) REFERENCES Question(question_id),
    FOREIGN KEY (user_id) REFERENCES User(user_id)
);

-- Create the Review table
CREATE TABLE Review (
    review_id INT AUTO_INCREMENT PRIMARY KEY,
    course_id INT,
    user_id INT,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    comment TEXT,
    review_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (course_id) REFERENCES Course(course_id),
    FOREIGN KEY (user_id) REFERENCES User(user_id)
);

-- Create the Feedback table
CREATE TABLE Feedback (
    feedback_id INT AUTO_INCREMENT PRIMARY KEY,
    course_id INT,
    user_id INT,
    feedback_text TEXT NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (course_id) REFERENCES Course(course_id),
    FOREIGN KEY (user_id) REFERENCES User(user_id)
);

-- Create the UserProfile table
CREATE TABLE UserProfile (
    profile_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    bio TEXT,
    profile_picture_url VARCHAR(255),
    FOREIGN KEY (user_id) REFERENCES User(user_id)
);

-- Create the Certificate table
CREATE TABLE Certificate (
    certificate_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    course_id INT,
    issue_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    certificate_url VARCHAR(255),
    FOREIGN KEY (user_id) REFERENCES User(user_id),
    FOREIGN KEY (course_id) REFERENCES Course(course_id)
);

-- Create the CourseTag table
CREATE TABLE CourseTag (
    tag_id INT AUTO_INCREMENT PRIMARY KEY,
    course_id INT,
    tag_name VARCHAR(255) NOT NULL,
    FOREIGN KEY (course_id) REFERENCES Course(course_id)
);

