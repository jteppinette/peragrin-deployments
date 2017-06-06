CREATE TABLE IF NOT EXISTS AccountOrganization (
  accountID			int REFERENCES Account ON DELETE CASCADE,
  organizationID		int REFERENCES Organization ON DELETE CASCADE,
  PRIMARY KEY (accountID, organizationID)
);
