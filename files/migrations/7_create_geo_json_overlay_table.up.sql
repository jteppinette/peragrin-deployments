CREATE TABLE IF NOT EXISTS GeoJSONOverlay (
  name			varchar(40),
  communityID		integer REFERENCES Community ON DELETE CASCADE,
  data			jsonb,
  style			jsonb,
  PRIMARY KEY (communityID, name)
);
