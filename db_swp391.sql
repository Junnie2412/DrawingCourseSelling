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
	[createdDay] [date] NULL,
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
	[courseID] [varchar](250) NULL,
	[voucherID] [int] NULL,
	[cartID] [int] NULL,
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
PRIMARY KEY CLUSTERED 
(
	[courseID] ASC
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

/****** Object:  Table [dbo].[tblLesson]    Script Date: 10/1/2023 9:28:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblLesson](
	[lessonID] [int] IDENTITY(1,1) NOT NULL,
	[title] [varchar](250) NULL,
	[description] [varchar](250) NULL,
	[moduleID] [int] NULL,
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
	[courseID] [varchar](250) NULL,
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
	[voucherCode] [varchar](20) NULL,
	[total] [float] NULL,
	[isSuccess] [bit] NULL,
	[accountID] [varchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrderDetail]    Script Date: 10/28/2023 3:09:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrderDetail](
	[orderDetailID] [int] IDENTITY(1,1) NOT NULL,
	[price] [float] NULL,
	[quantity] [int] NULL,
	[orderID] [int] NULL,
	[courseID] [varchar](250) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblPaymentDetail]    Script Date: 10/28/2023 3:09:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPaymentDetail](
	[paymentDetailID] [int] IDENTITY(1,1) NOT NULL,
	[amount] [float] NULL,
	[numTransaction] [varchar](250) NULL,
	[orderID] [int] NULL,
	[provider] [varchar](250) NULL,
	[status] [bit] NULL,
	[createdAt] [datetime] NULL
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
/****** Object:  Table [dbo].[tblVideo]    Script Date: 10/1/2023 9:28:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblVideo](
	[videoID] [int] IDENTITY(1,1) NOT NULL,
	[content] [varchar](250) NULL,
	[time] [time](7) NULL,
	[isActive] [bit] NULL,
	[lessonID] [int] NULL,
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
	[expiredDay] [datetime] NOT NULL
PRIMARY KEY CLUSTERED 
(
	[voucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblLearningCourse]    Script Date: 10/1/2023 9:28:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblLearningCourse](
	[learningCourseID] [int] IDENTITY(1,1) NOT NULL,
	[isLearning] [bit] NULL,
	[expiredDay] [date] NULL,
	[courseID] [varchar](250) NULL,
	[accountID] [varchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[learningCourseID] ASC
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
	[learningCourseID] [int] NULL,
	[videoID] [int] NULL,
	[IsFnished] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[progressID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


ALTER TABLE [dbo].[tblOrderDetail] ADD  DEFAULT ((1)) FOR [quantity]
GO
ALTER TABLE [dbo].[tblCart]  WITH CHECK ADD FOREIGN KEY([accountID])
REFERENCES [dbo].[tblAccount] ([accountID])
GO
ALTER TABLE [dbo].[tblCartItem]  WITH CHECK ADD FOREIGN KEY([courseID])
REFERENCES [dbo].[tblCourse] ([courseID])
GO
ALTER TABLE [dbo].[tblCartItem]  WITH CHECK ADD FOREIGN KEY([voucherID])
REFERENCES [dbo].[tblVoucher] ([voucherID])
GO
ALTER TABLE [dbo].[tblCartItem]  WITH CHECK ADD FOREIGN KEY([cartID])
REFERENCES [dbo].[tblCart] ([cartID])
GO
ALTER TABLE [dbo].[tblCourse]  WITH CHECK ADD FOREIGN KEY([accountID])
REFERENCES [dbo].[tblAccount] ([accountID])
GO
ALTER TABLE [dbo].[tblCourse]  WITH CHECK ADD FOREIGN KEY([descriptionID])
REFERENCES [dbo].[tblDescription] ([descriptionID])
GO
ALTER TABLE [dbo].[tblGallery]  WITH CHECK ADD FOREIGN KEY([courseID])
REFERENCES [dbo].[tblAccount] ([accountID])
GO
ALTER TABLE [dbo].[tblLesson]  WITH CHECK ADD FOREIGN KEY([moduleID])
REFERENCES [dbo].[tblModule] ([moduleID])
GO
ALTER TABLE [dbo].[tblModule]  WITH CHECK ADD FOREIGN KEY([courseID])
REFERENCES [dbo].[tblCourse] ([courseID])
GO
ALTER TABLE [dbo].[tblVideo]  WITH CHECK ADD FOREIGN KEY([lessonID])
REFERENCES [dbo].[tblLesson] ([lessonID])
GO
ALTER TABLE [dbo].[tblOrder]  WITH CHECK ADD FOREIGN KEY([accountID])
REFERENCES [dbo].[tblAccount] ([accountID])
GO
ALTER TABLE [dbo].[tblOrderDetail]  WITH CHECK ADD FOREIGN KEY([courseID])
REFERENCES [dbo].[tblCourse] ([courseID])
GO
ALTER TABLE [dbo].[tblOrderDetail]  WITH CHECK ADD FOREIGN KEY([orderID])
REFERENCES [dbo].[tblOrder] ([orderID])
GO
ALTER TABLE [dbo].[tblPaymentDetail]  WITH CHECK ADD FOREIGN KEY([orderID])
REFERENCES [dbo].[tblOrder] ([orderID])

GO
ALTER TABLE [dbo].[tblPost]  WITH CHECK ADD FOREIGN KEY([accountID])
REFERENCES [dbo].[tblAccount] ([accountID])
GO
ALTER TABLE [dbo].[tblProfile]  WITH CHECK ADD FOREIGN KEY([accountID])
REFERENCES [dbo].[tblAccount] ([accountID])
GO
ALTER TABLE [dbo].[tblProgress]  WITH CHECK ADD FOREIGN KEY([learningCourseID])
REFERENCES [dbo].[tblLearningCourse] ([learningCourseID])
GO
ALTER TABLE [dbo].[tblProgress]  WITH CHECK ADD FOREIGN KEY([videoID])
REFERENCES [dbo].[tblVideo] ([videoID])
GO
ALTER TABLE [dbo].[tblLearningCourse]  WITH CHECK ADD FOREIGN KEY([accountID])
REFERENCES [dbo].[tblAccount] ([accountID])
GO
ALTER TABLE [dbo].[tblLearningCourse]  WITH CHECK ADD FOREIGN KEY([courseID])
REFERENCES [dbo].[tblCourse] ([courseID])
GO
