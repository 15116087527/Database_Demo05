SHOW DATABASES;

DROP DATABASE IF EXISTS demo;
CREATE DATABASE demo;

USE demo;

DROP TABLE IF EXISTS demo.user;
CREATE TABLE demo.user (
  id       INT(11) UNSIGNED AUTO_INCREMENT PRIMARY KEY, -- unsigned 无符（负）号
  username VARCHAR(255),
  password VARCHAR(255),
  sex      CHAR(1) DEFAULT 'M', -- M:male; F:female 定长？
  age      INT(3),
  height   DOUBLE(3, 2), -- 1.75 m
  salary   DECIMAL(6, 2), -- 1234.56
  birthday DATE
);

INSERT INTO demo.user VALUES (1, 'tester', '123', 'female', 20, 1.6, 6000, '1996-1-2');
INSERT INTO demo.user VALUES (2, 'new user', '123', 'female', 20, 1.6, 6000, '1996-1-2');
INSERT INTO demo.user VALUE (NULL, NULL , '123', 'female', 20, 1.6, 6000, '1996-1-2');

INSERT INTO demo.user(id, username) VALUE(NULL , 'tester');

SELECT *
FROM demo.user;
