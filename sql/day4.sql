DROP DATABASE IF EXISTS db_dict;
CREATE DATABASE db_dict;

-- table word
DROP TABLE IF EXISTS db_dict.word;
CREATE TABLE db_dict.word (
  id      INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  english VARCHAR(255)
);

-- table definition
DROP TABLE IF EXISTS db_dict.definition;
CREATE TABLE db_dict.definition (
  id           INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  partOfSpeech VARCHAR(255),
  chinese      VARCHAR(255),
  wordId       INT UNSIGNED
);

DROP TABLE IF EXISTS db_dict.sentence;
CREATE TABLE db_dict.sentence (
  id           INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  english      VARCHAR(255),
  chinese      VARCHAR(255),
  definitionId INT UNSIGNED
);

ALTER TABLE db_dict.definition
ADD CONSTRAINT
  fk_definition_wordId
FOREIGN KEY (wordId)
REFERENCES db_dict.word (id);

ALTER TABLE db_dict.sentence
ADD CONSTRAINT
  fk_sentence_definitionId
FOREIGN KEY (definitionId)
REFERENCES db_dict.definition (id);

INSERT INTO db_dict.word VALUES (NULL, 'test');

INSERT INTO db_dict.definition VALUES (NULL, 'n.', 'n. > chinese', 1);
INSERT INTO db_dict.definition VALUES (NULL, 'v.', 'v. > chinese', 1);

INSERT INTO db_dict.sentence VALUES (NULL, 'e1', 'c1', 1);
INSERT INTO db_dict.sentence VALUES (NULL, 'e2', 'c2', 1);
INSERT INTO db_dict.sentence VALUES (NULL, 'e3', 'c3', 1);

INSERT INTO db_dict.sentence VALUES (NULL, 'e4', 'c4', 2);
INSERT INTO db_dict.sentence VALUES (NULL, 'e5', 'c5', 2);
INSERT INTO db_dict.sentence VALUES (NULL, 'e6', 'c6', 2);

SELECT
  w.english,
  d.partOfSpeech 词性,
  s.english      英语,
  s.chinese      中文
FROM db_dict.word w JOIN db_dict.definition d
  JOIN db_dict.sentence s
    ON w.id = d.wordId AND d.id = s.definitionId;

/*
n.
e1
c1
n.
e2
c2
n.
e3
c3

v.
e1
c1
v.
e2
c2
v.
e3
c3

 */


