CREATE TABLE IF NOT EXISTS Account (
  id				SERIAL PRIMARY KEY,
  email			varchar(60) NOT NULL UNIQUE,
  password		varchar(60) NOT NULL
);
