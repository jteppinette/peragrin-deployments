CREATE TABLE IF NOT EXISTS AccountPromotion (
  accountID	int REFERENCES Account ON DELETE CASCADE,
  promotionID int REFERENCES Promotion ON DELETE CASCADE,
  consumedAt	timestamp DEFAULT current_timestamp
);
