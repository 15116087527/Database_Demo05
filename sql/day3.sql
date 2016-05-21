SHOW DATABASES;

SELECT * # test
FROM scott.emp;

DESC scott.emp;
SHOW FULL COLUMNS FROM scott.emp;

DROP TABLE scott.test;
CREATE TABLE scott.test (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY
  COMMENT '主键'
)
  COMMENT '测试表';

SHOW FULL COLUMNS FROM scott.test;
SHOW TABLE STATUS FROM scott;

SELECT *
FROM scott.emp
  JOIN scott.dept;

SELECT *
FROM scott.emp;
SELECT *
FROM scott.dept;

SELECT
  ENAME,
  DNAME
FROM scott.emp
  JOIN scott.dept
    ON emp.deptno = dept.DEPTNO;

SELECT
  ENAME,
  DNAME
FROM scott.emp
  RIGHT JOIN scott.dept
    ON emp.deptno = dept.DEPTNO
UNION
SELECT
  ENAME,
  DNAME
FROM scott.dept
  RIGHT JOIN scott.emp
    ON emp.deptno = dept.DEPTNO;