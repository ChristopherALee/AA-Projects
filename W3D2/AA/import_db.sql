CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  fname TEXT NOT NULL,
  lname TEXT NOT NULL
);

CREATE TABLE questions (
  id INTEGER PRIMARY KEY,
  title TEXT NOT NULL,
  author INTEGER NOT NULL,
  
  FOREIGN KEY (author) REFERENCES users(id)
);

CREATE TABLE question_follows (
  id INTEGER PRIMARY KEY,
  user_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,
  
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);

CREATE TABLE replies (
  id INTEGER PRIMARY KEY,
  question_id INTEGER NOT NULL,
  question_title TEXT NOT NULL,
  reply_id INTEGER,
  user_id INTEGER NOT NULL,
  body TEXT NOT NULL,
  
  FOREIGN KEY (reply_id) REFERENCES replies(id),
  FOREIGN KEY (question_id) REFERENCES question_follows(question_id),
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_title) REFERENCES questions(title)
);

CREATE TABLE question_likes (
  id INTEGER PRIMARY KEY,
  user INTEGER NOT NULL,
  question INTEGER NOT NULL,
  
  FOREIGN KEY (user) REFERENCES users(id),
  FOREIGN KEY (question) REFERENCES questions(id)
);



INSERT INTO
  users (fname, lname)
VALUES  
  ('Steve', 'Stevenson'),
  ('Bob', 'Bobson'),
  ('Jim', 'Jimson'),
  ('Alice','Alicedaughter'),
  ('Mike', 'Michaelson');
  
INSERT INTO
  questions(title, author)
VALUES
  ('How i SQL??', (SELECT id FROM users WHERE fname = 'Steve')),
  ('pLS halp', (SELECT id FROM users WHERE fname = 'Bob')),
  ('omg nu', (SELECT id FROM users WHERE fname = 'Jim')),
  ('where am i?', (SELECT id FROM users WHERE fname = 'Alice')),
  ('what is the meaning of life?', (SELECT id FROM users WHERE fname = 'Mike')),
  ('How i SQL??_2', (SELECT id FROM users WHERE fname = 'Steve'));  
  
INSERT INTO question_follows
  (user_id, question_id)
VALUES
  ((SELECT id FROM users WHERE fname = 'Steve'), (SELECT id FROM questions WHERE author = (SELECT id FROM users WHERE fname = 'Steve'))),
  ((SELECT id FROM users WHERE fname = 'Bob'), (SELECT id FROM questions WHERE author = (SELECT id FROM users WHERE fname = 'Bob'))),
  ((SELECT id FROM users WHERE fname = 'Jim'), (SELECT id FROM questions WHERE author = (SELECT id FROM users WHERE fname = 'Jim'))),
  ((SELECT id FROM users WHERE fname = 'Alice'), (SELECT id FROM questions WHERE author = (SELECT id FROM users WHERE fname = 'Alice'))),
  ((SELECT id FROM users WHERE fname = 'Mike'), (SELECT id FROM questions WHERE author = (SELECT id FROM users WHERE fname = 'Mike'))),
  ((SELECT id FROM users WHERE fname = 'Mike'), (SELECT id FROM questions WHERE author = (SELECT id FROM users WHERE fname = 'Bob'))),
  ((SELECT id FROM users WHERE fname = 'Alice'), (SELECT id FROM questions WHERE author = (SELECT id FROM users WHERE fname = 'Steve')));
  
INSERT INTO
  replies(question_id, question_title, reply_id, user_id, body)
VALUES
  (1, (SELECT title FROM questions WHERE id = 1), NULL, (SELECT user_id FROM question_follows WHERE question_id = 1), 'lol roflmao'),
  (2, (SELECT title FROM questions WHERE id = 2), NULL, (SELECT user_id FROM question_follows WHERE question_id = 1), 'totally');

INSERT INTO
  replies(question_id, question_title, reply_id, user_id, body)
VALUES
  (1, (SELECT title FROM questions WHERE id = 1),(SELECT id FROM replies WHERE body = 'lol roflmao'), (SELECT user_id FROM question_follows WHERE question_id = 1), 'ha ha omg'),
  (1, (SELECT title FROM questions WHERE id = 1), (SELECT id FROM replies WHERE body = 'lol roflmao'), (SELECT user_id FROM question_follows WHERE question_id = 1), 'no wai');

INSERT INTO
  question_likes(user, question)
VALUES
  ((SELECT id FROM users WHERE id = 1), (SELECT id FROM questions WHERE id = 2));