CREATE TABLE IF NOT EXISTS Membership (
  id			SERIAL PRIMARY KEY,
  communityID int REFERENCES Community ON DELETE CASCADE,
  name		varchar(30),
  description text
);
