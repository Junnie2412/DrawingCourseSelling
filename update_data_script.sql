------------------Add Account Data----------------------
INSERT INTO tblAccount(accountID,password,fullName,dateOfBirth,role,isActive,image,email)
VALUES('ad','123','Nguyen Le Hoang Dung','1980-11-10','Admin',1,'https://www.ecpi.edu/sites/default/files/buis.png','dungchan321@gmail.com'),
	  ('user321','123','Nguyen Minh Nguyet','2000-12-24','Customer',1,'https://drive.google.com/drive/folders/1XHZoN-_nXG1l-LaVB3JO1cweB1mDzrhK','junniehoang2412@gmail.com'),
	  ('staff123','123','Le Hoang Trong','1990-05-23','Staff',1,'https://drive.google.com/drive/folders/1XHZoN-_nXG1l-LaVB3JO1cweB1mDzrhK','tronghoang2322@gmail.com'),
	  ('instructor123','123','Ngo Khanh Han','1994-05-12','Instructor',1,'https://mythuatbui.edu.vn/wp-content/uploads/2022/12/24118CE0-DA81-4AEF-BAC0-3F0C593BA6AF-Ngo-Khanh-Han.jpeg','khanhHan231@gmail.com');


------ Add 1 lượt từ chỗ này-------

 UPDATE dbo.tblAccount
 SET image = 'https://s120-ava-talk.zadn.vn/7/6/7/7/11/120/f1ed963fd72209896cf32ce6ada08879.jpg'
 WHERE accountID = 'staff123';

INSERT INTO tblAccount(accountID,password,fullName,dateOfBirth,role,isActive,image,email)
VALUES('minh123','123','Nguyen Hoang Minh','1991-01-10','Instructor',1,'https://mythuatbui.edu.vn/wp-content/uploads/2023/01/3842E851-34F9-41FF-AEEB-14AD8CEE5D06-Nguyen-Hoang-Minh.jpeg','hoangminh91@gmail.com'),
('khang96','123','Tran Minh Khang','1996-03-27','Instructor',1,'https://mythuatbui.edu.vn/wp-content/uploads/2022/12/BN.jpg','khang27@gmail.com'),
('ql1996','123','Cao Thi Quynh Linh','1996-07-09','Instructor',1,'https://mythuatbui.edu.vn/wp-content/uploads/2022/12/z3653097294533_fcdf0a876f4e4dae6e79dc09e5463c1d-Cao-Thi-Quynh-Linh.jpg','caoql96@gmail.com'),
('xuanhau','123','Kien Xuan Hau','1990-12-12','Instructor',1,'https://mythuatbui.edu.vn/wp-content/uploads/2022/12/Meme-BN.jpg','xuanhau@gmail.com'),
('giabao123','123','Hinh Dinh Gia Bao','1999-12-02','Instructor',1,'https://mythuatbui.edu.vn/wp-content/uploads/2022/12/GB.jpg','giabao123@gmail.com'),
('thaidui111','123','Nguyen Huynh Nhat Thai','1999-12-01','Instructor',1,'https://mythuatbui.edu.vn/wp-content/uploads/2022/12/IMG_20220612_005344_416-Thai-Nguyen-Huynh-Nhut.jpg','thaidui111@gmail.com'),
('minhthu11','123','Nguyen Minh Thu','1999-09-02','Instructor',1,'https://mythuatbui.edu.vn/wp-content/uploads/2022/12/received_476006377695940-Nguyen-Minh-Thu.jpeg','minhthu11@gmail.com'),
('tructhanh','123','Tran Thanh Truc','1989-10-02','Instructor',1,'https://mythuatbui.edu.vn/wp-content/uploads/2022/12/8E2A0BB8-6706-42DC-8E1E-DEE1EB3533D9-Truc-Tran-Thanh.jpeg','tructhanh123@gmail.com'),
('namkhongchay','123','Le Nam Dy','1993-12-09','Instructor',1,'https://mythuatbui.edu.vn/wp-content/uploads/2022/12/Screenshot-2022-12-30-083404.jpeg','namkhongchay123@gmail.com'),
('bahuan123','123','Nguyen Ba Huan','1995-03-29','Instructor',1,'https://mythuatbui.edu.vn/wp-content/uploads/2022/11/z3866535979544_b6f8d6898c1faa873e1b28725666d396.jpg','bahuan123@gmail.com'),
('baovi90','123','Tran Phuong Bao Vi','1996-12-03','Instructor',1,'https://buinho.com.vn/wp-content/uploads/2021/10/186537430_2977662062468379_2963576170917617482_n-scaled-1.jpg','baovi90@gmail.com'),
('hth123','123','Hoang Thi Huyen','1999-11-06','Instructor',1,'https://buinho.com.vn/wp-content/uploads/2022/05/E83B23C2-9640-4E9E-ABFD-83AE38F70044-Huyen-Hoang-Thi-scaled-1.jpeg','hth123@gmail.com');


------Tới đây nha-------

------Ở đây add từ từ nha, add bình tĩnh thôi nha năn nỉ-------

---1----
INSERT INTO tblDescription(content,target,image,type,level)
VALUES('From this course, you can learn drawing basic hands and models. Fundamental theory in character building and combining perspective, color thinking, and composition.','Proficient in using Photoshop and Wacom software. Know how to use Photoshop in Digital Painting. Get Brush tools to draw.','https://img.freepik.com/premium-photo/painting-girl-woman-smooth-soft-skin-colorful_849906-592.jpg','Digital','Basic'),
('Improve your observation skills through simple exercises and assignments. Draw from your imagination or whatever you see and observe.','Develop your own creative style and draw with more confidence. Have a strong understanding of core concepts','https://img-c.udemycdn.com/course/750x422/2650180_5eba_2.jpg','Traditional','Intermediate'),
('Draw full body anime characters with basic poses. Use DesignDoll software for creating models with any pose','Develop your own creative style and draw with more confidence.','https://i.ytimg.com/vi/gQgV8bRrX4o/maxresdefault.jpg','Digital','Basic'),
('The basics of drawing. Shading and making the drawing hyper-realistic','Draw the face of whoever you want. Drawing from the model in two different ways','https://gfx-hub.co/uploads/posts/2023-09/complete-portrait-drawing-masterclass-beginner-to-advanced-1.webp','Traditional','Basic'),
('Create 3D models with simple colors. Create animations for your objects & characters','Use Blender and understand its interface. Understand the principles of modelling','https://cgian.com/wp-content/uploads/2023/07/Best-udemy-blender-for-beginners.jpg','Digital','Advanced'),
('Create different kind of vector illustration styles with ease. Master the secrets and proven techniques','Become a vector graphic professional and start making money using the skill learned from this course','https://img-c.udemycdn.com/course/750x422/628786_dbd9.jpg','Digital','Advanced');

----2-----
INSERT INTO tblCourse(courseID,price,name,duration,isActive,datePublic,accountID,descriptionID)
VALUES('bdp1','429000','Basic Digital Painting','98','1','2023-10-04','instructor123','1'),
('skp1','327000','Sketch Painting','570','1','2023-09-24','minh123','1'),
('anidraw','329000','Anime character drawing for beginners','150','1','2023-08-12','hth123','1'),
('portrait','279000','Complete Portrait Drawing Masterclass','549','1','2023-10-02','thaidui111','1'),
('blender1','349000','Complete Blender Creator','780','1','2023-09-24','ql1996','1'),
('vector1','279000','Adobe Illustrator Advanced Vector Artwork','480','1','2023-09-24','minhthu11','1');

------3------
INSERT INTO tblModule(title,courseID)
VALUES('Using Photoshop in Digital Painting','bdp1'),
('Enhance your skill and create a complete line-up drawing','bdp1'),
('The elements of Art','skp1'),
('Basic drawing techniques','skp1'),
('Introduction of values','skp1'),
('Drawing the Face and Head','anidraw'),
('Drawing full body','anidraw'),
('Clothing','anidraw'),
('The basics of drawing','portrait'),
('Drawing and shading facial features hyper-realistic','portrait'),
('Introduction and setup','blender1'),
('Modular Dungeon','blender1'),
('Low-Poly Dinosaur','blender1'),
('UV Mapping','blender1'),
('Rigging and Animation','blender1'),
('Sculpting a cartoon Head','blender1'),
('Shading','vector1'),
('Drawing 3D objects','vector1'),
('The final project','vector1');

-----4-----

SET IDENTITY_INSERT tblLesson ON
INSERT INTO tblLesson(lessonID,title,description,moduleID)
VALUES('1','Introduction','Learning to Draw Digitally for Beginners','1'),
('2','Learn about Digital Painting','How to Learn Digital Painting','1'),
('3','Get familiar with Photoshop performance','How To Set Up Photoshop like an Artist','1'),
('4','Get familiar with Brush and Erase tools','How to Use the Eraser Tool in Photoshop','1'),
('5','Work with Layer system in Photoshop','Photoshop Layers Explained In Brief','1'),
('6','Timelapse drawing object progress, change object line color','How to change the line art color','1'),
('7','Save and export file in Photoshop','How to Save & Export - Photoshop for Beginners','1'),
('8','Introduction Module 2','Digital Art for Beginners','2'),
('9','Master the lines and pressure','How to Smooth JAGGED LINES in your Digital Art','2'),
('10','Arrange palette in the right way','How to Apply a Color Palette to Your Design','2'),
('11','How to prevent shaking hands and undulating drawing strokes','How to Draw - Fix Shakey Hands','2'),
('12','Use pressure to classify information','Pen Pressure in Art EXPLAINED!','2'),
('13','Get familiar with basic shaping','Digital Painting Basics - Simple Forms to Complex Paintings','2'),
('14','Doodle timelapse','Mountain Doodle: Digital Painting Time-Lapse','2'),
('15','Arrange objects support tools','How to Center Things in Photoshop','2'),
('16','Line','Elements of Art: Line','3'),
('17','Shape','Elements of Art: Shape','3'),
('18','Form','Elements of Art: Form','3'),
('19','Value','Elements of Art: Value','3'),
('20','Space','Elements of Art: Space','3'),
('21','Hatching Technique','Beginner Hatching Techniques and Tips For Pen - How to Know What Sort of Lines to Use','4'),
('22','Cross-Hatching Technique','How to Cross Hatch - The Best Cross Hatching Tip','4'),
('23','Scumbling and Stippling Techniques','Pencil sketching technique | Stippling and Scumbling technique','4'),
('24','Back and forth Stroke Technique','BACK & FORTH STROKE','4'),
('25','Introduction of sketching','Introduction to Sketching','5'),
('26','What is value scale and how it work?','Value Scale','5'),
('27','Blending and its importance','Blending Stumps - Do You Really Need Them At All?','5'),
('28','Different tools of blending and usages','4 blending tools | How to do Blending','5'),
('29','Blending and mixing value in value scale','Value Shading in Layers','5');
('30','Eye of girl','How to Draw Eyes ♡','6'),
('31','Eye of guy','How to draw male eyes step by step tutorial','6'),
('32','Closed eye','How to draw Realistic closed eye for beginners','6'),
('33','Nose and mouth','How I draw facial features|| Eyes, nose and mouth Tutorial','6'),
('34','Girl and guy head - front view','How to Draw Different HEAD ANGLES','6'),
('35','Hair','How to Draw Hair: Male & Female - Ultimate Tutorial','6'),
('36','¾ view head','GOLDEN RATIO 3/4 VIEW [ TUTORIAL ]','6'),
('37','Side view head','How to Draw the Head - Side View','6'),
('38','Hand: Key points','How to draw Hands / Useful Tips!! / Tutorials (Easy way)','7'),
('39','Hand: Front and back vỉews','Observe hands views','7'),
('40','Hand: Poses','How to Draw HANDS and HAND POSES!','7'),
('41','Feet','How To Draw SIMPLE FEET: FRONT & SOLE','7'),
('42','Body: 4 views','Ill teach you drawing bodies in 10 minutes.','7'),
('43','Poses','How to draw ANY POSE in 10 minutes','7'),
('44','Using DesignDoll for poses','Tutorial | How to make your own reference with DesignDoll','7'),
('45','Girl’s tops','How to draw Clothes & Wrinkles','8'),
('46','Girl’s bottoms','How To Draw SKIRTS FROM BASIC SHAPES','8'),
('47','Clothes folds','How to draw Clothing folds','8'),
('48','Shoes','How to Draw FEET & Shoes - Art Tutorial','8'),
('49','How to draw lines','13 Types of Lines and How to Use Them','9'),
('50','Light and dark shading','How to see and draw the light and shadows in a portrait','9'),
('51','Light to dark and dark to light shading','How do you choose the right direction? | Shading with crosshatching','9'),
('52','Eye shading','How to draw eyes on your Portraits','10'),
('53','Nose shading','How to Draw a Nose - Step by Step','10'),
('54','Lips shading','How to Draw Lips - Step by Step','10'),
('55','Ear shading','How to Draw Ear - Step by Step','10'),
('56','Beard and mustache shading','How to Draw Beard and Mustache - Step by Step','10'),
('57','Drawing hair','How to Draw Hair - Step by Step','10'),
('58','Introduce and download Blender','How to Download and Install Blender 2023','11'),
('59','Moving around the scene','Blender Beginner Tutorial','11'),
('60','Adding objects','How to Join & Separate Objects in Blender','11'),
('61','Viewport and rendering','Blender Tutorial: Viewport Render Animation ( make preview )','11'),
('62','Material Colours','How to Add Color in Blender (Colorize Beginner Tutorial)','11'),
('63','Lighting','Blender 3D - Lighting for Beginners','11'),
('64','Editing Objects','BLENDER BASICS 7: Editing Object Data','11'),
('65','Create objects in dungeon','Blender - Procedural Dungeons with Geometry Nodes Tutorial','12'),
('66','Focus on details','Blender Secrets - Sculpting Details With Alpha Textures','12'),
('67','Creating sounds','Blender Tutorial: How to Add Sound to Your Renders, Quick Beginner Tutorial','12'),
('68','Cutting the door opening','Blender Beginner Tutorial | Door Modeling','12'),
('69','Shading objects','BLENDER BASICS 12: Mesh Normals and Smooth Shading','12'),
('70','Create dinosaur body','How to Create A 3D Dinosaur in Blender','13'),
('71','Create landscape and objects','Create Any Landscape in Minutes!','13'),
('72','Intro to nodes','What are Geometry Nodes?','13'),
('73','The finishing touches','Blender 3D Particles and Geometry Tutorial : Final Touches','13'),
('74','Basic UV mapping','UV Unwrapping Explained for Beginners | Blender Tutorial','14'),
('75','Building a plane body','How to make a plane in blender!','14'),
('76','Preparing for animation and animating plane','Animating the Airplane - Blender','14'),
('77','Scene and animation adjustments','Low Poly Airplane Tutorial in Blender','14'),
('78','Rendering Animations','Blender Plane Animation in Forest (Cycles Render)','14'),
('79','Bone basics','BASICS OF ANIMATION - Blender - Bones & Armature','15'),
('80','Subdivision surface Modelling','Using the SUBDIVISION SURFACE Modifier in Blender - Beginner Tutorial','15'),
('81','Animated textures','Blender Tutorial - Animating Textures','15'),
('82','Build a cartoon facial details','How to Make an Animatable 2D Face in Blender','16'),
('83','Adding character','How to make a Character in Blender','16'),
('84','Lighting character','Blender Beginner Tutorial - Lighting Tutorial','16'),
('85','Flat icon','HOW TO DRAW A FLAT ICON? ADOBE ILLUSTRATOR TUTORIAL','17'),
('86','Image-traced vector artwork','How to convert an Image to Vector in illustrator','17'),
('87','Polygonal style illustration','How To Create A Low Poly Portrait in Illustrator','17'),
('88','Gradient','How to Make a Gradient in Illustrator','17'),
('89','Mesh tool','Mesh Tool Illustrator','17'),
('90','Blur effect shading','How to create SHADOW and LIGHT with the BLUR EFFECT and a CUTTING MASK | Adobe Illustrator Tutorial','17'),
('91','Methods of creating 3D','3D Noodle Bowl Design In Adobe Illustrator | Tutorial','18'),
('92','Isometric','Learn Skills For QUALITY ISOMETRIC DESIGN - Illustrator Isometric House Tutorial','18'),
('93','Perspective grid','MASTER The Illustrator PERSPECTIVE GRID Tool','18'),
('94','3D modeling','How to Create REALISTIC 3D Objects in Adobe Illustrator','18'),
('95','3D rendering','HOW TO MAKE 3D SUSHI IN SECONDS IN ADOBE ILLUSTRATOR','18'),
('96','Extrude and blend','Extrude Text Effect in Adobe Illustrator | Halftone & Isometric | Graphic design','18'),
('97','Sketching','How to SKETCH Like Me ( ADOBE ILLUSTRATOR )Tutorial','19'),
('98','Tracing and layering','Illustrator-Tracing Layers','19'),
('99','Coloring','HOW TO COLOR - Tutorial | Adobe Illustrator','19'),
('100','Shading','Illustrator Tutorial: Shading a Flat Design Illustration','19'),
('101','Highlights','Adobe Illustrator Tutorial - Color with Shadows and Highlights','19'),
('102','Texture and details','How To Apply Textures with Adobe Illustrator','19'),
('103','Color correction and visual effects','Color correction and visual effects Adobe Illustrator Tutorial','19'),
('104','Line artwork','Illustrator Line Art Technique (MIND BLOWING)','19');
SET IDENTITY_INSERT tblLesson OFF

