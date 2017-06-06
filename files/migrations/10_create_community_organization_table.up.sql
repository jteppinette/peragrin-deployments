CREATE TABLE IF NOT EXISTS CommunityOrganization (
  organizationID	int REFERENCES Organization ON DELETE CASCADE,
  communityID		int REFERENCES Community ON DELETE CASCADE,
  isAdministrator bool,
  PRIMARY KEY (organizationID, communityID)
);
