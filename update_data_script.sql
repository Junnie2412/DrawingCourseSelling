------ Add 1 lượt từ chỗ này-------
ALTER TABLE dbo.tblAccount
  DROP COLUMN phone

  ALTER TABLE dbo.tblVideo 
  DROP COLUMN topic 

  UPDATE dbo.tblAccount
  SET image = 'https://s120-ava-talk.zadn.vn/7/6/7/7/11/120/f1ed963fd72209896cf32ce6ada08879.jpg'
  WHERE accountID = 'staff123';

------Tới đây nha-------


