DROP TABLE albums;
DROP TABLE artists;
DROP TABLE genres;

CREATE TABLE artists(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE genres(
  id SERIAL8 PRIMARY KEY,
  type VARCHAR(255)
);

CREATE TABLE albums(
  id SERIAL8 PRIMARY KEY,
  title VARCHAR(255),
  quantity INT4,
  artist_id INT8 REFERENCES artists(id),
  genre_id INT8 REFERENCES genres(id)
);
