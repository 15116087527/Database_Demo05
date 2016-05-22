DROP DATABASE IF EXISTS db_csdn;
CREATE DATABASE db_csdn;

DROP TABLE IF EXISTS db_csdn.user;
CREATE TABLE db_csdn.user (
  id       INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(255),
  password VARCHAR(255),
  email    VARCHAR(255)
);

# 数据导入 MySQL 数据库
LOAD DATA LOCAL INFILE 'c:/www.csdn.net.sql' INTO TABLE db_csdn.user
FIELDS TERMINATED BY ' # '
LINES TERMINATED BY '\n'
(username, password, email);
# [2016-05-22 16:24:04] 6428632 rows affected in 3m 23s 2ms

SELECT *
FROM db_csdn.user
WHERE id = 6000001;

# 各列值的快速模糊查询
CREATE INDEX ind_user_username_password_email ON db_csdn.user (username, password, email);
# [2016-05-22 16:42:41] completed in 6m 30s 326ms

SELECT *
FROM db_csdn.user
WHERE username LIKE '%some_username%';

SELECT *
FROM db_csdn.user
WHERE password LIKE '%some_password%';

SELECT *
FROM db_csdn.user
WHERE email LIKE '%some_email%';

# 排名前十的密码
SELECT password, count(*)
FROM db_csdn.user
GROUP BY password
ORDER BY 2 DESC
LIMIT 10;

# 排名前十的邮箱
SELECT substr(email, instr(email, '@'), length(email)), count(*) -- Java String.indexOf("")
FROM db_csdn.user
GROUP BY substr(email, instr(email, '@'), length(email))
ORDER BY 2 DESC
LIMIT 10;

# 用户名和邮箱名相同的数据
SELECT *
FROM db_csdn.user
WHERE username = substr(email, 1, instr(email, '@'));

# 密码可能是生日的数据
SELECT *
FROM db_csdn.user
WHERE password REGEXP '\d{8}';