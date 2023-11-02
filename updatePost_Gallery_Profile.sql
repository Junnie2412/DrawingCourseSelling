/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [postID]
      ,[image]
      ,[title]
      ,[content]
      ,[dateCreate]
      ,[isApproved]
      ,[accountID]
  FROM [DrawingCourse].[dbo].[tblPost]

  SET IDENTITY_INSERT tblPost ON
  INSERT INTO tblPost(postID,image,title,content,dateCreate,isApproved,accountID)
  VALUES(1,'https://cand.com.vn/Files/Image/honghai/2019/05/20/06fe5cd6-72fb-45b7-8706-d84d1134403f.jpg','Nguyen Quoc Thai - A warrior using a brush instead of a gun',
  'With a variety of materials such as charcoal, gouache, watercolor, silk painting, oil painting, artist Nguyen Quoc Thai creations are not limited to themes (war - peace, portraits, landscapes, still lifes…). These works, whether monochrome or multicolor, clearly express his soul with love for his country, kindness, and compassion when facing the reality of life. Artist Nguyen Quoc Thai was born in 1943 in Hai Phong. He graduated from the Department of Painting in 1982, Hanoi University of Fine Arts. As a member of the Vietnam Fine Arts Association, he works at Hai Phong City Police. During his artistic life, he presented 3 personal exhibitions at 16 Ngo Quyen, Hanoi. His paintings are kept at the Vietnam Fine Arts Museum. The determined and ready spirit of Hai Phong in 1972 was a continuation of the previous courage of the Vietnamese people in the fight with the French colonialists to protect national independence and was maintained during peacetime. production and national construction. Viewers can fully see the state of a land over time, through the ups and downs of history, and the stages of fierce wars through the works recorded by artist Nguyen Quoc Thai: destroyed - revived, black and white - brilliant, turbulent - peaceful, solemn - liberal,... has stored within itself abundant and healthy life force. Artist Quoc Thai has a son and daughter-in-law who followed his father footsteps, painter Quoc Thang and painter Binh Nhi. What makes him happiest up to now is that his children have kept the fire of his love for art alive for him. They are artists who are quietly on the path of creativity. Like him, they continue to record and preserve the beauty of the world...',
  '2023-11-02',1,'giabao123'),
(2,'','','','',1,''),
(3,'','','','',1,''),
(4,'','','','',1,''),
(5,'','','','',1,''),
(6,'','','','',1,''),
(7,'','','','',1,''),
(8,'','','','',1,''),
(9,'','','','',1,''),
(10,'','','','',0,'instructor123');
  SET IDENTITY_INSERT tblPost OFF