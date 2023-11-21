CREATE DATABASE ironhack_project;

USE ironhack_project;

CREATE TABLE schools (
    school_id INT(5) PRIMARY KEY,
    school VARCHAR(30) UNIQUE,
    website VARCHAR(50) UNIQUE,
    logo_url VARCHAR(50) UNIQUE,
    description TEXT(200)
);

CREATE TABLE badges (
    badges_id INT(10) PRIMARY KEY AUTO_INCREMENT UNIQUE,
    school_id INT(5),
    FOREIGN KEY (school_id) REFERENCES schools(school_id),
    school VARCHAR(30),
    keyword VARCHAR(30),
    name VARCHAR(30),
    description TEXT(200)
);

CREATE TABLE courses (
    course_id INT(5) PRIMARY KEY AUTO_INCREMENT UNIQUE,
    course VARCHAR(200),
    school_id INT(5),
    FOREIGN KEY (school_id) REFERENCES schools(school_id),
    school VARCHAR(30)
);

CREATE TABLE locations (
    location_id INT(5) PRIMARY KEY AUTO_INCREMENT UNIQUE,
    description VARCHAR(30),
    country_name TEXT(20),
    city_name TEXT(20),
    school VARCHAR(30),
    school_id INT(5),
    FOREIGN KEY (school_id) REFERENCES schools(school_id)
);

CREATE TABLE students (
    student_id INT(20) PRIMARY KEY AUTO_INCREMENT,
    name TEXT(30),
    job_title TEXT(50),
    graduating_year DATE,
    school VARCHAR(30),
    school_id INT(5),
    FOREIGN KEY (school_id) REFERENCES schools(school_id),
    course VARCHAR(200),
    course_id INT(5),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

CREATE TABLE comments (
    comment_id INT(6) PRIMARY KEY AUTO_INCREMENT UNIQUE,
    student_id INT(20),
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    name TEXT(30),
    anonymous BOOLEAN,
    graduation_year DATE,
    is_alumni BOOLEAN,
    job_title TEXT(50),
    tag_line TEXT(200),
    body TEXT(500),
    courses VARCHAR(200),
    course_id INT(5),
    FOREIGN KEY (course_id) REFERENCES courses(course_id),
    overall_score FLOAT,
    overall FLOAT,
    curriculum FLOAT,
    job_support FLOAT,
    school VARCHAR(40),
    school_id INT(5),
    FOREIGN KEY (school_id) REFERENCES schools(school_id)
);
