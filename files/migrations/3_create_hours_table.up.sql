CREATE TABLE IF NOT EXISTS Hours (
  organizationID integer REFERENCES Organization ON DELETE CASCADE,
  weekday int,
  start int,
  close int,
  PRIMARY KEY (organizationID, weekday, start, close)
);
