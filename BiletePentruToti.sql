USE [master]
GO
/****** Object:  Database [BiletePentruToti]    Script Date: 1/5/2020 4:52:52 PM ******/
CREATE DATABASE [BiletePentruToti]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BiletePentruToti', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER19\MSSQL\DATA\BiletePentruToti.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BiletePentruToti_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER19\MSSQL\DATA\BiletePentruToti_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [BiletePentruToti] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BiletePentruToti].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BiletePentruToti] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BiletePentruToti] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BiletePentruToti] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BiletePentruToti] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BiletePentruToti] SET ARITHABORT OFF 
GO
ALTER DATABASE [BiletePentruToti] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BiletePentruToti] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BiletePentruToti] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BiletePentruToti] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BiletePentruToti] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BiletePentruToti] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BiletePentruToti] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BiletePentruToti] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BiletePentruToti] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BiletePentruToti] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BiletePentruToti] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BiletePentruToti] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BiletePentruToti] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BiletePentruToti] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BiletePentruToti] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BiletePentruToti] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [BiletePentruToti] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BiletePentruToti] SET RECOVERY FULL 
GO
ALTER DATABASE [BiletePentruToti] SET  MULTI_USER 
GO
ALTER DATABASE [BiletePentruToti] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BiletePentruToti] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BiletePentruToti] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BiletePentruToti] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BiletePentruToti] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'BiletePentruToti', N'ON'
GO
ALTER DATABASE [BiletePentruToti] SET QUERY_STORE = OFF
GO
USE [BiletePentruToti]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 1/5/2020 4:52:52 PM ******/
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
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 1/5/2020 4:52:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [bigint] NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 1/5/2020 4:52:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 1/5/2020 4:52:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [bigint] NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 1/5/2020 4:52:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [bigint] NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 1/5/2020 4:52:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [bigint] NOT NULL,
	[RoleId] [bigint] NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 1/5/2020 4:52:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 1/5/2020 4:52:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [bigint] NOT NULL,
	[LoginProvider] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EventGenres]    Script Date: 1/5/2020 4:52:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventGenres](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_EventGenres] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EventParents]    Script Date: 1/5/2020 4:52:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventParents](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[EventTypeId] [bigint] NOT NULL,
	[EventGenreId] [bigint] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Deleted] [bit] NOT NULL,
	[DateAndHour] [datetime2](7) NOT NULL,
	[LocationId] [bigint] NOT NULL,
	[PersonId] [bigint] NOT NULL,
	[PhotoURL] [nvarchar](max) NULL,
 CONSTRAINT [PK_EventParents] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EventTypes]    Script Date: 1/5/2020 4:52:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventTypes](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_EventTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EventTypeXEventGenres]    Script Date: 1/5/2020 4:52:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventTypeXEventGenres](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[EventTypeId] [bigint] NOT NULL,
	[EventGenreId] [bigint] NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_EventTypeXEventGenres] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Locations]    Script Date: 1/5/2020 4:52:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Locations](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_Locations] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Persons]    Script Date: 1/5/2020 4:52:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Persons](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](max) NULL,
	[LastName] [nvarchar](max) NULL,
	[UserId] [bigint] NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_Persons] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PersonXTickets]    Script Date: 1/5/2020 4:52:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PersonXTickets](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[TicketId] [bigint] NOT NULL,
	[PersonId] [bigint] NOT NULL,
	[NrOfBought] [int] NOT NULL,
	[NrOfReturned] [int] NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_PersonXTickets] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RefreshTokens]    Script Date: 1/5/2020 4:52:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RefreshTokens](
	[Token] [nvarchar](450) NOT NULL,
	[JwtId] [nvarchar](max) NULL,
	[CreationDate] [datetime2](7) NOT NULL,
	[ExpiryDate] [datetime2](7) NOT NULL,
	[Used] [bit] NOT NULL,
	[Invalidated] [bit] NOT NULL,
	[UserId] [bigint] NOT NULL,
 CONSTRAINT [PK_RefreshTokens] PRIMARY KEY CLUSTERED 
(
	[Token] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tickets]    Script Date: 1/5/2020 4:52:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tickets](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[EventParentId] [bigint] NOT NULL,
	[TicketTypeId] [bigint] NOT NULL,
	[Price] [float] NOT NULL,
	[Remaining] [int] NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_Tickets] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TicketTypes]    Script Date: 1/5/2020 4:52:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TicketTypes](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_TicketTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20191124230921_Added Identity', N'3.0.1')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20191126225801_Added-Person', N'3.0.1')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20191128212237_Added-Event-EventType-EventGenre-EventTypeXEventGenre', N'3.0.1')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20191223130128_Every table done', N'3.0.1')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200102100751_Added photourl to event', N'3.0.1')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200103112306_Added deleted column on person', N'3.0.1')
SET IDENTITY_INSERT [dbo].[AspNetRoles] ON 

INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (1, N'Admin', N'ADMIN', N'99d24f9a-f80f-467c-b518-fb25d2ace206')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (2, N'EventManager', N'EVENTMANAGER', N'8083b6c1-e4f7-4a97-870f-ef68ea2080a8')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (3, N'User', N'USER', N'3e8ce9f8-2cbb-4fbc-af75-86a70915efd1')
SET IDENTITY_INSERT [dbo].[AspNetRoles] OFF
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (1, 1)
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (2, 1)
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (3, 1)
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (4, 1)
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (1, 2)
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (3, 2)
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (4, 2)
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (6, 2)
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (1, 3)
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (2, 3)
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (3, 3)
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (4, 3)
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (5, 3)
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (6, 3)
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (7, 3)
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (8, 3)
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (9, 3)
SET IDENTITY_INSERT [dbo].[AspNetUsers] ON 

INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (1, N'test@test.com', N'TEST@TEST.COM', N'test@test.com', N'TEST@TEST.COM', 0, N'AQAAAAEAACcQAAAAEGfcHfEPi+pRXLQwzhWet8QxRNV5wm3bE1BEKKFeuQ02qUjmB20rlbcZYMEY/Byu5g==', N'77CCXKGEIJLVY2US4EMKVKRTHT44BLFE', N'37d5eb4b-52b5-468a-853a-99b34907233b', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (2, N'test2@test.com', N'TEST2@TEST.COM', N'test2@test.com', N'TEST2@TEST.COM', 0, N'AQAAAAEAACcQAAAAEI4DlmlSY/HIo6J3dYmoOp+IhQQ8MzalCPstAj/2PBXa9kio+OQYOWVTMPVQnKbeOQ==', N'GWAXEWP46YEWOPPZ2J7NDJROI5QFB53R', N'88a23d3a-9f8e-466b-8ba7-4d0c8feecd50', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (3, N'test3@test.com', N'TEST3@TEST.COM', N'test3@test.com', N'TEST3@TEST.COM', 0, N'AQAAAAEAACcQAAAAEIv/12ZTvcWC1wxessqs6k8Ef7hAPQ+Hdew+JLtefxDCiP6ufiXxfAYE3786Rj6lQA==', N'4XIIKAP4KBUYOTPQTZ5TPLFXQDZMNP5B', N'b818e187-89cc-424a-839a-d181267235e3', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (4, N'admin@test.com', N'ADMIN@TEST.COM', N'admin@test.com', N'ADMIN@TEST.COM', 0, N'AQAAAAEAACcQAAAAENLWggX2hOgxJpuL4zqd9HHF+aPzgx15DxSCvT7+daPeg12QX+3L75iwr9obPoMJSA==', N'PORZKYE52WACL2HBJ7LP6YOMJRVG6PMT', N'b4996990-5c53-46d9-b551-f1d9bbb73b15', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (5, N'first@first.com', N'FIRST@FIRST.COM', N'first@first.com', N'FIRST@FIRST.COM', 0, N'AQAAAAEAACcQAAAAENKDRDu9WU8tJIkfABsP150Ix1W+B4MpJ3+BS03R20kyy4U2ZW84SUybSrJk4seqPg==', N'GIDYDIRTUI4GLL3UEZN3TFTMZLXJJ4YB', N'3c914f0e-ba1b-4b5f-b66f-507d356dced3', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (6, N'eventm@eventm.com', N'EVENTM@EVENTM.COM', N'eventm@eventm.com', N'EVENTM@EVENTM.COM', 0, N'AQAAAAEAACcQAAAAEPrLN3BwuI3XLMA1nwjJ79P6hXdN2HzKmBPCmQih+LfVzseOrs/fjyLoSLPWIfhPgA==', N'V6HS36ZVKGLD6E27H5P5SODTUAYJPQ6U', N'66e4eb3b-2ce7-4293-b0c7-10b567e47981', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (7, N'deleted@deleted.com', N'DELETED@DELETED.COM', N'deleted@deleted.com', N'DELETED@DELETED.COM', 0, N'AQAAAAEAACcQAAAAEMo736Wmlvj41q7BBP7Itza/7I1ID6FV2lWwYf8ahsR6x7ky4dlmxBkT30nFd8/D9Q==', N'VVCB5T6OKRYALROZ5GKK67F7F2QTI3RL', N'40698987-ce1a-4167-9506-572d1736ca4c', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (8, N'deleted2@deleted.com', N'DELETED2@DELETED.COM', N'deleted2@deleted.com', N'DELETED2@DELETED.COM', 0, N'AQAAAAEAACcQAAAAEGP+xPWpUJ+x96vGxeiXSO2/ufwrLQvMyO6AHNxUuC7JJJfVzIDdqC0NUJtRsCbGFg==', N'LWJEW4VBBZSJEOUFTRDUOQIYC6B2HIS3', N'867f38de-427a-4769-85e2-9b6689bb0f44', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (9, N'normaluser@user.com', N'NORMALUSER@USER.COM', N'normaluser@user.com', N'NORMALUSER@USER.COM', 0, N'AQAAAAEAACcQAAAAEOFCHA6Zi/hXRq3B/2uR8eZGTxbQbJ6QZPnKjtYUpm3PWfnKIgJpAU/ScAj4IZldIw==', N'HD3BDFIP3TY2C6NZZTEPFGMPHYWZEJLK', N'f8f0024e-f1dd-4714-afe9-fd0cf595b102', NULL, 0, 0, NULL, 1, 0)
SET IDENTITY_INSERT [dbo].[AspNetUsers] OFF
SET IDENTITY_INSERT [dbo].[EventGenres] ON 

INSERT [dbo].[EventGenres] ([Id], [Name], [Deleted]) VALUES (1, N'Comedie', 0)
INSERT [dbo].[EventGenres] ([Id], [Name], [Deleted]) VALUES (2, N'Rock', 0)
INSERT [dbo].[EventGenres] ([Id], [Name], [Deleted]) VALUES (3, N'Rap', 0)
INSERT [dbo].[EventGenres] ([Id], [Name], [Deleted]) VALUES (4, N'Folk', 0)
INSERT [dbo].[EventGenres] ([Id], [Name], [Deleted]) VALUES (5, N'Pop', 0)
INSERT [dbo].[EventGenres] ([Id], [Name], [Deleted]) VALUES (6, N'Actiune', 0)
SET IDENTITY_INSERT [dbo].[EventGenres] OFF
SET IDENTITY_INSERT [dbo].[EventParents] ON 

INSERT [dbo].[EventParents] ([Id], [Name], [EventTypeId], [EventGenreId], [Description], [Deleted], [DateAndHour], [LocationId], [PersonId], [PhotoURL]) VALUES (1, N'Concert Rock', 1, 2, N'Cel mai tare concert', 0, CAST(N'2020-01-15T00:00:00.0000000' AS DateTime2), 4, 6, N'https://previews.123rf.com/images/paseven/paseven1711/paseven171100076/89699839-banni%C3%A8re-de-vecteur-ou-embl%C3%A8me-avec-des-mots-musique-rock-guitare-%C3%A9lectrique-avec-des-ailes-sur-le-fond-d-.jpg')
INSERT [dbo].[EventParents] ([Id], [Name], [EventTypeId], [EventGenreId], [Description], [Deleted], [DateAndHour], [LocationId], [PersonId], [PhotoURL]) VALUES (2, N'Rock in Berr', 1, 2, N'Concert minunat', 0, CAST(N'2020-01-15T00:00:00.0000000' AS DateTime2), 3, 6, N'https://comps.canstockphoto.com/vintage-hand-drawn-rock-n-roll-poster-vector-clipart_csp55680509.jpg')
INSERT [dbo].[EventParents] ([Id], [Name], [EventTypeId], [EventGenreId], [Description], [Deleted], [DateAndHour], [LocationId], [PersonId], [PhotoURL]) VALUES (3, N'Rocking All day', 1, 2, N'Beautiful minunat', 1, CAST(N'2020-01-15T00:00:00.0000000' AS DateTime2), 2, 6, N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSYyP3EGi3mgAZPPgo0AYUT5YVJ5Gq2Y_PHgGAtDhnfsRuBUdkwjA&s')
INSERT [dbo].[EventParents] ([Id], [Name], [EventTypeId], [EventGenreId], [Description], [Deleted], [DateAndHour], [LocationId], [PersonId], [PhotoURL]) VALUES (4, N'rrrRock', 1, 2, N'Rockkkk', 1, CAST(N'2020-01-15T00:00:00.0000000' AS DateTime2), 1, 6, N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTDO3rcWakx49Jl-a9JW8vCt2LHCAZBR1aCbDmusw1nLA0_eaN2&s')
INSERT [dbo].[EventParents] ([Id], [Name], [EventTypeId], [EventGenreId], [Description], [Deleted], [DateAndHour], [LocationId], [PersonId], [PhotoURL]) VALUES (5, N'Fast And Furious', 2, 6, N'Fugi si esti furios', 0, CAST(N'2020-01-15T00:00:00.0000000' AS DateTime2), 1, 6, N'https://playtech.ro/wp-content/uploads/2019/07/Fast-and-Furious-9-fake-logo-1170x658.jpg')
INSERT [dbo].[EventParents] ([Id], [Name], [EventTypeId], [EventGenreId], [Description], [Deleted], [DateAndHour], [LocationId], [PersonId], [PhotoURL]) VALUES (6, N'Best Pop', 1, 5, N'De ce nu vii?', 0, CAST(N'2020-01-15T00:00:00.0000000' AS DateTime2), 3, 6, N'https://m.media-amazon.com/images/I/71R8o46LtLL._SS500_.jpg')
INSERT [dbo].[EventParents] ([Id], [Name], [EventTypeId], [EventGenreId], [Description], [Deleted], [DateAndHour], [LocationId], [PersonId], [PhotoURL]) VALUES (7, N'Nicu si Costel', 3, 1, N'Razi? Atunci vino!', 0, CAST(N'2020-01-15T00:00:00.0000000' AS DateTime2), 4, 6, N'https://img.huffingtonpost.com/asset/58fd0d551c00001600e81366.jpg?ops=crop_2_27_498_443,scalefit_630_noupscale')
INSERT [dbo].[EventParents] ([Id], [Name], [EventTypeId], [EventGenreId], [Description], [Deleted], [DateAndHour], [LocationId], [PersonId], [PhotoURL]) VALUES (8, N'test', 3, 1, N'test', 1, CAST(N'2020-01-22T00:00:00.0000000' AS DateTime2), 2, 2, N'https://images.unsplash.com/photo-1559628129-67cf63b72248?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80')
INSERT [dbo].[EventParents] ([Id], [Name], [EventTypeId], [EventGenreId], [Description], [Deleted], [DateAndHour], [LocationId], [PersonId], [PhotoURL]) VALUES (9, N'Test', 1, 5, N'Pop Test', 0, CAST(N'2020-01-23T00:00:00.0000000' AS DateTime2), 2, 1, N'https://storage.ws.pho.to/s2/C2A065D2-DAAD-11E9-8948-023B0289F6C4_m.jpg')
SET IDENTITY_INSERT [dbo].[EventParents] OFF
SET IDENTITY_INSERT [dbo].[EventTypes] ON 

INSERT [dbo].[EventTypes] ([Id], [Name], [Deleted]) VALUES (1, N'Concert', 0)
INSERT [dbo].[EventTypes] ([Id], [Name], [Deleted]) VALUES (2, N'Film', 0)
INSERT [dbo].[EventTypes] ([Id], [Name], [Deleted]) VALUES (3, N'Standup', 0)
INSERT [dbo].[EventTypes] ([Id], [Name], [Deleted]) VALUES (4, N'Electro', 0)
SET IDENTITY_INSERT [dbo].[EventTypes] OFF
SET IDENTITY_INSERT [dbo].[EventTypeXEventGenres] ON 

INSERT [dbo].[EventTypeXEventGenres] ([Id], [EventTypeId], [EventGenreId], [Deleted]) VALUES (1, 1, 2, 0)
INSERT [dbo].[EventTypeXEventGenres] ([Id], [EventTypeId], [EventGenreId], [Deleted]) VALUES (2, 1, 3, 0)
INSERT [dbo].[EventTypeXEventGenres] ([Id], [EventTypeId], [EventGenreId], [Deleted]) VALUES (3, 1, 4, 0)
INSERT [dbo].[EventTypeXEventGenres] ([Id], [EventTypeId], [EventGenreId], [Deleted]) VALUES (4, 1, 5, 0)
INSERT [dbo].[EventTypeXEventGenres] ([Id], [EventTypeId], [EventGenreId], [Deleted]) VALUES (5, 2, 1, 0)
INSERT [dbo].[EventTypeXEventGenres] ([Id], [EventTypeId], [EventGenreId], [Deleted]) VALUES (6, 2, 6, 0)
INSERT [dbo].[EventTypeXEventGenres] ([Id], [EventTypeId], [EventGenreId], [Deleted]) VALUES (7, 3, 1, 0)
INSERT [dbo].[EventTypeXEventGenres] ([Id], [EventTypeId], [EventGenreId], [Deleted]) VALUES (8, 4, 5, 0)
SET IDENTITY_INSERT [dbo].[EventTypeXEventGenres] OFF
SET IDENTITY_INSERT [dbo].[Locations] ON 

INSERT [dbo].[Locations] ([Id], [Name], [Address], [Deleted]) VALUES (1, N'Sala Polivalenta', N'Str Polivalenta 1', 0)
INSERT [dbo].[Locations] ([Id], [Name], [Address], [Deleted]) VALUES (2, N'Romexpo', N'Str Romexpo 1', 0)
INSERT [dbo].[Locations] ([Id], [Name], [Address], [Deleted]) VALUES (3, N'Berarie', N'Str Berarie 1', 0)
INSERT [dbo].[Locations] ([Id], [Name], [Address], [Deleted]) VALUES (4, N'Rock Cafe', N'Str CafeRock 1', 0)
SET IDENTITY_INSERT [dbo].[Locations] OFF
SET IDENTITY_INSERT [dbo].[Persons] ON 

INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [UserId], [Deleted]) VALUES (1, N'Test', N'Test', 1, 0)
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [UserId], [Deleted]) VALUES (2, N'Test2', N'Test', 2, 1)
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [UserId], [Deleted]) VALUES (3, N'Test3', N'Test', 3, 0)
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [UserId], [Deleted]) VALUES (4, N'admin', N'test', 4, 0)
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [UserId], [Deleted]) VALUES (5, N'first', N'tsrif', 5, 1)
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [UserId], [Deleted]) VALUES (6, N'eventm', N'eventm', 6, 0)
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [UserId], [Deleted]) VALUES (7, N'Deleted', N'Deteled', 7, 1)
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [UserId], [Deleted]) VALUES (8, N'Deleted2', N'Deteled2', 8, 1)
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [UserId], [Deleted]) VALUES (9, N'Normal', N'User', 9, 0)
SET IDENTITY_INSERT [dbo].[Persons] OFF
SET IDENTITY_INSERT [dbo].[PersonXTickets] ON 

INSERT [dbo].[PersonXTickets] ([Id], [TicketId], [PersonId], [NrOfBought], [NrOfReturned], [Deleted]) VALUES (1, 1, 6, 10, 0, 0)
INSERT [dbo].[PersonXTickets] ([Id], [TicketId], [PersonId], [NrOfBought], [NrOfReturned], [Deleted]) VALUES (2, 3, 6, 5, 5, 1)
INSERT [dbo].[PersonXTickets] ([Id], [TicketId], [PersonId], [NrOfBought], [NrOfReturned], [Deleted]) VALUES (3, 3, 1, 7, 0, 0)
INSERT [dbo].[PersonXTickets] ([Id], [TicketId], [PersonId], [NrOfBought], [NrOfReturned], [Deleted]) VALUES (4, 2, 6, 2, 0, 0)
INSERT [dbo].[PersonXTickets] ([Id], [TicketId], [PersonId], [NrOfBought], [NrOfReturned], [Deleted]) VALUES (5, 2, 6, 2, 0, 0)
INSERT [dbo].[PersonXTickets] ([Id], [TicketId], [PersonId], [NrOfBought], [NrOfReturned], [Deleted]) VALUES (6, 2, 2, 1, 0, 1)
INSERT [dbo].[PersonXTickets] ([Id], [TicketId], [PersonId], [NrOfBought], [NrOfReturned], [Deleted]) VALUES (7, 3, 2, 1, 0, 1)
INSERT [dbo].[PersonXTickets] ([Id], [TicketId], [PersonId], [NrOfBought], [NrOfReturned], [Deleted]) VALUES (8, 1, 2, 1, 0, 1)
INSERT [dbo].[PersonXTickets] ([Id], [TicketId], [PersonId], [NrOfBought], [NrOfReturned], [Deleted]) VALUES (9, 13, 1, 3, 0, 1)
INSERT [dbo].[PersonXTickets] ([Id], [TicketId], [PersonId], [NrOfBought], [NrOfReturned], [Deleted]) VALUES (10, 14, 1, 5, 0, 0)
SET IDENTITY_INSERT [dbo].[PersonXTickets] OFF
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [UserId]) VALUES (N'060a5b35-7677-4101-a140-b1a81941941e', N'e562dc73-d0a9-485d-ad16-a54735daf64d', CAST(N'2019-11-27T21:00:43.1724025' AS DateTime2), CAST(N'2020-05-27T21:00:43.1724029' AS DateTime2), 0, 0, 1)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [UserId]) VALUES (N'0f2839f4-b238-4273-944d-d17efaf0ca06', N'056acd9d-deee-4597-98e9-50e2a67b6e7e', CAST(N'2019-11-29T18:32:33.0783437' AS DateTime2), CAST(N'2020-05-29T18:32:33.0784097' AS DateTime2), 0, 0, 1)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [UserId]) VALUES (N'0fb3f855-60da-4961-b732-088de866c636', N'f7c8c573-2f28-4605-befa-cc65d54824e0', CAST(N'2020-01-04T11:42:35.8705224' AS DateTime2), CAST(N'2020-07-04T11:42:35.8706317' AS DateTime2), 0, 0, 4)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [UserId]) VALUES (N'10d23cd8-fea8-4a06-8f89-2bb153b88754', N'f68dc1fc-60d8-4116-bc46-1c732a347417', CAST(N'2019-12-23T15:57:48.4782035' AS DateTime2), CAST(N'2020-06-23T15:57:48.4782702' AS DateTime2), 0, 0, 6)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [UserId]) VALUES (N'13909ec9-f499-4052-bfea-8ecd8b36154e', N'c0a8790e-3c8b-4419-83ee-ec6463ff274b', CAST(N'2019-11-29T13:05:53.3264659' AS DateTime2), CAST(N'2020-05-29T13:05:53.3265287' AS DateTime2), 0, 0, 1)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [UserId]) VALUES (N'1ac1743e-ca3d-457c-8a22-2d82cd653470', N'a79bc276-6c9c-4d37-b181-78d607991189', CAST(N'2019-12-23T13:38:50.9729805' AS DateTime2), CAST(N'2020-06-23T13:38:50.9730586' AS DateTime2), 0, 0, 6)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [UserId]) VALUES (N'1bc7fdec-b3a0-4a44-a3a8-4357b7c7c796', N'bdc4fbc3-0f82-45aa-81cf-3c4fbddb3956', CAST(N'2019-12-23T16:08:14.8653541' AS DateTime2), CAST(N'2020-06-23T16:08:14.8654353' AS DateTime2), 0, 0, 1)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [UserId]) VALUES (N'1c00fab3-5c7c-42ea-810c-2061ef0dc278', N'd9ac4958-afe7-4edc-b6da-5334d914b82f', CAST(N'2019-11-24T23:24:57.9905299' AS DateTime2), CAST(N'2020-05-24T23:24:57.9905303' AS DateTime2), 0, 0, 1)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [UserId]) VALUES (N'1da18363-db1e-43c1-a0f3-3b40d11b7b5e', N'658d7853-e1a5-400f-9742-e9f3c1a5a64b', CAST(N'2020-01-03T17:50:46.6165633' AS DateTime2), CAST(N'2020-07-03T17:50:46.6166316' AS DateTime2), 0, 0, 1)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [UserId]) VALUES (N'1e0c84ae-4184-4685-beea-8e16c624fdd1', N'7efcd107-55e4-465e-b197-6e04180c409d', CAST(N'2019-11-27T20:51:00.2944280' AS DateTime2), CAST(N'2020-05-27T20:51:00.2944285' AS DateTime2), 0, 0, 1)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [UserId]) VALUES (N'20695461-8de2-4ede-b2e2-6ffc2f90302a', N'1a5f80dd-a544-44d1-92bc-cab08f95b303', CAST(N'2019-11-27T21:46:52.6677397' AS DateTime2), CAST(N'2020-05-27T21:46:52.6677404' AS DateTime2), 0, 0, 1)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [UserId]) VALUES (N'24e1d333-3c64-4c18-b549-8732f5fd53cd', N'382f7eef-21e3-4f51-8103-10b68d807f0e', CAST(N'2020-01-03T18:19:52.7488299' AS DateTime2), CAST(N'2020-07-03T18:19:52.7488989' AS DateTime2), 0, 0, 1)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [UserId]) VALUES (N'28e9526d-fe0a-427e-b116-c7501aa1c35c', N'1ae8cbb7-22a6-4bd7-86fd-779c9b06fd8c', CAST(N'2019-12-23T14:21:20.9396224' AS DateTime2), CAST(N'2020-06-23T14:21:20.9396933' AS DateTime2), 0, 0, 6)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [UserId]) VALUES (N'28f7d772-a160-495e-b840-97979a286d74', N'3a238723-9f8a-455f-8ddb-3d7025fcf61d', CAST(N'2019-12-23T16:13:17.4815555' AS DateTime2), CAST(N'2020-06-23T16:13:17.4816310' AS DateTime2), 0, 0, 1)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [UserId]) VALUES (N'292046b7-4b37-45c4-b001-81e2faef0825', N'5f2500c2-3e90-43a0-9177-449ec1b8656e', CAST(N'2020-01-04T15:28:13.0563931' AS DateTime2), CAST(N'2020-07-04T15:28:13.0564561' AS DateTime2), 0, 0, 1)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [UserId]) VALUES (N'2b61d3a0-b2da-4eeb-b239-d5a648791d56', N'7417a195-3ad5-4dce-9007-d8675a3fa31a', CAST(N'2019-11-26T23:14:48.7547801' AS DateTime2), CAST(N'2020-05-26T23:14:48.7547812' AS DateTime2), 0, 0, 4)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [UserId]) VALUES (N'2ccd95bf-43b6-45d3-9615-c4685a57ebf6', N'234d6887-aca2-4383-a40b-c73494b86658', CAST(N'2019-12-23T16:01:47.6242004' AS DateTime2), CAST(N'2020-06-23T16:01:47.6242686' AS DateTime2), 0, 0, 1)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [UserId]) VALUES (N'2d9517ed-7a5b-42f9-b301-58e01cfe0175', N'3f0498ed-6ef4-4d71-abf6-dc2738c2171e', CAST(N'2019-11-27T20:56:41.2558412' AS DateTime2), CAST(N'2020-05-27T20:56:41.2558417' AS DateTime2), 0, 0, 1)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [UserId]) VALUES (N'2ffcce66-7a48-4b2b-80de-3150fef11b49', N'9c00cded-9add-4e27-a3c5-acbade84c102', CAST(N'2020-01-04T15:20:15.2769141' AS DateTime2), CAST(N'2020-07-04T15:20:15.2769144' AS DateTime2), 0, 0, 6)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [UserId]) VALUES (N'3047f38f-7d1b-42bc-afc6-708be7d1c522', N'2006c513-4a22-4ce2-bccf-cfca34fb8bc7', CAST(N'2019-11-29T13:12:26.3938320' AS DateTime2), CAST(N'2020-05-29T13:12:26.3939753' AS DateTime2), 0, 0, 1)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [UserId]) VALUES (N'346c51cc-0dd6-40ce-af16-11dbfd5bc176', N'e16842d6-0fca-4cf9-a0ef-d33ad1d82947', CAST(N'2020-01-03T11:29:37.0195898' AS DateTime2), CAST(N'2020-07-03T11:29:37.0195904' AS DateTime2), 0, 0, 7)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [UserId]) VALUES (N'38159c49-7793-4be9-8e14-d78d3f5645f1', N'f4d4fa04-8214-4ab8-9832-15d47ec98f87', CAST(N'2020-01-03T09:35:55.3297293' AS DateTime2), CAST(N'2020-07-03T09:35:55.3297979' AS DateTime2), 0, 0, 1)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [UserId]) VALUES (N'38c631b0-ad4a-4843-ade8-12d35f5cd2f8', N'4ad87a56-1f8f-41d2-94e0-265ca1daf086', CAST(N'2019-11-27T20:36:40.5841066' AS DateTime2), CAST(N'2020-05-27T20:36:40.5841070' AS DateTime2), 0, 0, 1)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [UserId]) VALUES (N'3b186e89-c960-4ef2-926b-cbf565a48955', N'c388ca97-8571-4f26-8b0c-9e513e6fc32f', CAST(N'2019-11-27T20:53:58.3063873' AS DateTime2), CAST(N'2020-05-27T20:53:58.3063890' AS DateTime2), 0, 0, 1)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [UserId]) VALUES (N'3c8e9812-ea65-4f68-a53e-6ed24801ede9', N'a8ad868b-03e4-4596-88d3-419442a82dda', CAST(N'2019-11-29T18:38:54.0567560' AS DateTime2), CAST(N'2020-05-29T18:38:54.0568733' AS DateTime2), 0, 0, 1)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [UserId]) VALUES (N'3e8e77e4-c9b1-4442-877b-6993897d2dcb', N'2a24f907-249d-4bf9-9d27-e9d79ec76b2f', CAST(N'2020-01-04T13:40:25.2518315' AS DateTime2), CAST(N'2020-07-04T13:40:25.2518318' AS DateTime2), 0, 0, 8)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [UserId]) VALUES (N'40899f07-1634-4bdc-b80f-4a15711d292a', N'762f47d1-fbb7-455e-9599-6632d7b68f11', CAST(N'2019-11-27T20:56:34.0428068' AS DateTime2), CAST(N'2020-05-27T20:56:34.0428073' AS DateTime2), 0, 0, 1)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [UserId]) VALUES (N'41fb83d2-db9e-4899-83e7-b6684b5713fb', N'ff2ed541-34e8-48a4-87e4-9505c08ad853', CAST(N'2019-11-27T21:02:46.1561842' AS DateTime2), CAST(N'2020-05-27T21:02:46.1561845' AS DateTime2), 0, 0, 1)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [UserId]) VALUES (N'479da592-5245-4d75-9c2f-ef214a4d17df', N'23728cdf-5c1d-4550-96c5-38bb8f0095fb', CAST(N'2019-11-27T21:00:39.9929618' AS DateTime2), CAST(N'2020-05-27T21:00:39.9929626' AS DateTime2), 0, 0, 1)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [UserId]) VALUES (N'4a5ce03c-41c4-4843-bda6-d7a51ac790b7', N'd5f85e3f-be2b-4728-bce9-aae527f61ba9', CAST(N'2020-01-05T14:39:13.6330989' AS DateTime2), CAST(N'2020-07-05T14:39:13.6330995' AS DateTime2), 0, 0, 6)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [UserId]) VALUES (N'4de88bf0-e6f1-446e-8ebc-61f01a7cbf91', N'b9dfbcd2-aac4-4443-a3e0-70e92e1c65aa', CAST(N'2019-11-27T22:07:46.9372174' AS DateTime2), CAST(N'2020-05-27T22:07:46.9372180' AS DateTime2), 0, 0, 1)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [UserId]) VALUES (N'4f7964d1-4311-486e-8262-0bd2b5061dd7', N'd5a08d56-1d2d-44c5-b214-45724513d98d', CAST(N'2019-12-23T15:44:03.4336993' AS DateTime2), CAST(N'2020-06-23T15:44:03.4338049' AS DateTime2), 0, 0, 6)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [UserId]) VALUES (N'50a882eb-db40-4bce-a8e8-6ac56676dbb6', N'f96171a9-5122-47b6-b8fa-837890a78f50', CAST(N'2020-01-04T14:00:50.8737393' AS DateTime2), CAST(N'2020-07-04T14:00:50.8738594' AS DateTime2), 0, 0, 2)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [UserId]) VALUES (N'51a904f2-e73b-43ae-a75e-d3e4661afb3b', N'4d7ac037-d23a-43d2-8392-c0e4c9cd83ba', CAST(N'2020-01-04T15:09:47.4941520' AS DateTime2), CAST(N'2020-07-04T15:09:47.4941529' AS DateTime2), 0, 0, 9)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [UserId]) VALUES (N'530e6aa3-5ef5-4b98-b707-545515813ce8', N'ab0082c2-0a1c-4be7-872e-12a4734745d0', CAST(N'2019-11-27T21:00:44.3077749' AS DateTime2), CAST(N'2020-05-27T21:00:44.3077754' AS DateTime2), 0, 0, 1)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [UserId]) VALUES (N'551963b9-b44d-4588-9135-47e6538d7277', N'57200509-c698-40b1-8fae-fb585f978cfc', CAST(N'2019-11-27T20:58:20.1201974' AS DateTime2), CAST(N'2020-05-27T20:58:20.1201977' AS DateTime2), 0, 0, 1)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [UserId]) VALUES (N'55cdf016-d13e-44ee-8ce4-777f45de8b3b', N'55c9bf1d-e8f5-402a-be10-112dffb4fec2', CAST(N'2019-11-27T21:04:38.2919476' AS DateTime2), CAST(N'2020-05-27T21:04:38.2919482' AS DateTime2), 0, 0, 1)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [UserId]) VALUES (N'58e7d032-5f3b-410e-b3a3-f641d4d003bf', N'c86e1112-dc5a-48d3-a3df-d2311e4e06b0', CAST(N'2020-01-04T15:41:18.5510421' AS DateTime2), CAST(N'2020-07-04T15:41:18.5511074' AS DateTime2), 0, 0, 9)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [UserId]) VALUES (N'5ae3f271-1e50-4678-a074-3f6267288460', N'27994e1f-c55c-41b9-a161-2f1bf7827430', CAST(N'2019-11-27T22:16:01.0036482' AS DateTime2), CAST(N'2020-05-27T22:16:01.0036488' AS DateTime2), 0, 0, 1)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [UserId]) VALUES (N'5f6c4820-2d2d-4ddc-9b9e-4733fd48de25', N'68a6d4f7-b903-4f00-bfba-396ab1f3c11c', CAST(N'2020-01-04T14:49:02.8246091' AS DateTime2), CAST(N'2020-07-04T14:49:02.8246799' AS DateTime2), 0, 0, 2)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [UserId]) VALUES (N'60465447-61af-47e0-8d16-7a9fb7a2fcf6', N'405340b5-7c0c-4841-a99d-b4a7be75d7f6', CAST(N'2020-01-03T17:48:03.2757358' AS DateTime2), CAST(N'2020-07-03T17:48:03.2758068' AS DateTime2), 0, 0, 1)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [UserId]) VALUES (N'6454e433-e0b4-46ed-adba-7eddbdf2b605', N'648f6de8-51bc-4a7d-8dce-886355105f9a', CAST(N'2020-01-03T18:24:29.4317746' AS DateTime2), CAST(N'2020-07-03T18:24:29.4318411' AS DateTime2), 0, 0, 1)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [UserId]) VALUES (N'685707da-15b9-44b8-b03f-974b53d2b333', N'52ece432-574a-456d-94c7-505e649bac40', CAST(N'2019-11-27T22:15:30.7523560' AS DateTime2), CAST(N'2020-05-27T22:15:30.7523566' AS DateTime2), 0, 0, 1)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [UserId]) VALUES (N'68c248fa-ffc0-44d2-b87e-1ae88154bbe2', N'172dd43e-1150-41dd-951a-c609df825229', CAST(N'2020-01-03T18:04:02.5553415' AS DateTime2), CAST(N'2020-07-03T18:04:02.5555110' AS DateTime2), 0, 0, 1)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [UserId]) VALUES (N'6ee6a073-abf3-4a41-9f13-13142647a656', N'3f289704-ba76-4aef-ad19-a2a4c10068eb', CAST(N'2019-11-26T00:10:30.6147663' AS DateTime2), CAST(N'2020-05-26T00:10:30.6147667' AS DateTime2), 0, 0, 1)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [UserId]) VALUES (N'6f66fa10-5fad-45af-8130-9276a651885d', N'4825d39b-8c1e-4002-a915-3cbde341f9b3', CAST(N'2019-12-23T15:45:50.6545278' AS DateTime2), CAST(N'2020-06-23T15:45:50.6545920' AS DateTime2), 0, 0, 6)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [UserId]) VALUES (N'716e3be9-b821-4fcd-83e6-78eae4392ecd', N'b4ac6317-c6f3-4ed3-8f73-23e5f1964576', CAST(N'2020-01-04T13:40:33.5041002' AS DateTime2), CAST(N'2020-07-04T13:40:33.5041011' AS DateTime2), 0, 0, 4)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [UserId]) VALUES (N'7303c5c8-13c6-40b4-8b45-b627c0790ec2', N'6a439d0d-9a6f-44d2-88c1-fc5a77752980', CAST(N'2019-11-26T23:56:14.1379420' AS DateTime2), CAST(N'2020-05-26T23:56:14.1380042' AS DateTime2), 0, 0, 1)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [UserId]) VALUES (N'7349e79e-47a0-4574-ae90-e6c307e972c0', N'1695b13a-8f6b-4d1d-a0c9-faf41320fb94', CAST(N'2019-11-27T20:53:28.6238654' AS DateTime2), CAST(N'2020-05-27T20:53:28.6238657' AS DateTime2), 0, 0, 1)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [UserId]) VALUES (N'7360b325-7cfc-43b0-8179-28c3573c1576', N'33b610fe-2aff-41d5-bb79-72bb1f58a6fd', CAST(N'2019-11-27T21:00:43.0456897' AS DateTime2), CAST(N'2020-05-27T21:00:43.0456903' AS DateTime2), 0, 0, 1)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [UserId]) VALUES (N'73b8e2dd-fe76-4315-b73a-c3296b83bda9', N'c14f3666-e705-4dbb-86f8-8c5829d7cbaa', CAST(N'2019-12-23T13:53:46.2447365' AS DateTime2), CAST(N'2020-06-23T13:53:46.2448256' AS DateTime2), 0, 0, 6)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [UserId]) VALUES (N'768efd1c-e22f-466c-8f68-f98212573dc3', N'0f809ba2-ca6f-4e40-8dd6-d7819e57a671', CAST(N'2019-12-23T13:26:41.1652704' AS DateTime2), CAST(N'2020-06-23T13:26:41.1653364' AS DateTime2), 0, 0, 5)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [UserId]) VALUES (N'76a16e0b-ac35-4167-b9da-f8939e25af52', N'79e5d51a-fc29-4a2a-ae4c-7751592d661d', CAST(N'2019-11-27T21:00:43.8934053' AS DateTime2), CAST(N'2020-05-27T21:00:43.8934056' AS DateTime2), 0, 0, 1)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [UserId]) VALUES (N'7d52d26a-94b7-4c7f-890f-ac45a2797db8', N'9cfbf5ef-20f9-43f7-96eb-bc044551b3a0', CAST(N'2019-11-26T23:51:09.2283273' AS DateTime2), CAST(N'2020-05-26T23:51:09.2284191' AS DateTime2), 0, 0, 1)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [UserId]) VALUES (N'7ed8b111-9a08-4c84-94f8-3fd88f84241a', N'3a24a395-732d-4099-985a-52caaf4c8abd', CAST(N'2020-01-05T14:38:27.5087866' AS DateTime2), CAST(N'2020-07-05T14:38:27.5087869' AS DateTime2), 0, 0, 6)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [UserId]) VALUES (N'7edeed8e-2b75-42ca-808f-c58335b296b6', N'faed244b-1afc-4321-8bd1-d8b6e94853de', CAST(N'2019-11-27T21:48:27.8714149' AS DateTime2), CAST(N'2020-05-27T21:48:27.8714152' AS DateTime2), 0, 0, 1)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [UserId]) VALUES (N'8021d13b-3fbd-4281-8261-3dae849b33e4', N'f38d66d3-f283-472b-960e-ff9cfe9c71f5', CAST(N'2019-11-25T23:49:12.4184183' AS DateTime2), CAST(N'2020-05-25T23:49:12.4184908' AS DateTime2), 0, 0, 2)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [UserId]) VALUES (N'80cad8f0-17d5-4225-b260-07e053e5f3e8', N'5c0fd054-ce72-489f-885f-ae544ea30e7e', CAST(N'2019-11-26T23:24:39.1324205' AS DateTime2), CAST(N'2020-05-26T23:24:39.1324210' AS DateTime2), 0, 0, 4)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [UserId]) VALUES (N'89407c00-c94f-4325-a004-38f652a0daef', N'9a02cae1-528a-4b7e-bb26-8f012f2a4650', CAST(N'2019-11-29T13:03:03.9848353' AS DateTime2), CAST(N'2020-05-29T13:03:03.9848991' AS DateTime2), 0, 0, 1)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [UserId]) VALUES (N'8c38a8a1-2e86-4d79-b885-796847964bab', N'778f6f49-f6fa-4908-b3bc-b265bdeb19e8', CAST(N'2019-11-27T20:32:20.0002715' AS DateTime2), CAST(N'2020-05-27T20:32:20.0003727' AS DateTime2), 0, 0, 1)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [UserId]) VALUES (N'8dbc8a75-e691-42a7-b529-befacc00aa9e', N'17853d2d-ebb9-41b6-b5c4-3aae0415ca57', CAST(N'2019-11-27T21:53:17.4022488' AS DateTime2), CAST(N'2020-05-27T21:53:17.4022490' AS DateTime2), 0, 0, 1)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [UserId]) VALUES (N'8e1c40eb-00b6-4b1c-94cb-29425cb3bd60', N'd6df9123-42dd-48a3-9ea2-40e97c4b1881', CAST(N'2019-11-27T21:01:19.7796414' AS DateTime2), CAST(N'2020-05-27T21:01:19.7796416' AS DateTime2), 0, 0, 1)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [UserId]) VALUES (N'91354473-2016-480a-9dd6-4dd977038d62', N'0d0a61a6-40a7-4a8b-a3fb-18a52d7c8529', CAST(N'2020-01-04T13:41:58.2637943' AS DateTime2), CAST(N'2020-07-04T13:41:58.2637950' AS DateTime2), 0, 0, 2)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [UserId]) VALUES (N'917e0ee8-2828-413e-8643-050eda0064f0', N'bb86afd1-d07c-4b70-87a8-92c5956cb359', CAST(N'2019-11-27T20:56:44.3608656' AS DateTime2), CAST(N'2020-05-27T20:56:44.3608660' AS DateTime2), 0, 0, 1)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [UserId]) VALUES (N'918b0241-1a3b-4caa-878c-b9772112b055', N'36fd9f2c-245d-4c6e-ab50-e581c4689201', CAST(N'2019-11-26T00:09:39.8870054' AS DateTime2), CAST(N'2020-05-26T00:09:39.8870058' AS DateTime2), 0, 0, 1)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [UserId]) VALUES (N'93db41fb-4b6b-4c2b-ad8e-c85b151cd534', N'6393cd81-c084-4ccb-96d9-9a9fba1ebed7', CAST(N'2019-11-27T21:04:41.9191140' AS DateTime2), CAST(N'2020-05-27T21:04:41.9191145' AS DateTime2), 0, 0, 1)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [UserId]) VALUES (N'95340887-6614-4875-9e82-8b53c7df765b', N'145a2afa-355e-47df-b5a9-b2b3075dfcb6', CAST(N'2019-11-27T21:00:43.4481757' AS DateTime2), CAST(N'2020-05-27T21:00:43.4481761' AS DateTime2), 0, 0, 1)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [UserId]) VALUES (N'95be0682-a38b-48e1-8647-4bcad6e366ae', N'ee3a20a2-3347-4cd5-9ff9-c9be6f42e125', CAST(N'2019-11-27T20:56:44.2079252' AS DateTime2), CAST(N'2020-05-27T20:56:44.2079258' AS DateTime2), 0, 0, 1)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [UserId]) VALUES (N'97ab62a3-5882-4ebf-bf53-e97cf1108a87', N'8701725a-09a2-4a7d-9f31-140faca45099', CAST(N'2020-01-04T15:20:02.2216478' AS DateTime2), CAST(N'2020-07-04T15:20:02.2216484' AS DateTime2), 0, 0, 1)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [UserId]) VALUES (N'9e4c0e90-4a1a-405d-ac20-1ea725953019', N'8fc64812-465d-4c0e-bc13-d90d4ee9f981', CAST(N'2020-01-03T18:13:08.1501317' AS DateTime2), CAST(N'2020-07-03T18:13:08.1502044' AS DateTime2), 0, 0, 1)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [UserId]) VALUES (N'9f005e25-61ce-40f9-bb48-a9837f3212c0', N'4a716235-b346-4e33-b8dd-321993ddd686', CAST(N'2020-01-04T13:01:43.7004816' AS DateTime2), CAST(N'2020-07-04T13:01:43.7004821' AS DateTime2), 0, 0, 4)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [UserId]) VALUES (N'a19a5801-22d2-462c-b20c-b40e6b0781e6', N'c0786e3f-313b-4efb-923c-481c99d4afd3', CAST(N'2019-11-27T20:56:44.6281125' AS DateTime2), CAST(N'2020-05-27T20:56:44.6281130' AS DateTime2), 0, 0, 1)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [UserId]) VALUES (N'a2be4166-dd00-4b24-b309-b11b29abc7cf', N'6cc7c926-dedf-423c-80ad-48cfbe802100', CAST(N'2020-01-05T14:36:09.4936121' AS DateTime2), CAST(N'2020-07-05T14:36:09.4936996' AS DateTime2), 0, 0, 1)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [UserId]) VALUES (N'a611a248-7d42-4994-ab2c-0ba5df09d5d8', N'aadcc6f0-7082-4502-af33-744f4549570e', CAST(N'2019-11-26T00:05:04.1080126' AS DateTime2), CAST(N'2020-05-26T00:05:04.1080132' AS DateTime2), 0, 0, 1)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [UserId]) VALUES (N'abe771fc-156f-4423-9f4d-f4abcfe78f6a', N'd4d07bb0-8c22-4155-8d9b-bc91c4c5719c', CAST(N'2019-11-27T20:59:58.6188746' AS DateTime2), CAST(N'2020-05-27T20:59:58.6188750' AS DateTime2), 0, 0, 1)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [UserId]) VALUES (N'b33d1702-65d8-4e41-8fc3-bd4ed3939d5c', N'c1d764be-8a9d-4538-8bec-d47b5981b3db', CAST(N'2019-11-27T21:01:45.1549164' AS DateTime2), CAST(N'2020-05-27T21:01:45.1549169' AS DateTime2), 0, 0, 1)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [UserId]) VALUES (N'b4061c0f-b247-4164-a28e-1caf8f89d865', N'cc56bb25-4a1a-4750-a2a4-b05c0faf4cef', CAST(N'2019-11-27T21:00:43.2963739' AS DateTime2), CAST(N'2020-05-27T21:00:43.2963745' AS DateTime2), 0, 0, 1)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [UserId]) VALUES (N'c68c8edc-93b1-492b-b05b-fca5dffb618e', N'360269b1-0586-4807-9f72-98288a30d154', CAST(N'2019-11-27T21:00:44.0353565' AS DateTime2), CAST(N'2020-05-27T21:00:44.0353571' AS DateTime2), 0, 0, 1)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [UserId]) VALUES (N'c7e213a8-10ae-420c-98c1-d84d362ebeec', N'aef10e80-2a04-4b11-851a-6140b8093611', CAST(N'2020-01-04T15:17:59.1399673' AS DateTime2), CAST(N'2020-07-04T15:17:59.1399677' AS DateTime2), 0, 0, 1)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [UserId]) VALUES (N'cb4a1af7-49c2-4c51-b96d-df37c5d8f1cc', N'16113a59-bc72-4cd7-a214-9f536e2b18bd', CAST(N'2019-11-27T20:56:44.4888004' AS DateTime2), CAST(N'2020-05-27T20:56:44.4888008' AS DateTime2), 0, 0, 1)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [UserId]) VALUES (N'cd038b5b-30ba-42dd-bb3f-8858c0c1b9a2', N'adf03316-095e-41d1-bd4c-8f5bff44167a', CAST(N'2019-11-27T20:34:29.9576676' AS DateTime2), CAST(N'2020-05-27T20:34:29.9576679' AS DateTime2), 0, 0, 1)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [UserId]) VALUES (N'cd9cab2e-ac2e-46c8-bb09-35b43e0435c3', N'977f2d8d-2c45-4457-924c-4366abde6fea', CAST(N'2019-12-23T14:18:59.4425547' AS DateTime2), CAST(N'2020-06-23T14:18:59.4426281' AS DateTime2), 0, 0, 6)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [UserId]) VALUES (N'ce534d36-d5de-4c12-af4a-de7fb3ee8ace', N'512dfcb7-231d-4370-8d58-5831bc313b33', CAST(N'2019-11-27T21:03:16.8693827' AS DateTime2), CAST(N'2020-05-27T21:03:16.8693829' AS DateTime2), 0, 0, 1)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [UserId]) VALUES (N'd05e375d-3104-467e-8cf2-840d36555977', N'a635c184-e577-4bbc-b625-c023493c5c52', CAST(N'2019-11-27T22:18:02.2587765' AS DateTime2), CAST(N'2020-05-27T22:18:02.2587770' AS DateTime2), 0, 0, 1)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [UserId]) VALUES (N'd41dd5af-6e85-4408-a819-382fe920ebbf', N'4a6d4a44-a6ea-4a38-9d71-48af79eadce2', CAST(N'2019-11-26T23:25:31.2244116' AS DateTime2), CAST(N'2020-05-26T23:25:31.2244119' AS DateTime2), 0, 0, 4)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [UserId]) VALUES (N'd984ed67-d9a6-4ff5-bfb8-a2324106f6ec', N'b05d6c51-4637-44c9-b716-abf0e0f3a01c', CAST(N'2019-11-27T00:06:36.0198433' AS DateTime2), CAST(N'2020-05-27T00:06:36.0199585' AS DateTime2), 0, 0, 1)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [UserId]) VALUES (N'dabb0330-d793-49c8-965a-3806fab0995f', N'63f923f1-d865-4c75-82f3-979b82ce8e3e', CAST(N'2019-11-26T23:57:34.0783103' AS DateTime2), CAST(N'2020-05-26T23:57:34.0783933' AS DateTime2), 0, 0, 1)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [UserId]) VALUES (N'db736eaa-f44c-41b0-855b-af9d65d71a3f', N'2f321cb5-af7b-4f47-a015-6510751fa64e', CAST(N'2020-01-03T11:29:26.8987110' AS DateTime2), CAST(N'2020-07-03T11:29:26.8987794' AS DateTime2), 0, 0, 7)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [UserId]) VALUES (N'dfeb448c-fbdf-4582-8424-40a970de39e2', N'd3319d52-9577-4026-825f-9721ad17b83a', CAST(N'2019-11-26T23:51:33.2997567' AS DateTime2), CAST(N'2020-05-26T23:51:33.2997574' AS DateTime2), 0, 0, 1)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [UserId]) VALUES (N'e1a9d6e4-6230-470c-8938-b71dbc286ba2', N'126c7dc5-e6bf-435f-8f14-07e39e12691c', CAST(N'2019-12-23T13:42:55.3400074' AS DateTime2), CAST(N'2020-06-23T13:42:55.3401184' AS DateTime2), 0, 0, 6)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [UserId]) VALUES (N'e33775cb-88eb-4d83-9784-0f27c8a97616', N'6ca44e21-2981-48db-961d-68f873fa3a62', CAST(N'2019-11-29T18:37:04.8081037' AS DateTime2), CAST(N'2020-05-29T18:37:04.8082271' AS DateTime2), 0, 0, 1)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [UserId]) VALUES (N'e81926e5-5884-4498-829d-954ecd72dfc1', N'3edb19f1-d064-4911-8b96-54bcff0759f2', CAST(N'2019-11-27T20:37:59.5479700' AS DateTime2), CAST(N'2020-05-27T20:37:59.5479703' AS DateTime2), 0, 0, 1)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [UserId]) VALUES (N'e96440f0-53d9-4da7-b3d8-7c4f584b27c5', N'b0b0cb1e-e573-4144-a11d-a3c0bbeb8d69', CAST(N'2019-11-27T21:00:43.7182896' AS DateTime2), CAST(N'2020-05-27T21:00:43.7182899' AS DateTime2), 0, 0, 1)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [UserId]) VALUES (N'eb15d399-201b-4937-8fdc-51273ce79d15', N'8f3ec3bf-8405-4e1a-ad56-2d617c97a144', CAST(N'2020-01-04T15:20:37.5051706' AS DateTime2), CAST(N'2020-07-04T15:20:37.5051711' AS DateTime2), 0, 0, 1)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [UserId]) VALUES (N'ee32fe69-abbf-4f99-adbe-d726923fac48', N'c72596e2-9610-4b4a-a9c0-7214e3951580', CAST(N'2020-01-02T09:35:05.2926185' AS DateTime2), CAST(N'2020-07-02T09:35:05.2927565' AS DateTime2), 0, 0, 6)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [UserId]) VALUES (N'f10ef7d7-c4ed-4c14-b1ea-b3eafff917c5', N'5e74f314-371d-4111-91b1-ea2a2a249e3c', CAST(N'2020-01-04T15:18:10.2175730' AS DateTime2), CAST(N'2020-07-04T15:18:10.2175733' AS DateTime2), 0, 0, 9)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [UserId]) VALUES (N'f2299c0f-0e76-4a72-9c76-dd42fd362a30', N'f71c9c17-8dea-419c-8325-a445d21f0021', CAST(N'2019-11-27T22:02:55.2086452' AS DateTime2), CAST(N'2020-05-27T22:02:55.2086454' AS DateTime2), 0, 0, 1)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [UserId]) VALUES (N'f3b58e8d-2247-4ee5-876e-cef46f4c9075', N'45137a16-de4d-4976-8b1f-f709a8cec7f8', CAST(N'2019-11-27T21:00:43.6240941' AS DateTime2), CAST(N'2020-05-27T21:00:43.6240945' AS DateTime2), 0, 0, 1)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [UserId]) VALUES (N'f40470c9-c64a-45f8-9085-6947d0c77f78', N'8ef717de-9f72-406d-a867-b13a2d0e2b85', CAST(N'2019-11-24T23:24:03.2686528' AS DateTime2), CAST(N'2020-05-24T23:24:03.2687232' AS DateTime2), 0, 0, 1)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [UserId]) VALUES (N'f530a7b4-d074-4a78-8511-fe030461ec39', N'1bcdb485-86ee-459d-a14a-2d641d00758c', CAST(N'2019-11-27T20:56:44.0714820' AS DateTime2), CAST(N'2020-05-27T20:56:44.0714824' AS DateTime2), 0, 0, 1)
GO
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [UserId]) VALUES (N'f5762554-931c-4eac-a98a-1c9d4981e205', N'6577cc00-34f1-4320-8ea7-4ec49014f328', CAST(N'2020-01-04T15:06:18.5377083' AS DateTime2), CAST(N'2020-07-04T15:06:18.5377851' AS DateTime2), 0, 0, 1)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [UserId]) VALUES (N'f6b7535a-938e-46c8-a52c-50908fe4ee91', N'f3a891e7-7ad9-4f28-9fa8-1c3cb22720eb', CAST(N'2020-01-04T15:42:02.1372115' AS DateTime2), CAST(N'2020-07-04T15:42:02.1372122' AS DateTime2), 0, 0, 1)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [UserId]) VALUES (N'f6eb94f9-0017-46f8-9792-8ee9a4c319c1', N'50c2bc06-1eb1-4d89-aa64-106d46b49a42', CAST(N'2019-11-26T23:14:23.4402341' AS DateTime2), CAST(N'2020-05-26T23:14:23.4402345' AS DateTime2), 0, 0, 4)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [UserId]) VALUES (N'f7bd3cfe-3261-43b9-a5bc-ce8a9b95f7a1', N'4c94776b-158d-4ae7-bf9f-9c02c1e36805', CAST(N'2019-11-27T21:00:44.1728354' AS DateTime2), CAST(N'2020-05-27T21:00:44.1728357' AS DateTime2), 0, 0, 1)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [UserId]) VALUES (N'f820f7f9-dacb-4027-9b53-86e9e414f64b', N'f7ceb00e-171e-4e89-b0ad-e1484caf7afc', CAST(N'2019-11-27T00:10:07.5031110' AS DateTime2), CAST(N'2020-05-27T00:10:07.5031788' AS DateTime2), 0, 0, 1)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [UserId]) VALUES (N'f8e24cd6-e8a8-48c3-868f-4c415e7dea9c', N'37baec4d-90a1-4395-9c6a-aed34d903d79', CAST(N'2019-11-26T23:51:21.0859827' AS DateTime2), CAST(N'2020-05-26T23:51:21.0859833' AS DateTime2), 0, 0, 1)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [UserId]) VALUES (N'f9bb44ac-21ba-4775-9fda-706872e08955', N'2fc37f4d-fbbf-43f0-9337-a850b429f954', CAST(N'2019-11-27T21:00:42.9323044' AS DateTime2), CAST(N'2020-05-27T21:00:42.9323048' AS DateTime2), 0, 0, 1)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [UserId]) VALUES (N'fa37e0ed-3086-4d2d-833d-edbdbe7c6eb9', N'1b97b753-881f-4f25-8aa0-56b91c84ce9b', CAST(N'2019-12-23T16:43:18.5121515' AS DateTime2), CAST(N'2020-06-23T16:43:18.5122257' AS DateTime2), 0, 0, 1)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [UserId]) VALUES (N'fa864add-b27c-44f9-acce-dd9ca32c556c', N'0616a22d-58a4-461e-844c-778a8140e579', CAST(N'2019-11-26T23:02:25.4254852' AS DateTime2), CAST(N'2020-05-26T23:02:25.4255605' AS DateTime2), 0, 0, 3)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [UserId]) VALUES (N'fae58473-8f34-43df-afff-22381ff0b518', N'8fffb468-718c-42c8-bea5-33298ef19412', CAST(N'2020-01-03T17:53:45.0772292' AS DateTime2), CAST(N'2020-07-03T17:53:45.0772995' AS DateTime2), 0, 0, 1)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [UserId]) VALUES (N'fd101478-419b-4b01-b2de-dafadec6eb9b', N'e4eff4ae-b8dd-4878-860b-7057cad10c3e', CAST(N'2019-11-27T20:56:53.5423645' AS DateTime2), CAST(N'2020-05-27T20:56:53.5423649' AS DateTime2), 0, 0, 1)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [UserId]) VALUES (N'fdc11f3a-edac-4f7a-a0de-64067702212a', N'b0f247af-2525-4419-9f6e-037729a13b53', CAST(N'2019-11-27T00:08:40.8474849' AS DateTime2), CAST(N'2020-05-27T00:08:40.8475515' AS DateTime2), 0, 0, 1)
INSERT [dbo].[RefreshTokens] ([Token], [JwtId], [CreationDate], [ExpiryDate], [Used], [Invalidated], [UserId]) VALUES (N'fee162ab-a423-4f63-825e-2a32f345f94f', N'c8568634-2861-4542-bfd7-7a948eaaeea9', CAST(N'2020-01-04T15:09:40.3939811' AS DateTime2), CAST(N'2020-07-04T15:09:40.3939815' AS DateTime2), 0, 0, 9)
SET IDENTITY_INSERT [dbo].[Tickets] ON 

INSERT [dbo].[Tickets] ([Id], [EventParentId], [TicketTypeId], [Price], [Remaining], [Deleted]) VALUES (1, 1, 1, 50, 189, 0)
INSERT [dbo].[Tickets] ([Id], [EventParentId], [TicketTypeId], [Price], [Remaining], [Deleted]) VALUES (2, 1, 2, 100, 95, 0)
INSERT [dbo].[Tickets] ([Id], [EventParentId], [TicketTypeId], [Price], [Remaining], [Deleted]) VALUES (3, 1, 3, 150, 23, 0)
INSERT [dbo].[Tickets] ([Id], [EventParentId], [TicketTypeId], [Price], [Remaining], [Deleted]) VALUES (4, 2, 1, 20, 300, 0)
INSERT [dbo].[Tickets] ([Id], [EventParentId], [TicketTypeId], [Price], [Remaining], [Deleted]) VALUES (5, 2, 2, 50, 50, 0)
INSERT [dbo].[Tickets] ([Id], [EventParentId], [TicketTypeId], [Price], [Remaining], [Deleted]) VALUES (6, 3, 1, 100, 200, 1)
INSERT [dbo].[Tickets] ([Id], [EventParentId], [TicketTypeId], [Price], [Remaining], [Deleted]) VALUES (7, 4, 1, 50, 100, 1)
INSERT [dbo].[Tickets] ([Id], [EventParentId], [TicketTypeId], [Price], [Remaining], [Deleted]) VALUES (8, 4, 3, 75, 50, 1)
INSERT [dbo].[Tickets] ([Id], [EventParentId], [TicketTypeId], [Price], [Remaining], [Deleted]) VALUES (9, 5, 1, 55, 150, 0)
INSERT [dbo].[Tickets] ([Id], [EventParentId], [TicketTypeId], [Price], [Remaining], [Deleted]) VALUES (10, 5, 2, 80, 150, 0)
INSERT [dbo].[Tickets] ([Id], [EventParentId], [TicketTypeId], [Price], [Remaining], [Deleted]) VALUES (11, 6, 1, 80, 300, 0)
INSERT [dbo].[Tickets] ([Id], [EventParentId], [TicketTypeId], [Price], [Remaining], [Deleted]) VALUES (12, 7, 3, 300, 100, 0)
INSERT [dbo].[Tickets] ([Id], [EventParentId], [TicketTypeId], [Price], [Remaining], [Deleted]) VALUES (13, 8, 2, 277, 235, 1)
INSERT [dbo].[Tickets] ([Id], [EventParentId], [TicketTypeId], [Price], [Remaining], [Deleted]) VALUES (14, 8, 3, 255, 248, 1)
INSERT [dbo].[Tickets] ([Id], [EventParentId], [TicketTypeId], [Price], [Remaining], [Deleted]) VALUES (15, 9, 3, 30, 30, 0)
INSERT [dbo].[Tickets] ([Id], [EventParentId], [TicketTypeId], [Price], [Remaining], [Deleted]) VALUES (16, 9, 1, 20, 20, 0)
SET IDENTITY_INSERT [dbo].[Tickets] OFF
SET IDENTITY_INSERT [dbo].[TicketTypes] ON 

INSERT [dbo].[TicketTypes] ([Id], [Name], [Deleted]) VALUES (1, N'Normal', 0)
INSERT [dbo].[TicketTypes] ([Id], [Name], [Deleted]) VALUES (2, N'Premium', 0)
INSERT [dbo].[TicketTypes] ([Id], [Name], [Deleted]) VALUES (3, N'VIP', 0)
SET IDENTITY_INSERT [dbo].[TicketTypes] OFF
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 1/5/2020 4:52:52 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 1/5/2020 4:52:52 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 1/5/2020 4:52:52 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 1/5/2020 4:52:52 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 1/5/2020 4:52:52 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 1/5/2020 4:52:52 PM ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 1/5/2020 4:52:52 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_EventParents_EventGenreId]    Script Date: 1/5/2020 4:52:52 PM ******/
CREATE NONCLUSTERED INDEX [IX_EventParents_EventGenreId] ON [dbo].[EventParents]
(
	[EventGenreId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_EventParents_EventTypeId]    Script Date: 1/5/2020 4:52:52 PM ******/
CREATE NONCLUSTERED INDEX [IX_EventParents_EventTypeId] ON [dbo].[EventParents]
(
	[EventTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_EventParents_LocationId]    Script Date: 1/5/2020 4:52:52 PM ******/
CREATE NONCLUSTERED INDEX [IX_EventParents_LocationId] ON [dbo].[EventParents]
(
	[LocationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_EventParents_PersonId]    Script Date: 1/5/2020 4:52:52 PM ******/
CREATE NONCLUSTERED INDEX [IX_EventParents_PersonId] ON [dbo].[EventParents]
(
	[PersonId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_EventTypeXEventGenres_EventGenreId]    Script Date: 1/5/2020 4:52:52 PM ******/
CREATE NONCLUSTERED INDEX [IX_EventTypeXEventGenres_EventGenreId] ON [dbo].[EventTypeXEventGenres]
(
	[EventGenreId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_EventTypeXEventGenres_EventTypeId]    Script Date: 1/5/2020 4:52:52 PM ******/
CREATE NONCLUSTERED INDEX [IX_EventTypeXEventGenres_EventTypeId] ON [dbo].[EventTypeXEventGenres]
(
	[EventTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Persons_UserId]    Script Date: 1/5/2020 4:52:52 PM ******/
CREATE NONCLUSTERED INDEX [IX_Persons_UserId] ON [dbo].[Persons]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_PersonXTickets_PersonId]    Script Date: 1/5/2020 4:52:52 PM ******/
CREATE NONCLUSTERED INDEX [IX_PersonXTickets_PersonId] ON [dbo].[PersonXTickets]
(
	[PersonId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_PersonXTickets_TicketId]    Script Date: 1/5/2020 4:52:52 PM ******/
CREATE NONCLUSTERED INDEX [IX_PersonXTickets_TicketId] ON [dbo].[PersonXTickets]
(
	[TicketId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_RefreshTokens_UserId]    Script Date: 1/5/2020 4:52:52 PM ******/
CREATE NONCLUSTERED INDEX [IX_RefreshTokens_UserId] ON [dbo].[RefreshTokens]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Tickets_EventParentId]    Script Date: 1/5/2020 4:52:52 PM ******/
CREATE NONCLUSTERED INDEX [IX_Tickets_EventParentId] ON [dbo].[Tickets]
(
	[EventParentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Tickets_TicketTypeId]    Script Date: 1/5/2020 4:52:52 PM ******/
CREATE NONCLUSTERED INDEX [IX_Tickets_TicketTypeId] ON [dbo].[Tickets]
(
	[TicketTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[EventParents] ADD  DEFAULT ('0001-01-01T00:00:00.0000000') FOR [DateAndHour]
GO
ALTER TABLE [dbo].[EventParents] ADD  DEFAULT (CONVERT([bigint],(0))) FOR [LocationId]
GO
ALTER TABLE [dbo].[EventParents] ADD  DEFAULT (CONVERT([bigint],(0))) FOR [PersonId]
GO
ALTER TABLE [dbo].[Persons] ADD  DEFAULT (CONVERT([bit],(0))) FOR [Deleted]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[EventParents]  WITH CHECK ADD  CONSTRAINT [FK_EventParents_EventGenres_EventGenreId] FOREIGN KEY([EventGenreId])
REFERENCES [dbo].[EventGenres] ([Id])
GO
ALTER TABLE [dbo].[EventParents] CHECK CONSTRAINT [FK_EventParents_EventGenres_EventGenreId]
GO
ALTER TABLE [dbo].[EventParents]  WITH CHECK ADD  CONSTRAINT [FK_EventParents_EventTypes_EventTypeId] FOREIGN KEY([EventTypeId])
REFERENCES [dbo].[EventTypes] ([Id])
GO
ALTER TABLE [dbo].[EventParents] CHECK CONSTRAINT [FK_EventParents_EventTypes_EventTypeId]
GO
ALTER TABLE [dbo].[EventParents]  WITH CHECK ADD  CONSTRAINT [FK_EventParents_Locations_LocationId] FOREIGN KEY([LocationId])
REFERENCES [dbo].[Locations] ([Id])
GO
ALTER TABLE [dbo].[EventParents] CHECK CONSTRAINT [FK_EventParents_Locations_LocationId]
GO
ALTER TABLE [dbo].[EventParents]  WITH CHECK ADD  CONSTRAINT [FK_EventParents_Persons_PersonId] FOREIGN KEY([PersonId])
REFERENCES [dbo].[Persons] ([Id])
GO
ALTER TABLE [dbo].[EventParents] CHECK CONSTRAINT [FK_EventParents_Persons_PersonId]
GO
ALTER TABLE [dbo].[EventTypeXEventGenres]  WITH CHECK ADD  CONSTRAINT [FK_EventTypeXEventGenres_EventGenres_EventGenreId] FOREIGN KEY([EventGenreId])
REFERENCES [dbo].[EventGenres] ([Id])
GO
ALTER TABLE [dbo].[EventTypeXEventGenres] CHECK CONSTRAINT [FK_EventTypeXEventGenres_EventGenres_EventGenreId]
GO
ALTER TABLE [dbo].[EventTypeXEventGenres]  WITH CHECK ADD  CONSTRAINT [FK_EventTypeXEventGenres_EventTypes_EventTypeId] FOREIGN KEY([EventTypeId])
REFERENCES [dbo].[EventTypes] ([Id])
GO
ALTER TABLE [dbo].[EventTypeXEventGenres] CHECK CONSTRAINT [FK_EventTypeXEventGenres_EventTypes_EventTypeId]
GO
ALTER TABLE [dbo].[Persons]  WITH CHECK ADD  CONSTRAINT [FK_Persons_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Persons] CHECK CONSTRAINT [FK_Persons_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[PersonXTickets]  WITH CHECK ADD  CONSTRAINT [FK_PersonXTickets_Persons_PersonId] FOREIGN KEY([PersonId])
REFERENCES [dbo].[Persons] ([Id])
GO
ALTER TABLE [dbo].[PersonXTickets] CHECK CONSTRAINT [FK_PersonXTickets_Persons_PersonId]
GO
ALTER TABLE [dbo].[PersonXTickets]  WITH CHECK ADD  CONSTRAINT [FK_PersonXTickets_Tickets_TicketId] FOREIGN KEY([TicketId])
REFERENCES [dbo].[Tickets] ([Id])
GO
ALTER TABLE [dbo].[PersonXTickets] CHECK CONSTRAINT [FK_PersonXTickets_Tickets_TicketId]
GO
ALTER TABLE [dbo].[RefreshTokens]  WITH CHECK ADD  CONSTRAINT [FK_RefreshTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[RefreshTokens] CHECK CONSTRAINT [FK_RefreshTokens_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Tickets]  WITH CHECK ADD  CONSTRAINT [FK_Tickets_EventParents_EventParentId] FOREIGN KEY([EventParentId])
REFERENCES [dbo].[EventParents] ([Id])
GO
ALTER TABLE [dbo].[Tickets] CHECK CONSTRAINT [FK_Tickets_EventParents_EventParentId]
GO
ALTER TABLE [dbo].[Tickets]  WITH CHECK ADD  CONSTRAINT [FK_Tickets_TicketTypes_TicketTypeId] FOREIGN KEY([TicketTypeId])
REFERENCES [dbo].[TicketTypes] ([Id])
GO
ALTER TABLE [dbo].[Tickets] CHECK CONSTRAINT [FK_Tickets_TicketTypes_TicketTypeId]
GO
USE [master]
GO
ALTER DATABASE [BiletePentruToti] SET  READ_WRITE 
GO
