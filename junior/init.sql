CREATE DATABASE IF NOT EXISTS my_database;
USE my_database;

DROP TABLE IF EXISTS teaches;
DROP TABLE IF EXISTS instructor;
DROP TABLE IF EXISTS section;
DROP TABLE IF EXISTS course;
DROP TABLE IF EXISTS department;

CREATE TABLE IF NOT EXISTS department
(
    dept_name VARCHAR(20),
    building  VARCHAR(15),
    budget NUMERIC(12,2),
    PRIMARY KEY (dept_name)
);

insert into department
    value("计算机技术", "SEIEE",1000000);
insert into department
    value("电气工程", "SEIEE",1000000);
insert into department
    value("自动化","SEIEE", 1000000);
CREATE TABLE IF NOT EXISTS course
(
    course_id VARCHAR(7),
    title VARCHAR(50),
    dept_name VARCHAR(20),
    credits NUMERIC(2,0),
    PRIMARY KEY (course_id),
    FOREIGN KEY (dept_name) REFERENCES department(dept_name)
);

insert into course
    value("100", "数据结构", "计算机技术", 3);
insert into course
    value("101", "数据库基础", "计算机技术", 3);
insert into course
    value("102", "物联网概论", "计算机技术", 2);

insert into course
    value("200", "大学物理", "电气工程", 3);
insert into course
    value("201", "移动通信", "电气工程", 2);
    insert into course
    value("202", "模拟电子技术", "电气工程", 3);

CREATE TABLE IF NOT EXISTS instructor
(
    ID VARCHAR(5),
    full_name VARCHAR(20) NOT NULL,
    dept_name VARCHAR (20),
    salary NUMERIC (8,2),
    PRIMARY KEY (ID),
    FOREIGN KEY (dept_name) REFERENCES department(dept_name)
);

insert into instructor
    value("0714","shiyang", "计算机技术", 10000);
insert into instructor
    value("0411", "heanni", "电气工程", 10000);
insert into instructor
    value("0515", "shidaqin", "自动化", 10000);

CREATE TABLE section(
    course_id VARCHAR(8),
    sec_id VARCHAR(8),
    semester VARCHAR(6),
    year NUMERIC(4,0),
    building VARCHAR(15),
    room_number  VARCHAR(7),
    time_slot_id VARCHAR(4),
    PRIMARY KEY(course_id, sec_id, semester, year),
    FOREIGN KEY(course_id) REFERENCES course(course_id)
);

insert into section
    value("100","1","Fall", 2017, "SEIEE", "100","0");
insert into section
    value("100","1","Spring", 2018, "SEIEE", "100","0");

insert into section
    value("200", "1", "Fall", 2017, "SEIEE", "101","0");
insert into section
    value("200", "1", "Spring", 2018, "SEIEE", "101","0");

CREATE TABLE IF NOT EXISTS teaches (
    ID  VARCHAR(5),
    course_id VARCHAR(8),
    sec_id VARCHAR(8),
    semester VARCHAR(6),
    year NUMERIC(4,0),
    PRIMARY KEY(ID, sec_id, semester, year),
    FOREIGN KEY(course_id, sec_id, semester, year) REFERENCES section(course_id, sec_id, semester, year)
   # ,FOREIGN KEY(ID) REFERENCES instructor(ID)
);

insert into  teaches
    value("0714", "100", "1","Fall", 2017);
insert into teaches
    value("0714", "100", "1","Spring", 2018);

insert into teaches
    value("0411", "200", "1","Fall", 2017);
insert into teaches
    value("0411", "200", "1","Spring", 2018);
#当表teaches的“FOREIGN KEY(ID) REFERENCES instructor(ID)”
#被注释掉时，以下两个sql语句才是正确的。
insert into teaches
    value("0000", "200", "1","Fall", 2017);
insert into teaches
    value("0000", "200", "1","Spring", 2018);