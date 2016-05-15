USE demo;

DESC demo.user;

INSERT INTO demo.user VALUES (NULL, 'asdf@test.com', '李斯', '123', 'M', 18, 1.7, 5000, '1998-1-1');
INSERT INTO demo.user (id, password) VALUES (NULL, '123');
INSERT INTO demo.user (password) VALUES ('123');

UPDATE demo.user
SET password = 'test';

UPDATE demo.user
SET password = '123', email = 'tester@test.com'
WHERE id = 4;

DELETE FROM demo.user
WHERE sex IS NOT NULL ;

SELECT *
FROM demo.user;

