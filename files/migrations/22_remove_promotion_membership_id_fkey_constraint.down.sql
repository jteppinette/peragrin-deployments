ALTER TABLE Promotion ADD CONSTRAINT promotion_membershipid_fkey FOREIGN KEY (membershipID) REFERENCES Organization ON DELETE CASCADE;
