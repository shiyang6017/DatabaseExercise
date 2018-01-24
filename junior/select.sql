USE my_database;

SELECT * 
FROM department;
SELECT DISTINCT building 
FROM department;

#单关系条件查询
SELECT * 
FROM course;
SELECT * 
FROM course
# >, <, >=, <=, =, <>
#and, or, not
WHERE credits > 2 and dept_name = "计算机技术";

#多关系查询
SELECT full_name, instructor.dept_name, building
#FROM子句定义了一个在该子句中所列出关系上的笛卡尔积
FROM instructor, department
WHERE department.dept_name=instructor.dept_name;


#自然连接
SELECT full_name, instructor.dept_name, building
FROM instructor natural join department