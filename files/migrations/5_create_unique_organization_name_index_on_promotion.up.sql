CREATE UNIQUE INDEX CONCURRENTLY IF NOT EXISTS promotion_organizationid_name_idx ON Promotion (organizationID, name);
