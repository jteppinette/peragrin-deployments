CREATE TABLE IF NOT EXISTS Post (
  id				SERIAL PRIMARY KEY,
  content			text,
  organizationID	integer NOT NULL REFERENCES Organization ON DELETE CASCADE,
  createdAt		timestamp DEFAULT current_timestamp
);
