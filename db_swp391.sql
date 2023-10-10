CREATE DATABASE DrawingCourse;
USE [DrawingCourse]
GO
/****** Object:  Table [dbo].[tblAccount]    Script Date: 10/1/2023 9:28:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAccount](
	[accountID] [varchar](250) NOT NULL,
	[password] [varchar](250) NULL,
	[fullName] [varchar](250) NULL,
	[dateOfBirth] [date] NULL,
	[role] [varchar](250) NULL,
	[phone] [varchar](250) NULL,
	[isActive] [bit] NULL,
	[image] [varchar](250) NULL,
	[email] [varchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[accountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCart]    Script Date: 10/1/2023 9:28:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCart](
	[cartID] [int] IDENTITY(1,1) NOT NULL,
	[quantity] [int] NULL,
	[cartItemID] [int] NULL,
	[accountID] [varchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[cartID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCartItem]    Script Date: 10/1/2023 9:28:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCartItem](
	[cartItemID] [int] IDENTITY(1,1) NOT NULL,
	[quantity] [int] NULL,
	[courseID] [varchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[cartItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCourse]    Script Date: 10/1/2023 9:28:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCourse](
	[courseID] [varchar](250) NOT NULL,
	[price] [float] NULL,
	[name] [varchar](250) NULL,
	[duration] [int] NULL,
	[isActive] [bit] NULL,
	[datePublic] [date] NULL,
	[accountID] [varchar](250) NULL,
	[descriptionID] [int] NULL,
	[moduleID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[courseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCourseFeedback]    Script Date: 10/1/2023 9:28:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCourseFeedback](
	[courseFeedbackID] [int] IDENTITY(1,1) NOT NULL,
	[feedback] [varchar](250) NOT NULL,
	[rate] [int] NULL,
	[date] [datetime] NULL,
	[isActive] [bit] NULL,
	[courseID] [varchar](250) NULL,
	[accountID] [varchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[courseFeedbackID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblDescription]    Script Date: 10/1/2023 9:28:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDescription](
	[descriptionID] [int] IDENTITY(1,1) NOT NULL,
	[content] [varchar](250) NULL,
	[target] [varchar](250) NULL,
	[image] [varchar](250) NULL,
	[type] [varchar](250) NULL,
	[level] [varchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[descriptionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblGallery]    Script Date: 10/1/2023 9:28:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblGallery](
	[galleryID] [int] IDENTITY(1,1) NOT NULL,
	[image] [varbinary](max) NULL,
	[imageName] [varchar](100) NULL,
	[courseID] [varchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[galleryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblGrade]    Script Date: 10/1/2023 9:28:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblGrade](
	[gradeID] [int] IDENTITY(1,1) NOT NULL,
	[grade] [float] NULL,
	[accountID] [varchar](250) NULL,
	[quizID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[gradeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblLesson]    Script Date: 10/1/2023 9:28:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblLesson](
	[lessonID] [int] IDENTITY(1,1) NOT NULL,
	[title] [varchar](250) NULL,
	[description] [varchar](250) NULL,
	[videoID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[lessonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblModule]    Script Date: 10/1/2023 9:28:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblModule](
	[moduleID] [int] IDENTITY(1,1) NOT NULL,
	[title] [varchar](250) NULL,
	[lessonID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[moduleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrder]    Script Date: 10/1/2023 9:28:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrder](
	[orderID] [int] IDENTITY(1,1) NOT NULL,
	[dateOrder] [datetime] NULL,
	[total] [float] NULL,
	[isSuccess] [bit] NULL,
	[accountID] [varchar](250) NULL,
	[voucherID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrderDetail]    Script Date: 10/1/2023 9:28:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrderDetail](
	[orderDetailID] [int] IDENTITY(1,1) NOT NULL,
	[price] [float] NULL,
	[voucherCode] [varchar](20) NULL,
	[quantity] [int] NULL,
	[orderID] [int] NULL,
	[paymentDetailID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[orderDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblPaymentDetail]    Script Date: 10/1/2023 9:28:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPaymentDetail](
	[paymentDetailID] [int] IDENTITY(1,1) NOT NULL,
	[amount] [float] NULL,
	[provider] [varchar](250) NULL,
	[status] [bit] NULL,
	[createdAt] [datetime] NULL,
	[modifiedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[paymentDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblPost]    Script Date: 10/1/2023 9:28:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPost](
	[postID] [int] IDENTITY(1,1) NOT NULL,
	[image] [varchar](250) NULL,
	[title] [nvarchar](250) NULL,
	[content] [nvarchar](250) NULL,
	[dateCreate] [date] NULL,
	[isApproved] [bit] NULL,
	[accountID] [varchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[postID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblProfile]    Script Date: 10/1/2023 9:28:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProfile](
	[profileID] [varchar](250) NOT NULL,
	[achivement] [varchar](250) NULL,
	[portfolio] [varchar](250) NULL,
	[accountID] [varchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[profileID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblProgress]    Script Date: 10/1/2023 9:28:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProgress](
	[progressID] [int] IDENTITY(1,1) NOT NULL,
	[accountID] [varchar](250) NULL,
	[courseID] [varchar](250) NULL,
	[videoID] [int] NULL,
	[IsWatched] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[progressID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblQuiz]    Script Date: 10/1/2023 9:28:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblQuiz](
	[quizID] [int] IDENTITY(1,1) NOT NULL,
	[title] [varchar](250) NULL,
	[lessonID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[quizID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblQuizQuestion]    Script Date: 10/1/2023 9:28:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblQuizQuestion](
	[questionID] [int] IDENTITY(1,1) NOT NULL,
	[question] [varchar](250) NULL,
	[quizID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[questionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblQuizQuestionOption]    Script Date: 10/1/2023 9:28:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblQuizQuestionOption](
	[optionID] [int] IDENTITY(1,1) NOT NULL,
	[content] [varchar](250) NULL,
	[isCorrect] [bit] NULL,
	[questionID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[optionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblQuizUserAnswer]    Script Date: 10/1/2023 9:28:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblQuizUserAnswer](
	[answerID] [int] IDENTITY(1,1) NOT NULL,
	[accountID] [varchar](250) NULL,
	[courseID] [varchar](250) NULL,
	[questionID] [int] NULL,
	[optionID] [int] NULL,
	[lessonID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[answerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUserLog]    Script Date: 10/1/2023 9:28:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUserLog](
	[LogID] [int] IDENTITY(1,1) NOT NULL,
	[accountID] [varchar](250) NULL,
	[DeviceName] [varchar](100) NULL,
	[TimeLogin] [datetime] NULL,
	[DayLogin] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[LogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblVideo]    Script Date: 10/1/2023 9:28:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblVideo](
	[videoID] [int] IDENTITY(1,1) NOT NULL,
	[topic] [varchar](250) NULL,
	[content] [varchar](250) NULL,
	[time] [time](7) NULL,
	[isActive] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[videoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblVoucher]    Script Date: 10/1/2023 9:28:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblVoucher](
	[voucherID] [int] IDENTITY(1,1) NOT NULL,
	[discountPercent] [decimal](5, 2) NULL,
	[voucherCode] [varchar](20) NULL,
	[createdDay] [datetime] NULL,
	[expireDay] [datetime] NOT NULL,
	[courseID] [varchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[voucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblOrderDetail] ADD  DEFAULT ((1)) FOR [quantity]
GO
ALTER TABLE [dbo].[tblCart]  WITH CHECK ADD FOREIGN KEY([accountID])
REFERENCES [dbo].[tblAccount] ([accountID])
GO
ALTER TABLE [dbo].[tblCart]  WITH CHECK ADD FOREIGN KEY([cartItemID])
REFERENCES [dbo].[tblCartItem] ([cartItemID])
GO
ALTER TABLE [dbo].[tblCartItem]  WITH CHECK ADD FOREIGN KEY([courseID])
REFERENCES [dbo].[tblCourse] ([courseID])
GO
ALTER TABLE [dbo].[tblCourse]  WITH CHECK ADD FOREIGN KEY([accountID])
REFERENCES [dbo].[tblAccount] ([accountID])
GO
ALTER TABLE [dbo].[tblCourse]  WITH CHECK ADD FOREIGN KEY([descriptionID])
REFERENCES [dbo].[tblDescription] ([descriptionID])
GO
ALTER TABLE [dbo].[tblCourse]  WITH CHECK ADD FOREIGN KEY([moduleID])
REFERENCES [dbo].[tblModule] ([moduleID])
GO
ALTER TABLE [dbo].[tblCourseFeedback]  WITH CHECK ADD FOREIGN KEY([accountID])
REFERENCES [dbo].[tblAccount] ([accountID])
GO
ALTER TABLE [dbo].[tblCourseFeedback]  WITH CHECK ADD FOREIGN KEY([courseID])
REFERENCES [dbo].[tblCourse] ([courseID])
GO
ALTER TABLE [dbo].[tblGallery]  WITH CHECK ADD FOREIGN KEY([courseID])
REFERENCES [dbo].[tblAccount] ([accountID])
GO
ALTER TABLE [dbo].[tblGrade]  WITH CHECK ADD FOREIGN KEY([accountID])
REFERENCES [dbo].[tblAccount] ([accountID])
GO
ALTER TABLE [dbo].[tblGrade]  WITH CHECK ADD FOREIGN KEY([quizID])
REFERENCES [dbo].[tblQuiz] ([quizID])
GO
ALTER TABLE [dbo].[tblLesson]  WITH CHECK ADD FOREIGN KEY([videoID])
REFERENCES [dbo].[tblVideo] ([videoID])
GO
ALTER TABLE [dbo].[tblModule]  WITH CHECK ADD FOREIGN KEY([lessonID])
REFERENCES [dbo].[tblLesson] ([lessonID])
GO
ALTER TABLE [dbo].[tblOrder]  WITH CHECK ADD FOREIGN KEY([accountID])
REFERENCES [dbo].[tblAccount] ([accountID])
GO
ALTER TABLE [dbo].[tblOrder]  WITH CHECK ADD FOREIGN KEY([voucherID])
REFERENCES [dbo].[tblVoucher] ([voucherID])
GO
ALTER TABLE [dbo].[tblOrderDetail]  WITH CHECK ADD FOREIGN KEY([orderID])
REFERENCES [dbo].[tblOrder] ([orderID])
GO
ALTER TABLE [dbo].[tblOrderDetail]  WITH CHECK ADD FOREIGN KEY([paymentDetailID])
REFERENCES [dbo].[tblPaymentDetail] ([paymentDetailID])
GO
ALTER TABLE [dbo].[tblPost]  WITH CHECK ADD FOREIGN KEY([accountID])
REFERENCES [dbo].[tblAccount] ([accountID])
GO
ALTER TABLE [dbo].[tblProfile]  WITH CHECK ADD FOREIGN KEY([accountID])
REFERENCES [dbo].[tblAccount] ([accountID])
GO
ALTER TABLE [dbo].[tblProgress]  WITH CHECK ADD FOREIGN KEY([accountID])
REFERENCES [dbo].[tblAccount] ([accountID])
GO
ALTER TABLE [dbo].[tblProgress]  WITH CHECK ADD FOREIGN KEY([courseID])
REFERENCES [dbo].[tblAccount] ([accountID])
GO
ALTER TABLE [dbo].[tblProgress]  WITH CHECK ADD FOREIGN KEY([videoID])
REFERENCES [dbo].[tblVideo] ([videoID])
GO
ALTER TABLE [dbo].[tblQuiz]  WITH CHECK ADD FOREIGN KEY([lessonID])
REFERENCES [dbo].[tblLesson] ([lessonID])
GO
ALTER TABLE [dbo].[tblQuizQuestion]  WITH CHECK ADD FOREIGN KEY([quizID])
REFERENCES [dbo].[tblQuiz] ([quizID])
GO
ALTER TABLE [dbo].[tblQuizQuestionOption]  WITH CHECK ADD FOREIGN KEY([questionID])
REFERENCES [dbo].[tblQuizQuestion] ([questionID])
GO
ALTER TABLE [dbo].[tblQuizUserAnswer]  WITH CHECK ADD FOREIGN KEY([accountID])
REFERENCES [dbo].[tblAccount] ([accountID])
GO
ALTER TABLE [dbo].[tblQuizUserAnswer]  WITH CHECK ADD FOREIGN KEY([courseID])
REFERENCES [dbo].[tblCourse] ([courseID])
GO
ALTER TABLE [dbo].[tblQuizUserAnswer]  WITH CHECK ADD FOREIGN KEY([lessonID])
REFERENCES [dbo].[tblLesson] ([lessonID])
GO
ALTER TABLE [dbo].[tblQuizUserAnswer]  WITH CHECK ADD FOREIGN KEY([optionID])
REFERENCES [dbo].[tblQuizQuestionOption] ([optionID])
GO
ALTER TABLE [dbo].[tblQuizUserAnswer]  WITH CHECK ADD FOREIGN KEY([questionID])
REFERENCES [dbo].[tblQuizQuestion] ([questionID])
GO
ALTER TABLE [dbo].[tblUserLog]  WITH CHECK ADD FOREIGN KEY([accountID])
REFERENCES [dbo].[tblAccount] ([accountID])
GO
ALTER TABLE [dbo].[tblVoucher]  WITH CHECK ADD FOREIGN KEY([courseID])
REFERENCES [dbo].[tblAccount] ([accountID])
GO
------------------Add Data to Table----------------------
INSERT INTO tblAccount(accountID,password,fullName,dateOfBirth,role,phone,isActive,image,email)
VALUES('ad','123','Nguyen Le Hoang Dung','1980-11-10','Admin','0325245427',1,'https://www.ecpi.edu/sites/default/files/buis.png','dungchan321@gmail.com'),
	  ('user321','123','Nguyen Minh Nguyet','2000-12-24','Customer','03246673232',1,'https://drive.google.com/drive/folders/1XHZoN-_nXG1l-LaVB3JO1cweB1mDzrhK','junniehoang2412@gmail.com'),
	  ('staff123','123','Le Hoang Trong','1990-05-23','Staff','03236382852',1,'https://drive.google.com/drive/folders/1XHZoN-_nXG1l-LaVB3JO1cweB1mDzrhK','tronghoang2322@gmail.com'),
	  ('instructor123','123','Ngo Khanh Han','1994-05-12','Instructor','0323655552',1,'https://mythuatbui.edu.vn/wp-content/uploads/2022/12/24118CE0-DA81-4AEF-BAC0-3F0C593BA6AF-Ngo-Khanh-Han.jpeg','khanhHan231@gmail.com');

------------------Add Từng cái vào nha, add 1 lần vào lỗi t kh có chịu đâu nha <3----------------------

------------------1/Add Description to Table----------------------
SET IDENTITY_INSERT tblDescription ON
INSERT INTO tblDescription(descriptionID,content,target,image,type,level)
VALUES('101','From this course, you can learn drawing basic hands and models. Fundamental theory in character building and combining perspective, color thinking, and composition.','Proficient in using Photoshop and Wacom software. Know how to use Photoshop in Digital Painting. Get Brush tools to draw.','https://img.freepik.com/premium-photo/painting-girl-woman-smooth-soft-skin-colorful_849906-592.jpg','Digital','Basic');
SET IDENTITY_INSERT tblDescription OFF

------------------2/Add Video to Table----------------------
SET IDENTITY_INSERT tblVideo ON
INSERT INTO tblVideo(videoID,topic,content,time,isActive)
VALUES('301','Introduction','Get ready with basic stuffs','00:10:12',1);
SET IDENTITY_INSERT tblVideo OFF

------------------3/Add Lesson to Table----------------------
SET IDENTITY_INSERT tblLesson ON
INSERT INTO tblLesson(lessonID,title,description,videoID)
VALUES('201','Introduction','Get ready with basic stuffs','301');
SET IDENTITY_INSERT tblLesson OFF

------------------4/Add Module to Table----------------------
SET IDENTITY_INSERT tblModule ON
INSERT INTO tblModule(moduleID,title,lessonID)
VALUES('1001','Using Photoshop in Digital Painting','201');
SET IDENTITY_INSERT tblModule OFF

------------------5/Add Course to Table----------------------
SET IDENTITY_INSERT tblCourse ON
INSERT INTO tblCourse(courseID,price,name,duration,isActive,datePublic,accountID,descriptionID,moduleID)
VALUES('bdp1','429000','Basic Digital Painting','98','1','2023-10-04','instructor123','101','1001');
SET IDENTITY_INSERT tblCourse OFF
