USE [master]
GO
/****** Object:  Database [Chat]    Script Date: 8/28/2022 1:44:39 PM ******/
CREATE DATABASE [Chat]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Chat', FILENAME = N'E:\SQL Server 2019\MSSQL15.MSSQLSERVER\MSSQL\DATA\Chat.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Chat_log', FILENAME = N'E:\SQL Server 2019\MSSQL15.MSSQLSERVER\MSSQL\DATA\Chat_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Chat] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Chat].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Chat] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Chat] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Chat] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Chat] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Chat] SET ARITHABORT OFF 
GO
ALTER DATABASE [Chat] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Chat] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Chat] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Chat] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Chat] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Chat] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Chat] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Chat] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Chat] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Chat] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Chat] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Chat] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Chat] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Chat] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Chat] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Chat] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [Chat] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Chat] SET RECOVERY FULL 
GO
ALTER DATABASE [Chat] SET  MULTI_USER 
GO
ALTER DATABASE [Chat] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Chat] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Chat] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Chat] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Chat] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Chat] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Chat', N'ON'
GO
ALTER DATABASE [Chat] SET QUERY_STORE = OFF
GO
USE [Chat]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 8/28/2022 1:44:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Chats]    Script Date: 8/28/2022 1:44:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Chats](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ChatName] [nvarchar](max) NOT NULL,
	[IsPrivate] [bit] NOT NULL,
 CONSTRAINT [PK_Chats] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChatUser]    Script Date: 8/28/2022 1:44:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChatUser](
	[ChatsId] [int] NOT NULL,
	[UsersId] [int] NOT NULL,
 CONSTRAINT [PK_ChatUser] PRIMARY KEY CLUSTERED 
(
	[ChatsId] ASC,
	[UsersId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Messages]    Script Date: 8/28/2022 1:44:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Messages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Content] [nvarchar](max) NOT NULL,
	[UserId] [int] NOT NULL,
	[ChatId] [int] NOT NULL,
	[DateCreated] [datetime2](7) NOT NULL,
	[isVisibleForUser] [bit] NOT NULL,
 CONSTRAINT [PK_Messages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 8/28/2022 1:44:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Pass] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220822164242_CreatedDB', N'7.0.0-preview.7.22376.2')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220822164540_CreatedModels', N'7.0.0-preview.7.22376.2')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220822164706_CreatedTables', N'7.0.0-preview.7.22376.2')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220822172257_ChangedMessages', N'7.0.0-preview.7.22376.2')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220824104731_ChangedChatModel', N'7.0.0-preview.7.22376.2')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220827102410_ChangedMessageModel', N'7.0.0-preview.7.22376.2')
GO
SET IDENTITY_INSERT [dbo].[Chats] ON 

INSERT [dbo].[Chats] ([Id], [ChatName], [IsPrivate]) VALUES (5, N'AlexAndMoonler', 1)
INSERT [dbo].[Chats] ([Id], [ChatName], [IsPrivate]) VALUES (7, N'Public chat', 0)
INSERT [dbo].[Chats] ([Id], [ChatName], [IsPrivate]) VALUES (9, N'MoonlerAndbloowb0und', 1)
INSERT [dbo].[Chats] ([Id], [ChatName], [IsPrivate]) VALUES (10, N'bloowb0undAndAlex', 1)
SET IDENTITY_INSERT [dbo].[Chats] OFF
GO
INSERT [dbo].[ChatUser] ([ChatsId], [UsersId]) VALUES (5, 1)
INSERT [dbo].[ChatUser] ([ChatsId], [UsersId]) VALUES (7, 1)
INSERT [dbo].[ChatUser] ([ChatsId], [UsersId]) VALUES (9, 1)
INSERT [dbo].[ChatUser] ([ChatsId], [UsersId]) VALUES (7, 2)
INSERT [dbo].[ChatUser] ([ChatsId], [UsersId]) VALUES (9, 2)
INSERT [dbo].[ChatUser] ([ChatsId], [UsersId]) VALUES (10, 2)
INSERT [dbo].[ChatUser] ([ChatsId], [UsersId]) VALUES (5, 3)
INSERT [dbo].[ChatUser] ([ChatsId], [UsersId]) VALUES (7, 3)
INSERT [dbo].[ChatUser] ([ChatsId], [UsersId]) VALUES (10, 3)
GO
SET IDENTITY_INSERT [dbo].[Messages] ON 

INSERT [dbo].[Messages] ([Id], [Content], [UserId], [ChatId], [DateCreated], [isVisibleForUser]) VALUES (53, N'Alex connected!', 3, 7, CAST(N'2022-08-24T16:04:08.2087070' AS DateTime2), 1)
INSERT [dbo].[Messages] ([Id], [Content], [UserId], [ChatId], [DateCreated], [isVisibleForUser]) VALUES (54, N'Moonler connected!', 1, 9, CAST(N'2022-08-24T16:06:15.5085459' AS DateTime2), 1)
INSERT [dbo].[Messages] ([Id], [Content], [UserId], [ChatId], [DateCreated], [isVisibleForUser]) VALUES (55, N'Moonler: kek', 1, 9, CAST(N'2022-08-24T16:06:59.8408702' AS DateTime2), 1)
INSERT [dbo].[Messages] ([Id], [Content], [UserId], [ChatId], [DateCreated], [isVisibleForUser]) VALUES (56, N'Moonler: aasds', 1, 9, CAST(N'2022-08-24T16:07:48.7393035' AS DateTime2), 1)
INSERT [dbo].[Messages] ([Id], [Content], [UserId], [ChatId], [DateCreated], [isVisibleForUser]) VALUES (61, N'Alex connected!', 3, 7, CAST(N'2022-08-24T16:09:20.0998394' AS DateTime2), 1)
INSERT [dbo].[Messages] ([Id], [Content], [UserId], [ChatId], [DateCreated], [isVisibleForUser]) VALUES (169, N'Alex connected!', 3, 5, CAST(N'2022-08-25T18:00:46.3331816' AS DateTime2), 1)
INSERT [dbo].[Messages] ([Id], [Content], [UserId], [ChatId], [DateCreated], [isVisibleForUser]) VALUES (191, N'Alex: lol?', 3, 5, CAST(N'2022-08-26T17:21:33.7748576' AS DateTime2), 1)
INSERT [dbo].[Messages] ([Id], [Content], [UserId], [ChatId], [DateCreated], [isVisibleForUser]) VALUES (192, N'Alex connected!', 3, 5, CAST(N'2022-08-26T17:23:45.1803345' AS DateTime2), 1)
INSERT [dbo].[Messages] ([Id], [Content], [UserId], [ChatId], [DateCreated], [isVisibleForUser]) VALUES (194, N'bloowb0und connected!', 2, 10, CAST(N'2022-08-26T17:23:51.7364139' AS DateTime2), 1)
INSERT [dbo].[Messages] ([Id], [Content], [UserId], [ChatId], [DateCreated], [isVisibleForUser]) VALUES (198, N'Moonler: asd', 1, 9, CAST(N'2022-08-26T17:46:00.3955383' AS DateTime2), 1)
INSERT [dbo].[Messages] ([Id], [Content], [UserId], [ChatId], [DateCreated], [isVisibleForUser]) VALUES (212, N'Alex: asdasdasd', 3, 5, CAST(N'2022-08-26T18:24:18.4992106' AS DateTime2), 1)
INSERT [dbo].[Messages] ([Id], [Content], [UserId], [ChatId], [DateCreated], [isVisibleForUser]) VALUES (214, N'Moonler: Hello chat', 1, 5, CAST(N'2022-08-26T18:24:35.0658155' AS DateTime2), 1)
INSERT [dbo].[Messages] ([Id], [Content], [UserId], [ChatId], [DateCreated], [isVisibleForUser]) VALUES (215, N'Alex: asd', 3, 5, CAST(N'2022-08-26T18:36:54.2157964' AS DateTime2), 1)
INSERT [dbo].[Messages] ([Id], [Content], [UserId], [ChatId], [DateCreated], [isVisibleForUser]) VALUES (216, N'Alex: asd', 3, 5, CAST(N'2022-08-26T18:36:54.7999887' AS DateTime2), 1)
INSERT [dbo].[Messages] ([Id], [Content], [UserId], [ChatId], [DateCreated], [isVisibleForUser]) VALUES (217, N'Alex: asd', 3, 5, CAST(N'2022-08-26T18:36:55.3700432' AS DateTime2), 1)
INSERT [dbo].[Messages] ([Id], [Content], [UserId], [ChatId], [DateCreated], [isVisibleForUser]) VALUES (218, N'Alex: asd', 3, 5, CAST(N'2022-08-26T18:36:55.8372307' AS DateTime2), 1)
INSERT [dbo].[Messages] ([Id], [Content], [UserId], [ChatId], [DateCreated], [isVisibleForUser]) VALUES (219, N'Alex: asd', 3, 5, CAST(N'2022-08-26T18:36:56.2810523' AS DateTime2), 1)
INSERT [dbo].[Messages] ([Id], [Content], [UserId], [ChatId], [DateCreated], [isVisibleForUser]) VALUES (220, N'Alex: asd', 3, 5, CAST(N'2022-08-26T18:36:56.6548282' AS DateTime2), 1)
INSERT [dbo].[Messages] ([Id], [Content], [UserId], [ChatId], [DateCreated], [isVisibleForUser]) VALUES (221, N'Alex: asd', 3, 5, CAST(N'2022-08-26T18:36:57.0105732' AS DateTime2), 1)
INSERT [dbo].[Messages] ([Id], [Content], [UserId], [ChatId], [DateCreated], [isVisibleForUser]) VALUES (222, N'Alex: asd', 3, 5, CAST(N'2022-08-26T18:36:57.3338441' AS DateTime2), 1)
INSERT [dbo].[Messages] ([Id], [Content], [UserId], [ChatId], [DateCreated], [isVisibleForUser]) VALUES (223, N'Alex: asd', 3, 5, CAST(N'2022-08-26T18:36:57.6512065' AS DateTime2), 1)
INSERT [dbo].[Messages] ([Id], [Content], [UserId], [ChatId], [DateCreated], [isVisibleForUser]) VALUES (224, N'Alex: asd', 3, 5, CAST(N'2022-08-26T18:36:57.9613769' AS DateTime2), 1)
INSERT [dbo].[Messages] ([Id], [Content], [UserId], [ChatId], [DateCreated], [isVisibleForUser]) VALUES (225, N'Alex: sd', 3, 5, CAST(N'2022-08-26T18:36:58.2592591' AS DateTime2), 1)
INSERT [dbo].[Messages] ([Id], [Content], [UserId], [ChatId], [DateCreated], [isVisibleForUser]) VALUES (227, N'Alex: sdasd', 3, 5, CAST(N'2022-08-26T18:36:58.7918976' AS DateTime2), 1)
INSERT [dbo].[Messages] ([Id], [Content], [UserId], [ChatId], [DateCreated], [isVisibleForUser]) VALUES (228, N'Alex: d', 3, 5, CAST(N'2022-08-26T18:36:59.0452604' AS DateTime2), 1)
INSERT [dbo].[Messages] ([Id], [Content], [UserId], [ChatId], [DateCreated], [isVisibleForUser]) VALUES (230, N'Alex: dasd', 3, 5, CAST(N'2022-08-26T18:36:59.5663230' AS DateTime2), 1)
INSERT [dbo].[Messages] ([Id], [Content], [UserId], [ChatId], [DateCreated], [isVisibleForUser]) VALUES (231, N'Alex: d', 3, 5, CAST(N'2022-08-26T18:36:59.8164957' AS DateTime2), 1)
INSERT [dbo].[Messages] ([Id], [Content], [UserId], [ChatId], [DateCreated], [isVisibleForUser]) VALUES (235, N'bloowb0und: asd', 1, 9, CAST(N'2022-08-27T12:45:36.1414661' AS DateTime2), 1)
INSERT [dbo].[Messages] ([Id], [Content], [UserId], [ChatId], [DateCreated], [isVisibleForUser]) VALUES (236, N'bloowb0und: asd', 2, 9, CAST(N'2022-08-27T12:45:36.1415225' AS DateTime2), 1)
INSERT [dbo].[Messages] ([Id], [Content], [UserId], [ChatId], [DateCreated], [isVisibleForUser]) VALUES (237, N'Moonler: kek', 1, 9, CAST(N'2022-08-27T12:45:37.9311288' AS DateTime2), 1)
INSERT [dbo].[Messages] ([Id], [Content], [UserId], [ChatId], [DateCreated], [isVisibleForUser]) VALUES (238, N'Moonler: kek', 2, 9, CAST(N'2022-08-27T12:45:37.9311253' AS DateTime2), 1)
INSERT [dbo].[Messages] ([Id], [Content], [UserId], [ChatId], [DateCreated], [isVisibleForUser]) VALUES (246, N'Moonler: kek', 1, 5, CAST(N'2022-08-27T14:30:52.7805729' AS DateTime2), 1)
INSERT [dbo].[Messages] ([Id], [Content], [UserId], [ChatId], [DateCreated], [isVisibleForUser]) VALUES (247, N'Alex: kek', 3, 5, CAST(N'2022-08-27T15:33:58.0794341' AS DateTime2), 1)
INSERT [dbo].[Messages] ([Id], [Content], [UserId], [ChatId], [DateCreated], [isVisibleForUser]) VALUES (248, N'Alex: rofl', 3, 5, CAST(N'2022-08-27T15:36:10.5014516' AS DateTime2), 1)
INSERT [dbo].[Messages] ([Id], [Content], [UserId], [ChatId], [DateCreated], [isVisibleForUser]) VALUES (249, N'Alex: ?', 3, 5, CAST(N'2022-08-27T15:36:16.3023209' AS DateTime2), 1)
INSERT [dbo].[Messages] ([Id], [Content], [UserId], [ChatId], [DateCreated], [isVisibleForUser]) VALUES (250, N'Alex: vshoki', 3, 5, CAST(N'2022-08-27T15:36:23.0822328' AS DateTime2), 1)
INSERT [dbo].[Messages] ([Id], [Content], [UserId], [ChatId], [DateCreated], [isVisibleForUser]) VALUES (252, N'Alex: In reply to Alex connected!: pip', 3, 7, CAST(N'2022-08-27T16:11:00.5539793' AS DateTime2), 1)
INSERT [dbo].[Messages] ([Id], [Content], [UserId], [ChatId], [DateCreated], [isVisibleForUser]) VALUES (256, N'Alex: hello)', 3, 5, CAST(N'2022-08-28T12:12:20.3603603' AS DateTime2), 1)
INSERT [dbo].[Messages] ([Id], [Content], [UserId], [ChatId], [DateCreated], [isVisibleForUser]) VALUES (257, N'Alex: Alex', 3, 5, CAST(N'2022-08-28T12:12:43.3731215' AS DateTime2), 1)
INSERT [dbo].[Messages] ([Id], [Content], [UserId], [ChatId], [DateCreated], [isVisibleForUser]) VALUES (285, N'Alex: sup', 3, 5, CAST(N'2022-08-28T13:05:22.5976388' AS DateTime2), 0)
INSERT [dbo].[Messages] ([Id], [Content], [UserId], [ChatId], [DateCreated], [isVisibleForUser]) VALUES (287, N'Moonler: Change Test by Moonler', 1, 5, CAST(N'2022-08-28T13:06:15.2598234' AS DateTime2), 0)
INSERT [dbo].[Messages] ([Id], [Content], [UserId], [ChatId], [DateCreated], [isVisibleForUser]) VALUES (288, N'Alex: Еуые', 3, 5, CAST(N'2022-08-28T13:12:19.3173245' AS DateTime2), 1)
INSERT [dbo].[Messages] ([Id], [Content], [UserId], [ChatId], [DateCreated], [isVisibleForUser]) VALUES (289, N'Alex: Test?', 3, 5, CAST(N'2022-08-28T13:15:57.8056316' AS DateTime2), 1)
INSERT [dbo].[Messages] ([Id], [Content], [UserId], [ChatId], [DateCreated], [isVisibleForUser]) VALUES (290, N'Moonler: In reply to Alex: In reply to Alex connected!: pip: hello', 1, 5, CAST(N'2022-08-28T13:42:56.3811073' AS DateTime2), 1)
SET IDENTITY_INSERT [dbo].[Messages] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [Name], [Pass]) VALUES (1, N'Moonler', N'1234')
INSERT [dbo].[Users] ([Id], [Name], [Pass]) VALUES (2, N'bloowb0und', N'12345')
INSERT [dbo].[Users] ([Id], [Name], [Pass]) VALUES (3, N'Alex', N'12345')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
/****** Object:  Index [IX_ChatUser_UsersId]    Script Date: 8/28/2022 1:44:40 PM ******/
CREATE NONCLUSTERED INDEX [IX_ChatUser_UsersId] ON [dbo].[ChatUser]
(
	[UsersId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Messages_ChatId]    Script Date: 8/28/2022 1:44:40 PM ******/
CREATE NONCLUSTERED INDEX [IX_Messages_ChatId] ON [dbo].[Messages]
(
	[ChatId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Messages_UserId]    Script Date: 8/28/2022 1:44:40 PM ******/
CREATE NONCLUSTERED INDEX [IX_Messages_UserId] ON [dbo].[Messages]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Chats] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsPrivate]
GO
ALTER TABLE [dbo].[Messages] ADD  DEFAULT ('0001-01-01T00:00:00.0000000') FOR [DateCreated]
GO
ALTER TABLE [dbo].[Messages] ADD  DEFAULT (CONVERT([bit],(0))) FOR [isVisibleForUser]
GO
ALTER TABLE [dbo].[ChatUser]  WITH CHECK ADD  CONSTRAINT [FK_ChatUser_Chats_ChatsId] FOREIGN KEY([ChatsId])
REFERENCES [dbo].[Chats] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ChatUser] CHECK CONSTRAINT [FK_ChatUser_Chats_ChatsId]
GO
ALTER TABLE [dbo].[ChatUser]  WITH CHECK ADD  CONSTRAINT [FK_ChatUser_Users_UsersId] FOREIGN KEY([UsersId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ChatUser] CHECK CONSTRAINT [FK_ChatUser_Users_UsersId]
GO
ALTER TABLE [dbo].[Messages]  WITH CHECK ADD  CONSTRAINT [FK_Messages_Chats_ChatId] FOREIGN KEY([ChatId])
REFERENCES [dbo].[Chats] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Messages] CHECK CONSTRAINT [FK_Messages_Chats_ChatId]
GO
ALTER TABLE [dbo].[Messages]  WITH CHECK ADD  CONSTRAINT [FK_Messages_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Messages] CHECK CONSTRAINT [FK_Messages_Users_UserId]
GO
USE [master]
GO
ALTER DATABASE [Chat] SET  READ_WRITE 
GO
