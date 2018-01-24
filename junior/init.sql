CREATE DATABASE IF NOT EXISTS my_database;
USE my_database;

DROP TABLE IF EXISTS course;
DROP TABLE IF EXISTS instructor;
DROP TABLE IF EXISTS department;


CREATE TABLE IF NOT EXISTS department
(
    dept_name VARCHAR(20),
    building  VARCHAR(15),
    budget NUMERIC(12,2),
    PRIMARY KEY (dept_name)
);
CREATE TABLE IF NOT EXISTS course
(
    course_id VARCHAR(7),
    title VARCHAR(50),
    dept_name VARCHAR(20),
    credits NUMERIC(2,0),
    PRIMARY KEY (course_id),
    FOREIGN KEY (dept_name) REFERENCES department(dept_name)
);
CREATE TABLE IF NOT EXISTS instructor
(
    ID VARCHAR(7),
    full_name VARCHAR(20) NOT NULL,
    dept_name VARCHAR (20),
    salary NUMERIC (8,2),
    PRIMARY KEY (ID),
    FOREIGN KEY (dept_name) REFERENCES department(dept_name)
);

insert into department
    value("计算机技术", "SEIEE",1000000);
insert into department
    value("电气工程", "SEIEE",1000000);

insert into course
    value(100, "数据结构", "计算机技术", 3);
insert into course
    value(101, "数据库基础", "计算机技术", 3);
insert into course
    value(102, "物联网概论", "计算机技术", 2);

insert into course
    value(200, "大学物理", "电气工程", 3);
insert into course
    value(201, "移动通信", "电气工程", 2);
    insert into course
    value(202, "模拟电子技术", "电气工程", 3);

insert into instructor
    value(0714,"shiyang", "计算机技术", 10000);
insert into instructor
    value(0411, "heanni", "电气工程", 10000);


