CREATE TABLE IF NOT EXISTS AccountMembership (
  accountID		int REFERENCES Account ON DELETE CASCADE,
  membershipID	int REFERENCES Membership ON DELETE CASCADE
);
