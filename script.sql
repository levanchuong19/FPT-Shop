USE [Assignment_PRJ301]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 17/3/2024 3:34:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[uID] [int] IDENTITY(1,1) NOT NULL,
	[user] [nvarchar](max) NULL,
	[pass] [nvarchar](max) NULL,
	[roleID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[uID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[category]    Script Date: 17/3/2024 3:34:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[category](
	[cateID] [int] NOT NULL,
	[cateName] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[cateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[connectAcc]    Script Date: 17/3/2024 3:34:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[connectAcc](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[uID] [int] NULL,
	[sellID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 17/3/2024 3:34:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[roleID] [int] NOT NULL,
	[roleName] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[roleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sell]    Script Date: 17/3/2024 3:34:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sell](
	[sellID] [int] IDENTITY(1,1) NOT NULL,
	[sellName] [nvarchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[sellID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[technology]    Script Date: 17/3/2024 3:34:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[technology](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[image] [nvarchar](max) NULL,
	[price] [money] NULL,
	[title] [nvarchar](max) NULL,
	[description] [nvarchar](max) NULL,
	[cateID] [int] NULL,
	[sellID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([uID], [user], [pass], [roleID]) VALUES (1, N'admin', N'admin', 1)
INSERT [dbo].[Account] ([uID], [user], [pass], [roleID]) VALUES (2, N'sa', N'sa', 2)
INSERT [dbo].[Account] ([uID], [user], [pass], [roleID]) VALUES (3, N'sb', N'sb', 2)
INSERT [dbo].[Account] ([uID], [user], [pass], [roleID]) VALUES (4, N'sc', N'sc', 2)
INSERT [dbo].[Account] ([uID], [user], [pass], [roleID]) VALUES (5, N'123', N'123', 2)
INSERT [dbo].[Account] ([uID], [user], [pass], [roleID]) VALUES (6, N'sd', N'sd', 0)
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
INSERT [dbo].[category] ([cateID], [cateName]) VALUES (1, N'Iphone')
INSERT [dbo].[category] ([cateID], [cateName]) VALUES (2, N'SamSung')
INSERT [dbo].[category] ([cateID], [cateName]) VALUES (3, N'Huawei')
INSERT [dbo].[category] ([cateID], [cateName]) VALUES (4, N'Xiaomi')
INSERT [dbo].[category] ([cateID], [cateName]) VALUES (5, N'Oppo')
GO
SET IDENTITY_INSERT [dbo].[connectAcc] ON 

INSERT [dbo].[connectAcc] ([id], [uID], [sellID]) VALUES (1, 2, 1)
INSERT [dbo].[connectAcc] ([id], [uID], [sellID]) VALUES (2, 3, 2)
INSERT [dbo].[connectAcc] ([id], [uID], [sellID]) VALUES (3, 4, 3)
INSERT [dbo].[connectAcc] ([id], [uID], [sellID]) VALUES (4, 5, 4)
SET IDENTITY_INSERT [dbo].[connectAcc] OFF
GO
INSERT [dbo].[Role] ([roleID], [roleName]) VALUES (0, N'notSell')
INSERT [dbo].[Role] ([roleID], [roleName]) VALUES (1, N'Admin')
INSERT [dbo].[Role] ([roleID], [roleName]) VALUES (2, N'User')
GO
SET IDENTITY_INSERT [dbo].[sell] ON 

INSERT [dbo].[sell] ([sellID], [sellName]) VALUES (1, N'Vu Trong Ha')
INSERT [dbo].[sell] ([sellID], [sellName]) VALUES (2, N'Vu Trong Hoang')
INSERT [dbo].[sell] ([sellID], [sellName]) VALUES (3, N'Pham Tuan hai')
INSERT [dbo].[sell] ([sellID], [sellName]) VALUES (4, N'Hoang Nang Viet')
SET IDENTITY_INSERT [dbo].[sell] OFF
GO
DELETE FROM technology
WHERE [name] = N'Xiaomi Redmi 13C'; 
SET IDENTITY_INSERT [dbo].[technology] ON 

INSERT [dbo].[technology] ([id], [name], [image], [price], [title], [description], [cateID], [sellID]) VALUES (1, N'Iphone11', N'https://product.hstatic.net/1000359786/product/bbr_711a465e10c342b79aa1a488ea23e305_master_4e3e9490d1d94330ab7a2a5212b8fe85_master.jpg', 500.0000, N'Ip11-64gb-BlueArchive', N' Màn hình: IPS LCD 6.1" Liquid Retina · Chip: Apple A13 Bionic · RAM: 4 GB · Dung lu?ng: 128 GB · Camera sau: 2 camera 12 MP', 1, 2)
INSERT [dbo].[technology] ([id], [name], [image], [price], [title], [description], [cateID], [sellID]) VALUES (3, N'Iphone13', N'https://product.hstatic.net/1000359786/product/94_918d11fdb55d492a9a791e49ac957933_master.jpg', 600.0000, N' iPhone 13 Mini 128GB VN/A-Pink', N'OLED6.1"Super Retina XDR, 2 camera 12 MP, Chip:Apple A15 Bionic RAM:4Gb/128 GB', 1, 4)
INSERT [dbo].[technology] ([id], [name], [image], [price], [title], [description], [cateID], [sellID]) VALUES (4, N'SamSung Galaxy Ultra s24', N'https://www.didongmy.com/vnt_upload/product/01_2024/thumbs/(600x600)_samsung_galaxy_s24_ultra_5g_xam_didongmy_thumb_600x600_1_3.jpg', 750.0000, N'Samsung Galaxy S24 Ultra 5G 12GB|256GB', N'Màn hình:Dynamic LTPO AMOLED 2X, 6.8'', 1440 x 3088, Chipset:	Qualcomm SM8650-AC Snapdragon 8 Gen 3 (4 nm)', 2, 2)
INSERT [dbo].[technology] ([id], [name], [image], [price], [title], [description], [cateID], [sellID]) VALUES (5, N'samsung galaxy z fold3', N'https://trungsonmobile.com/storage/samsung-galaxy-z-fold-3-green-1-600x600.jpg', 800.0000, N'Samsung Galaxy Z Fold3 5G 256GB', N'Màn hình:Dynamic AMOLED 2XChính 7.6" & Ph? 6.2"Full HD+ Chip:Snapdragon 888', 2, 2)
INSERT [dbo].[technology] ([id], [name], [image], [price], [title], [description], [cateID], [sellID]) VALUES (7, N'Huawei Nova', N'https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:90/plain/https://cellphones.com.vn/media/catalog/product/_/h/_huawei_nova_10_1.jpg', 650.0000, N'Huawei P60 Pro Plus siu cap', N'7', 3, 3)
INSERT [dbo].[technology] ([id], [name], [image], [price], [title], [description], [cateID], [sellID]) VALUES (8, N'Xiaomi redmi note 12r pro', N'https://cdn1.viettelstore.vn/Images/Product/ProductImage/1253805826.jpeg', 300.0000, N'Redmi Note 12R Pro 5G', N'Màn Hình6,67 inch, OLED, FHD+, 120Hz, 1200 nits Camera Sau48 MP, 2 MP Camera Tru?c8 MP, f / 2.0 Chíp X? Lý (CPU)Snapdragon 4 Gen 1 ( 6nm ) B? Nh? RAM12GB', 4, 4)
SET IDENTITY_INSERT [dbo].[technology] ON 
INSERT [dbo].[technology] ([id], [name], [image], [price], [title], [description], [cateID], [sellID]) VALUES (9, N'Xiaomi Redmi 13C', N'https://salt.tikicdn.com/cache/550x550/ts/product/43/67/10/785f365c131d40818ca848fbf5487968.jpg', 400.0000, N'Xiaomi Redmi 13C 6GB 128GB Chính Hãng', N'Màn hình 6.74 inches CPU Mediatek MT6769Z Helio G85 (12nm) Android 13, MIUI 14, 128GB RAM 6GB', 4, 4)
SET IDENTITY_INSERT [dbo].[technology] OFF
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD FOREIGN KEY([roleID])
REFERENCES [dbo].[Role] ([roleID])
GO
ALTER TABLE [dbo].[connectAcc]  WITH CHECK ADD FOREIGN KEY([sellID])
REFERENCES [dbo].[sell] ([sellID])
GO
ALTER TABLE [dbo].[connectAcc]  WITH CHECK ADD FOREIGN KEY([uID])
REFERENCES [dbo].[Account] ([uID])
GO
ALTER TABLE [dbo].[technology]  WITH CHECK ADD FOREIGN KEY([cateID])
REFERENCES [dbo].[category] ([cateID])
GO
ALTER TABLE [dbo].[technology]  WITH CHECK ADD FOREIGN KEY([sellID])
REFERENCES [dbo].[sell] ([sellID])
GO
