-- Drop the junction table first (to avoid FK conflicts)
DROP TABLE IF EXISTS student_course CASCADE;

-- Then drop the base tables
DROP TABLE IF EXISTS students CASCADE;
DROP TABLE IF EXISTS majors CASCADE;
DROP TABLE IF EXISTS courses CASCADE;
DROP TABLE question CASCADE;
DROP TABLE quiz CASCADE;
DROP TABLE result CASCADE;
DROP TABLE "user" CASCADE;

-- Create tables

CREATE TABLE "user" (
    user_id SERIAL PRIMARY KEY,
    name    VARCHAR(100)        NOT NULL,
    email   VARCHAR(150) UNIQUE NOT NULL,
    role    VARCHAR(20)         NOT NULL CHECK (role IN ('admin', 'player'))
);

CREATE TABLE Quiz (
    quiz_id SERIAL PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    type VARCHAR(50) NOT NULL CHECK (type IN ('FOOTBALL', 'BASKETBALL', 'TENNIS', 'GOLF', 'ATHLETISME', 'NATATION', 'RUGBY', 'AUTRE')),
    description TEXT
);

CREATE TABLE Question (
    question_id SERIAL PRIMARY KEY,
    quiz_id INT NOT NULL,
    statement TEXT NOT NULL,
    choices TEXT,
    correct_answer VARCHAR(255) NOT NULL,
    CONSTRAINT fk_question_quiz FOREIGN KEY (quiz_id)
        REFERENCES Quiz(quiz_id)
        ON DELETE CASCADE
);

CREATE TABLE Result (
    result_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    quiz_id INT NOT NULL,
    score INT NOT NULL,
    play_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_result_user FOREIGN KEY (user_id)
        REFERENCES "user"(user_id)
        ON DELETE CASCADE,
    CONSTRAINT fk_result_quiz FOREIGN KEY (quiz_id)
        REFERENCES Quiz(quiz_id)
        ON DELETE CASCADE
);