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

DESC scott.salgrade;

SELECT
  ENAME,
  DNAME,
  SAL,
  GRADE
FROM scott.emp
  JOIN scott.dept
  JOIN scott.salgrade
    ON emp.DEPTNO = dept.DEPTNO AND emp.SAL BETWEEN salgrade.LOSAL AND salgrade.HISAL
WHERE salgrade.GRADE = 2;

SELECT
  ENAME,
  DNAME,
  SAL,
  GRADE
FROM scott.emp, scott.dept, scott.salgrade
WHERE emp.DEPTNO = dept.DEPTNO AND emp.SAL BETWEEN salgrade.LOSAL AND salgrade.HISAL AND salgrade.GRADE = 2;

DROP TABLE emp_temp;
CREATE TABLE emp_temp
  SELECT
    ENAME,
    sal
  FROM emp
  WHERE DEPTNO = 10;

SELECT *
FROM emp_temp;

INSERT INTO emp_temp (ENAME, sal)
  SELECT
    ENAME,
    sal
  FROM emp;

CREATE OR REPLACE VIEW v_emp
AS
  SELECT
    ENAME,
    sal
  FROM emp
  WHERE DEPTNO = 10;

DROP TABLE emp;

SHOW TABLE STATUS FROM scott;

SELECT *
FROM v_emp; -- 虚表


UPDATE v_emp
SET sal = 3000
WHERE ENAME = 'clark';

DELETE FROM v_emp WHERE ENAME='miller';

INSERT INTO v_emp VALUES ('tester', 1000);
INSERT INTO v_emp_2 VALUES (9999, 'tester');

CREATE OR REPLACE VIEW v_emp_2
  AS
  SELECT EMPNO, ENAME
  FROM emp;


UPDATE emp
SET sal = 3000
WHERE ENAME = 'clark';

SELECT *
FROM emp;

SHOW CREATE VIEW v_emp;

CREATE OR REPLACE VIEW v_emp_read_only
  AS
  SELECT e.*, d.dname, d.loc
  FROM emp e JOIN dept d
  ON e.DEPTNO = d.DEPTNO;

SELECT *
FROM v_emp_read_only;

DELETE FROM v_emp_read_only
WHERE ENAME = 'clark';

SELECT *
FROM v_emp_read_only;

SELECT ENAME, SAL, dname
FROM emp e JOIN dept d
ON e.DEPTNO = d.DEPTNO
WHERE e.DEPTNO = 10;

SELECT ENAME, SAL, dname
FROM v_emp_read_only
WHERE DEPTNO = 10;