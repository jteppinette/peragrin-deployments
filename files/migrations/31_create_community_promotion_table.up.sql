CREATE TABLE IF NOT EXISTS CommunityPromotion (
  communityID int REFERENCES Community ON DELETE CASCADE,
  promotionID int REFERENCES Promotion ON DELETE CASCADE,
  PRIMARY KEY (communityID, promotionID)
);
