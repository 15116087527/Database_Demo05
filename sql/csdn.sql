DROP DATABASE IF EXISTS db_csdn;
CREATE DATABASE db_csdn;

DROP TABLE IF EXISTS db_csdn.user;
CREATE TABLE db_csdn.user (
  id       INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(255),
  password VARCHAR(255),
  email    VARCHAR(255)
);

# [2016-05-22 16:24:04] 6428632 rows affected in 3m 23s 2ms
LOAD DATA LOCAL INFILE 'c:/www.csdn.net.sql' INTO TABLE db_csdn.user
FIELDS TERMINATED BY ' # '
LINES TERMINATED BY '\n'
(username, password, email);

SELECT *
FROM db_csdn.user
WHERE id = 6000001;