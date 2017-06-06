CREATE TABLE IF NOT EXISTS Organization (
  id		SERIAL PRIMARY KEY,
  name	varchar(80) NOT NULL UNIQUE,
  street	varchar(160) NOT NULL,
  city	varchar(30) NOT NULL,
  state	varchar(30) NOT NULL,
  country	varchar(40) NOT NULL,
  zip		varchar(20) NOT NULL,
  lon		float,
  lat		float,
  email varchar(60) NOT NULL,
  phone varchar(20) NOT NULL,
  website varchar(60) NOT NULL,
  category varchar(30)
);
