ALTER TABLE Promotion ADD CONSTRAINT promotion_membershipid_fkey FOREIGN KEY (membershipID) REFERENCES Membership ON DELETE CASCADE;
