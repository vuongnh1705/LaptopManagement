use master
go
IF EXISTS(SELECT name FROM sys.sysdatabases WHERE name='LaptopShop')
	DROP DATABASE LaptopShop
GO
create database LaptopShop
go
USE [LaptopShop]
GO
/****** Object:  Table [dbo].[Brand]    Script Date: 12/9/2020 12:05:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brand](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Brand_Name] [nvarchar](30) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 12/9/2020 12:05:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Product_Id] [int] NULL,
	[Quantity] [int] NULL,
	[Combo_ID] [int] NULL,
	[UserID] [int] NOT NULL
 CONSTRAINT [PK_Cart] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Catalog]    Script Date: 12/9/2020 12:05:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Catalog](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Catalog_Name] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Combo]    Script Date: 12/9/2020 12:05:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Combo](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Combo_Name] [nvarchar](50) NOT NULL,
	[Product_List] [text] NOT NULL,
	[startDate] [date] NOT NULL,
	[endDate] [date] NOT NULL,
	[totalMoney] [decimal](10, 0) NOT NULL,
	[discount] int NOT NULL,
 CONSTRAINT [PK__Combo__3214EC27DB0F4795] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Invoice]    Script Date: 12/9/2020 12:05:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invoice](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Customer_ID] [int] NOT NULL,
	[Employee_ID] [int] NULL,
	[totalMoney] [decimal](10, 0) NOT NULL,
	[createdDate] [date] NOT NULL,
	[customerAddress] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InvoiceDetail]    Script Date: 12/9/2020 12:05:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InvoiceDetail](
	[Invoice_ID] [int] NOT NULL,
	[Product_ID] [int] NULL,
	[Combo_ID] [int] NULL,
	[Amount] [int] NOT NULL,
	[Price] [decimal](10, 0) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 12/9/2020 12:05:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Product_Name] [nvarchar](80) NOT NULL,
	[Catalog_ID] [int] NOT NULL,
	[Amount] [int] NOT NULL,
	[Price] [decimal](10, 0) NOT NULL,
	[Image] [text] NULL,
	[Discount] int NULL,
	[Detail] [nvarchar](600) NULL,
	[Brand_ID] [int] NULL,
 CONSTRAINT [PK__Product__3214EC271154E5A8] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductDetail]    Script Date: 12/9/2020 12:05:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductDetail](
	[Product_ID] [int] IDENTITY(1,1) NOT NULL,
	[Product_Detail] [nvarchar](650) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Product_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 12/9/2020 12:05:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Role_Name] [nvarchar](25) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 12/9/2020 12:05:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[firstName] [nvarchar](50) NULL,
	[lastName] [nvarchar](20) NULL,
	[gender] [bit] NOT NULL,
	[birthDate] [date] NULL,
	[address] [text] NULL,
	[joinDate] [date] NULL,
	[isDisable] [bit] NOT NULL,
	[Role_ID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 12/13/2020 4:50:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Date] [date] NULL,
	[Total_Price] [float] NULL,
	[Customer_Id] [int] NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 12/13/2020 4:50:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Order_Id] [int] NULL,
	[Product_Id] [int] NULL,
	[Combo_Id] [int] NULL,
	[Quantity] [int] NULL,
	[Price] [float] NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Brand] ON 

INSERT [dbo].[Brand] ([ID], [Brand_Name]) VALUES (1, N'Dell')
INSERT [dbo].[Brand] ([ID], [Brand_Name]) VALUES (2, N'Asus')
SET IDENTITY_INSERT [dbo].[Brand] OFF
GO
SET IDENTITY_INSERT [dbo].[Catalog] ON 

INSERT [dbo].[Catalog] ([ID], [Catalog_Name]) VALUES (1, N'PC')
INSERT [dbo].[Catalog] ([ID], [Catalog_Name]) VALUES (2, N'Bàn Phím')
INSERT [dbo].[Catalog] ([ID], [Catalog_Name]) VALUES (3, N'Chuột')
INSERT [dbo].[Catalog] ([ID], [Catalog_Name]) VALUES (4, N'Tai nghe')
INSERT [dbo].[Catalog] ([ID], [Catalog_Name]) VALUES (5, N'Loa')
INSERT [dbo].[Catalog] ([ID], [Catalog_Name]) VALUES (6, N'Laptop')
INSERT [dbo].[Catalog] ([ID], [Catalog_Name]) VALUES (7, N'Ghế Gaming')
INSERT [dbo].[Catalog] ([ID], [Catalog_Name]) VALUES (8, N'Thiết bị văn phòng')
INSERT [dbo].[Catalog] ([ID], [Catalog_Name]) VALUES (9, N'Combo')
SET IDENTITY_INSERT [dbo].[Catalog] OFF
GO
SET IDENTITY_INSERT [dbo].[Combo] ON 

INSERT [dbo].[Combo] ([ID], [Combo_Name], [Product_List], [startDate], [endDate], [totalMoney], [discount]) VALUES (1, N'Giảm giá Giáng Sinh', N'1;3;5;7', CAST(N'2015-11-20' AS Date), CAST(N'2015-11-20' AS Date), 10, 15)
SET IDENTITY_INSERT [dbo].[Combo] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ID], [Product_Name], [Catalog_ID], [Amount], [Price], [Image], [Discount], [Detail], [Brand_ID]) VALUES (1, N'Dell Vostro 15 5590', 6, 10, CAST(19590000 AS Decimal(10, 0)), N'/Assets/Layout2/images/Laptop/Dell/vostro5590_00.jpg', 10, N'CPU: Intel Core i3 Ice Lake, 1005G1, 1.20 GHz;RAM: 8 GB, DDR4 (On board 4GB +1 khe 4GB), 2400 MHz;Ổ cứng: SSD 512 GB M.2 PCIe, Hỗ trợ khe cắm HDD SATA;Màn hình: 15.6 inch, Full HD (1920 x 1080);Card màn hình: Card đồ họa tích hợp, Intel UHD Graphics;Cổng kết nối: 2 x USB 2.0, USB 3.1, HDMI, LAN (RJ45);Hệ điều hành: Windows 10 Home SL;Thiết kế: Vỏ nhựa, PIN liền;Kích thước: Dày 19.9 mm, 1.7 kg', 1),
																																(2, N'Dell Inspiron 7501', 6, 5, CAST(29290000 AS Decimal(10, 0)), N'/Assets/Layout2/images/Laptop/Dell/inspiron7501_00.jpg', 0, N'CPU: Intel Core i3 Ice Lake, 1005G1, 1.20 GHz;RAM: 8 GB, DDR4 (On board 4GB +1 khe 4GB), 2400 MHz;Ổ cứng: SSD 512 GB M.2 PCIe, Hỗ trợ khe cắm HDD SATA;Màn hình: 15.6 inch, Full HD (1920 x 1080);Card màn hình: Card đồ họa tích hợp, Intel UHD Graphics;Cổng kết nối: 2 x USB 2.0, USB 3.1, HDMI, LAN (RJ45);Hệ điều hành: Windows 10 Home SL;Thiết kế: Vỏ nhựa, PIN liền;Kích thước: Dày 19.9 mm, 1.7 kg', 1),
																																(3, N'Bàn phím Newmen GM368', 2, 18, CAST(790000 AS Decimal(10, 0)), N'/Assets/Layout2/images/Laptop/Dell/inspiron7501_00.jpg', 0, N'CPU: Intel Core i3 Ice Lake, 1005G1, 1.20 GHz;RAM: 8 GB, DDR4 (On board 4GB +1 khe 4GB), 2400 MHz;Ổ cứng: SSD 512 GB M.2 PCIe, Hỗ trợ khe cắm HDD SATA;Màn hình: 15.6 inch, Full HD (1920 x 1080);Card màn hình: Card đồ họa tích hợp, Intel UHD Graphics;Cổng kết nối: 2 x USB 2.0, USB 3.1, HDMI, LAN (RJ45);Hệ điều hành: Windows 10 Home SL;Thiết kế: Vỏ nhựa, PIN liền;Kích thước: Dày 19.9 mm, 1.7 kg', 0),
																																(4, N'Bàn phím E-Dra EK311', 2, 15, CAST(690000 AS Decimal(10, 0)), N'/Assets/Layout2/images/Laptop/Dell/inspiron7501_00.jpg', 0, N'CPU: Intel Core i3 Ice Lake, 1005G1, 1.20 GHz;RAM: 8 GB, DDR4 (On board 4GB +1 khe 4GB), 2400 MHz;Ổ cứng: SSD 512 GB M.2 PCIe, Hỗ trợ khe cắm HDD SATA;Màn hình: 15.6 inch, Full HD (1920 x 1080);Card màn hình: Card đồ họa tích hợp, Intel UHD Graphics;Cổng kết nối: 2 x USB 2.0, USB 3.1, HDMI, LAN (RJ45);Hệ điều hành: Windows 10 Home SL;Thiết kế: Vỏ nhựa, PIN liền;Kích thước: Dày 19.9 mm, 1.7 kg', 0),
																																(5, N'Chuột Gaming Zadez G151M Ðen', 3, 15, CAST(300000 AS Decimal(10, 0)), N'/Assets/Layout2/images/Laptop/Dell/dell-gaming-g7-7590-GamingG77590.jpg', 0, N'CPU: Intel Core i3 Ice Lake, 1005G1, 1.20 GHz;RAM: 8 GB, DDR4 (On board 4GB +1 khe 4GB), 2400 MHz;Ổ cứng: SSD 512 GB M.2 PCIe, Hỗ trợ khe cắm HDD SATA;Màn hình: 15.6 inch, Full HD (1920 x 1080);Card màn hình: Card đồ họa tích hợp, Intel UHD Graphics;Cổng kết nối: 2 x USB 2.0, USB 3.1, HDMI, LAN (RJ45);Hệ điều hành: Windows 10 Home SL;Thiết kế: Vỏ nhựa, PIN liền;Kích thước: Dày 19.9 mm, 1.7 kg', 0),
																																(6, N'Chuộtt không dây Zadez M353 Xám', 3, 10, CAST(300000 AS Decimal(10, 0)), N'/Assets/Layout2/images/Laptop/Dell/inspiron7501_00.jpg', 0, N'CPU: Intel Core i3 Ice Lake, 1005G1, 1.20 GHz;RAM: 8 GB, DDR4 (On board 4GB +1 khe 4GB), 2400 MHz;Ổ cứng: SSD 512 GB M.2 PCIe, Hỗ trợ khe cắm HDD SATA;Màn hình: 15.6 inch, Full HD (1920 x 1080);Card màn hình: Card đồ họa tích hợp, Intel UHD Graphics;Cổng kết nối: 2 x USB 2.0, USB 3.1, HDMI, LAN (RJ45);Hệ điều hành: Windows 10 Home SL;Thiết kế: Vỏ nhựa, PIN liền;Kích thước: Dày 19.9 mm, 1.7 kg', 0),
																																(7, N'Tai nghe Bluetooth True Wireless Mozard Air 3 Ðen', 4, 10, CAST(800000 AS Decimal(10, 0)), N'/Assets/Layout2/images/Laptop/Dell/inspiron7501_00.jpg', 0, N'CPU: Intel Core i3 Ice Lake, 1005G1, 1.20 GHz;RAM: 8 GB, DDR4 (On board 4GB +1 khe 4GB), 2400 MHz;Ổ cứng: SSD 512 GB M.2 PCIe, Hỗ trợ khe cắm HDD SATA;Màn hình: 15.6 inch, Full HD (1920 x 1080);Card màn hình: Card đồ họa tích hợp, Intel UHD Graphics;Cổng kết nối: 2 x USB 2.0, USB 3.1, HDMI, LAN (RJ45);Hệ điều hành: Windows 10 Home SL;Thiết kế: Vỏ nhựa, PIN liền;Kích thước: Dày 19.9 mm, 1.7 kg', 0),
																																(8, N'Tai nghe Bluetooth True Wireless Jabra Elite Activ', 4, 5, CAST(3790000 AS Decimal(10, 0)), N'/Assets/Layout2/images/Laptop/Dell/inspiron7501_00.jpg', 0, N'CPU: Intel Core i3 Ice Lake, 1005G1, 1.20 GHz;RAM: 8 GB, DDR4 (On board 4GB +1 khe 4GB), 2400 MHz;Ổ cứng: SSD 512 GB M.2 PCIe, Hỗ trợ khe cắm HDD SATA;Màn hình: 15.6 inch, Full HD (1920 x 1080);Card màn hình: Card đồ họa tích hợp, Intel UHD Graphics;Cổng kết nối: 2 x USB 2.0, USB 3.1, HDMI, LAN (RJ45);Hệ điều hành: Windows 10 Home SL;Thiết kế: Vỏ nhựa, PIN liền;Kích thước: Dày 19.9 mm, 1.7 kg', 0),
																																(9, N'Loa Bluetooth LG Xboom Go PL7 Xanh Ðen', 5, 8, CAST(3390000 AS Decimal(10, 0)), N'/Assets/Layout2/images/Laptop/Dell/dell-gaming-g7-7590-GamingG77590.jpg', 0, N'CPU: Intel Core i3 Ice Lake, 1005G1, 1.20 GHz;RAM: 8 GB, DDR4 (On board 4GB +1 khe 4GB), 2400 MHz;Ổ cứng: SSD 512 GB M.2 PCIe, Hỗ trợ khe cắm HDD SATA;Màn hình: 15.6 inch, Full HD (1920 x 1080);Card màn hình: Card đồ họa tích hợp, Intel UHD Graphics;Cổng kết nối: 2 x USB 2.0, USB 3.1, HDMI, LAN (RJ45);Hệ điều hành: Windows 10 Home SL;Thiết kế: Vỏ nhựa, PIN liền;Kích thước: Dày 19.9 mm, 1.7 kg', 0),
																																(10, N'Loa Bluetooth JBL PULSE2BLKAS Ðen', 5, 6, CAST(2952000 AS Decimal(10, 0)), N'/Assets/Layout2/images/Laptop/Dell/dell-gaming-g7-7590-GamingG77590.jpg', 0, N'CPU: Intel Core i3 Ice Lake, 1005G1, 1.20 GHz;RAM: 8 GB, DDR4 (On board 4GB +1 khe 4GB), 2400 MHz;Ổ cứng: SSD 512 GB M.2 PCIe, Hỗ trợ khe cắm HDD SATA;Màn hình: 15.6 inch, Full HD (1920 x 1080);Card màn hình: Card đồ họa tích hợp, Intel UHD Graphics;Cổng kết nối: 2 x USB 2.0, USB 3.1, HDMI, LAN (RJ45);Hệ điều hành: Windows 10 Home SL;Thiết kế: Vỏ nhựa, PIN liền;Kích thước: Dày 19.9 mm, 1.7 kg', 0),
																																(11, N'GVN Titan 10 M', 1, 10, CAST(8990000 AS Decimal(10, 0)), N'/Assets/Layout2/images/Laptop/Dell/dell-gaming-g7-7590-GamingG77590.jpg', 0, N'CPU: Intel Core i3 Ice Lake, 1005G1, 1.20 GHz;RAM: 8 GB, DDR4 (On board 4GB +1 khe 4GB), 2400 MHz;Ổ cứng: SSD 512 GB M.2 PCIe, Hỗ trợ khe cắm HDD SATA;Màn hình: 15.6 inch, Full HD (1920 x 1080);Card màn hình: Card đồ họa tích hợp, Intel UHD Graphics;Cổng kết nối: 2 x USB 2.0, USB 3.1, HDMI, LAN (RJ45);Hệ điều hành: Windows 10 Home SL;Thiết kế: Vỏ nhựa, PIN liền;Kích thước: Dày 19.9 mm, 1.7 kg', 0),
																																(12, N'Dell Gaming G7 7590', 6, 10, CAST(21990000 AS Decimal(10, 0)), N'/Assets/Layout2/images/Laptop/Dell/dell-gaming-g7-7590-GamingG77590.jpg', 0, N'CPU: Intel Core i3 Ice Lake, 1005G1, 1.20 GHz;RAM: 8 GB, DDR4 (On board 4GB +1 khe 4GB), 2400 MHz;Ổ cứng: SSD 512 GB M.2 PCIe, Hỗ trợ khe cắm HDD SATA;Màn hình: 15.6 inch, Full HD (1920 x 1080);Card màn hình: Card đồ họa tích hợp, Intel UHD Graphics;Cổng kết nối: 2 x USB 2.0, USB 3.1, HDMI, LAN (RJ45);Hệ điều hành: Windows 10 Home SL;Thiết kế: Vỏ nhựa, PIN liền;Kích thước: Dày 19.9 mm, 1.7 kg', 2),
																																(13, N'Dell XPS 15 9500', 6, 10, CAST(37990000 AS Decimal(10, 0)), N'/Assets/Layout2/images/Laptop/Dell/dell-xps-15-9500-XPS159500.jpg', 0, N'CPU: Intel Core i3 Ice Lake, 1005G1, 1.20 GHz;RAM: 8 GB, DDR4 (On board 4GB +1 khe 4GB), 2400 MHz;Ổ cứng: SSD 512 GB M.2 PCIe, Hỗ trợ khe cắm HDD SATA;Màn hình: 15.6 inch, Full HD (1920 x 1080);Card màn hình: Card đồ họa tích hợp, Intel UHD Graphics;Cổng kết nối: 2 x USB 2.0, USB 3.1, HDMI, LAN (RJ45);Hệ điều hành: Windows 10 Home SL;Thiết kế: Vỏ nhựa, PIN liền;Kích thước: Dày 19.9 mm, 1.7 kg', 1),
																																(14, N'Dell Inspiron 14 5402', 6, 10, CAST(19490000 AS Decimal(10, 0)), N'/Assets/Layout2/images/Laptop/Dell/5402_00.jpg', 0, N'CPU: Intel Core i3 Ice Lake, 1005G1, 1.20 GHz;RAM: 8 GB, DDR4 (On board 4GB +1 khe 4GB), 2400 MHz;Ổ cứng: SSD 512 GB M.2 PCIe, Hỗ trợ khe cắm HDD SATA;Màn hình: 15.6 inch, Full HD (1920 x 1080);Card màn hình: Card đồ họa tích hợp, Intel UHD Graphics;Cổng kết nối: 2 x USB 2.0, USB 3.1, HDMI, LAN (RJ45);Hệ điều hành: Windows 10 Home SL;Thiết kế: Vỏ nhựa, PIN liền;Kích thước: Dày 19.9 mm, 1.7 kg', 1),
																																(15, N'Dell XPS 13 9310', 6, 10, CAST(33990000 AS Decimal(10, 0)), N'/Assets/Layout2/images/Laptop/Dell/xps93102-1s_00.jpg', 0, N'CPU: Intel Core i3 Ice Lake, 1005G1, 1.20 GHz;RAM: 8 GB, DDR4 (On board 4GB +1 khe 4GB), 2400 MHz;Ổ cứng: SSD 512 GB M.2 PCIe, Hỗ trợ khe cắm HDD SATA;Màn hình: 15.6 inch, Full HD (1920 x 1080);Card màn hình: Card đồ họa tích hợp, Intel UHD Graphics;Cổng kết nối: 2 x USB 2.0, USB 3.1, HDMI, LAN (RJ45);Hệ điều hành: Windows 10 Home SL;Thiết kế: Vỏ nhựa, PIN liền;Kích thước: Dày 19.9 mm, 1.7 kg', 1),
																																(16, N'Dell XPS 13 7390', 6, 10, CAST(23990000 AS Decimal(10, 0)), N'/Assets/Layout2/images/Laptop/Dell/dell-xps-13-7390-XPS7390.jpg', 0, N'CPU: Intel Core i3 Ice Lake, 1005G1, 1.20 GHz;RAM: 8 GB, DDR4 (On board 4GB +1 khe 4GB), 2400 MHz;Ổ cứng: SSD 512 GB M.2 PCIe, Hỗ trợ khe cắm HDD SATA;Màn hình: 15.6 inch, Full HD (1920 x 1080);Card màn hình: Card đồ họa tích hợp, Intel UHD Graphics;Cổng kết nối: 2 x USB 2.0, USB 3.1, HDMI, LAN (RJ45);Hệ điều hành: Windows 10 Home SL;Thiết kế: Vỏ nhựa, PIN liền;Kích thước: Dày 19.9 mm, 1.7 kg', 1),
																																(17, N'Dell Inspiron 13 7306', 6, 10, CAST(34990000 AS Decimal(10, 0)), N'/Assets/Layout2/images/Laptop/Dell/Inspiron7306_00.jpg', 0, N'CPU: Intel Core i3 Ice Lake, 1005G1, 1.20 GHz;RAM: 8 GB, DDR4 (On board 4GB +1 khe 4GB), 2400 MHz;Ổ cứng: SSD 512 GB M.2 PCIe, Hỗ trợ khe cắm HDD SATA;Màn hình: 15.6 inch, Full HD (1920 x 1080);Card màn hình: Card đồ họa tích hợp, Intel UHD Graphics;Cổng kết nối: 2 x USB 2.0, USB 3.1, HDMI, LAN (RJ45);Hệ điều hành: Windows 10 Home SL;Thiết kế: Vỏ nhựa, PIN liền;Kích thước: Dày 19.9 mm, 1.7 kg', 1),
																																(18, N'Dell XPS 13 9310 2-in-1', 6, 10, CAST(38990000 AS Decimal(10, 0)), N'/Assets/Layout2/images/Laptop/Dell/xps93102-1s_00.jpg', 0, N'CPU: Intel Core i3 Ice Lake, 1005G1, 1.20 GHz;RAM: 8 GB, DDR4 (On board 4GB +1 khe 4GB), 2400 MHz;Ổ cứng: SSD 512 GB M.2 PCIe, Hỗ trợ khe cắm HDD SATA;Màn hình: 15.6 inch, Full HD (1920 x 1080);Card màn hình: Card đồ họa tích hợp, Intel UHD Graphics;Cổng kết nối: 2 x USB 2.0, USB 3.1, HDMI, LAN (RJ45);Hệ điều hành: Windows 10 Home SL;Thiết kế: Vỏ nhựa, PIN liền;Kích thước: Dày 19.9 mm, 1.7 kg', 1);
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductDetail] ON 

INSERT [dbo].[ProductDetail] ([Product_ID], [Product_Detail]) VALUES (1, N'CPU: Intel Core i3 Ice Lake, 1005G1, 1.20 GHz;RAM: 8 GB, DDR4 (On board 4GB +1 khe 4GB), 2400 MHz;Ổ cứng: SSD 512 GB M.2 PCIe, Hỗ trợ khe cắm HDD SATA;Màn hình: 15.6 inch, Full HD (1920 x 1080);Card màn hình: Card đồ họa tích hợp, Intel UHD Graphics;Cổng kết nối: 2 x USB 2.0, USB 3.1, HDMI, LAN (RJ45);Hệ điều hành: Windows 10 Home SL;Thiết kế: Vỏ nhựa, PIN liền;Kích thước: Dày 19.9 mm, 1.7 kg'),
																	(2, N'CPU: Intel Core i7 Comet Lake, 10750H, 2.60 GHz;RAM: 8 GB, DDR4 (2 khe), 3200 MHz;Ổ cứng: Hỗ trợ thêm 2 khe cắm SSD M.2 PCIe, SSD 512 GB M.2 PCIe;Màn hình: 15.6 inch, Full HD (1920 x 1080), 144Hz;Card màn hình: Card đồ họa rời, NVIDIA GeForce GTX 1660Ti 6GB;Cổng kết nối: 3 x USB 3.2, HDMI, LAN (RJ45), USB Type-C;Hệ điều hành: Windows 10 Home SL;Thiết kế: Vỏ nhựa, PIN liền;Kích thước: Dày 25.8 mm, 2.3 Kg'),
																	(3, N'Model: GM368;Màu sắc: đen;Kiểu kết nối: bàn phím có dây, 160cm;Kết nối: USB 2.0;Phím chức năng: Standard;Kích thước: Full size, 485x230x40mm;Kiểu bàn phím: bàn phím cơ;Trọng lượng: 1083g'),
																	(4, N'Model: EK311;Loại bàn phím: Bàn phím cơ fullsize;Led: LED Rainbow siêu sáng;Switch: Outmenu;Kết nối: USB;Kích thước: Full size, 485x230x40mm;Chất liệu: kim loại'),
																	(5, N'Tương thích: Windows;Độ phân giải: 1200 - 3200 DPI;Cách kết nối: Dây cắm USB;Độ dài dây / Khoảng cách kết nối: Dây dài 158 cm;Trọng lượng: 69g;Thương hiệu của: Trung Quốc'),
																	(6, N'Tương thích: Windows;Độ phân giải: 1200 - 3200 DPI;Cách kết nối: Dây cắm USB;Độ dài dây / Khoảng cách kết nối: Dây dài 158 cm;Trọng lượng: 69g;Thương hiệu của: Trung Quốc'),
																	(7, N'Tương thích: Android, Windows, iOS (iPhone);Cổng sạc: Type-C;Thời gian sử dụng: 4 giờ;Thời gian sạc đầy: 2 giờ;Kết nối cùng lúc: 1 thiết bị;Hỗ trợ kết nối: 10m (Bluetooth 5.0);Phím điều khiển: Nghe/nhận cuộc gọi, Phát/dừng chơi nhạc, Chuyển bài hát, Tăng/giảm âm lượng;Thương hiệu: Thế Giới Di Động;Sản xuất tại: Trung Quốc'),
																	(8, N'Tương thích: Android, Windows, iOS (iPhone);Cổng sạc: Micro USB;Thời gian sử dụng: 5 giờ;Thời gian sạc đầy: 2 giờ;Kết nối cùng lúc: 2 thiết bị;Hỗ trợ kết nối: 10m (Bluetooth 5.0);Thương hiệu: Đan Mạch;Sản xuất tại: Trung Quốc'),
																	(9, N'Loại loa: Loa bluetooth;Tương thích: Android, Windows, iOS (iPhone);Tổng công suất: 30W;Thời gian sử dụng: dùng khoảng 24 giờ;Thời gian sạc đầy: 5 giờ;Công nghệ âm thanh: Meridian, Sound boost;Kết nối không dây: Bluetooth;Kết nối khác: AUX in;Tiện ích: Kết nối không dây nhiều loa cùng lúc, Chống nước IPX5, Google Assistant;Phím điều khiển: Bật/tắt bluetooth, Nút nguồn, Tăng/giảm âm lượng, Phát/dừng chơi nhạc;Điều khiển bằng điện thoại: LG XBoom;Kích thước: Dài 25 cm - Đường kính 10 cm - Nặng 1.46 kg;Thương hiệu của: Hàn Quốc'),
																	(10, N'Loại loa: Loa bluetooth;Tương thích: Android, Windows, iOS (iPhone);Tổng công suất: 16W;Thời gian sử dụng: dùng khoảng 10 giờ;Công nghệ âm thanh: JBL Connect;Kết nối không dây: Bluetooth 4.1;Kết nối khác: Jack 3.5 mm;Tiện ích: Có micro đàm thoại, Bật trợ lý ảo trên điện thoại, Chống nước IPX7;Phím điều khiển: Bật/tắt bluetooth, Nút nguồn, Tăng/giảm âm lượng, Phát/dừng chơi nhạc;Điều khiển bằng điện thoại: LG XBoom;Kích thước: Dài 19.5 cm - Đường kính 8 cm - Nặng 775 g;Thương hiệu của: Mỹ;'),
																	(11, N'Mainboard: MSI H410M-A PRO;CPU: Intel Pentium G6400 / 4MB / 4.0GHz / 2 Nhân 4 Luồng / LGA 1200RAM: G.SKILL Ripjaws V 1x8GB 2800VGA: MSI GTX 1650 VENTUS XS 4GB OC V1 GDDR6SSD: PNY SSD CS900 120G 2.5" Sata 3PSU: Deepcool DN450 80 PlusCase: Xigmatek NYX 3F RGB ( Mini Tower )');
SET IDENTITY_INSERT [dbo].[ProductDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([ID], [username], [password], [firstName], [lastName], [gender], [birthDate], [address], [joinDate], [isDisable], [Role_ID]) VALUES (1, N'NV_001', N'CVJuIRIHoFQ=', N'Nguyễn Văn', N'A', 1, CAST(N'1999-01-01' AS Date), N'193 Hàm T?', CAST(N'2015-11-20' AS Date), 0, 1),
																																						(2, N'NV_002', N'CVJuIRIHoFQ=', N'Nguyễn Văn', N'B', 0, CAST(N'1999-02-01' AS Date), N'193 Hàm T?', CAST(N'2015-11-20' AS Date), 0, 2),
																																						(3, N'NV_003', N'CVJuIRIHoFQ=', N'Nguyễn Văn', N'C', 0, CAST(N'1999-02-01' AS Date), N'193 Hàm T?', CAST(N'2015-11-20' AS Date),0,  2),
																																						(4, N'sieusaopolo15', N'CVJuIRIHoFQ=', N'Huỳnh Tuấn', N'Đạt', 1, CAST(N'2015-11-20' AS Date), N'267/16 Tùng Thi?n Vuong', CAST(N'2015-11-20' AS Date), 0, 3),
																																						(5, N'abcxyz', N'CVJuIRIHoFQ=', N'Nguyễn Văn', N'A', 1, CAST(N'2015-11-20' AS Date), N'193 Hàm T?', CAST(N'2015-11-20' AS Date), 0, 3),
																																						(6, N'hello', N'CVJuIRIHoFQ=', N'Nguyễn Văn', N'B', 1, CAST(N'2015-11-20' AS Date), N'193 Hàm T?', CAST(N'2015-11-20' AS Date), 0, 3),
																																						(7, N'trung', N'CVJuIRIHoFQ', N'Trung', N'Do Tham', 1, CAST(N'1999-01-13' AS Date), NULL, CAST(N'2001-01-01' AS Date), 0, 3);
SET IDENTITY_INSERT [dbo].[User] OFF
GO

SET IDENTITY_INSERT [dbo].[Role] ON 
INSERT [dbo].[Role] ([ID], [Role_Name]) VALUES (1,N'Admin'),
											   (2,N'Nhân viên'),
											   (3,N'Khách hàng');
SET IDENTITY_INSERT [dbo].[Role] OFF
