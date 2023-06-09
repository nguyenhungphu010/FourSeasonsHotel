
CREATE DATABASE [dbFourSeasonHotel]

GO
ALTER DATABASE [dbFourSeasonHotel] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dbFourSeasonHotel].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [dbFourSeasonHotel] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [dbFourSeasonHotel] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [dbFourSeasonHotel] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [dbFourSeasonHotel] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [dbFourSeasonHotel] SET ARITHABORT OFF 
GO
ALTER DATABASE [dbFourSeasonHotel] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [dbFourSeasonHotel] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [dbFourSeasonHotel] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [dbFourSeasonHotel] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [dbFourSeasonHotel] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [dbFourSeasonHotel] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [dbFourSeasonHotel] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [dbFourSeasonHotel] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [dbFourSeasonHotel] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [dbFourSeasonHotel] SET  ENABLE_BROKER 
GO
ALTER DATABASE [dbFourSeasonHotel] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [dbFourSeasonHotel] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [dbFourSeasonHotel] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [dbFourSeasonHotel] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [dbFourSeasonHotel] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [dbFourSeasonHotel] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [dbFourSeasonHotel] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [dbFourSeasonHotel] SET RECOVERY FULL 
GO
ALTER DATABASE [dbFourSeasonHotel] SET  MULTI_USER 
GO
ALTER DATABASE [dbFourSeasonHotel] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [dbFourSeasonHotel] SET DB_CHAINING OFF 
GO
ALTER DATABASE [dbFourSeasonHotel] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [dbFourSeasonHotel] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [dbFourSeasonHotel] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [dbFourSeasonHotel] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'dbFourSeasonHotel', N'ON'
GO
ALTER DATABASE [dbFourSeasonHotel] SET QUERY_STORE = ON
GO
ALTER DATABASE [dbFourSeasonHotel] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [dbFourSeasonHotel]
GO
/****** Object:  Table [dbo].[Booking]    Script Date: 31/05/2023 4:29:43 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Booking](
	[BookingId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[CheckIn] [datetime] NOT NULL,
	[CheckOut] [datetime] NOT NULL,
	[TotalPrice] [money] NOT NULL,
	[Status] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[BookingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BookingDetail]    Script Date: 31/05/2023 4:29:43 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookingDetail](
	[BookingDetailId] [int] IDENTITY(1,1) NOT NULL,
	[BookingId] [int] NULL,
	[RoomId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[BookingDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 31/05/2023 4:29:43 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](255) NOT NULL,
	[MaxPeople] [int] NOT NULL,
	[Size] [float] NOT NULL,
	[Image] [varchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[Status] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 31/05/2023 4:29:43 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Room]    Script Date: 31/05/2023 4:29:43 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Room](
	[RoomId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryId] [int] NULL,
	[RoomName] [nvarchar](255) NOT NULL,
	[Price] [money] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Status] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoomId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoomImg]    Script Date: 31/05/2023 4:29:43 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoomImg](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoomId] [int] NULL,
	[Image] [varchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 31/05/2023 4:29:43 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[FullName] [nvarchar](255) NULL,
	[Address] [nvarchar](255) NULL,
	[Phone] [varchar](10) NULL,
	[IDCard] [varchar](12) NULL,
	[BirthDay] [date] NULL,
	[RoleId] [int] NULL,
	[Avatar] [varchar](max) NULL,
	[Status] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CategoryId], [CategoryName], [MaxPeople], [Size], [Image], [Description], [Status]) VALUES (5, N'Double', 1, 10, N'https://images.unsplash.com/photo-1611892440504-42a792e24d32?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aG90ZWwlMjByb29tfGVufDB8fDB8fHww&w=1000&q=80', N'This charming room overlooks our beautiful tropical garden and the landscaped lagoon pool. Enjoy the view over palm trees, plants and flowers in all kinds of shapes and colours. At night, pool and garden are romantically illuminated. The room features timber floor, attractive sitting area, walk-in closet, twin or kingsize bed and a generous marble bathroom with oversized shower. Standard occupancy is 2 persons. Maximum occupancy is 03 adults and 01 child (under 12 years old) or 02 adults and 02 children (under 12 years old).', 1)
INSERT [dbo].[Category] ([CategoryId], [CategoryName], [MaxPeople], [Size], [Image], [Description], [Status]) VALUES (6, N'Superior Twin', 4, 20, N'https://watermark.lovepik.com/photo/20211121/large/lovepik-hotel-room-picture_500597052.jpg', N'Lying amongst beautiful green foliage and a private swimming pool, this two floor villa features a private rooftop, kitchen, living and dining room, master bedroom and spare room on the first floor. A third room on the rooftop with a chic-designed small window can be used as children’s area. Standard occupancy is 4 persons. Maximum occupancy is 06 adults and 02 children (under 12 years old) or 04 adults and 04 children (under 12 years old).', 1)
INSERT [dbo].[Category] ([CategoryId], [CategoryName], [MaxPeople], [Size], [Image], [Description], [Status]) VALUES (9, N'Deluxe', 8, 30, N'data:image/jpeg;base64,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', N'Decorated in muted cool colors and they feature local Cham artifacts and decorative handicrafts.The L-shape soft supple sofa on the lower level of the “split floor level” Suite, visually separates living and sleeping areas of the Suite and so makes for an elegant, lavishly appointed yet homely atmosphere. Silk cushions and new sumptuous bed linen and pillows make it even more plush & seductive.

', 1)
INSERT [dbo].[Category] ([CategoryId], [CategoryName], [MaxPeople], [Size], [Image], [Description], [Status]) VALUES (10, N'Suit', 10, 100, N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQVCLh3OmqQcyq2_vlR09wMZBwtyFUNrA8qcA&usqp=CAU', N'The new Presidential Suite decorated in royal style with sea view offers its own unique features with oversized living room, large screen TV, bedroom with king bed, marble bathroom housing with bathtub and electric bidet.', 1)
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([RoleId], [RoleName]) VALUES (1, N'Admin')
INSERT [dbo].[Role] ([RoleId], [RoleName]) VALUES (2, N'Manager')
INSERT [dbo].[Role] ([RoleId], [RoleName]) VALUES (3, N'Receptionist')
INSERT [dbo].[Role] ([RoleId], [RoleName]) VALUES (4, N'Guest')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[Room] ON 

INSERT [dbo].[Room] ([RoomId], [CategoryId], [RoomName], [Price], [Description], [Status]) VALUES (6, 5, N'Double Room', 100.0000, N'This charming room overlooks our beautiful tropical garden and the landscaped lagoon pool. Enjoy the view over palm trees, plants and flowers in all kinds of shapes and colours. At night, pool and garden are romantically illuminated. The room features timber floor, attractive sitting area, walk-in closet, twin or kingsize bed and a generous marble bathroom with oversized shower. Standard occupancy is 2 persons. Maximum occupancy is 03 adults and 01 child (under 12 years old) or 02 adults and 02 children (under 12 years old).', 1)
INSERT [dbo].[Room] ([RoomId], [CategoryId], [RoomName], [Price], [Description], [Status]) VALUES (8, 5, N'Double Room Ocean', 120.0000, N'This charming room overlooks our beautiful tropical garden and the landscaped lagoon pool. Enjoy the view over palm trees, plants and flowers in all kinds of shapes and colours. At night, pool and garden are romantically illuminated. The room features timber floor, attractive sitting area, walk-in closet, twin or kingsize bed and a generous marble bathroom with oversized shower. Standard occupancy is 2 persons. Maximum occupancy is 03 adults and 01 child (under 12 years old) or 02 adults and 02 children (under 12 years old).', 1)
INSERT [dbo].[Room] ([RoomId], [CategoryId], [RoomName], [Price], [Description], [Status]) VALUES (10, 5, N'Double Room Natural', 150.0000, N'This charming room overlooks our beautiful tropical garden and the landscaped lagoon pool. Enjoy the view over palm trees, plants and flowers in all kinds of shapes and colours. At night, pool and garden are romantically illuminated. The room features timber floor, attractive sitting area, walk-in closet, twin or kingsize bed and a generous marble bathroom with oversized shower. Standard occupancy is 2 persons. Maximum occupancy is 03 adults and 01 child (under 12 years old) or 02 adults and 02 children (under 12 years old).', 1)
INSERT [dbo].[Room] ([RoomId], [CategoryId], [RoomName], [Price], [Description], [Status]) VALUES (12, 6, N'Superior Twin ', 180.0000, N'Lying amongst beautiful green foliage and a private swimming pool, this two floor villa features a private rooftop, kitchen, living and dining room, master bedroom and spare room on the first floor. A third room on the rooftop with a chic-designed small window can be used as children’s area. Standard occupancy is 6 persons. Maximum occupancy is 09 adults and 03 children (under 12 years old) or 06 adults and 06 children (under 12 years old).', 1)
INSERT [dbo].[Room] ([RoomId], [CategoryId], [RoomName], [Price], [Description], [Status]) VALUES (13, 6, N'Superior Twin Vip', 250.0000, N'Lying amongst beautiful green foliage and a private swimming pool, this two floor villa features a private rooftop, kitchen, living and dining room, master bedroom and spare room on the first floor. A third room on the rooftop with a chic-designed small window can be used as children’s area. Standard occupancy is 6 persons. Maximum occupancy is 09 adults and 03 children (under 12 years old) or 06 adults and 06 children (under 12 years old).', 1)
INSERT [dbo].[Room] ([RoomId], [CategoryId], [RoomName], [Price], [Description], [Status]) VALUES (14, 9, N'Deluxe Room', 300.0000, N'You will like this deluxe and spacious room!

The sitting area with an elegant sofa, coffee table, and comfortable armchair will help you relax. The large bathroom decorated with honey-colored marble offers a separate shower and bathtub.', 1)
INSERT [dbo].[Room] ([RoomId], [CategoryId], [RoomName], [Price], [Description], [Status]) VALUES (15, 9, N'Deluxe Room Vip', 400.0000, N'You will like this deluxe and spacious room!

The sitting area with an elegant sofa, coffee table, and comfortable armchair will help you relax. The large bathroom decorated with honey-colored marble offers a separate shower and bathtub.', 1)
INSERT [dbo].[Room] ([RoomId], [CategoryId], [RoomName], [Price], [Description], [Status]) VALUES (16, 10, N'Suit', 10000.0000, N'The new Presidential Suite decorated in royal style with sea view offers its own unique features with oversized living room, large screen TV, bedroom with king bed, marble bathroom housing with bathtub and electric bidet.', 1)
INSERT [dbo].[Room] ([RoomId], [CategoryId], [RoomName], [Price], [Description], [Status]) VALUES (17, 10, N'Suit Vip ', 12000.0000, N'The new Presidential Suite decorated in royal style with sea view offers its own unique features with oversized living room, large screen TV, bedroom with king bed, marble bathroom housing with bathtub and electric bidet.', 1)
SET IDENTITY_INSERT [dbo].[Room] OFF
GO
SET IDENTITY_INSERT [dbo].[RoomImg] ON 

INSERT [dbo].[RoomImg] ([Id], [RoomId], [Image]) VALUES (1, 6, N'https://res.cloudinary.com/dfb1bpw8c/image/upload/v1685523696/Ocean_Suite_bh24k2.jpg')
INSERT [dbo].[RoomImg] ([Id], [RoomId], [Image]) VALUES (3, 6, N'https://res.cloudinary.com/dfb1bpw8c/image/upload/v1685523697/Two_Bedroom_Presidential_Suite_h4i8gq.jpg')
INSERT [dbo].[RoomImg] ([Id], [RoomId], [Image]) VALUES (4, 8, N'https://res.cloudinary.com/dfb1bpw8c/image/upload/v1685523694/Interior_Sofa_hyr9cz.jpg')
INSERT [dbo].[RoomImg] ([Id], [RoomId], [Image]) VALUES (5, 8, N'https://res.cloudinary.com/dfb1bpw8c/image/upload/v1685523693/Interior_Sofa_1__dhcwoj.jpg')
INSERT [dbo].[RoomImg] ([Id], [RoomId], [Image]) VALUES (6, 8, N'https://res.cloudinary.com/dfb1bpw8c/image/upload/v1685523693/Living_Room_dgnprj.jpg')
INSERT [dbo].[RoomImg] ([Id], [RoomId], [Image]) VALUES (7, 10, N'https://res.cloudinary.com/dfb1bpw8c/image/upload/v1685523692/FV_OneBedroom_Masterbedroom__2__r2fkhv.jpg')
INSERT [dbo].[RoomImg] ([Id], [RoomId], [Image]) VALUES (8, 10, N'https://res.cloudinary.com/dfb1bpw8c/image/upload/v1685523692/Kitchen._wmwt8d.jpg')
INSERT [dbo].[RoomImg] ([Id], [RoomId], [Image]) VALUES (9, 10, N'https://res.cloudinary.com/dfb1bpw8c/image/upload/v1685523692/FV_Pool_Two_Bedroom_Villa_d8iwcb.jpg')
INSERT [dbo].[RoomImg] ([Id], [RoomId], [Image]) VALUES (10, 12, N'https://res.cloudinary.com/dfb1bpw8c/image/upload/v1685523692/Garden_Superior_ztmucn.jpg')
INSERT [dbo].[RoomImg] ([Id], [RoomId], [Image]) VALUES (11, 12, N'https://res.cloudinary.com/dfb1bpw8c/image/upload/v1685523692/Interior_Desk_x1xvgx.jpg')
INSERT [dbo].[RoomImg] ([Id], [RoomId], [Image]) VALUES (12, 12, N'https://res.cloudinary.com/dfb1bpw8c/image/upload/v1685523691/FV_DiningArea_Two_Bedroom_Villa_nqcmlk.jpg')
INSERT [dbo].[RoomImg] ([Id], [RoomId], [Image]) VALUES (13, 13, N'https://res.cloudinary.com/dfb1bpw8c/image/upload/v1685523691/FV_OneBedroom_Masterbedroom_xw2xry.jpg')
INSERT [dbo].[RoomImg] ([Id], [RoomId], [Image]) VALUES (14, 13, N'https://res.cloudinary.com/dfb1bpw8c/image/upload/v1685523691/FV_One_Bedroom_fcsvgm.jpg')
INSERT [dbo].[RoomImg] ([Id], [RoomId], [Image]) VALUES (15, 13, N'https://res.cloudinary.com/dfb1bpw8c/image/upload/v1685523691/FV_Inroom_Amenities2_Two_Bedroom_Villa_wqmk94.jpg')
INSERT [dbo].[RoomImg] ([Id], [RoomId], [Image]) VALUES (16, 14, N'https://res.cloudinary.com/dfb1bpw8c/image/upload/v1685523691/FV_Inroom_Amenities1_Two_Bedroom_Villa_itxthy.jpg')
INSERT [dbo].[RoomImg] ([Id], [RoomId], [Image]) VALUES (17, 14, N'https://res.cloudinary.com/dfb1bpw8c/image/upload/v1685523690/FV_OneBedroom_Livingroom_nnvmei.jpg')
INSERT [dbo].[RoomImg] ([Id], [RoomId], [Image]) VALUES (18, 14, N'https://res.cloudinary.com/dfb1bpw8c/image/upload/v1685523689/FV_Bedroom3_Three_Bedroom_Villa_fbqjhy.jpg')
INSERT [dbo].[RoomImg] ([Id], [RoomId], [Image]) VALUES (19, 15, N'https://res.cloudinary.com/dfb1bpw8c/image/upload/v1685523689/FV_Balcony_Three_Bedroom_Villa_hqpdjg.jpg')
INSERT [dbo].[RoomImg] ([Id], [RoomId], [Image]) VALUES (20, 15, N'https://res.cloudinary.com/dfb1bpw8c/image/upload/v1685523689/FV_King_Bedroom_Two_Bedroom_Villa_nmzcby.jpg')
INSERT [dbo].[RoomImg] ([Id], [RoomId], [Image]) VALUES (21, 16, N'https://res.cloudinary.com/dfb1bpw8c/image/upload/v1685523689/FV_Dining_Area_Three_Bedroom_Villa_ewwix6.jpg')
INSERT [dbo].[RoomImg] ([Id], [RoomId], [Image]) VALUES (22, 16, N'https://res.cloudinary.com/dfb1bpw8c/image/upload/v1685523689/FV_King_Bedroom_Two_Bedroom_Villa_nmzcby.jpg')
INSERT [dbo].[RoomImg] ([Id], [RoomId], [Image]) VALUES (25, 17, N'https://res.cloudinary.com/dfb1bpw8c/image/upload/v1685523696/Ocean_Suite_bh24k2.jpg')
INSERT [dbo].[RoomImg] ([Id], [RoomId], [Image]) VALUES (26, 17, N'https://res.cloudinary.com/dfb1bpw8c/image/upload/v1685523697/Two_Bedroom_Presidential_Suite_h4i8gq.jpg')
INSERT [dbo].[RoomImg] ([Id], [RoomId], [Image]) VALUES (27, 17, N'https://res.cloudinary.com/dfb1bpw8c/image/upload/v1685523694/Interior_Sofa_hyr9cz.jpg')
SET IDENTITY_INSERT [dbo].[RoomImg] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserId], [Email], [Password], [FullName], [Address], [Phone], [IDCard], [BirthDay], [RoleId], [Avatar], [Status]) VALUES (73, N'huynhbaokhuyen123@gmail.com', N'QWJjMTIzNDU2IQ==', N'Huynh Thi Bao Khuyen', N'123 Ngo Quyen', N'0905386651', N'123456123456', CAST(N'1997-10-12' AS Date), 1, NULL, N'1')
INSERT [dbo].[User] ([UserId], [Email], [Password], [FullName], [Address], [Phone], [IDCard], [BirthDay], [RoleId], [Avatar], [Status]) VALUES (75, N'khoale548@gmail.com', N'QWJjMTIzNDU2IQ==', N'Le Huu Nhat Khoa', N'56 Hoang Dieu', N'0912983193', N'123412341234', CAST(N'2001-10-28' AS Date), 2, NULL, N'1')
INSERT [dbo].[User] ([UserId], [Email], [Password], [FullName], [Address], [Phone], [IDCard], [BirthDay], [RoleId], [Avatar], [Status]) VALUES (76, N'vmhsky@gmail.com', N'QWJjMTIzNDU2IQ==', N'Vo Minh Hieu', N'12 Dong Da', N'0901293139', N'123123123123', CAST(N'2001-12-12' AS Date), 3, NULL, N'1')
INSERT [dbo].[User] ([UserId], [Email], [Password], [FullName], [Address], [Phone], [IDCard], [BirthDay], [RoleId], [Avatar], [Status]) VALUES (77, N'1162tranthenam@gmail.com', N'QWJjMTIzNDU2IQ==', N'Tran The Nam', N'21 Nguyen Van Linh', N'0912874261', N'456456456456', CAST(N'2000-08-05' AS Date), 4, NULL, N'1')
INSERT [dbo].[User] ([UserId], [Email], [Password], [FullName], [Address], [Phone], [IDCard], [BirthDay], [RoleId], [Avatar], [Status]) VALUES (78, N'ghuynguyen0311@gmail.com', N'QWJjMTIzNDU2IQ==', N'Nguyen Gia Huy', N'200 Truong Chinh', N'0909123456', N'343434343434', CAST(N'2001-07-23' AS Date), 1, NULL, N'1')
INSERT [dbo].[User] ([UserId], [Email], [Password], [FullName], [Address], [Phone], [IDCard], [BirthDay], [RoleId], [Avatar], [Status]) VALUES (79, N'Nguyenhungphu010@gmail.com', N'QWJjMTIzNDU2IQ==', N'Nguyen Van Phu', N'20 Pham Van Dong', N'0914982134', N'565656565656', CAST(N'1992-12-12' AS Date), 2, NULL, N'1')
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD  CONSTRAINT [FK_User_Booking] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Booking] CHECK CONSTRAINT [FK_User_Booking]
GO
ALTER TABLE [dbo].[BookingDetail]  WITH CHECK ADD  CONSTRAINT [FK_BookingDetail_Booking] FOREIGN KEY([BookingId])
REFERENCES [dbo].[Booking] ([BookingId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BookingDetail] CHECK CONSTRAINT [FK_BookingDetail_Booking]
GO
ALTER TABLE [dbo].[BookingDetail]  WITH CHECK ADD  CONSTRAINT [FK_BookingDetail_Room] FOREIGN KEY([RoomId])
REFERENCES [dbo].[Room] ([RoomId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BookingDetail] CHECK CONSTRAINT [FK_BookingDetail_Room]
GO
ALTER TABLE [dbo].[Room]  WITH CHECK ADD  CONSTRAINT [FK_Room_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([CategoryId])
GO
ALTER TABLE [dbo].[Room] CHECK CONSTRAINT [FK_Room_Category]
GO
ALTER TABLE [dbo].[RoomImg]  WITH CHECK ADD  CONSTRAINT [FK_RoomImg_Room] FOREIGN KEY([RoomId])
REFERENCES [dbo].[Room] ([RoomId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RoomImg] CHECK CONSTRAINT [FK_RoomImg_Room]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([RoleId])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role]
GO
USE [master]
GO
ALTER DATABASE [dbFourSeasonHotel] SET  READ_WRITE 
GO
