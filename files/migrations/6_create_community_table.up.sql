CREATE TABLE IF NOT EXISTS Community (
  id			SERIAL PRIMARY KEY,
  name		varchar(80) NOT NULL UNIQUE,
  lon			float,
  lat			float,
  zoom		int
);
