CREATE TABLE IF NOT EXISTS Promotion (
  id				SERIAL PRIMARY KEY,
  organizationID	integer REFERENCES Organization ON DELETE CASCADE,
  name			varchar(160) NOT NULL,
  description		text,
  exclusions		text,
  expiration		date,
  isSingleUse		bool
);
