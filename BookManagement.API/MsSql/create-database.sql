USE [master]
GO
/****** Object:  Database [BookManagement]    Script Date: 14/12/2022 12:38:54 ******/
CREATE DATABASE [BookManagement]
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [BookManagement] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BookManagement].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BookManagement] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BookManagement] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BookManagement] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BookManagement] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BookManagement] SET ARITHABORT OFF 
GO
ALTER DATABASE [BookManagement] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BookManagement] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BookManagement] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BookManagement] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BookManagement] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BookManagement] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BookManagement] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BookManagement] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BookManagement] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BookManagement] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BookManagement] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BookManagement] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BookManagement] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BookManagement] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BookManagement] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BookManagement] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [BookManagement] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BookManagement] SET RECOVERY FULL 
GO
ALTER DATABASE [BookManagement] SET  MULTI_USER 
GO
ALTER DATABASE [BookManagement] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BookManagement] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BookManagement] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BookManagement] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BookManagement] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BookManagement] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'BookManagement', N'ON'
GO
ALTER DATABASE [BookManagement] SET QUERY_STORE = OFF
GO
USE [BookManagement]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 14/12/2022 12:38:54 ******/
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
/****** Object:  Table [dbo].[Books]    Script Date: 14/12/2022 12:38:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Books](
	[Id] [uniqueidentifier] NOT NULL,
	[Title] [nvarchar](max) NULL,
	[Author] [nvarchar](max) NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[LaunchDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Books] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Persons]    Script Date: 14/12/2022 12:38:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Persons](
	[Id] [uniqueidentifier] NOT NULL,
	[FirstName] [nvarchar](max) NULL,
	[LastName] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
	[Gender] [nvarchar](max) NULL,
 CONSTRAINT [PK_Persons] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 14/12/2022 12:38:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [uniqueidentifier] NOT NULL,
	[Login] [nvarchar](max) NULL,
	[AccessKey] [nvarchar](max) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20221212163856_InitialConfiguration', N'6.0.11')
GO
INSERT [dbo].[Books] ([Id], [Title], [Author], [Price], [LaunchDate]) VALUES (N'965ffdba-3c7a-ed11-b25b-8a1a0693972a', N'Working effectively with legacy code', N'Michael C. Feathers', CAST(49.00 AS Decimal(18, 2)), CAST(N'2017-11-29T13:50:05.8780000' AS DateTime2))
GO
INSERT [dbo].[Books] ([Id], [Title], [Author], [Price], [LaunchDate]) VALUES (N'975ffdba-3c7a-ed11-b25b-8a1a0693972a', N'Design Patterns', N'Ralph Johnson, Erich Gamma, John Vlissides e Richard Helm', CAST(45.00 AS Decimal(18, 2)), CAST(N'2017-11-29T15:15:13.6360000' AS DateTime2))
GO
INSERT [dbo].[Books] ([Id], [Title], [Author], [Price], [LaunchDate]) VALUES (N'985ffdba-3c7a-ed11-b25b-8a1a0693972a', N'Clean Code', N'Robert C. Martin', CAST(77.00 AS Decimal(18, 2)), CAST(N'2009-01-10T00:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[Books] ([Id], [Title], [Author], [Price], [LaunchDate]) VALUES (N'995ffdba-3c7a-ed11-b25b-8a1a0693972a', N'JavaScript', N'Crockford', CAST(67.00 AS Decimal(18, 2)), CAST(N'2017-11-07T15:09:01.6740000' AS DateTime2))
GO
INSERT [dbo].[Books] ([Id], [Title], [Author], [Price], [LaunchDate]) VALUES (N'9a5ffdba-3c7a-ed11-b25b-8a1a0693972a', N'Code complete', N'Steve McConnell', CAST(58.00 AS Decimal(18, 2)), CAST(N'2017-11-07T15:09:01.6740000' AS DateTime2))
GO
INSERT [dbo].[Books] ([Id], [Title], [Author], [Price], [LaunchDate]) VALUES (N'9b5ffdba-3c7a-ed11-b25b-8a1a0693972a', N'Refactoring', N'Martin Fowler e Kent Beck', CAST(88.00 AS Decimal(18, 2)), CAST(N'2017-11-07T15:09:01.6740000' AS DateTime2))
GO
INSERT [dbo].[Books] ([Id], [Title], [Author], [Price], [LaunchDate]) VALUES (N'9c5ffdba-3c7a-ed11-b25b-8a1a0693972a', N'Head First Design Patterns', N'Eric Freeman, Elisabeth Freeman, Kathy Sierra, Bert Bates', CAST(110.00 AS Decimal(18, 2)), CAST(N'2017-11-07T15:09:01.6740000' AS DateTime2))
GO
INSERT [dbo].[Books] ([Id], [Title], [Author], [Price], [LaunchDate]) VALUES (N'9d5ffdba-3c7a-ed11-b25b-8a1a0693972a', N'Domain Driven Design', N'Eric Evans', CAST(92.00 AS Decimal(18, 2)), CAST(N'2017-11-07T15:09:01.6740000' AS DateTime2))
GO
INSERT [dbo].[Books] ([Id], [Title], [Author], [Price], [LaunchDate]) VALUES (N'9e5ffdba-3c7a-ed11-b25b-8a1a0693972a', N'Java Concurrency in Practice', N'Brian Goetz e Tim Peierls', CAST(80.00 AS Decimal(18, 2)), CAST(N'2017-11-07T15:09:01.6740000' AS DateTime2))
GO
INSERT [dbo].[Books] ([Id], [Title], [Author], [Price], [LaunchDate]) VALUES (N'9f5ffdba-3c7a-ed11-b25b-8a1a0693972a', N'O poder dos quietos', N'Susan Cain', CAST(123.00 AS Decimal(18, 2)), CAST(N'2017-11-07T15:09:01.6740000' AS DateTime2))
GO
INSERT [dbo].[Books] ([Id], [Title], [Author], [Price], [LaunchDate]) VALUES (N'a05ffdba-3c7a-ed11-b25b-8a1a0693972a', N'Engenharia de Software: uma abordagem profissional', N'Roger S. Pressman', CAST(56.00 AS Decimal(18, 2)), CAST(N'2017-11-07T15:09:01.6740000' AS DateTime2))
GO
INSERT [dbo].[Books] ([Id], [Title], [Author], [Price], [LaunchDate]) VALUES (N'a15ffdba-3c7a-ed11-b25b-8a1a0693972a', N'Big Data: como extrair volume, variedade, velocidade e valor da avalanche de informação cotidiana', N'Viktor Mayer-Schonberger e Kenneth Kukier', CAST(54.00 AS Decimal(18, 2)), CAST(N'2017-11-07T15:09:01.6740000' AS DateTime2))
GO
INSERT [dbo].[Books] ([Id], [Title], [Author], [Price], [LaunchDate]) VALUES (N'a25ffdba-3c7a-ed11-b25b-8a1a0693972a', N'O verdadeiro valor de TI', N'Richard Hunter e George Westerman', CAST(95.00 AS Decimal(18, 2)), CAST(N'2017-11-07T15:09:01.6740000' AS DateTime2))
GO
INSERT [dbo].[Books] ([Id], [Title], [Author], [Price], [LaunchDate]) VALUES (N'a35ffdba-3c7a-ed11-b25b-8a1a0693972a', N'Os 11 segredos de líderes de TI altamente influentes', N'Marc J. Schiller', CAST(45.00 AS Decimal(18, 2)), CAST(N'2017-11-07T15:09:01.6740000' AS DateTime2))
GO
INSERT [dbo].[Books] ([Id], [Title], [Author], [Price], [LaunchDate]) VALUES (N'a45ffdba-3c7a-ed11-b25b-8a1a0693972a', N'Implantando a governança de TI', N'Aguinaldo Aragon Fernandes e Vladimir Ferraz de Abreu', CAST(54.00 AS Decimal(18, 2)), CAST(N'2017-11-07T15:09:01.6740000' AS DateTime2))
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'fd086c88-3c7a-ed11-b25b-8a1a0693972a', N'Nancey', N'Accombe', N'343 Oak Hill', N'Female')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'fe086c88-3c7a-ed11-b25b-8a1a0693972a', N'Liz', N'Carcass', N'517 New Castle Court', N'Female')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'ff086c88-3c7a-ed11-b25b-8a1a0693972a', N'Bobbe', N'Allett', N'18088 Redwing Plaza', N'Female')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'00096c88-3c7a-ed11-b25b-8a1a0693972a', N'Chas', N'Kinnard', N'0016 Green Place', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'01096c88-3c7a-ed11-b25b-8a1a0693972a', N'Brear', N'Pien', N'90 Barnett Crossing', N'Female')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'02096c88-3c7a-ed11-b25b-8a1a0693972a', N'Stephanie', N'Luckings', N'0 Northwestern Lane', N'Female')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'03096c88-3c7a-ed11-b25b-8a1a0693972a', N'Rosy', N'Tash', N'3 Di Loreto Street', N'Female')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'04096c88-3c7a-ed11-b25b-8a1a0693972a', N'Chase', N'Rabl', N'4779 Merrick Trail', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'05096c88-3c7a-ed11-b25b-8a1a0693972a', N'Livvy', N'Mulvany', N'60 Hooker Parkway', N'Female')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'06096c88-3c7a-ed11-b25b-8a1a0693972a', N'Rey', N'O'' Sullivan', N'55 Oriole Avenue', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'07096c88-3c7a-ed11-b25b-8a1a0693972a', N'Adler', N'Lytell', N'30 Moulton Point', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'08096c88-3c7a-ed11-b25b-8a1a0693972a', N'Brodie', N'Glanville', N'81 Brown Point', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'09096c88-3c7a-ed11-b25b-8a1a0693972a', N'Hughie', N'Treker', N'691 Dixon Lane', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'0a096c88-3c7a-ed11-b25b-8a1a0693972a', N'Dominga', N'Cestard', N'528 Welch Court', N'Female')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'0b096c88-3c7a-ed11-b25b-8a1a0693972a', N'Janis', N'Tomley', N'2 Pearson Road', N'Female')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'0c096c88-3c7a-ed11-b25b-8a1a0693972a', N'Caroline', N'O''Kennedy', N'977 Meadow Vale Court', N'Female')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'0d096c88-3c7a-ed11-b25b-8a1a0693972a', N'Bartolomeo', N'Hover', N'080 Pearson Crossing', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'0e096c88-3c7a-ed11-b25b-8a1a0693972a', N'Westbrook', N'Klaessen', N'4 Mariners Cove Trail', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'0f096c88-3c7a-ed11-b25b-8a1a0693972a', N'Larisa', N'Horick', N'372 Huxley Junction', N'Female')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'10096c88-3c7a-ed11-b25b-8a1a0693972a', N'Aaron', N'Hollingshead', N'78389 Westport Drive', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'11096c88-3c7a-ed11-b25b-8a1a0693972a', N'Jasen', N'Quest', N'010 Waubesa Avenue', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'12096c88-3c7a-ed11-b25b-8a1a0693972a', N'Rosabella', N'Ivashkov', N'77 Village Green Junction', N'Female')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'13096c88-3c7a-ed11-b25b-8a1a0693972a', N'Ali', N'Pugsley', N'157 Sutherland Point', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'14096c88-3c7a-ed11-b25b-8a1a0693972a', N'Berni', N'McCrohon', N'64297 Butterfield Way', N'Female')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'15096c88-3c7a-ed11-b25b-8a1a0693972a', N'Gustave', N'Beggini', N'842 Kensington Trail', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'16096c88-3c7a-ed11-b25b-8a1a0693972a', N'Mort', N'Pulver', N'1 Dwight Lane', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'17096c88-3c7a-ed11-b25b-8a1a0693972a', N'Barbara-anne', N'Watling', N'3 Namekagon Terrace', N'Female')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'18096c88-3c7a-ed11-b25b-8a1a0693972a', N'Fransisco', N'Boulds', N'20470 Evergreen Junction', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'19096c88-3c7a-ed11-b25b-8a1a0693972a', N'Deanne', N'Gallichiccio', N'809 Dahle Court', N'Female')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'1a096c88-3c7a-ed11-b25b-8a1a0693972a', N'Cherise', N'Prozescky', N'1 Drewry Pass', N'Female')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'1b096c88-3c7a-ed11-b25b-8a1a0693972a', N'Percival', N'Pridden', N'3910 Badeau Alley', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'1c096c88-3c7a-ed11-b25b-8a1a0693972a', N'Noelyn', N'Bugg', N'701 Emmet Way', N'Female')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'1d096c88-3c7a-ed11-b25b-8a1a0693972a', N'Ruthanne', N'Tibbles', N'2051 Macpherson Alley', N'Female')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'1e096c88-3c7a-ed11-b25b-8a1a0693972a', N'Clark', N'Berndsen', N'04248 Harper Plaza', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'1f096c88-3c7a-ed11-b25b-8a1a0693972a', N'Kakalina', N'Niven', N'326 Fairview Crossing', N'Female')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'20096c88-3c7a-ed11-b25b-8a1a0693972a', N'Vivia', N'Gunthorpe', N'47 Evergreen Street', N'Female')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'21096c88-3c7a-ed11-b25b-8a1a0693972a', N'Adlai', N'Maude', N'5 Heath Circle', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'22096c88-3c7a-ed11-b25b-8a1a0693972a', N'Hogan', N'Higbin', N'39 Becker Place', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'23096c88-3c7a-ed11-b25b-8a1a0693972a', N'Virgina', N'Matuszinski', N'6974 Village Alley', N'Female')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'24096c88-3c7a-ed11-b25b-8a1a0693972a', N'Effie', N'Shorten', N'81953 Anniversary Circle', N'Female')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'25096c88-3c7a-ed11-b25b-8a1a0693972a', N'Buffy', N'Plet', N'7 Donald Drive', N'Female')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'26096c88-3c7a-ed11-b25b-8a1a0693972a', N'Fannie', N'Fantonetti', N'8737 Gale Road', N'Female')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'27096c88-3c7a-ed11-b25b-8a1a0693972a', N'Neville', N'Lauthian', N'694 Golf View Drive', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'28096c88-3c7a-ed11-b25b-8a1a0693972a', N'Leif', N'Rayhill', N'9642 Eagan Circle', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'29096c88-3c7a-ed11-b25b-8a1a0693972a', N'Yehudit', N'Rowberry', N'8 Talisman Alley', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'2a096c88-3c7a-ed11-b25b-8a1a0693972a', N'Anica', N'Mahady', N'3461 Utah Parkway', N'Female')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'2b096c88-3c7a-ed11-b25b-8a1a0693972a', N'Hymie', N'Vanner', N'58514 Corscot Drive', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'2c096c88-3c7a-ed11-b25b-8a1a0693972a', N'Niall', N'Sleight', N'64838 Express Alley', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'2d096c88-3c7a-ed11-b25b-8a1a0693972a', N'Sheba', N'Toten', N'99 Cherokee Lane', N'Female')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'2e096c88-3c7a-ed11-b25b-8a1a0693972a', N'Minnie', N'Starling', N'2 Glacier Hill Road', N'Female')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'2f096c88-3c7a-ed11-b25b-8a1a0693972a', N'Gibb', N'Rodolphe', N'219 Sachtjen Court', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'30096c88-3c7a-ed11-b25b-8a1a0693972a', N'Horst', N'Kinloch', N'644 American Circle', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'31096c88-3c7a-ed11-b25b-8a1a0693972a', N'Helene', N'Trouncer', N'6481 Canary Alley', N'Female')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'32096c88-3c7a-ed11-b25b-8a1a0693972a', N'Dicky', N'Beazey', N'56396 Lerdahl Street', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'33096c88-3c7a-ed11-b25b-8a1a0693972a', N'Berkeley', N'Cristofanini', N'8596 Lakeland Park', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'34096c88-3c7a-ed11-b25b-8a1a0693972a', N'Tamara', N'Cleveland', N'1 Thompson Court', N'Female')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'35096c88-3c7a-ed11-b25b-8a1a0693972a', N'Valentin', N'Sandys', N'23592 Kensington Crossing', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'36096c88-3c7a-ed11-b25b-8a1a0693972a', N'Miner', N'Cornelisse', N'8405 Prentice Place', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'37096c88-3c7a-ed11-b25b-8a1a0693972a', N'Nedda', N'Dawks', N'287 Drewry Trail', N'Female')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'38096c88-3c7a-ed11-b25b-8a1a0693972a', N'Rubi', N'Weedall', N'9061 Oriole Way', N'Female')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'39096c88-3c7a-ed11-b25b-8a1a0693972a', N'Calida', N'Gile', N'9769 Morrow Street', N'Female')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'3a096c88-3c7a-ed11-b25b-8a1a0693972a', N'Myron', N'Lethibridge', N'1968 Moulton Junction', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'3b096c88-3c7a-ed11-b25b-8a1a0693972a', N'Hart', N'Begin', N'84 Manufacturers Park', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'3c096c88-3c7a-ed11-b25b-8a1a0693972a', N'Ange', N'Kob', N'7 Independence Junction', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'3d096c88-3c7a-ed11-b25b-8a1a0693972a', N'Wendell', N'Esposito', N'2403 Rockefeller Crossing', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'3e096c88-3c7a-ed11-b25b-8a1a0693972a', N'Henry', N'Thurber', N'6067 Little Fleur Hill', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'3f096c88-3c7a-ed11-b25b-8a1a0693972a', N'Donaugh', N'Thies', N'6 Westridge Lane', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'40096c88-3c7a-ed11-b25b-8a1a0693972a', N'Kala', N'Hounson', N'514 Transport Way', N'Female')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'41096c88-3c7a-ed11-b25b-8a1a0693972a', N'Phip', N'Clail', N'126 Vahlen Circle', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'42096c88-3c7a-ed11-b25b-8a1a0693972a', N'Christy', N'Punchard', N'2 Graceland Drive', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'43096c88-3c7a-ed11-b25b-8a1a0693972a', N'Philippa', N'Hartfleet', N'79 Center Lane', N'Female')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'44096c88-3c7a-ed11-b25b-8a1a0693972a', N'Jinny', N'Gelderd', N'5 Anhalt Plaza', N'Female')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'45096c88-3c7a-ed11-b25b-8a1a0693972a', N'Annalise', N'Stanier', N'2565 Mockingbird Parkway', N'Female')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'46096c88-3c7a-ed11-b25b-8a1a0693972a', N'Anatola', N'Harnett', N'53360 Donald Road', N'Female')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'47096c88-3c7a-ed11-b25b-8a1a0693972a', N'Leon', N'De Normanville', N'57219 Welch Plaza', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'48096c88-3c7a-ed11-b25b-8a1a0693972a', N'Janessa', N'Edgeley', N'84 Almo Circle', N'Female')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'49096c88-3c7a-ed11-b25b-8a1a0693972a', N'Rolando', N'Spitell', N'07158 Hallows Drive', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'4a096c88-3c7a-ed11-b25b-8a1a0693972a', N'Pierson', N'Sailer', N'8010 John Wall Center', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'4b096c88-3c7a-ed11-b25b-8a1a0693972a', N'Dorie', N'Seneschal', N'57 Del Mar Court', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'4c096c88-3c7a-ed11-b25b-8a1a0693972a', N'Pail', N'Bridgnell', N'793 Parkside Trail', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'4d096c88-3c7a-ed11-b25b-8a1a0693972a', N'Jacquelyn', N'Stucke', N'3 Fisk Pass', N'Female')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'4e096c88-3c7a-ed11-b25b-8a1a0693972a', N'Tito', N'Mance', N'07 Fulton Avenue', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'4f096c88-3c7a-ed11-b25b-8a1a0693972a', N'Zulema', N'Strowthers', N'0101 Aberg Pass', N'Female')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'50096c88-3c7a-ed11-b25b-8a1a0693972a', N'Derk', N'McCarthy', N'584 Oriole Lane', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'51096c88-3c7a-ed11-b25b-8a1a0693972a', N'Hestia', N'Bartkiewicz', N'3 Washington Place', N'Female')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'52096c88-3c7a-ed11-b25b-8a1a0693972a', N'Cliff', N'Scotti', N'06449 South Court', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'53096c88-3c7a-ed11-b25b-8a1a0693972a', N'Drugi', N'Janton', N'003 Vahlen Lane', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'54096c88-3c7a-ed11-b25b-8a1a0693972a', N'Paco', N'Whiteson', N'0161 Riverside Junction', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'55096c88-3c7a-ed11-b25b-8a1a0693972a', N'Leodora', N'Lys', N'46277 Rusk Road', N'Female')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'56096c88-3c7a-ed11-b25b-8a1a0693972a', N'Dionis', N'Krysztofowicz', N'5509 Calypso Place', N'Female')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'57096c88-3c7a-ed11-b25b-8a1a0693972a', N'Carver', N'Fordham', N'02 Magdeline Lane', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'58096c88-3c7a-ed11-b25b-8a1a0693972a', N'Jeffy', N'Husselbee', N'621 Longview Place', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'59096c88-3c7a-ed11-b25b-8a1a0693972a', N'Kary', N'Geeraert', N'32 7th Plaza', N'Female')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'5a096c88-3c7a-ed11-b25b-8a1a0693972a', N'Sherye', N'Gilstoun', N'04 Tennyson Court', N'Female')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'5b096c88-3c7a-ed11-b25b-8a1a0693972a', N'Matthus', N'Foulser', N'783 Drewry Trail', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'5c096c88-3c7a-ed11-b25b-8a1a0693972a', N'Evyn', N'Pavyer', N'53428 Morrow Lane', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'5d096c88-3c7a-ed11-b25b-8a1a0693972a', N'Lloyd', N'Jaksic', N'6959 Arkansas Circle', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'5e096c88-3c7a-ed11-b25b-8a1a0693972a', N'Webster', N'Kagan', N'1671 Pine View Street', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'5f096c88-3c7a-ed11-b25b-8a1a0693972a', N'Alphonse', N'Kunzler', N'9 Kenwood Place', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'60096c88-3c7a-ed11-b25b-8a1a0693972a', N'Ramsay', N'Farrans', N'9378 Darwin Drive', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'61096c88-3c7a-ed11-b25b-8a1a0693972a', N'Geno', N'Spacie', N'7 Harper Way', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'62096c88-3c7a-ed11-b25b-8a1a0693972a', N'Gratia', N'Quennell', N'9 Dryden Junction', N'Female')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'63096c88-3c7a-ed11-b25b-8a1a0693972a', N'Eada', N'Roubeix', N'9 Fairfield Circle', N'Female')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'64096c88-3c7a-ed11-b25b-8a1a0693972a', N'Maurizio', N'Langland', N'600 School Street', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'65096c88-3c7a-ed11-b25b-8a1a0693972a', N'Eldin', N'Tizzard', N'150 Dryden Crossing', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'66096c88-3c7a-ed11-b25b-8a1a0693972a', N'Nelson', N'Laister', N'42407 Sommers Center', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'67096c88-3c7a-ed11-b25b-8a1a0693972a', N'Brockie', N'Grealy', N'669 Hollow Ridge Park', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'68096c88-3c7a-ed11-b25b-8a1a0693972a', N'Horten', N'Lamacraft', N'89 Thackeray Way', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'69096c88-3c7a-ed11-b25b-8a1a0693972a', N'Lizbeth', N'Loxly', N'5306 Bluejay Park', N'Female')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'6a096c88-3c7a-ed11-b25b-8a1a0693972a', N'Aurelia', N'Redish', N'44583 Monica Road', N'Female')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'6b096c88-3c7a-ed11-b25b-8a1a0693972a', N'Therese', N'Piquard', N'9802 2nd Crossing', N'Female')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'6c096c88-3c7a-ed11-b25b-8a1a0693972a', N'Muire', N'Easterfield', N'16 Gulseth Trail', N'Female')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'6d096c88-3c7a-ed11-b25b-8a1a0693972a', N'Inez', N'Mival', N'44 Ohio Avenue', N'Female')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'6e096c88-3c7a-ed11-b25b-8a1a0693972a', N'Giorgio', N'Baldetti', N'70330 Hanson Lane', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'6f096c88-3c7a-ed11-b25b-8a1a0693972a', N'Eddy', N'Ruddiman', N'4721 Hintze Parkway', N'Female')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'70096c88-3c7a-ed11-b25b-8a1a0693972a', N'Bartholomeus', N'Tippett', N'7 Debra Court', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'71096c88-3c7a-ed11-b25b-8a1a0693972a', N'Pat', N'Pinsent', N'34505 Prairieview Avenue', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'72096c88-3c7a-ed11-b25b-8a1a0693972a', N'Anna-diane', N'Cancelier', N'73853 Hazelcrest Street', N'Female')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'73096c88-3c7a-ed11-b25b-8a1a0693972a', N'Valentin', N'Labrum', N'5 Paget Place', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'74096c88-3c7a-ed11-b25b-8a1a0693972a', N'Roarke', N'Probat', N'7 Northwestern Way', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'75096c88-3c7a-ed11-b25b-8a1a0693972a', N'Nettie', N'Kinney', N'2095 Westport Lane', N'Female')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'76096c88-3c7a-ed11-b25b-8a1a0693972a', N'Daria', N'Innerstone', N'8 Bartillon Crossing', N'Female')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'77096c88-3c7a-ed11-b25b-8a1a0693972a', N'Eileen', N'Matthaus', N'8 Texas Pass', N'Female')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'78096c88-3c7a-ed11-b25b-8a1a0693972a', N'Bobine', N'Akker', N'0 Bobwhite Hill', N'Female')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'79096c88-3c7a-ed11-b25b-8a1a0693972a', N'Shaun', N'Cosin', N'9 Transport Place', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'7a096c88-3c7a-ed11-b25b-8a1a0693972a', N'Ximenes', N'O''Heaney', N'429 Sugar Avenue', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'7b096c88-3c7a-ed11-b25b-8a1a0693972a', N'Wood', N'Lodden', N'07 Lake View Trail', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'7c096c88-3c7a-ed11-b25b-8a1a0693972a', N'Lyndsay', N'Finlason', N'5201 Rusk Junction', N'Female')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'7d096c88-3c7a-ed11-b25b-8a1a0693972a', N'Camile', N'Commings', N'6506 Tennyson Point', N'Female')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'7e096c88-3c7a-ed11-b25b-8a1a0693972a', N'Matilde', N'Lordon', N'9 Texas Junction', N'Female')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'7f096c88-3c7a-ed11-b25b-8a1a0693972a', N'Brnaby', N'Whenman', N'909 Sugar Crossing', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'80096c88-3c7a-ed11-b25b-8a1a0693972a', N'Darin', N'Pendre', N'20 Pine View Place', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'81096c88-3c7a-ed11-b25b-8a1a0693972a', N'Judon', N'Dearnaley', N'3 Charing Cross Avenue', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'82096c88-3c7a-ed11-b25b-8a1a0693972a', N'Diane-marie', N'Keightley', N'335 Banding Alley', N'Female')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'83096c88-3c7a-ed11-b25b-8a1a0693972a', N'Ashil', N'Aleksich', N'17 Portage Trail', N'Female')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'84096c88-3c7a-ed11-b25b-8a1a0693972a', N'Jermain', N'McAlpin', N'1 Manley Avenue', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'85096c88-3c7a-ed11-b25b-8a1a0693972a', N'Lowe', N'Pavelin', N'71 Menomonie Lane', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'86096c88-3c7a-ed11-b25b-8a1a0693972a', N'Tallie', N'Rudiger', N'70404 Mifflin Lane', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'87096c88-3c7a-ed11-b25b-8a1a0693972a', N'Elton', N'Navein', N'4 Boyd Plaza', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'88096c88-3c7a-ed11-b25b-8a1a0693972a', N'Alyce', N'Sivyour', N'57553 Burning Wood Way', N'Female')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'89096c88-3c7a-ed11-b25b-8a1a0693972a', N'Arv', N'Sifleet', N'79 Debra Place', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'8a096c88-3c7a-ed11-b25b-8a1a0693972a', N'Claire', N'Melwall', N'66041 La Follette Junction', N'Female')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'8b096c88-3c7a-ed11-b25b-8a1a0693972a', N'Elvyn', N'Craft', N'965 Nevada Way', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'8c096c88-3c7a-ed11-b25b-8a1a0693972a', N'Maible', N'Aasaf', N'15 Walton Lane', N'Female')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'8d096c88-3c7a-ed11-b25b-8a1a0693972a', N'Giffer', N'Pattrick', N'3345 Mandrake Terrace', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'8e096c88-3c7a-ed11-b25b-8a1a0693972a', N'Hermie', N'Claxson', N'25 Summer Ridge Lane', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'8f096c88-3c7a-ed11-b25b-8a1a0693972a', N'Umberto', N'O''Scanlan', N'65074 Pierstorff Court', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'90096c88-3c7a-ed11-b25b-8a1a0693972a', N'Dalila', N'Leakner', N'706 Washington Trail', N'Female')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'91096c88-3c7a-ed11-b25b-8a1a0693972a', N'Hulda', N'Rathbourne', N'97 Ridge Oak Court', N'Female')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'92096c88-3c7a-ed11-b25b-8a1a0693972a', N'Abie', N'Armsby', N'2 Drewry Place', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'93096c88-3c7a-ed11-b25b-8a1a0693972a', N'Billy', N'Betjeman', N'611 Jay Road', N'Female')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'94096c88-3c7a-ed11-b25b-8a1a0693972a', N'Carlo', N'Jenkerson', N'80078 Mesta Drive', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'95096c88-3c7a-ed11-b25b-8a1a0693972a', N'Marylee', N'Persitt', N'5077 Summit Alley', N'Female')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'96096c88-3c7a-ed11-b25b-8a1a0693972a', N'Marcellina', N'Roocroft', N'38 Goodland Street', N'Female')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'97096c88-3c7a-ed11-b25b-8a1a0693972a', N'Babette', N'Giovannelli', N'8909 Elgar Point', N'Female')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'98096c88-3c7a-ed11-b25b-8a1a0693972a', N'Kermy', N'Allworthy', N'5 Artisan Center', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'99096c88-3c7a-ed11-b25b-8a1a0693972a', N'Oneida', N'Downgate', N'8506 Corben Parkway', N'Female')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'9a096c88-3c7a-ed11-b25b-8a1a0693972a', N'Gareth', N'Loding', N'11556 Hanover Way', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'9b096c88-3c7a-ed11-b25b-8a1a0693972a', N'Herbert', N'Beaver', N'0 Butternut Terrace', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'9c096c88-3c7a-ed11-b25b-8a1a0693972a', N'Evin', N'Dewsbury', N'56080 Magdeline Trail', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'9d096c88-3c7a-ed11-b25b-8a1a0693972a', N'Adamo', N'McConnulty', N'66 North Parkway', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'9e096c88-3c7a-ed11-b25b-8a1a0693972a', N'Egon', N'Andrusyak', N'4986 Northland Park', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'9f096c88-3c7a-ed11-b25b-8a1a0693972a', N'Kassie', N'Bedenham', N'844 Ronald Regan Point', N'Female')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'a0096c88-3c7a-ed11-b25b-8a1a0693972a', N'Scarlett', N'Cawse', N'94187 Russell Pass', N'Female')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'a1096c88-3c7a-ed11-b25b-8a1a0693972a', N'Javier', N'Hasted', N'6 Westport Lane', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'a2096c88-3c7a-ed11-b25b-8a1a0693972a', N'Eadmund', N'Esp', N'9 Kropf Junction', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'a3096c88-3c7a-ed11-b25b-8a1a0693972a', N'Dolf', N'Risebrow', N'09 Pearson Terrace', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'a4096c88-3c7a-ed11-b25b-8a1a0693972a', N'Micah', N'Elson', N'092 Mariners Cove Crossing', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'a5096c88-3c7a-ed11-b25b-8a1a0693972a', N'Rufus', N'Wase', N'84 Dovetail Trail', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'a6096c88-3c7a-ed11-b25b-8a1a0693972a', N'Alfie', N'Trevear', N'30570 Lotheville Point', N'Female')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'a7096c88-3c7a-ed11-b25b-8a1a0693972a', N'Shanda', N'Westphal', N'872 Hooker Pass', N'Female')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'a8096c88-3c7a-ed11-b25b-8a1a0693972a', N'Fons', N'Persitt', N'51410 Havey Center', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'a9096c88-3c7a-ed11-b25b-8a1a0693972a', N'Pearle', N'Drust', N'1 Moose Pass', N'Female')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'aa096c88-3c7a-ed11-b25b-8a1a0693972a', N'Mollee', N'Clancy', N'4878 Claremont Terrace', N'Female')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'ab096c88-3c7a-ed11-b25b-8a1a0693972a', N'Minny', N'Viste', N'553 Algoma Point', N'Female')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'ac096c88-3c7a-ed11-b25b-8a1a0693972a', N'Rebecka', N'De Paepe', N'67 Talmadge Parkway', N'Female')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'ad096c88-3c7a-ed11-b25b-8a1a0693972a', N'Christyna', N'Chung', N'4 Pond Avenue', N'Female')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'ae096c88-3c7a-ed11-b25b-8a1a0693972a', N'Monica', N'Masi', N'20906 Elmside Way', N'Female')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'af096c88-3c7a-ed11-b25b-8a1a0693972a', N'Lydie', N'Crane', N'76505 Arkansas Parkway', N'Female')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'b0096c88-3c7a-ed11-b25b-8a1a0693972a', N'Killy', N'Iacobassi', N'0997 Gale Pass', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'b1096c88-3c7a-ed11-b25b-8a1a0693972a', N'Torrance', N'Pamplin', N'3 Heath Lane', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'b2096c88-3c7a-ed11-b25b-8a1a0693972a', N'Rodger', N'Cattach', N'74 Fieldstone Park', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'b3096c88-3c7a-ed11-b25b-8a1a0693972a', N'Alanson', N'Biernacki', N'13586 Debs Pass', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'b4096c88-3c7a-ed11-b25b-8a1a0693972a', N'Nikkie', N'Morais', N'80 Hovde Drive', N'Female')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'b5096c88-3c7a-ed11-b25b-8a1a0693972a', N'Andres', N'Oger', N'1493 Emmet Avenue', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'b6096c88-3c7a-ed11-b25b-8a1a0693972a', N'Isac', N'Lyven', N'8 Meadow Vale Terrace', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'b7096c88-3c7a-ed11-b25b-8a1a0693972a', N'Riva', N'Nials', N'9252 Hanover Court', N'Female')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'b8096c88-3c7a-ed11-b25b-8a1a0693972a', N'Rickie', N'Mc Gorley', N'25287 Redwing Place', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'b9096c88-3c7a-ed11-b25b-8a1a0693972a', N'Elisha', N'MacInerney', N'655 Springs Park', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'ba096c88-3c7a-ed11-b25b-8a1a0693972a', N'Jamaal', N'Bushen', N'5653 Continental Alley', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'bb096c88-3c7a-ed11-b25b-8a1a0693972a', N'Denney', N'Eplate', N'3 Pierstorff Court', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'bc096c88-3c7a-ed11-b25b-8a1a0693972a', N'Erv', N'Horning', N'0579 Barnett Drive', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'bd096c88-3c7a-ed11-b25b-8a1a0693972a', N'Myrvyn', N'Seawell', N'59 Prentice Avenue', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'be096c88-3c7a-ed11-b25b-8a1a0693972a', N'Hamil', N'McHaffy', N'5 Independence Crossing', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'bf096c88-3c7a-ed11-b25b-8a1a0693972a', N'Gayle', N'Raccio', N'88450 Larry Trail', N'Female')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'c0096c88-3c7a-ed11-b25b-8a1a0693972a', N'Cristy', N'Keohane', N'543 Blackbird Plaza', N'Female')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'c1096c88-3c7a-ed11-b25b-8a1a0693972a', N'Hugues', N'Sizey', N'21 Hauk Park', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'c2096c88-3c7a-ed11-b25b-8a1a0693972a', N'Estell', N'Iacopetti', N'266 Towne Pass', N'Female')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'c3096c88-3c7a-ed11-b25b-8a1a0693972a', N'Rad', N'Skipton', N'85623 Garrison Alley', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'c4096c88-3c7a-ed11-b25b-8a1a0693972a', N'Selig', N'Matyashev', N'0175 Mayfield Center', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'c5096c88-3c7a-ed11-b25b-8a1a0693972a', N'Emlen', N'Ruffler', N'0 Shopko Park', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'c6096c88-3c7a-ed11-b25b-8a1a0693972a', N'Claus', N'Dench', N'2 Delaware Hill', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'c7096c88-3c7a-ed11-b25b-8a1a0693972a', N'Egon', N'Crammy', N'3016 Hoard Crossing', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'c8096c88-3c7a-ed11-b25b-8a1a0693972a', N'Carey', N'Bangle', N'05 Mandrake Trail', N'Female')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'c9096c88-3c7a-ed11-b25b-8a1a0693972a', N'Jereme', N'Andresen', N'2 Esch Terrace', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'ca096c88-3c7a-ed11-b25b-8a1a0693972a', N'Jeri', N'Haslehurst', N'178 Anderson Way', N'Female')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'cb096c88-3c7a-ed11-b25b-8a1a0693972a', N'Bernie', N'Thorneywork', N'94 Debs Avenue', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'cc096c88-3c7a-ed11-b25b-8a1a0693972a', N'Philip', N'McGraw', N'1 Dahle Drive', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'cd096c88-3c7a-ed11-b25b-8a1a0693972a', N'Klarika', N'Swinerd', N'92131 Maple Hill', N'Female')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'ce096c88-3c7a-ed11-b25b-8a1a0693972a', N'Leann', N'Elston', N'35 David Park', N'Female')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'cf096c88-3c7a-ed11-b25b-8a1a0693972a', N'Robby', N'Newall', N'42473 Dexter Pass', N'Female')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'd0096c88-3c7a-ed11-b25b-8a1a0693972a', N'Lindi', N'Eustes', N'50314 Arizona Avenue', N'Female')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'd1096c88-3c7a-ed11-b25b-8a1a0693972a', N'Dominique', N'Crowther', N'04 Eastlawn Parkway', N'Female')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'd2096c88-3c7a-ed11-b25b-8a1a0693972a', N'Colette', N'Pessolt', N'2 Delaware Drive', N'Female')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'd3096c88-3c7a-ed11-b25b-8a1a0693972a', N'Jimmie', N'Lamps', N'9 Pine View Pass', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'd4096c88-3c7a-ed11-b25b-8a1a0693972a', N'Laverna', N'Parlett', N'98975 Briar Crest Alley', N'Female')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'd5096c88-3c7a-ed11-b25b-8a1a0693972a', N'Linc', N'McChruiter', N'8167 Eagan Street', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'd6096c88-3c7a-ed11-b25b-8a1a0693972a', N'Dame', N'Ugolotti', N'6 North Point', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'd7096c88-3c7a-ed11-b25b-8a1a0693972a', N'Gordie', N'Whardley', N'06 Norway Maple Hill', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'd8096c88-3c7a-ed11-b25b-8a1a0693972a', N'Jerrine', N'Barrasse', N'72 Florence Hill', N'Female')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'd9096c88-3c7a-ed11-b25b-8a1a0693972a', N'Nero', N'Ivy', N'54100 Chive Terrace', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'da096c88-3c7a-ed11-b25b-8a1a0693972a', N'Eunice', N'Molineaux', N'63442 Luster Trail', N'Female')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'db096c88-3c7a-ed11-b25b-8a1a0693972a', N'Kirsteni', N'Vedekhin', N'48 Holy Cross Center', N'Female')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'dc096c88-3c7a-ed11-b25b-8a1a0693972a', N'Cybil', N'Navarro', N'36 Sunfield Way', N'Female')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'dd096c88-3c7a-ed11-b25b-8a1a0693972a', N'Brien', N'Lamasna', N'43 Katie Junction', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'de096c88-3c7a-ed11-b25b-8a1a0693972a', N'Bram', N'Cruden', N'01176 Harper Place', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'df096c88-3c7a-ed11-b25b-8a1a0693972a', N'Arnie', N'Cawdron', N'74 North Place', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'e0096c88-3c7a-ed11-b25b-8a1a0693972a', N'Germaine', N'O''Flynn', N'87 Jana Parkway', N'Female')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'e1096c88-3c7a-ed11-b25b-8a1a0693972a', N'Frankie', N'Beilby', N'31886 Old Gate Parkway', N'Female')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'e2096c88-3c7a-ed11-b25b-8a1a0693972a', N'Celene', N'Lambertson', N'30 8th Lane', N'Female')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'e3096c88-3c7a-ed11-b25b-8a1a0693972a', N'Maressa', N'Antonacci', N'2961 Eagan Street', N'Female')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'e4096c88-3c7a-ed11-b25b-8a1a0693972a', N'Emmerich', N'Standrin', N'72631 Mallory Parkway', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'e5096c88-3c7a-ed11-b25b-8a1a0693972a', N'Roxi', N'Mowsdale', N'1 Cody Way', N'Female')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'e6096c88-3c7a-ed11-b25b-8a1a0693972a', N'Patten', N'Tattersfield', N'6 Milwaukee Alley', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'e7096c88-3c7a-ed11-b25b-8a1a0693972a', N'Wyatan', N'Jandl', N'1386 Chive Circle', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'e8096c88-3c7a-ed11-b25b-8a1a0693972a', N'Dorotea', N'Hassard', N'0376 Sycamore Park', N'Female')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'e9096c88-3c7a-ed11-b25b-8a1a0693972a', N'Jesus', N'MacLardie', N'35788 Blackbird Alley', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'ea096c88-3c7a-ed11-b25b-8a1a0693972a', N'Alexa', N'Fern', N'623 Pond Trail', N'Female')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'eb096c88-3c7a-ed11-b25b-8a1a0693972a', N'Algernon', N'Leyes', N'5 Starling Alley', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'ec096c88-3c7a-ed11-b25b-8a1a0693972a', N'Modesta', N'Hub', N'18667 Straubel Parkway', N'Female')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'ed096c88-3c7a-ed11-b25b-8a1a0693972a', N'Dacia', N'Reeson', N'788 Farmco Center', N'Female')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'ee096c88-3c7a-ed11-b25b-8a1a0693972a', N'Desdemona', N'Turpey', N'029 Elmside Center', N'Female')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'ef096c88-3c7a-ed11-b25b-8a1a0693972a', N'Nari', N'Joinson', N'5111 Monterey Avenue', N'Female')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'f0096c88-3c7a-ed11-b25b-8a1a0693972a', N'Ervin', N'Valentin', N'0602 Waubesa Crossing', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'f1096c88-3c7a-ed11-b25b-8a1a0693972a', N'Daven', N'Weems', N'274 Gina Drive', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'f2096c88-3c7a-ed11-b25b-8a1a0693972a', N'Velvet', N'Mulliss', N'3 Mallory Junction', N'Female')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'f3096c88-3c7a-ed11-b25b-8a1a0693972a', N'Tom', N'Tidgewell', N'5 Cottonwood Place', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'f4096c88-3c7a-ed11-b25b-8a1a0693972a', N'Gasparo', N'Fawloe', N'7 Bay Point', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'f5096c88-3c7a-ed11-b25b-8a1a0693972a', N'Cullen', N'Ellery', N'71 Harbort Center', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'f6096c88-3c7a-ed11-b25b-8a1a0693972a', N'Pandora', N'Mennell', N'79 Northview Circle', N'Female')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'f7096c88-3c7a-ed11-b25b-8a1a0693972a', N'Lauritz', N'Gollin', N'9797 Lake View Hill', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'f8096c88-3c7a-ed11-b25b-8a1a0693972a', N'Alasteir', N'Reeve', N'9530 Summer Ridge Park', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'f9096c88-3c7a-ed11-b25b-8a1a0693972a', N'Quincey', N'Stelljes', N'93123 Hagan Alley', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'fa096c88-3c7a-ed11-b25b-8a1a0693972a', N'Anthe', N'Dootson', N'52 Clemons Plaza', N'Female')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'fb096c88-3c7a-ed11-b25b-8a1a0693972a', N'Briggs', N'Kem', N'3305 Main Lane', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'fc096c88-3c7a-ed11-b25b-8a1a0693972a', N'Helli', N'Rosencrantz', N'78 Dorton Alley', N'Female')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'fd096c88-3c7a-ed11-b25b-8a1a0693972a', N'Mayne', N'Bendin', N'8663 Bartillon Park', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'fe096c88-3c7a-ed11-b25b-8a1a0693972a', N'Giulio', N'Wilks', N'1753 Maple Pass', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'ff096c88-3c7a-ed11-b25b-8a1a0693972a', N'Murry', N'Giles', N'3971 Kedzie Circle', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'000a6c88-3c7a-ed11-b25b-8a1a0693972a', N'Price', N'Considine', N'1628 Dennis Terrace', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'010a6c88-3c7a-ed11-b25b-8a1a0693972a', N'Muffin', N'Pinar', N'2601 Anthes Lane', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'020a6c88-3c7a-ed11-b25b-8a1a0693972a', N'Beckie', N'Breckin', N'31 Thackeray Alley', N'Female')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'030a6c88-3c7a-ed11-b25b-8a1a0693972a', N'Ty', N'Galer', N'769 Annamark Place', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'040a6c88-3c7a-ed11-b25b-8a1a0693972a', N'Georgy', N'Kopfer', N'89 Dapin Plaza', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'050a6c88-3c7a-ed11-b25b-8a1a0693972a', N'Emelen', N'Booth', N'5 Delaware Circle', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'060a6c88-3c7a-ed11-b25b-8a1a0693972a', N'Nannie', N'Loftus', N'13711 Glendale Park', N'Female')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'070a6c88-3c7a-ed11-b25b-8a1a0693972a', N'Alida', N'Palin', N'7752 Mccormick Place', N'Female')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'080a6c88-3c7a-ed11-b25b-8a1a0693972a', N'Penelope', N'Fouracre', N'2653 Harper Plaza', N'Female')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'090a6c88-3c7a-ed11-b25b-8a1a0693972a', N'Naoma', N'Nobriga', N'6 Jay Trail', N'Female')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'0a0a6c88-3c7a-ed11-b25b-8a1a0693972a', N'Arlette', N'Townes', N'43 Welch Hill', N'Female')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'0b0a6c88-3c7a-ed11-b25b-8a1a0693972a', N'Rasla', N'Snowman', N'0667 Northwestern Avenue', N'Female')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'0c0a6c88-3c7a-ed11-b25b-8a1a0693972a', N'Koren', N'Bellocht', N'14 3rd Trail', N'Female')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'0d0a6c88-3c7a-ed11-b25b-8a1a0693972a', N'Ulrich', N'Palphramand', N'179 Pennsylvania Drive', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'0e0a6c88-3c7a-ed11-b25b-8a1a0693972a', N'Lenette', N'Goede', N'18277 Surrey Park', N'Female')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'0f0a6c88-3c7a-ed11-b25b-8a1a0693972a', N'Adrien', N'Keningham', N'51471 Oneill Lane', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'100a6c88-3c7a-ed11-b25b-8a1a0693972a', N'Bailie', N'Reside', N'5499 Fieldstone Point', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'110a6c88-3c7a-ed11-b25b-8a1a0693972a', N'Alec', N'Dowson', N'1558 Scott Terrace', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'120a6c88-3c7a-ed11-b25b-8a1a0693972a', N'Brendin', N'Button', N'07 Chinook Park', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'130a6c88-3c7a-ed11-b25b-8a1a0693972a', N'Jemmy', N'Rawlin', N'9 La Follette Park', N'Female')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'140a6c88-3c7a-ed11-b25b-8a1a0693972a', N'Galvin', N'Lafayette', N'83093 Kensington Lane', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'150a6c88-3c7a-ed11-b25b-8a1a0693972a', N'Josy', N'McCrisken', N'45 Graceland Road', N'Female')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'160a6c88-3c7a-ed11-b25b-8a1a0693972a', N'Felicio', N'Slyme', N'51 Hoepker Park', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'170a6c88-3c7a-ed11-b25b-8a1a0693972a', N'Diena', N'Glave', N'41 Namekagon Street', N'Female')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'180a6c88-3c7a-ed11-b25b-8a1a0693972a', N'Darryl', N'Greste', N'6 Lighthouse Bay Hill', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'190a6c88-3c7a-ed11-b25b-8a1a0693972a', N'Sauveur', N'O''Loinn', N'1 Sunbrook Avenue', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'1a0a6c88-3c7a-ed11-b25b-8a1a0693972a', N'Broderic', N'Leggan', N'84 Colorado Trail', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'1b0a6c88-3c7a-ed11-b25b-8a1a0693972a', N'Angelica', N'Brockie', N'80350 Springview Court', N'Female')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'1c0a6c88-3c7a-ed11-b25b-8a1a0693972a', N'Edmund', N'Petteford', N'044 Milwaukee Crossing', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'1d0a6c88-3c7a-ed11-b25b-8a1a0693972a', N'Obadiah', N'Ochterlonie', N'003 Ramsey Way', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'1e0a6c88-3c7a-ed11-b25b-8a1a0693972a', N'Pennie', N'Jeacop', N'25283 Buena Vista Junction', N'Female')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'1f0a6c88-3c7a-ed11-b25b-8a1a0693972a', N'Emlynne', N'Kieran', N'8103 Hoepker Avenue', N'Female')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'200a6c88-3c7a-ed11-b25b-8a1a0693972a', N'Jaime', N'Mosco', N'517 Crowley Crossing', N'Female')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'210a6c88-3c7a-ed11-b25b-8a1a0693972a', N'Jade', N'Ambrosetti', N'85545 Portage Place', N'Female')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'220a6c88-3c7a-ed11-b25b-8a1a0693972a', N'Glendon', N'Ferriman', N'99 Sheridan Hill', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'230a6c88-3c7a-ed11-b25b-8a1a0693972a', N'Steffane', N'Clutram', N'8 Victoria Terrace', N'Female')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'240a6c88-3c7a-ed11-b25b-8a1a0693972a', N'Elayne', N'Arbuckle', N'43118 Cardinal Hill', N'Female')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'250a6c88-3c7a-ed11-b25b-8a1a0693972a', N'Bethena', N'Hassey', N'32725 Logan Street', N'Female')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'260a6c88-3c7a-ed11-b25b-8a1a0693972a', N'Jehu', N'Sawkin', N'30 Lighthouse Bay Hill', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'270a6c88-3c7a-ed11-b25b-8a1a0693972a', N'Lyn', N'Langfat', N'112 Fremont Crossing', N'Male')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [Address], [Gender]) VALUES (N'280a6c88-3c7a-ed11-b25b-8a1a0693972a', N'Rory', N'Friedank', N'1 Pine View Way', N'Male')
GO
INSERT [dbo].[Users] ([Id], [Login], [AccessKey]) VALUES (N'54e99656-3c7a-ed11-b25b-8a1a0693972a', N'Admin', N'admin123')
GO
INSERT [dbo].[Users] ([Id], [Login], [AccessKey]) VALUES (N'55e99656-3c7a-ed11-b25b-8a1a0693972a', N'User01', N'user123')
GO
ALTER TABLE [dbo].[Books] ADD  DEFAULT (newsequentialid()) FOR [Id]
GO
ALTER TABLE [dbo].[Persons] ADD  DEFAULT (newsequentialid()) FOR [Id]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (newsequentialid()) FOR [Id]
GO
USE [master]
GO
ALTER DATABASE [BookManagement] SET  READ_WRITE 
GO
