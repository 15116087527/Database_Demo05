SHOW DATABASES;

CREATE DATABASE demo;
USE demo;

CREATE TABLE demo.user (
  id       INT(11),
  username VARCHAR(255),
  password VARCHAR(255)
);

SHOW tables;

SELECT *
FROM demo.user;

INSERT INTO demo.user VALUES (1, '张三','123');
