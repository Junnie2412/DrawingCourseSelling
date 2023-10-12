------ Add 1 lượt từ chỗ này-------
ALTER TABLE dbo.tblAccount
  DROP COLUMN phone

  ALTER TABLE dbo.tblVideo 
  DROP COLUMN topic 

  UPDATE dbo.tblAccount
  SET image = 'https://s120-ava-talk.zadn.vn/7/6/7/7/11/120/f1ed963fd72209896cf32ce6ada08879.jpg'
  WHERE accountID = 'staff123';

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

