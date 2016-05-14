SHOW DATABASES;

DROP DATABASE IF EXISTS demo;
CREATE DATABASE demo;

USE demo;

DROP TABLE IF EXISTS demo.user;
CREATE TABLE demo.user (
  id       INT(11) UNSIGNED AUTO_INCREMENT PRIMARY KEY, -- unsigned 无符（负）号
  username VARCHAR(255) UNIQUE,
  password VARCHAR(255) NOT NULL,
  sex      CHAR(1)          DEFAULT 'M', -- M:male; F:female 定长？
  age      INT(3) CHECK (age > 18),
  height   DOUBLE(3, 2), -- 1.75 m
  salary   DECIMAL(6, 2), -- 1234.56
  birthday DATE
);

INSERT INTO demo.user VALUES (NULL, NULL, '123', 'F', 16, 1.6, 6000, '1996-1-2');
SELECT *
FROM demo.user;

DELETE FROM demo.user WHERE id = 5;

TRUNCATE TABLE demo.user;

-- student table
# sno 2007220647 2003

