------ Add 1 lượt từ chỗ này-------
ALTER TABLE dbo.tblAccount
  DROP COLUMN phone

  ALTER TABLE dbo.tblVideo 
  DROP COLUMN topic 

  UPDATE dbo.tblAccount
  SET image = 'https://s120-ava-talk.zadn.vn/7/6/7/7/11/120/f1ed963fd72209896cf32ce6ada08879.jpg'
  WHERE accountID = 'staff123';

INSERT INTO tblAccount(accountID,password,fullName,dateOfBirth,role,phone,isActive,image,email)
VALUES('minh123','123','Nguyen Hoang Minh','1991-01-10','Instructor','0323849927',1,'https://mythuatbui.edu.vn/wp-content/uploads/2023/01/3842E851-34F9-41FF-AEEB-14AD8CEE5D06-Nguyen-Hoang-Minh.jpeg','hoangminh91@gmail.com'),
('khang96','123','Tran Minh Khang','1996-03-27','Instructor','0323123927',1,'https://mythuatbui.edu.vn/wp-content/uploads/2022/12/BN.jpg','khang27@gmail.com'),
('ql1996','123','Cao Thi Quynh Linh','1996-07-09','Instructor','0323126196',1,'https://mythuatbui.edu.vn/wp-content/uploads/2022/12/z3653097294533_fcdf0a876f4e4dae6e79dc09e5463c1d-Cao-Thi-Quynh-Linh.jpg','caoql96@gmail.com'),
('xuanhau','123','Kien Xuan Hau','1990-12-12','Instructor','0392426196',1,'https://mythuatbui.edu.vn/wp-content/uploads/2022/12/Meme-BN.jpg','xuanhau@gmail.com'),
('giabao123','123','Hinh Dinh Gia Bao','1999-12-02','Instructor','0322226196',1,'https://mythuatbui.edu.vn/wp-content/uploads/2022/12/GB.jpg','giabao123@gmail.com'),
('thaidui111','123','Nguyen Huynh Nhat Thai','1999-12-01','Instructor','0392426333',1,'https://mythuatbui.edu.vn/wp-content/uploads/2022/12/IMG_20220612_005344_416-Thai-Nguyen-Huynh-Nhut.jpg','thaidui111@gmail.com'),
('minhthu11','123','Nguyen Minh Thu','1999-09-02','Instructor','0395559033',1,'https://mythuatbui.edu.vn/wp-content/uploads/2022/12/received_476006377695940-Nguyen-Minh-Thu.jpeg','minhthu11@gmail.com'),
('tructhanh','123','Tran Thanh Truc','1989-10-02','Instructor','0300276033',1,'https://mythuatbui.edu.vn/wp-content/uploads/2022/12/8E2A0BB8-6706-42DC-8E1E-DEE1EB3533D9-Truc-Tran-Thanh.jpeg','tructhanh123@gmail.com'),
('namkhongchay','123','Le Nam Dy','1993-12-09','Instructor','0394748033',1,'https://mythuatbui.edu.vn/wp-content/uploads/2022/12/Screenshot-2022-12-30-083404.jpeg','namkhongchay123@gmail.com'),
('bahuan123','123','Nguyen Ba Huan','1995-03-29','Instructor','0394726701',1,'https://mythuatbui.edu.vn/wp-content/uploads/2022/11/z3866535979544_b6f8d6898c1faa873e1b28725666d396.jpg','bahuan123@gmail.com'),
('baovi90','123','Tran Phuong Bao Vi','1996-12-03','Instructor','0394111882',1,'https://buinho.com.vn/wp-content/uploads/2021/10/186537430_2977662062468379_2963576170917617482_n-scaled-1.jpg','baovi90@gmail.com'),
('hth123','123','Hoang Thi Huyen','1999-11-06','Instructor','0394726701',1,'https://buinho.com.vn/wp-content/uploads/2022/05/E83B23C2-9640-4E9E-ABFD-83AE38F70044-Huyen-Hoang-Thi-scaled-1.jpeg','hth123@gmail.com');


------Tới đây nha-------

------Ở đây add từ từ nha, add bình tĩnh thôi nha năn nỉ-------

---1----
SET IDENTITY_INSERT tblDescription ON
INSERT INTO tblDescription(descriptionID,content,target,image,type,level)
VALUES('1','From this course, you can learn drawing basic hands and models. Fundamental theory in character building and combining perspective, color thinking, and composition.','Proficient in using Photoshop and Wacom software. Know how to use Photoshop in Digital Painting. Get Brush tools to draw.','https://img.freepik.com/premium-photo/painting-girl-woman-smooth-soft-skin-colorful_849906-592.jpg','Digital','Basic'),
('2','Improve your observation skills through simple exercises and assignments. Draw from your imagination or whatever you see and observe.','Develop your own creative style and draw with more confidence. Have a strong understanding of core concepts','https://img-c.udemycdn.com/course/750x422/2650180_5eba_2.jpg','Traditional','Intermediate'),
('3','Draw full body anime characters with basic poses. Use DesignDoll software for creating models with any pose','Develop your own creative style and draw with more confidence.','https://i.ytimg.com/vi/gQgV8bRrX4o/maxresdefault.jpg','Digital','Basic'),
('4','The basics of drawing. Shading and making the drawing hyper-realistic','Draw the face of whoever you want. Drawing from the model in two different ways','https://gfx-hub.co/uploads/posts/2023-09/complete-portrait-drawing-masterclass-beginner-to-advanced-1.webp','Traditional','Basic'),
('5','Create 3D models with simple colors. Create animations for your objects & characters','Use Blender and understand its interface. Understand the principles of modelling','https://cgian.com/wp-content/uploads/2023/07/Best-udemy-blender-for-beginners.jpg','Digital','Advanced'),
('6','Create different kind of vector illustration styles with ease. Master the secrets and proven techniques','Become a vector graphic professional and start making money using the skill learned from this course','https://img-c.udemycdn.com/course/750x422/628786_dbd9.jpg','Digital','Advanced');
SET IDENTITY_INSERT tblDescription OFF

----2-----
INSERT INTO tblCourse(courseID,price,name,duration,isActive,datePublic,accountID,descriptionID)
VALUES('bdp1','429000','Basic Digital Painting','98','1','2023-10-04','instructor123','1'),
('skp1','327000','Sketch Painting','570','1','2023-09-24','minh123','1'),
('anidraw','329000','Anime character drawing for beginners','150','1','2023-08-12','hth123','1'),
('portrait','279000','Complete Portrait Drawing Masterclass','549','1','2023-10-02','thaidui111','1'),
('blender1','349000','Complete Blender Creator','780','1','2023-09-24','ql1996','1'),
('vector1','279000','Adobe Illustrator Advanced Vector Artwork','480','1','2023-09-24','minhthu11','1');

------3------
SET IDENTITY_INSERT tblModule ON
INSERT INTO tblModule(moduleID,title,courseID)
VALUES('1','Using Photoshop in Digital Painting','bdp1'),
('2','Enhance your skill and create a complete line-up drawing','bdp1'),
('3','The elements of Art','skp1'),
('4','Basic drawing techniques','skp1'),
('5','Introduction of values','skp1'),
('6','Drawing the Face and Head','anidraw'),
('7','Drawing full body','anidraw'),
('8','Clothing','anidraw'),
('9','The basics of drawing','portrait'),
('10','Drawing and shading facial features hyper-realistic','portrait'),
('11','Introduction and setup','blender1'),
('12','Modular Dungeon','blender1'),
('13','Low-Poly Dinosaur','blender1'),
('14','UV Mapping','blender1'),
('15','Rigging and Animation','blender1'),
('16','Sculpting a cartoon Head','blender1'),
('17','Shading','vector1'),
('18','Drawing 3D objects','vector1'),
('19','The final project','vector1');
SET IDENTITY_INSERT tblModule OFF

-----4-----

