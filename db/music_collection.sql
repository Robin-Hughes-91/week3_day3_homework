DROP TABLE IF EXISTS albums;
DROP TABLE artists;

-- pizza orders relies on customers

CREATE TABLE artists (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255)
  -- artist_id INT4 REFERENCES artists(id)

);

CREATE TABLE albums (
  id SERIAL4 PRIMARY KEY,
  artist VARCHAR(255),
  title VARCHAR(255),
  genre VARCHAR(255),
  artist_id INT4 REFERENCES artists(id)
);
