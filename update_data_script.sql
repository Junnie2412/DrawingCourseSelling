------ Add 1 lượt từ chỗ này-------
ALTER TABLE dbo.tblAccount
  DROP COLUMN phone

  ALTER TABLE dbo.tblVideo 
  DROP COLUMN topic 

  UPDATE dbo.tblVideo
  SET content = 'https://youtu.be/WLU26nqcvfY?si=6wK36fN8tJigAjc1'
  WHERE videoID = '301';

  UPDATE dbo.tblAccount
  SET image = 'https://s120-ava-talk.zadn.vn/7/6/7/7/11/120/f1ed963fd72209896cf32ce6ada08879.jpg'
  WHERE accountID = 'staff123';

------Tới đây nha-------

----Chỗ này add theo thứ tự nha-----

------------------1 /Add Video to Table----------------------
SET IDENTITY_INSERT tblVideo ON
INSERT INTO tblVideo(videoID,content,time,isActive)
VALUES('302','https://youtu.be/iwRa5qTnr8o?si=ba5RM0D_487MVOO9','00:13:11',1),
('303','https://youtu.be/xTFmwj5kch8?si=Et4acK93hQ3WSbK2','00:14:09',1),
('304','https://youtu.be/BgjxHJp_XYc?si=VtlwVUGkI5deFCzY','00:02:28',1),
('305','https://youtu.be/ZPdJAKIR-Bs?si=6NjXRKrsdb72DuqA','00:13:17',1),
('306','https://youtu.be/GMTvqj7gDOA?si=ZyRgi_4Dg9RjL8LQ','00:02:04',1),
('307','https://youtu.be/7EjorOn7jAs?si=dI1-sWhjjXvAYRPa','00:24:31',1);
SET IDENTITY_INSERT tblVideo OFF

------------------2/Add Lesson to Table----------------------
------------------Chạy từng cục nha, không có add 1 lần vào được đâu----------------------
SET IDENTITY_INSERT tblLesson ON
INSERT INTO tblLesson(lessonID,title,description,videoID)
VALUES('202','Learn about Digital Painting','The best way to learn the basics and get started with it.','302');
SET IDENTITY_INSERT tblLesson OFF

SET IDENTITY_INSERT tblLesson ON
INSERT INTO tblLesson(lessonID,title,description,videoID)
VALUES('203','Get familiar with Photoshop performance','A tutorial about Photoshop perfomance for digital painters.','303');
SET IDENTITY_INSERT tblLesson OFF

SET IDENTITY_INSERT tblLesson ON
INSERT INTO tblLesson(lessonID,title,description,videoID)
VALUES('204','Get familiar with Brush and Erase tools','A tutorial about Brush and Erase tools for digital painters.','304');
SET IDENTITY_INSERT tblLesson OFF

SET IDENTITY_INSERT tblLesson ON
INSERT INTO tblLesson(lessonID,title,description,videoID)
VALUES('205','Work with Layer system in Photoshop','Get familiar with Layer in PTS','305');
SET IDENTITY_INSERT tblLesson OFF

SET IDENTITY_INSERT tblLesson ON
INSERT INTO tblLesson(lessonID,title,description,videoID)
VALUES('206','Timelapse drawing object progress, change object line color','Fast drawing object, line color','306');
SET IDENTITY_INSERT tblLesson OFF

SET IDENTITY_INSERT tblLesson ON
INSERT INTO tblLesson(lessonID,title,description,videoID)
VALUES('207','Save and export file in Photoshop','Finish your first module','307');
SET IDENTITY_INSERT tblLesson OFF
