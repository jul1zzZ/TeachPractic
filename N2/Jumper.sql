GO
ALTER DATABASE [Jumper] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Jumper] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Jumper] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Jumper] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Jumper] SET ARITHABORT OFF 
GO
ALTER DATABASE [Jumper] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Jumper] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Jumper] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Jumper] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Jumper] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Jumper] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Jumper] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Jumper] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Jumper] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Jumper] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Jumper] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Jumper] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Jumper] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Jumper] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Jumper] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Jumper] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Jumper] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Jumper] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Jumper] SET  MULTI_USER 
GO
ALTER DATABASE [Jumper] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Jumper] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Jumper] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Jumper] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Jumper] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Jumper] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Jumper] SET QUERY_STORE = OFF
GO
USE [Jumper]
GO
/****** Object:  Table [dbo].[Agent]    Script Date: 05.04.2022 18:20:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Agent](
	[AgentId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[Email] [nvarchar](200) NOT NULL,
	[Phone] [nvarchar](50) NOT NULL,
	[Photo] [nvarchar](200) NOT NULL,
	[Address] [nvarchar](300) NOT NULL,
	[Priority] [int] NOT NULL,
	[BossName] [nvarchar](200) NOT NULL,
	[INN] [nvarchar](50) NOT NULL,
	[KPP] [nvarchar](50) NOT NULL,
	[AgentTypeId] [int] NOT NULL,
	[OrderAmount] [int] NOT NULL,
	[OrderSumm] [float] NOT NULL,
 CONSTRAINT [PK_Agent] PRIMARY KEY CLUSTERED 
(
	[AgentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AgentType]    Script Date: 05.04.2022 18:20:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AgentType](
	[AgentTypeId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_AgentType] PRIMARY KEY CLUSTERED 
(
	[AgentTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Material]    Script Date: 05.04.2022 18:20:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Material](
	[MaterialId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Width] [float] NOT NULL,
	[Length] [float] NOT NULL,
	[MaterialTypeId] [int] NOT NULL,
	[ProductId] [nchar](10) NULL,
 CONSTRAINT [PK_Material] PRIMARY KEY CLUSTERED 
(
	[MaterialId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaterialType]    Script Date: 05.04.2022 18:20:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaterialType](
	[MaterialTypeId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Coef] [float] NOT NULL,
 CONSTRAINT [PK_MaterialType] PRIMARY KEY CLUSTERED 
(
	[MaterialTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 05.04.2022 18:20:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[AgentId] [int] NOT NULL,
	[OrderDate] [date] NOT NULL,
	[ProductAmount] [int] NOT NULL,
	[OrderTime] [time](7) NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 05.04.2022 18:20:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[ProductTypeId] [int] NOT NULL,
	[Articul] [nvarchar](200) NOT NULL,
	[PeopleToDevelop] [int] NOT NULL,
	[WorkShop] [int] NOT NULL,
	[MinAgentPrice] [int] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductMaterial]    Script Date: 05.04.2022 18:20:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductMaterial](
	[ProductMaterialId] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[MaterialId] [int] NOT NULL,
 CONSTRAINT [PK_ProductMaterial] PRIMARY KEY CLUSTERED 
(
	[ProductMaterialId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductType]    Script Date: 05.04.2022 18:20:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductType](
	[ProductTypeId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[Coef] [float] NOT NULL,
 CONSTRAINT [PK_ProductType] PRIMARY KEY CLUSTERED 
(
	[ProductTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Agent] ON 

INSERT [dbo].[Agent] ([AgentId], [Name], [Email], [Phone], [Photo], [Address], [Priority], [BossName], [INN], [KPP], [AgentTypeId], [OrderAmount], [OrderSumm]) VALUES (1, N'МонтажОрионУрал', N'pzaitev@blokin.org', N'35222673926', N'agent_96.png', N'027573, Тамбовская область, город Коломна, ул. Ленина, 20', 50, N'Давыдоваа Нина Евгеньевна', N'1692286718', N'181380912', 1, 0, 0)
INSERT [dbo].[Agent] ([AgentId], [Name], [Email], [Phone], [Photo], [Address], [Priority], [BossName], [INN], [KPP], [AgentTypeId], [OrderAmount], [OrderSumm]) VALUES (2, N'МетизСтрой', N'kristina.pakomov@burova.ru', N'88001726256', N'agent_94.png', N'254238, Нижегородская область, город Павловский Посад, проезд Балканская, 23', 374, N'Ева Борисовна Беспалова', N'4024742936', N'295608432', 1, 0, 0)
INSERT [dbo].[Agent] ([AgentId], [Name], [Email], [Phone], [Photo], [Address], [Priority], [BossName], [INN], [KPP], [AgentTypeId], [OrderAmount], [OrderSumm]) VALUES (3, N'РадиоСевер', N'maiy.belov@rogov.ru', N'4953688651', N'agent_123.png', N'491360, Московская область, город Одинцово, въезд Ленина, 19', 431, N'Карпов Иосиф Максимович', N'5889206249', N'372789083', 3, 0, 0)
INSERT [dbo].[Agent] ([AgentId], [Name], [Email], [Phone], [Photo], [Address], [Priority], [BossName], [INN], [KPP], [AgentTypeId], [OrderAmount], [OrderSumm]) VALUES (4, N'Компания КазАлмаз', N'irina.gusina@vlasova.ru', N'88005332475', N'agent_80.png', N'848810, Кемеровская область, город Лотошино, пер. Ломоносова, 90', 396, N'Марк Фёдорович Муравьёва', N'3084797352', N'123190924', 4, 0, 0)
INSERT [dbo].[Agent] ([AgentId], [Name], [Email], [Phone], [Photo], [Address], [Priority], [BossName], [INN], [KPP], [AgentTypeId], [OrderAmount], [OrderSumm]) VALUES (5, N'Компания СервисРадиоГор', N'nika.nekrasova@kovalev.ru', N'88006763286', N'agent_40.png', N'547196, Ульяновская область, город Серебряные Пруды, въезд Балканская, 81', 169, N'Попов Вадим Александрович', N'8880473721', N'729975116', 4, 3, 2422)
INSERT [dbo].[Agent] ([AgentId], [Name], [Email], [Phone], [Photo], [Address], [Priority], [BossName], [INN], [KPP], [AgentTypeId], [OrderAmount], [OrderSumm]) VALUES (6, N'ВодТверьХозМашина', N'tkrylov@baranova.net', N'79228499196', N'agent_56.png', N'145030, Сахалинская область, город Шатура, въезд Гоголя, 79', 8, N'Александра Дмитриевна Ждановаа', N'4174253174', N'522227145', 5, 1, 255)
INSERT [dbo].[Agent] ([AgentId], [Name], [Email], [Phone], [Photo], [Address], [Priority], [BossName], [INN], [KPP], [AgentTypeId], [OrderAmount], [OrderSumm]) VALUES (7, N'Тех', N'vasilisa99@belyev.ru', N'79224271331', N'agent_61.png', N'731935, Калининградская область, город Павловский Посад, наб. Гагарина, 59', 278, N'Аким Романович Логинова', N'9282924869', N'587356429', 3, 3, 1686)
INSERT [dbo].[Agent] ([AgentId], [Name], [Email], [Phone], [Photo], [Address], [Priority], [BossName], [INN], [KPP], [AgentTypeId], [OrderAmount], [OrderSumm]) VALUES (8, N'ТверьМетизУралСнос', N'rlazareva@novikov.ru', N'35222579275', N'agent_109.png', N'880551, Ленинградская область, город Красногорск, ул. Гоголя, 61', 165, N'Зоя Андреевна Соболева', N'1076095397', N'947828491', 4, 0, 0)
INSERT [dbo].[Agent] ([AgentId], [Name], [Email], [Phone], [Photo], [Address], [Priority], [BossName], [INN], [KPP], [AgentTypeId], [OrderAmount], [OrderSumm]) VALUES (9, N'МясРеч', N'bkozlov@volkov.ru', N'88004536345', N'agent_58.png', N'903648, Калужская область, город Воскресенск, пр. Будапештсткая, 91', 355, N'Белоусоваа Ирина Максимовна', N'9254261217', N'656363498', 5, 3, 3722)
INSERT [dbo].[Agent] ([AgentId], [Name], [Email], [Phone], [Photo], [Address], [Priority], [BossName], [INN], [KPP], [AgentTypeId], [OrderAmount], [OrderSumm]) VALUES (10, N'Флот', N'gerasim.makarov@kornilov.ru', N'88001442538', N'agent_87.png', N'505562, Тюменская область, город Наро-Фоминск, пр. Косиора, 11', 473, N'Василий Андреевич Ковалёв', N'1112170258', N'382584255', 5, 0, 0)
INSERT [dbo].[Agent] ([AgentId], [Name], [Email], [Phone], [Photo], [Address], [Priority], [BossName], [INN], [KPP], [AgentTypeId], [OrderAmount], [OrderSumm]) VALUES (11, N'CибПивОмскСнаб', N'evorontova@potapova.ru', N'79221539522', N'agent_46.png', N'816260, Ивановская область, город Москва, ул. Гагарина, 31', 477, N'Людмила Александровна Сафонова', N'5676173945', N'256512286', 5, 2, 2412)
INSERT [dbo].[Agent] ([AgentId], [Name], [Email], [Phone], [Photo], [Address], [Priority], [BossName], [INN], [KPP], [AgentTypeId], [OrderAmount], [OrderSumm]) VALUES (12, N'ЦементАсбоцемент', N'polykov.veronika@artemeva.ru', N'4951848792', N'agent.png', N'619540, Курская область, город Раменское, пл. Балканская, 12', 426, N'Воронова Мария Александровна', N'4345774724', N'352469905', 5, 2, 2801)
INSERT [dbo].[Agent] ([AgentId], [Name], [Email], [Phone], [Photo], [Address], [Priority], [BossName], [INN], [KPP], [AgentTypeId], [OrderAmount], [OrderSumm]) VALUES (13, N'ТелеГлавВекторСбыт', N'nsitnikov@kovaleva.ru', N'35222561537', N'agent_31.png', N'062489, Челябинская область, город Пушкино, въезд Бухарестская, 07', 185, N'Екатерина Фёдоровна Ковалёва', N'9504787157', N'419758597', 5, 2, 2482)
INSERT [dbo].[Agent] ([AgentId], [Name], [Email], [Phone], [Photo], [Address], [Priority], [BossName], [INN], [KPP], [AgentTypeId], [OrderAmount], [OrderSumm]) VALUES (14, N'Инфо', N'arsenii.mikailova@prokorov.com', N'88007935997', N'agent_89.png', N'100469, Рязанская область, город Ногинск, шоссе Гагарина, 57', 304, N'Баранова Виктор Романович', N'6549468639', N'718386757', 3, 0, 0)
INSERT [dbo].[Agent] ([AgentId], [Name], [Email], [Phone], [Photo], [Address], [Priority], [BossName], [INN], [KPP], [AgentTypeId], [OrderAmount], [OrderSumm]) VALUES (15, N'ЭлектроРемОрионЛизинг', N'anfisa.fedotova@tvetkov.ru', N'4955199741', N'agent_68.png', N'594365, Ярославская область, город Павловский Посад, бульвар Космонавтов, 64', 198, N'Тарасова Дан Львович', N'1340072597', N'500478249', 5, 1, 727)
INSERT [dbo].[Agent] ([AgentId], [Name], [Email], [Phone], [Photo], [Address], [Priority], [BossName], [INN], [KPP], [AgentTypeId], [OrderAmount], [OrderSumm]) VALUES (16, N'Компания ТелекомХмельГаражПром', N'qkolesnikova@kalinina.ru', N'8129839173', N'agent_71.png', N'126668, Ростовская область, город Зарайск, наб. Гагарина, 69', 457, N'Костина Татьяна Борисовна', N'1614623826', N'824882264', 4, 2, 3155)
INSERT [dbo].[Agent] ([AgentId], [Name], [Email], [Phone], [Photo], [Address], [Priority], [BossName], [INN], [KPP], [AgentTypeId], [OrderAmount], [OrderSumm]) VALUES (17, N'Компания Алмаз', N'akalinina@zaitev.ru', N'79226887422', N'agent_121.png', N'016215, Воронежская область, город Зарайск, ул. Косиора, 48', 259, N'Фоминаа Лариса Романовна', N'6698862694', N'662876919', 4, 0, 0)
INSERT [dbo].[Agent] ([AgentId], [Name], [Email], [Phone], [Photo], [Address], [Priority], [BossName], [INN], [KPP], [AgentTypeId], [OrderAmount], [OrderSumm]) VALUES (18, N'МясТрансМоторЛизинг', N'vlad.sokolov@andreev.org', N'79226763494', N'agent_62.png', N'765320, Ивановская область, город Шатура, спуск Гоголя, 88', 268, N'Тамара Дмитриевна Семёноваа', N'6148685143', N'196332656', 3, 3, 3375)
INSERT [dbo].[Agent] ([AgentId], [Name], [Email], [Phone], [Photo], [Address], [Priority], [BossName], [INN], [KPP], [AgentTypeId], [OrderAmount], [OrderSumm]) VALUES (19, N'Монтаж', N'zakar.sazonova@gavrilov.ru', N'4958677615', N'agent.png', N'066594, Магаданская область, город Шаховская, спуск Сталина, 59', 300, N'Блохина Сергей Максимович', N'6142194281', N'154457435', 6, 2, 1564)
INSERT [dbo].[Agent] ([AgentId], [Name], [Email], [Phone], [Photo], [Address], [Priority], [BossName], [INN], [KPP], [AgentTypeId], [OrderAmount], [OrderSumm]) VALUES (20, N'ВостокГлав', N'gordei95@kirillov.ru', N'8129492926', N'agent_63.png', N'217022, Ростовская область, город Озёры, ул. Домодедовская, 19', 107, N'Инга Фёдоровна Дмитриева', N'3580946305', N'405017349', 4, 0, 0)
INSERT [dbo].[Agent] ([AgentId], [Name], [Email], [Phone], [Photo], [Address], [Priority], [BossName], [INN], [KPP], [AgentTypeId], [OrderAmount], [OrderSumm]) VALUES (21, N'Газ', N'ulyna.antonov@noskov.ru', N'35222224558', N'agent_76.png', N'252821, Тамбовская область, город Пушкино, ул. Чехова, 40', 170, N'Терентьев Илларион Максимович', N'8876413796', N'955381891', 6, 2, 2581)
INSERT [dbo].[Agent] ([AgentId], [Name], [Email], [Phone], [Photo], [Address], [Priority], [BossName], [INN], [KPP], [AgentTypeId], [OrderAmount], [OrderSumm]) VALUES (22, N'ЭлектроТранс', N'boleslav.zukova@nikiforova.com', N'8123422431', N'agent_91.png', N'434616, Калининградская область, город Павловский Посад, пл. Ладыгина, 83', 129, N'Сава Александрович Титова', N'6019144874', N'450629885', 3, 0, 0)
INSERT [dbo].[Agent] ([AgentId], [Name], [Email], [Phone], [Photo], [Address], [Priority], [BossName], [INN], [KPP], [AgentTypeId], [OrderAmount], [OrderSumm]) VALUES (23, N'Электро', N'likacev.makar@antonov.ru', N'88007143641', N'agent_93.png', N'966815, Новгородская область, город Одинцово, пр. Космонавтов, 19', 366, N'Шарапова Елена Дмитриевна', N'7896029866', N'786038848', 3, 0, 0)
INSERT [dbo].[Agent] ([AgentId], [Name], [Email], [Phone], [Photo], [Address], [Priority], [BossName], [INN], [KPP], [AgentTypeId], [OrderAmount], [OrderSumm]) VALUES (24, N'Гор', N'maiy12@koklov.net', N'4959734855', N'agent_52.png', N'376483, Калужская область, город Сергиев Посад, ул. Славы, 09', 175, N'Нонна Львовна Одинцоваа', N'7088187045', N'440309946', 1, 2, 2625)
INSERT [dbo].[Agent] ([AgentId], [Name], [Email], [Phone], [Photo], [Address], [Priority], [BossName], [INN], [KPP], [AgentTypeId], [OrderAmount], [OrderSumm]) VALUES (25, N'Компания Гараж', N'asiryeva@andreeva.com', N'79228483854', N'agent_66.png', N'395101, Белгородская область, город Балашиха, бульвар 1905 года, 00', 413, N'Владлена Фёдоровна Ларионоваа', N'6190244524', N'399106161', 4, 4, 5791)
INSERT [dbo].[Agent] ([AgentId], [Name], [Email], [Phone], [Photo], [Address], [Priority], [BossName], [INN], [KPP], [AgentTypeId], [OrderAmount], [OrderSumm]) VALUES (26, N'ОрионГлав', N'sermakova@sarova.net', N'79226841374', N'agent_106.png', N'729639, Магаданская область, город Талдом, въезд Будапештсткая, 98', 482, N'Тимофеева Григорий Андреевич', N'9032455179', N'763045792', 7, 0, 0)
INSERT [dbo].[Agent] ([AgentId], [Name], [Email], [Phone], [Photo], [Address], [Priority], [BossName], [INN], [KPP], [AgentTypeId], [OrderAmount], [OrderSumm]) VALUES (27, N'ГлавITФлотПроф', N'savva.rybov@kolobov.ru', N'8121466646', N'agent_64.png', N'447811, Мурманская область, город Егорьевск, ул. Ленина, 24', 62, N'Зыкова Стефан Максимович', N'2561361494', N'525678825', 6, 1, 1533)
INSERT [dbo].[Agent] ([AgentId], [Name], [Email], [Phone], [Photo], [Address], [Priority], [BossName], [INN], [KPP], [AgentTypeId], [OrderAmount], [OrderSumm]) VALUES (28, N'ТверьМонтажОмск', N'dteterina@selezneva.ru', N'88003634386', N'agent_128.png', N'761751, Амурская область, город Балашиха, шоссе Гоголя, 02', 272, N'Матвей Романович Большакова', N'2421347164', N'157370604', 7, 0, 0)
INSERT [dbo].[Agent] ([AgentId], [Name], [Email], [Phone], [Photo], [Address], [Priority], [BossName], [INN], [KPP], [AgentTypeId], [OrderAmount], [OrderSumm]) VALUES (29, N'РемСантехОмскБанк', N'anisimov.mark@vorobev.ru', N'8121824477', N'agent_57.png', N'289468, Омская область, город Видное, пер. Балканская, 33', 442, N'Фокина Искра Максимовна', N'6823050572', N'176488617', 3, 3, 4773)
INSERT [dbo].[Agent] ([AgentId], [Name], [Email], [Phone], [Photo], [Address], [Priority], [BossName], [INN], [KPP], [AgentTypeId], [OrderAmount], [OrderSumm]) VALUES (30, N'ЭлектроМоторТрансСнос', N'inessa.voronov@sidorova.ru', N'35222436219', N'agent.png', N'913777, Самарская область, город Красногорск, ул. Бухарестская, 49', 151, N'Людмила Евгеньевна Новиковаа', N'6608362851', N'799760512', 3, 4, 5689)
INSERT [dbo].[Agent] ([AgentId], [Name], [Email], [Phone], [Photo], [Address], [Priority], [BossName], [INN], [KPP], [AgentTypeId], [OrderAmount], [OrderSumm]) VALUES (31, N'ТверьХозМорСбыт', N'marina58@koroleva.com', N'4954167567', N'agent_117.png', N'252101, Ростовская область, город Дорохово, пер. Ленина, 85', 207, N'Аким Львович Субботина', N'6681338084', N'460530907', 1, 0, 0)
INSERT [dbo].[Agent] ([AgentId], [Name], [Email], [Phone], [Photo], [Address], [Priority], [BossName], [INN], [KPP], [AgentTypeId], [OrderAmount], [OrderSumm]) VALUES (32, N'Компания ТомскХоз', N'nelli11@gureva.ru', N'79228491337', N'agent_115.png', N'861543, Томская область, город Истра, бульвар Славы, 42', 464, N'Лазарева Аркадий Сергеевич', N'8430391035', N'961540858', 4, 0, 0)
INSERT [dbo].[Agent] ([AgentId], [Name], [Email], [Phone], [Photo], [Address], [Priority], [BossName], [INN], [KPP], [AgentTypeId], [OrderAmount], [OrderSumm]) VALUES (33, N'Компания МясДизайнДизайн', N'gleb.gulyev@belyeva.com', N'8125351725', N'agent_53.png', N'557264, Брянская область, город Серпухов, въезд Гоголя, 34', 491, N'Клементина Сергеевна Стрелкова', N'8004989990', N'908629456', 4, 4, 5290)
INSERT [dbo].[Agent] ([AgentId], [Name], [Email], [Phone], [Photo], [Address], [Priority], [BossName], [INN], [KPP], [AgentTypeId], [OrderAmount], [OrderSumm]) VALUES (34, N'Компания ЖелДорТверьМонтаж', N'burova.zlata@zueva.ru', N'4955216175', N'agent_85.png', N'152424, Рязанская область, город Сергиев Посад, ул. 1905 года, 27', 2, N'Нестор Максимович Гуляев', N'3325722996', N'665766347', 4, 0, 0)
INSERT [dbo].[Agent] ([AgentId], [Name], [Email], [Phone], [Photo], [Address], [Priority], [BossName], [INN], [KPP], [AgentTypeId], [OrderAmount], [OrderSumm]) VALUES (35, N'МетизТехАвтоПроф', N'anastasiy.gromov@samsonova.com', N'4955814246', N'agent_33.png', N'713016, Брянская область, город Подольск, пл. Домодедовская, 93', 321, N'Егор Фёдорович Третьякова', N'2988890076', N'215491048', 4, 1, 1995)
INSERT [dbo].[Agent] ([AgentId], [Name], [Email], [Phone], [Photo], [Address], [Priority], [BossName], [INN], [KPP], [AgentTypeId], [OrderAmount], [OrderSumm]) VALUES (36, N'Гараж', N'antonin51@korolev.com', N'35222547259', N'agent_90.png', N'585758, Самарская область, город Красногорск, бульвар Балканская, 13', 107, N'Панфилов Константин Максимович', N'2638464552', N'746822723', 6, 0, 0)
INSERT [dbo].[Agent] ([AgentId], [Name], [Email], [Phone], [Photo], [Address], [Priority], [BossName], [INN], [KPP], [AgentTypeId], [OrderAmount], [OrderSumm]) VALUES (37, N'ГазДизайнЖелДор', N'elizaveta.komarov@rybakov.net', N'4957979733', N'agent_49.png', N'695230, Курская область, город Красногорск, пр. Гоголя, 64', 236, N'Лев Иванович Третьяков', N'2396029740', N'458924890', 1, 2, 2414)
INSERT [dbo].[Agent] ([AgentId], [Name], [Email], [Phone], [Photo], [Address], [Priority], [BossName], [INN], [KPP], [AgentTypeId], [OrderAmount], [OrderSumm]) VALUES (38, N'РемГаражЛифт', N'novikova.gleb@sestakov.ru', N'88007722753', N'agent_65.png', N'048715, Ивановская область, город Люберцы, проезд Космонавтов, 89', 374, N'Филатов Владимир Максимович', N'1656477206', N'988968838', 3, 3, 3681)
INSERT [dbo].[Agent] ([AgentId], [Name], [Email], [Phone], [Photo], [Address], [Priority], [BossName], [INN], [KPP], [AgentTypeId], [OrderAmount], [OrderSumm]) VALUES (39, N'СантехБашкир', N'nikodim81@kiseleva.com', N'79221558739', N'agent_99.png', N'180288, Тверская область, город Одинцово, ул. Бухарестская, 37', 369, N'Виктор Иванович Молчанов', N'4159215346', N'639267493', 6, 0, 0)
INSERT [dbo].[Agent] ([AgentId], [Name], [Email], [Phone], [Photo], [Address], [Priority], [BossName], [INN], [KPP], [AgentTypeId], [OrderAmount], [OrderSumm]) VALUES (40, N'ЮпитерЛенГараж-М', N'larkipova@gorbunov.ru', N'4953275825', N'agent_48.png', N'339507, Московская область, город Видное, ул. Космонавтов, 11', 470, N'Васильева Валерия Борисовна', N'2038393690', N'259672761', 1, 2, 1494)
INSERT [dbo].[Agent] ([AgentId], [Name], [Email], [Phone], [Photo], [Address], [Priority], [BossName], [INN], [KPP], [AgentTypeId], [OrderAmount], [OrderSumm]) VALUES (41, N'ОрионСофтВодСнос', N'isukanov@sobolev.com', N'35222597511', N'agent_97.png', N'577227, Калужская область, город Павловский Посад, наб. Чехова, 35', 361, N'Мухина Ян Фёдорович', N'1522348613', N'977738715', 5, 0, 0)
INSERT [dbo].[Agent] ([AgentId], [Name], [Email], [Phone], [Photo], [Address], [Priority], [BossName], [INN], [KPP], [AgentTypeId], [OrderAmount], [OrderSumm]) VALUES (42, N'КазХоз', N'istrelkova@fomin.ru', N'79227288562', N'agent.png', N'384162, Астраханская область, город Одинцово, бульвар Гагарина, 57', 213, N'Степанова Роман Иванович', N'6503377671', N'232279972', 3, 1, 912)
INSERT [dbo].[Agent] ([AgentId], [Name], [Email], [Phone], [Photo], [Address], [Priority], [BossName], [INN], [KPP], [AgentTypeId], [OrderAmount], [OrderSumm]) VALUES (43, N'БухВжух', N'valentina.bolsakova@aksenova.ru', N'4953672141', N'agent.png', N'481744, Амурская область, город Щёлково, пл. Сталина, 48', 327, N'Тарасов Болеслав Александрович', N'2320989197', N'359282667', 7, 0, 0)
INSERT [dbo].[Agent] ([AgentId], [Name], [Email], [Phone], [Photo], [Address], [Priority], [BossName], [INN], [KPP], [AgentTypeId], [OrderAmount], [OrderSumm]) VALUES (44, N'ХозЮпитер', N'jisakova@nazarova.com', N'79223324896', N'agent_114.png', N'038182, Курганская область, город Москва, спуск Космонавтов, 16', 375, N'Максимоваа Вера Фёдоровна', N'6667635058', N'380592865', 3, 0, 0)
INSERT [dbo].[Agent] ([AgentId], [Name], [Email], [Phone], [Photo], [Address], [Priority], [BossName], [INN], [KPP], [AgentTypeId], [OrderAmount], [OrderSumm]) VALUES (45, N'ВостокКазРыб', N'flukin@misin.org', N'4959873163', N'agent_112.png', N'059565, Оренбургская область, город Истра, шоссе Домодедовская, 27', 361, N'Самсонов Родион Романович', N'7411284960', N'176779733', 6, 0, 0)
INSERT [dbo].[Agent] ([AgentId], [Name], [Email], [Phone], [Photo], [Address], [Priority], [BossName], [INN], [KPP], [AgentTypeId], [OrderAmount], [OrderSumm]) VALUES (46, N'ЦементКрепТех-М', N'yna.evdokimov@gordeeva.ru', N'8128387958', N'agent_82.png', N'263764, Свердловская область, город Раменское, пер. Косиора, 28', 189, N'Сергеев Владлен Александрович', N'5359981084', N'680416300', 5, 0, 0)
INSERT [dbo].[Agent] ([AgentId], [Name], [Email], [Phone], [Photo], [Address], [Priority], [BossName], [INN], [KPP], [AgentTypeId], [OrderAmount], [OrderSumm]) VALUES (47, N'Строй', N'soloveva.adam@andreev.ru', N'8124474559', N'agent.png', N'763019, Омская область, город Шатура, пл. Сталина, 56', 12, N'Кудрявцев Адриан Андреевич', N'6678884759', N'279288618', 6, 4, 4234)
INSERT [dbo].[Agent] ([AgentId], [Name], [Email], [Phone], [Photo], [Address], [Priority], [BossName], [INN], [KPP], [AgentTypeId], [OrderAmount], [OrderSumm]) VALUES (48, N'БашкирЮпитерТомск', N'dyckov.veniamin@kotova.ru', N'8121895957', N'agent_59.png', N'035268, Сахалинская область, город Волоколамск, проезд Ладыгина, 51', 139, N'Фадеева Раиса Александровна', N'1606315697', N'217799345', 5, 1, 338)
INSERT [dbo].[Agent] ([AgentId], [Name], [Email], [Phone], [Photo], [Address], [Priority], [BossName], [INN], [KPP], [AgentTypeId], [OrderAmount], [OrderSumm]) VALUES (49, N'Компания КазМеталКазань', N'mmoiseev@teterin.ru', N'4956853429', N'agent_130.png', N'532703, Пензенская область, город Чехов, наб. Чехова, 81', 252, N'Валерий Владимирович Хохлова', N'4598939812', N'303467543', 4, 0, 0)
INSERT [dbo].[Agent] ([AgentId], [Name], [Email], [Phone], [Photo], [Address], [Priority], [BossName], [INN], [KPP], [AgentTypeId], [OrderAmount], [OrderSumm]) VALUES (50, N'Компания Газ', N'alina56@zdanov.com', N'35222759685', N'agent_120.png', N'310403, Кировская область, город Солнечногорск, пл. Балканская, 76', 445, N'Давид Андреевич Фадеев', N'2262431140', N'247369527', 4, 0, 0)
INSERT [dbo].[Agent] ([AgentId], [Name], [Email], [Phone], [Photo], [Address], [Priority], [BossName], [INN], [KPP], [AgentTypeId], [OrderAmount], [OrderSumm]) VALUES (51, N'Компания Монтаж', N'afanasev.anastasiy@muravev.ru', N'35222924598', N'agent_75.png', N'036381, Брянская область, город Кашира, бульвар Гагарина, 76', 124, N'Силин Даниил Иванович', N'6206428565', N'118570048', 4, 3, 3548)
INSERT [dbo].[Agent] ([AgentId], [Name], [Email], [Phone], [Photo], [Address], [Priority], [BossName], [INN], [KPP], [AgentTypeId], [OrderAmount], [OrderSumm]) VALUES (52, N'СервисХмельМонтаж', N'galina31@melnikov.ru', N'79223447338', N'agent_92.png', N'928260, Нижегородская область, город Балашиха, пл. Косиора, 44', 124, N'Анжелика Дмитриевна Горбунова', N'3459886235', N'356196105', 5, 0, 0)
INSERT [dbo].[Agent] ([AgentId], [Name], [Email], [Phone], [Photo], [Address], [Priority], [BossName], [INN], [KPP], [AgentTypeId], [OrderAmount], [OrderSumm]) VALUES (53, N'ВодГараж', N'pmaslov@fomiceva.com', N'79223638667', N'agent_67.png', N'988899, Саратовская область, город Раменское, пр. Славы, 40', 250, N'Лаврентий Фёдорович Логинова', N'5575072431', N'684290320', 3, 3, 4333)
INSERT [dbo].[Agent] ([AgentId], [Name], [Email], [Phone], [Photo], [Address], [Priority], [BossName], [INN], [KPP], [AgentTypeId], [OrderAmount], [OrderSumm]) VALUES (54, N'CибГаз', N'inna.sarova@panfilov.ru', N'4959453725', N'agent_103.png', N'365674, Архангельская область, город Серебряные Пруды, пр. Ленина, 29', 488, N'Вячеслав Романович Третьякова', N'6483417250', N'455013058', 1, 0, 0)
INSERT [dbo].[Agent] ([AgentId], [Name], [Email], [Phone], [Photo], [Address], [Priority], [BossName], [INN], [KPP], [AgentTypeId], [OrderAmount], [OrderSumm]) VALUES (55, N'БашкирФлотМотор-H', N'morozova.nika@kazakova.ru', N'4957938482', N'agent_36.png', N'008081, Тюменская область, город Ногинск, въезд Гагарина, 94', 416, N'Марат Алексеевич Фролов', N'1657476072', N'934931159', 1, 1, 1160)
INSERT [dbo].[Agent] ([AgentId], [Name], [Email], [Phone], [Photo], [Address], [Priority], [BossName], [INN], [KPP], [AgentTypeId], [OrderAmount], [OrderSumm]) VALUES (56, N'МеталСервисМор', N'xdanilov@titov.ru', N'35222912862', N'agent.png', N'293265, Иркутская область, город Клин, пр. Славы, 12', 475, N'Коновалова Кирилл Львович', N'6922817841', N'580142825', 7, 0, 0)
INSERT [dbo].[Agent] ([AgentId], [Name], [Email], [Phone], [Photo], [Address], [Priority], [BossName], [INN], [KPP], [AgentTypeId], [OrderAmount], [OrderSumm]) VALUES (57, N'Рем', N'zanna25@nikiforova.com', N'4959878853', N'agent_79.png', N'707812, Иркутская область, город Шаховская, ул. Гагарина, 17', 329, N'Шароваа Елизавета Львовна', N'3203830728', N'456254820', 5, 2, 2068)
INSERT [dbo].[Agent] ([AgentId], [Name], [Email], [Phone], [Photo], [Address], [Priority], [BossName], [INN], [KPP], [AgentTypeId], [OrderAmount], [OrderSumm]) VALUES (58, N'СантехСеверЛенМашина', N'pgorbacev@vasilev.net', N'8129188843', N'agent_74.png', N'606990, Новосибирская область, город Павловский Посад, въезд Домодедовская, 38', 201, N'Павел Максимович Рожков', N'3506691089', N'830713603', 4, 1, 809)
INSERT [dbo].[Agent] ([AgentId], [Name], [Email], [Phone], [Photo], [Address], [Priority], [BossName], [INN], [KPP], [AgentTypeId], [OrderAmount], [OrderSumm]) VALUES (59, N'Цемент', N'panova.klementina@bobrov.ru', N'88005177847', N'agent_54.png', N'084315, Амурская область, город Шаховская, наб. Чехова, 62', 340, N'Анфиса Фёдоровна Буроваа', N'9662118663', N'650216214', 4, 3, 3204)
INSERT [dbo].[Agent] ([AgentId], [Name], [Email], [Phone], [Photo], [Address], [Priority], [BossName], [INN], [KPP], [AgentTypeId], [OrderAmount], [OrderSumm]) VALUES (60, N'Вод', N'savva86@zaiteva.ru', N'4951421984', N'agent_129.png', N'964386, Оренбургская область, город Чехов, пл. Косиора, 80', 359, N'Зоя Романовна Селезнёва', N'1296063939', N'447430051', 5, 0, 0)
INSERT [dbo].[Agent] ([AgentId], [Name], [Email], [Phone], [Photo], [Address], [Priority], [BossName], [INN], [KPP], [AgentTypeId], [OrderAmount], [OrderSumm]) VALUES (61, N'Орион', N'aleksei63@kiselev.ru', N'88006216193', N'agent_77.png', N'951035, Ивановская область, город Ступино, шоссе Космонавтов, 73', 166, N'Мартынов Михаил Борисович', N'2670166502', N'716874456', 7, 3, 4440)
INSERT [dbo].[Agent] ([AgentId], [Name], [Email], [Phone], [Photo], [Address], [Priority], [BossName], [INN], [KPP], [AgentTypeId], [OrderAmount], [OrderSumm]) VALUES (62, N'СтройГорНефть', N'lysy.kolesnikova@molcanova.com', N'8123852137', N'agent_37.png', N'444539, Ульяновская область, город Лотошино, спуск Будапештсткая, 95', 161, N'Тарасова Макар Максимович', N'5916775587', N'398299418', 3, 2, 1164)
INSERT [dbo].[Agent] ([AgentId], [Name], [Email], [Phone], [Photo], [Address], [Priority], [BossName], [INN], [KPP], [AgentTypeId], [OrderAmount], [OrderSumm]) VALUES (63, N'Компания Хмель', N'ermakov.mark@isakova.ru', N'8124217782', N'agent.png', N'889757, Новосибирская область, город Раменское, бульвар 1905 года, 93', 2, N'Владимир Борисович Суворова', N'9004087602', N'297273898', 4, 3, 4631)
INSERT [dbo].[Agent] ([AgentId], [Name], [Email], [Phone], [Photo], [Address], [Priority], [BossName], [INN], [KPP], [AgentTypeId], [OrderAmount], [OrderSumm]) VALUES (64, N'Компания ВодАлмазIT', N'zakar37@nikolaeva.ru', N'35222527616', N'agent_111.png', N'302100, Нижегородская область, город Мытищи, пер. 1905 года, 63', 31, N'Гуляев Егор Евгеньевич', N'2345297765', N'908449277', 4, 0, 0)
INSERT [dbo].[Agent] ([AgentId], [Name], [Email], [Phone], [Photo], [Address], [Priority], [BossName], [INN], [KPP], [AgentTypeId], [OrderAmount], [OrderSumm]) VALUES (65, N'БашкирРечТомск', N'aleksandra77@karpov.com', N'88002547185', N'agent_100.png', N'136886, Амурская область, город Видное, въезд Космонавтов, 39', 84, N'Назарова Вера Андреевна', N'7027724917', N'823811460', 7, 0, 0)
INSERT [dbo].[Agent] ([AgentId], [Name], [Email], [Phone], [Photo], [Address], [Priority], [BossName], [INN], [KPP], [AgentTypeId], [OrderAmount], [OrderSumm]) VALUES (66, N'СофтРосБух', N'ivanova.antonin@rodionov.ru', N'79224456917', N'agent_124.png', N'747695, Амурская область, город Сергиев Посад, въезд Бухарестская, 46', 69, N'Белова Полина Владимировна', N'8321561226', N'807803984', 5, 0, 0)
INSERT [dbo].[Agent] ([AgentId], [Name], [Email], [Phone], [Photo], [Address], [Priority], [BossName], [INN], [KPP], [AgentTypeId], [OrderAmount], [OrderSumm]) VALUES (67, N'ТелекомЮпитер', N'kulikov.adrian@zuravlev.org', N'8128956723', N'agent_81.png', N'959793, Курская область, город Егорьевск, бульвар Ленина, 72', 302, N'Калинина Татьяна Ивановна', N'9383182378', N'944520594', 1, 0, 0)
INSERT [dbo].[Agent] ([AgentId], [Name], [Email], [Phone], [Photo], [Address], [Priority], [BossName], [INN], [KPP], [AgentTypeId], [OrderAmount], [OrderSumm]) VALUES (68, N'УралСтройХмель', N'aleksandr95@kolobova.ru', N'35222392365', N'agent_113.png', N'462632, Костромская область, город Шаховская, шоссе Сталина, 92', 372, N'Август Борисович Красильникова', N'8773558039', N'402502867', 5, 0, 0)
INSERT [dbo].[Agent] ([AgentId], [Name], [Email], [Phone], [Photo], [Address], [Priority], [BossName], [INN], [KPP], [AgentTypeId], [OrderAmount], [OrderSumm]) VALUES (69, N'АсбоцементТехАвто', N'matveev.yliy@kiseleva.ru', N'79229776884', N'agent_110.png', N'304975, Пензенская область, город Солнечногорск, шоссе Балканская, 76', 247, N'Сидорова Любовь Ивановна', N'7626076463', N'579234124', 6, 0, 0)
INSERT [dbo].[Agent] ([AgentId], [Name], [Email], [Phone], [Photo], [Address], [Priority], [BossName], [INN], [KPP], [AgentTypeId], [OrderAmount], [OrderSumm]) VALUES (70, N'Компания ФинансСервис', N'robert.serbakov@safonova.ru', N'8128784271', N'agent_38.png', N'841700, Брянская область, город Серпухов, спуск Домодедовская, 35', 395, N'Клавдия Сергеевна Виноградова', N'7491491391', N'673621812', 4, 2, 1248)
INSERT [dbo].[Agent] ([AgentId], [Name], [Email], [Phone], [Photo], [Address], [Priority], [BossName], [INN], [KPP], [AgentTypeId], [OrderAmount], [OrderSumm]) VALUES (71, N'Софт', N'jterentev@ersov.com', N'35222128265', N'agent_122.png', N'453714, Смоленская область, город Одинцово, спуск Косиора, 84', 292, N'Петухова Прохор Фёдорович', N'3889910123', N'952047511', 3, 0, 0)
INSERT [dbo].[Agent] ([AgentId], [Name], [Email], [Phone], [Photo], [Address], [Priority], [BossName], [INN], [KPP], [AgentTypeId], [OrderAmount], [OrderSumm]) VALUES (72, N'ТелекомГор', N'gorskov.larisa@kalinin.com', N'35222789321', N'agent_98.png', N'210024, Белгородская область, город Сергиев Посад, наб. Ломоносова, 43', 255, N'Ксения Андреевна Михайлова', N'3748947224', N'766431901', 3, 0, 0)
INSERT [dbo].[Agent] ([AgentId], [Name], [Email], [Phone], [Photo], [Address], [Priority], [BossName], [INN], [KPP], [AgentTypeId], [OrderAmount], [OrderSumm]) VALUES (73, N'РемСтрем', N'rafail96@sukin.ru', N'35222552824', N'agent_116.png', N'373761, Псковская область, город Наро-Фоминск, наб. Гагарина, 03', 88, N'Альбина Александровна Романова', N'9006569852', N'152177100', 7, 0, 0)
INSERT [dbo].[Agent] ([AgentId], [Name], [Email], [Phone], [Photo], [Address], [Priority], [BossName], [INN], [KPP], [AgentTypeId], [OrderAmount], [OrderSumm]) VALUES (74, N'Лифт', N'zinaida01@bespalova.ru', N'8124849238', N'agent_101.png', N'479565, Курганская область, город Клин, пл. Ленина, 54', 92, N'Вера Евгеньевна Денисоваа', N'6169713039', N'848972934', 4, 0, 0)
INSERT [dbo].[Agent] ([AgentId], [Name], [Email], [Phone], [Photo], [Address], [Priority], [BossName], [INN], [KPP], [AgentTypeId], [OrderAmount], [OrderSumm]) VALUES (75, N'Компания МоторТелекомЦемент-М', N'larisa44@silin.org', N'8128579557', N'agent_118.png', N'021293, Амурская область, город Наро-Фоминск, шоссе Славы, 40', 237, N'Иван Евгеньевич Белоусова', N'7326832482', N'440199498', 4, 0, 0)
INSERT [dbo].[Agent] ([AgentId], [Name], [Email], [Phone], [Photo], [Address], [Priority], [BossName], [INN], [KPP], [AgentTypeId], [OrderAmount], [OrderSumm]) VALUES (76, N'ЮпитерТяжОрионЭкспедиция', N'gblokin@orlov.net', N'35222956365', N'agent_44.png', N'960726, Томская область, город Орехово-Зуево, въезд 1905 года, 51', 446, N'Валерий Евгеньевич Виноградов', N'6843174002', N'935556458', 3, 1, 597)
INSERT [dbo].[Agent] ([AgentId], [Name], [Email], [Phone], [Photo], [Address], [Priority], [BossName], [INN], [KPP], [AgentTypeId], [OrderAmount], [OrderSumm]) VALUES (77, N'Транс', N'artem.fadeev@polykov.com', N'88009542389', N'agent_127.png', N'508299, Кемеровская область, город Кашира, пер. Гагарина, 42', 38, N'Евсеева Болеслав Сергеевич', N'9604275878', N'951258069', 6, 0, 0)
INSERT [dbo].[Agent] ([AgentId], [Name], [Email], [Phone], [Photo], [Address], [Priority], [BossName], [INN], [KPP], [AgentTypeId], [OrderAmount], [OrderSumm]) VALUES (78, N'РемВод', N'komarov.elizaveta@agafonova.ru', N'79223533172', N'agent_126.png', N'449723, Смоленская область, город Наро-Фоминск, пер. Ломоносова, 94', 1, N'Медведеваа Ярослава Фёдоровна', N'3986603105', N'811373078', 3, 0, 0)
INSERT [dbo].[Agent] ([AgentId], [Name], [Email], [Phone], [Photo], [Address], [Priority], [BossName], [INN], [KPP], [AgentTypeId], [OrderAmount], [OrderSumm]) VALUES (79, N'АсбоцементЛифтРеч-H', N'vladlena58@seliverstova.ru', N'4952455716', N'agent_105.png', N'599158, Ростовская область, город Озёры, ул. Космонавтов, 05', 407, N'Кондратьева Таисия Андреевна', N'6567878928', N'560960507', 7, 0, 0)
INSERT [dbo].[Agent] ([AgentId], [Name], [Email], [Phone], [Photo], [Address], [Priority], [BossName], [INN], [KPP], [AgentTypeId], [OrderAmount], [OrderSumm]) VALUES (80, N'РосАвтоМонтаж', N'lapin.inessa@isaeva.com', N'4954459776', N'agent_55.png', N'331914, Курская область, город Ногинск, спуск Ладыгина, 66', 10, N'Диана Алексеевна Исаковаа', N'4735043946', N'263682488', 4, 2, 2214)
INSERT [dbo].[Agent] ([AgentId], [Name], [Email], [Phone], [Photo], [Address], [Priority], [BossName], [INN], [KPP], [AgentTypeId], [OrderAmount], [OrderSumm]) VALUES (81, N'Компания СервисТелеМотор', N'veronika.egorov@bespalova.com', N'79224612529', N'agent_102.png', N'625988, Вологодская область, город Озёры, пр. Гоголя, 18', 81, N'Фролова Эдуард Борисович', N'3248454160', N'138472695', 4, 0, 0)
INSERT [dbo].[Agent] ([AgentId], [Name], [Email], [Phone], [Photo], [Address], [Priority], [BossName], [INN], [KPP], [AgentTypeId], [OrderAmount], [OrderSumm]) VALUES (82, N'ФинансТелеТверь', N'medvedev.klim@afanasev.com', N'8121155693', N'agent_45.png', N'687171, Томская область, город Лотошино, пл. Славы, 59', 100, N'Зайцеваа Дарья Сергеевна', N'2646091050', N'971874277', 7, 2, 2504)
INSERT [dbo].[Agent] ([AgentId], [Name], [Email], [Phone], [Photo], [Address], [Priority], [BossName], [INN], [KPP], [AgentTypeId], [OrderAmount], [OrderSumm]) VALUES (83, N'ВодГор', N'tvetkova.robert@sorokin.com', N'35222737216', N'agent_125.png', N'265653, Калужская область, город Ступино, шоссе Гоголя, 89', 72, N'Фаина Фёдоровна Филиппова', N'4463113470', N'899603778', 3, 0, 0)
INSERT [dbo].[Agent] ([AgentId], [Name], [Email], [Phone], [Photo], [Address], [Priority], [BossName], [INN], [KPP], [AgentTypeId], [OrderAmount], [OrderSumm]) VALUES (84, N'ТяжРадиоУралПроф', N'liliy62@grisina.ru', N'79228856615', N'agent_88.png', N'521087, Орловская область, город Егорьевск, шоссе Ладыгина, 14', 278, N'София Алексеевна Мухина', N'5688533246', N'401535045', 3, 0, 0)
INSERT [dbo].[Agent] ([AgentId], [Name], [Email], [Phone], [Photo], [Address], [Priority], [BossName], [INN], [KPP], [AgentTypeId], [OrderAmount], [OrderSumm]) VALUES (85, N'ГаражЛофт', N'lydmila.belyeva@karpov.ru', N'4954275566', N'agent_108.png', N'294596, Мурманская область, город Шаховская, пр. Домодедовская, 88', 335, N'Клавдия Фёдоровна Кудряшова', N'2816939574', N'754741128', 3, 0, 0)
INSERT [dbo].[Agent] ([AgentId], [Name], [Email], [Phone], [Photo], [Address], [Priority], [BossName], [INN], [KPP], [AgentTypeId], [OrderAmount], [OrderSumm]) VALUES (86, N'ITСтройАлмаз', N'fokin.eduard@samoilov.com', N'88001857891', N'agent_83.png', N'361730, Костромская область, город Волоколамск, шоссе Славы, 36', 159, N'Алексеева Валериан Андреевич', N'7689065648', N'456612755', 3, 0, 0)
INSERT [dbo].[Agent] ([AgentId], [Name], [Email], [Phone], [Photo], [Address], [Priority], [BossName], [INN], [KPP], [AgentTypeId], [OrderAmount], [OrderSumm]) VALUES (87, N'Асбоцемент', N'antonin19@panfilov.ru', N'88002111623', N'agent_34.png', N'030119, Курганская область, город Дмитров, пер. Славы, 47', 273, N'Никитинаа Антонина Андреевна', N'1261407459', N'745921890', 4, 1, 597)
INSERT [dbo].[Agent] ([AgentId], [Name], [Email], [Phone], [Photo], [Address], [Priority], [BossName], [INN], [KPP], [AgentTypeId], [OrderAmount], [OrderSumm]) VALUES (88, N'ТекстильУралАвтоОпт', N'hkononova@pavlova.ru', N'35222987654', N'agent.png', N'028936, Магаданская область, город Видное, ул. Гагарина, 54', 176, N'Алина Сергеевна Дьячковаа', N'3930950057', N'678529397', 5, 1, 1160)
INSERT [dbo].[Agent] ([AgentId], [Name], [Email], [Phone], [Photo], [Address], [Priority], [BossName], [INN], [KPP], [AgentTypeId], [OrderAmount], [OrderSumm]) VALUES (89, N'Компания КрепЦемент', N'rusakov.efim@nikiforov.ru', N'8129637787', N'agent_50.png', N'423477, Мурманская область, город Кашира, бульвар Домодедовская, 61', 426, N'Екатерина Львовна Суворова', N'3025099903', N'606083992', 4, 1, 1691)
INSERT [dbo].[Agent] ([AgentId], [Name], [Email], [Phone], [Photo], [Address], [Priority], [BossName], [INN], [KPP], [AgentTypeId], [OrderAmount], [OrderSumm]) VALUES (90, N'КазаньТекстиль', N'osimonova@andreeva.com', N'35222867421', N'agent_47.png', N'231891, Челябинская область, город Шатура, бульвар Ладыгина, 40', 156, N'Александров Бронислав Максимович', N'4584384019', N'149680499', 3, 2, 1439)
INSERT [dbo].[Agent] ([AgentId], [Name], [Email], [Phone], [Photo], [Address], [Priority], [BossName], [INN], [KPP], [AgentTypeId], [OrderAmount], [OrderSumm]) VALUES (91, N'КазЮпитерТомск', N'tgavrilov@frolov.ru', N'79227723358', N'agent_60.png', N'393450, Тульская область, город Кашира, пр. 1905 года, 47', 244, N'Рафаил Андреевич Копылов', N'9201745524', N'510248846', 3, 2, 917)
INSERT [dbo].[Agent] ([AgentId], [Name], [Email], [Phone], [Photo], [Address], [Priority], [BossName], [INN], [KPP], [AgentTypeId], [OrderAmount], [OrderSumm]) VALUES (92, N'Бух', N'belova.vikentii@konstantinova.net', N'79223754921', N'agent_78.png', N'409600, Новгородская область, город Ногинск, пл. Гагарина, 68', 82, N'Татьяна Сергеевна Королёваа', N'1953785418', N'122905583', 6, 1, 419)
INSERT [dbo].[Agent] ([AgentId], [Name], [Email], [Phone], [Photo], [Address], [Priority], [BossName], [INN], [KPP], [AgentTypeId], [OrderAmount], [OrderSumm]) VALUES (93, N'Радио', N'rtretykova@kozlov.ru', N'88008973278', N'agent_43.png', N'798718, Ленинградская область, город Пушкино, бульвар Балканская, 37', 221, N'Эмма Андреевна Колесникова', N'9077613654', N'657690787', 7, 1, 523)
INSERT [dbo].[Agent] ([AgentId], [Name], [Email], [Phone], [Photo], [Address], [Priority], [BossName], [INN], [KPP], [AgentTypeId], [OrderAmount], [OrderSumm]) VALUES (94, N'Креп', N'savina.dominika@belousova.com', N'4952174629', N'agent_39.png', N'336489, Калининградская область, город Можайск, наб. Славы, 35', 371, N'Назар Алексеевич Григорьева', N'4880732317', N'258673591', 5, 3, 3657)
INSERT [dbo].[Agent] ([AgentId], [Name], [Email], [Phone], [Photo], [Address], [Priority], [BossName], [INN], [KPP], [AgentTypeId], [OrderAmount], [OrderSumm]) VALUES (95, N'Мобайл', N'dsiryev@dementeva.com', N'88006187337', N'agent_107.png', N'606703, Амурская область, город Чехов, пл. Будапештсткая, 91', 464, N'Екатерина Сергеевна Бобылёва', N'7803888520', N'885703265', 3, 0, 0)
INSERT [dbo].[Agent] ([AgentId], [Name], [Email], [Phone], [Photo], [Address], [Priority], [BossName], [INN], [KPP], [AgentTypeId], [OrderAmount], [OrderSumm]) VALUES (96, N'CибБашкирТекстиль', N'vzimina@zdanova.com', N'4952857838', N'agent_69.png', N'429540, Мурманская область, город Воскресенск, пл. Славы, 36', 218, N'Григорий Владимирович Елисеева', N'7392007090', N'576103661', 1, 2, 2928)
INSERT [dbo].[Agent] ([AgentId], [Name], [Email], [Phone], [Photo], [Address], [Priority], [BossName], [INN], [KPP], [AgentTypeId], [OrderAmount], [OrderSumm]) VALUES (97, N'МеталТекстильЛифтТрест', N'muravev.trofim@sazonov.net', N'8127539676', N'agent_86.png', N'786287, Свердловская область, город Волоколамск, пер. Будапештсткая, 72', 425, N'Одинцов Назар Борисович', N'2971553297', N'821859486', 1, 0, 0)
INSERT [dbo].[Agent] ([AgentId], [Name], [Email], [Phone], [Photo], [Address], [Priority], [BossName], [INN], [KPP], [AgentTypeId], [OrderAmount], [OrderSumm]) VALUES (98, N'ОрионТомскТех', N'faina.tikonova@veselov.com', N'79225428915', N'agent_119.png', N'738763, Курская область, город Егорьевск, спуск Чехова, 66', 73, N'Георгий Александрович Лукин', N'9351493429', N'583041591', 7, 0, 0)
INSERT [dbo].[Agent] ([AgentId], [Name], [Email], [Phone], [Photo], [Address], [Priority], [BossName], [INN], [KPP], [AgentTypeId], [OrderAmount], [OrderSumm]) VALUES (99, N'ЖелДорДизайнМетизТраст', N'lnikitina@kulikova.com', N'8121236347', N'agent.png', N'170549, Сахалинская область, город Видное, проезд Космонавтов, 89', 290, N'Игорь Львович Агафонова', N'7669116841', N'906390137', 7, 0, 0)
GO
INSERT [dbo].[Agent] ([AgentId], [Name], [Email], [Phone], [Photo], [Address], [Priority], [BossName], [INN], [KPP], [AgentTypeId], [OrderAmount], [OrderSumm]) VALUES (100, N'БухМясМоторПром', N'varvara49@savin.ru', N'35222832359', N'agent_95.png', N'677498, Костромская область, город Зарайск, спуск Славы, 59', 158, N'Нина Дмитриевна Черноваа', N'7377410338', N'592041317', 3, 0, 0)
SET IDENTITY_INSERT [dbo].[Agent] OFF
GO
SET IDENTITY_INSERT [dbo].[AgentType] ON 

INSERT [dbo].[AgentType] ([AgentTypeId], [Name]) VALUES (1, N'МКК')
INSERT [dbo].[AgentType] ([AgentTypeId], [Name]) VALUES (3, N'ОАО')
INSERT [dbo].[AgentType] ([AgentTypeId], [Name]) VALUES (4, N'ООО')
INSERT [dbo].[AgentType] ([AgentTypeId], [Name]) VALUES (5, N'ЗАО')
INSERT [dbo].[AgentType] ([AgentTypeId], [Name]) VALUES (6, N'МФО')
INSERT [dbo].[AgentType] ([AgentTypeId], [Name]) VALUES (7, N'ПАО')
SET IDENTITY_INSERT [dbo].[AgentType] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([OrderId], [ProductId], [AgentId], [OrderDate], [ProductAmount], [OrderTime]) VALUES (201, 10, 90, CAST(N'2010-06-21' AS Date), 7, CAST(N'00:00:00' AS Time))
INSERT [dbo].[Order] ([OrderId], [ProductId], [AgentId], [OrderDate], [ProductAmount], [OrderTime]) VALUES (202, 23, 70, CAST(N'2016-02-17' AS Date), 18, CAST(N'00:00:00' AS Time))
INSERT [dbo].[Order] ([OrderId], [ProductId], [AgentId], [OrderDate], [ProductAmount], [OrderTime]) VALUES (203, 24, 38, CAST(N'2012-11-07' AS Date), 9, CAST(N'00:00:00' AS Time))
INSERT [dbo].[Order] ([OrderId], [ProductId], [AgentId], [OrderDate], [ProductAmount], [OrderTime]) VALUES (204, 46, 93, CAST(N'2019-06-01' AS Date), 5, CAST(N'00:00:00' AS Time))
INSERT [dbo].[Order] ([OrderId], [ProductId], [AgentId], [OrderDate], [ProductAmount], [OrderTime]) VALUES (205, 21, 61, CAST(N'2014-06-11' AS Date), 11, CAST(N'00:00:00' AS Time))
INSERT [dbo].[Order] ([OrderId], [ProductId], [AgentId], [OrderDate], [ProductAmount], [OrderTime]) VALUES (206, 1, 29, CAST(N'2012-08-12' AS Date), 12, CAST(N'00:00:00' AS Time))
INSERT [dbo].[Order] ([OrderId], [ProductId], [AgentId], [OrderDate], [ProductAmount], [OrderTime]) VALUES (207, 35, 21, CAST(N'2012-09-26' AS Date), 16, CAST(N'00:00:00' AS Time))
INSERT [dbo].[Order] ([OrderId], [ProductId], [AgentId], [OrderDate], [ProductAmount], [OrderTime]) VALUES (208, 17, 38, CAST(N'2018-02-28' AS Date), 3, CAST(N'00:00:00' AS Time))
INSERT [dbo].[Order] ([OrderId], [ProductId], [AgentId], [OrderDate], [ProductAmount], [OrderTime]) VALUES (209, 2, 96, CAST(N'2018-09-15' AS Date), 6, CAST(N'00:00:00' AS Time))
INSERT [dbo].[Order] ([OrderId], [ProductId], [AgentId], [OrderDate], [ProductAmount], [OrderTime]) VALUES (210, 12, 33, CAST(N'2011-08-27' AS Date), 10, CAST(N'00:00:00' AS Time))
INSERT [dbo].[Order] ([OrderId], [ProductId], [AgentId], [OrderDate], [ProductAmount], [OrderTime]) VALUES (211, 42, 25, CAST(N'2011-08-19' AS Date), 2, CAST(N'00:00:00' AS Time))
INSERT [dbo].[Order] ([OrderId], [ProductId], [AgentId], [OrderDate], [ProductAmount], [OrderTime]) VALUES (212, 45, 38, CAST(N'2015-02-02' AS Date), 20, CAST(N'00:00:00' AS Time))
INSERT [dbo].[Order] ([OrderId], [ProductId], [AgentId], [OrderDate], [ProductAmount], [OrderTime]) VALUES (213, 48, 94, CAST(N'2011-07-01' AS Date), 14, CAST(N'00:00:00' AS Time))
INSERT [dbo].[Order] ([OrderId], [ProductId], [AgentId], [OrderDate], [ProductAmount], [OrderTime]) VALUES (214, 47, 40, CAST(N'2013-12-23' AS Date), 8, CAST(N'00:00:00' AS Time))
INSERT [dbo].[Order] ([OrderId], [ProductId], [AgentId], [OrderDate], [ProductAmount], [OrderTime]) VALUES (215, 10, 7, CAST(N'2017-11-11' AS Date), 10, CAST(N'00:00:00' AS Time))
INSERT [dbo].[Order] ([OrderId], [ProductId], [AgentId], [OrderDate], [ProductAmount], [OrderTime]) VALUES (216, 24, 35, CAST(N'2014-04-15' AS Date), 14, CAST(N'00:00:00' AS Time))
INSERT [dbo].[Order] ([OrderId], [ProductId], [AgentId], [OrderDate], [ProductAmount], [OrderTime]) VALUES (217, 24, 37, CAST(N'2018-06-22' AS Date), 6, CAST(N'00:00:00' AS Time))
INSERT [dbo].[Order] ([OrderId], [ProductId], [AgentId], [OrderDate], [ProductAmount], [OrderTime]) VALUES (218, 39, 57, CAST(N'2013-07-11' AS Date), 12, CAST(N'00:00:00' AS Time))
INSERT [dbo].[Order] ([OrderId], [ProductId], [AgentId], [OrderDate], [ProductAmount], [OrderTime]) VALUES (219, 17, 18, CAST(N'2016-08-13' AS Date), 7, CAST(N'00:00:00' AS Time))
INSERT [dbo].[Order] ([OrderId], [ProductId], [AgentId], [OrderDate], [ProductAmount], [OrderTime]) VALUES (220, 47, 21, CAST(N'2014-07-28' AS Date), 8, CAST(N'00:00:00' AS Time))
INSERT [dbo].[Order] ([OrderId], [ProductId], [AgentId], [OrderDate], [ProductAmount], [OrderTime]) VALUES (221, 14, 62, CAST(N'2010-04-15' AS Date), 8, CAST(N'00:00:00' AS Time))
INSERT [dbo].[Order] ([OrderId], [ProductId], [AgentId], [OrderDate], [ProductAmount], [OrderTime]) VALUES (222, 14, 42, CAST(N'2017-10-12' AS Date), 8, CAST(N'00:00:00' AS Time))
INSERT [dbo].[Order] ([OrderId], [ProductId], [AgentId], [OrderDate], [ProductAmount], [OrderTime]) VALUES (223, 38, 88, CAST(N'2012-09-02' AS Date), 13, CAST(N'00:00:00' AS Time))
INSERT [dbo].[Order] ([OrderId], [ProductId], [AgentId], [OrderDate], [ProductAmount], [OrderTime]) VALUES (224, 17, 91, CAST(N'2015-08-08' AS Date), 14, CAST(N'00:00:00' AS Time))
INSERT [dbo].[Order] ([OrderId], [ProductId], [AgentId], [OrderDate], [ProductAmount], [OrderTime]) VALUES (225, 49, 5, CAST(N'2012-05-25' AS Date), 15, CAST(N'00:00:00' AS Time))
INSERT [dbo].[Order] ([OrderId], [ProductId], [AgentId], [OrderDate], [ProductAmount], [OrderTime]) VALUES (226, 36, 30, CAST(N'2014-03-06' AS Date), 12, CAST(N'00:00:00' AS Time))
INSERT [dbo].[Order] ([OrderId], [ProductId], [AgentId], [OrderDate], [ProductAmount], [OrderTime]) VALUES (227, 16, 29, CAST(N'2016-05-18' AS Date), 6, CAST(N'00:00:00' AS Time))
INSERT [dbo].[Order] ([OrderId], [ProductId], [AgentId], [OrderDate], [ProductAmount], [OrderTime]) VALUES (228, 50, 89, CAST(N'2014-07-11' AS Date), 10, CAST(N'00:00:00' AS Time))
INSERT [dbo].[Order] ([OrderId], [ProductId], [AgentId], [OrderDate], [ProductAmount], [OrderTime]) VALUES (229, 45, 63, CAST(N'2016-08-18' AS Date), 8, CAST(N'00:00:00' AS Time))
INSERT [dbo].[Order] ([OrderId], [ProductId], [AgentId], [OrderDate], [ProductAmount], [OrderTime]) VALUES (230, 4, 5, CAST(N'2019-07-25' AS Date), 19, CAST(N'00:00:00' AS Time))
INSERT [dbo].[Order] ([OrderId], [ProductId], [AgentId], [OrderDate], [ProductAmount], [OrderTime]) VALUES (231, 40, 53, CAST(N'2019-03-17' AS Date), 6, CAST(N'00:00:00' AS Time))
INSERT [dbo].[Order] ([OrderId], [ProductId], [AgentId], [OrderDate], [ProductAmount], [OrderTime]) VALUES (232, 20, 47, CAST(N'2014-08-06' AS Date), 9, CAST(N'00:00:00' AS Time))
INSERT [dbo].[Order] ([OrderId], [ProductId], [AgentId], [OrderDate], [ProductAmount], [OrderTime]) VALUES (233, 27, 5, CAST(N'2011-09-12' AS Date), 18, CAST(N'00:00:00' AS Time))
INSERT [dbo].[Order] ([OrderId], [ProductId], [AgentId], [OrderDate], [ProductAmount], [OrderTime]) VALUES (234, 14, 19, CAST(N'2011-08-28' AS Date), 11, CAST(N'00:00:00' AS Time))
INSERT [dbo].[Order] ([OrderId], [ProductId], [AgentId], [OrderDate], [ProductAmount], [OrderTime]) VALUES (235, 41, 63, CAST(N'2015-12-25' AS Date), 4, CAST(N'00:00:00' AS Time))
INSERT [dbo].[Order] ([OrderId], [ProductId], [AgentId], [OrderDate], [ProductAmount], [OrderTime]) VALUES (236, 1, 18, CAST(N'2016-02-25' AS Date), 8, CAST(N'00:00:00' AS Time))
INSERT [dbo].[Order] ([OrderId], [ProductId], [AgentId], [OrderDate], [ProductAmount], [OrderTime]) VALUES (237, 8, 11, CAST(N'2017-06-07' AS Date), 1, CAST(N'00:00:00' AS Time))
INSERT [dbo].[Order] ([OrderId], [ProductId], [AgentId], [OrderDate], [ProductAmount], [OrderTime]) VALUES (238, 38, 96, CAST(N'2016-11-27' AS Date), 6, CAST(N'00:00:00' AS Time))
INSERT [dbo].[Order] ([OrderId], [ProductId], [AgentId], [OrderDate], [ProductAmount], [OrderTime]) VALUES (239, 18, 7, CAST(N'2012-03-12' AS Date), 18, CAST(N'00:00:00' AS Time))
INSERT [dbo].[Order] ([OrderId], [ProductId], [AgentId], [OrderDate], [ProductAmount], [OrderTime]) VALUES (240, 7, 59, CAST(N'2018-06-13' AS Date), 18, CAST(N'00:00:00' AS Time))
INSERT [dbo].[Order] ([OrderId], [ProductId], [AgentId], [OrderDate], [ProductAmount], [OrderTime]) VALUES (241, 31, 30, CAST(N'2017-11-05' AS Date), 2, CAST(N'00:00:00' AS Time))
INSERT [dbo].[Order] ([OrderId], [ProductId], [AgentId], [OrderDate], [ProductAmount], [OrderTime]) VALUES (242, 38, 16, CAST(N'2016-02-26' AS Date), 1, CAST(N'00:00:00' AS Time))
INSERT [dbo].[Order] ([OrderId], [ProductId], [AgentId], [OrderDate], [ProductAmount], [OrderTime]) VALUES (243, 29, 90, CAST(N'2010-06-20' AS Date), 8, CAST(N'00:00:00' AS Time))
INSERT [dbo].[Order] ([OrderId], [ProductId], [AgentId], [OrderDate], [ProductAmount], [OrderTime]) VALUES (244, 28, 7, CAST(N'2015-06-23' AS Date), 12, CAST(N'00:00:00' AS Time))
INSERT [dbo].[Order] ([OrderId], [ProductId], [AgentId], [OrderDate], [ProductAmount], [OrderTime]) VALUES (245, 14, 33, CAST(N'2013-01-24' AS Date), 3, CAST(N'00:00:00' AS Time))
INSERT [dbo].[Order] ([OrderId], [ProductId], [AgentId], [OrderDate], [ProductAmount], [OrderTime]) VALUES (246, 13, 9, CAST(N'2015-02-28' AS Date), 5, CAST(N'00:00:00' AS Time))
INSERT [dbo].[Order] ([OrderId], [ProductId], [AgentId], [OrderDate], [ProductAmount], [OrderTime]) VALUES (247, 42, 18, CAST(N'2019-07-05' AS Date), 14, CAST(N'00:00:00' AS Time))
INSERT [dbo].[Order] ([OrderId], [ProductId], [AgentId], [OrderDate], [ProductAmount], [OrderTime]) VALUES (248, 40, 92, CAST(N'2014-03-06' AS Date), 6, CAST(N'00:00:00' AS Time))
INSERT [dbo].[Order] ([OrderId], [ProductId], [AgentId], [OrderDate], [ProductAmount], [OrderTime]) VALUES (249, 31, 94, CAST(N'2017-05-01' AS Date), 5, CAST(N'00:00:00' AS Time))
INSERT [dbo].[Order] ([OrderId], [ProductId], [AgentId], [OrderDate], [ProductAmount], [OrderTime]) VALUES (250, 26, 51, CAST(N'2015-01-17' AS Date), 15, CAST(N'00:00:00' AS Time))
INSERT [dbo].[Order] ([OrderId], [ProductId], [AgentId], [OrderDate], [ProductAmount], [OrderTime]) VALUES (251, 15, 82, CAST(N'2018-04-14' AS Date), 7, CAST(N'00:00:00' AS Time))
INSERT [dbo].[Order] ([OrderId], [ProductId], [AgentId], [OrderDate], [ProductAmount], [OrderTime]) VALUES (252, 18, 94, CAST(N'2014-12-12' AS Date), 14, CAST(N'00:00:00' AS Time))
INSERT [dbo].[Order] ([OrderId], [ProductId], [AgentId], [OrderDate], [ProductAmount], [OrderTime]) VALUES (253, 17, 40, CAST(N'2015-03-28' AS Date), 16, CAST(N'00:00:00' AS Time))
INSERT [dbo].[Order] ([OrderId], [ProductId], [AgentId], [OrderDate], [ProductAmount], [OrderTime]) VALUES (254, 41, 13, CAST(N'2017-11-24' AS Date), 15, CAST(N'00:00:00' AS Time))
INSERT [dbo].[Order] ([OrderId], [ProductId], [AgentId], [OrderDate], [ProductAmount], [OrderTime]) VALUES (255, 46, 11, CAST(N'2019-06-27' AS Date), 10, CAST(N'00:00:00' AS Time))
INSERT [dbo].[Order] ([OrderId], [ProductId], [AgentId], [OrderDate], [ProductAmount], [OrderTime]) VALUES (256, 29, 87, CAST(N'2014-06-04' AS Date), 2, CAST(N'00:00:00' AS Time))
INSERT [dbo].[Order] ([OrderId], [ProductId], [AgentId], [OrderDate], [ProductAmount], [OrderTime]) VALUES (257, 43, 57, CAST(N'2019-03-18' AS Date), 11, CAST(N'00:00:00' AS Time))
INSERT [dbo].[Order] ([OrderId], [ProductId], [AgentId], [OrderDate], [ProductAmount], [OrderTime]) VALUES (258, 42, 13, CAST(N'2015-09-12' AS Date), 8, CAST(N'00:00:00' AS Time))
INSERT [dbo].[Order] ([OrderId], [ProductId], [AgentId], [OrderDate], [ProductAmount], [OrderTime]) VALUES (259, 47, 59, CAST(N'2012-01-02' AS Date), 13, CAST(N'00:00:00' AS Time))
INSERT [dbo].[Order] ([OrderId], [ProductId], [AgentId], [OrderDate], [ProductAmount], [OrderTime]) VALUES (260, 24, 9, CAST(N'2011-02-01' AS Date), 12, CAST(N'00:00:00' AS Time))
INSERT [dbo].[Order] ([OrderId], [ProductId], [AgentId], [OrderDate], [ProductAmount], [OrderTime]) VALUES (261, 33, 24, CAST(N'2016-10-07' AS Date), 17, CAST(N'00:00:00' AS Time))
INSERT [dbo].[Order] ([OrderId], [ProductId], [AgentId], [OrderDate], [ProductAmount], [OrderTime]) VALUES (262, 4, 91, CAST(N'2017-06-07' AS Date), 1, CAST(N'00:00:00' AS Time))
INSERT [dbo].[Order] ([OrderId], [ProductId], [AgentId], [OrderDate], [ProductAmount], [OrderTime]) VALUES (263, 5, 47, CAST(N'2016-02-26' AS Date), 14, CAST(N'00:00:00' AS Time))
INSERT [dbo].[Order] ([OrderId], [ProductId], [AgentId], [OrderDate], [ProductAmount], [OrderTime]) VALUES (264, 2, 47, CAST(N'2013-11-09' AS Date), 5, CAST(N'00:00:00' AS Time))
INSERT [dbo].[Order] ([OrderId], [ProductId], [AgentId], [OrderDate], [ProductAmount], [OrderTime]) VALUES (265, 40, 9, CAST(N'2015-07-01' AS Date), 14, CAST(N'00:00:00' AS Time))
INSERT [dbo].[Order] ([OrderId], [ProductId], [AgentId], [OrderDate], [ProductAmount], [OrderTime]) VALUES (266, 32, 58, CAST(N'2015-08-27' AS Date), 6, CAST(N'00:00:00' AS Time))
INSERT [dbo].[Order] ([OrderId], [ProductId], [AgentId], [OrderDate], [ProductAmount], [OrderTime]) VALUES (267, 23, 59, CAST(N'2013-08-27' AS Date), 15, CAST(N'00:00:00' AS Time))
INSERT [dbo].[Order] ([OrderId], [ProductId], [AgentId], [OrderDate], [ProductAmount], [OrderTime]) VALUES (268, 19, 61, CAST(N'2013-05-10' AS Date), 2, CAST(N'00:00:00' AS Time))
INSERT [dbo].[Order] ([OrderId], [ProductId], [AgentId], [OrderDate], [ProductAmount], [OrderTime]) VALUES (269, 24, 53, CAST(N'2013-12-01' AS Date), 19, CAST(N'00:00:00' AS Time))
INSERT [dbo].[Order] ([OrderId], [ProductId], [AgentId], [OrderDate], [ProductAmount], [OrderTime]) VALUES (270, 15, 70, CAST(N'2011-06-11' AS Date), 16, CAST(N'00:00:00' AS Time))
INSERT [dbo].[Order] ([OrderId], [ProductId], [AgentId], [OrderDate], [ProductAmount], [OrderTime]) VALUES (271, 2, 25, CAST(N'2019-05-24' AS Date), 16, CAST(N'00:00:00' AS Time))
INSERT [dbo].[Order] ([OrderId], [ProductId], [AgentId], [OrderDate], [ProductAmount], [OrderTime]) VALUES (272, 46, 47, CAST(N'2017-04-02' AS Date), 1, CAST(N'00:00:00' AS Time))
INSERT [dbo].[Order] ([OrderId], [ProductId], [AgentId], [OrderDate], [ProductAmount], [OrderTime]) VALUES (273, 3, 29, CAST(N'2013-04-08' AS Date), 10, CAST(N'00:00:00' AS Time))
INSERT [dbo].[Order] ([OrderId], [ProductId], [AgentId], [OrderDate], [ProductAmount], [OrderTime]) VALUES (274, 50, 51, CAST(N'2019-08-16' AS Date), 20, CAST(N'00:00:00' AS Time))
INSERT [dbo].[Order] ([OrderId], [ProductId], [AgentId], [OrderDate], [ProductAmount], [OrderTime]) VALUES (275, 46, 80, CAST(N'2011-12-26' AS Date), 5, CAST(N'00:00:00' AS Time))
INSERT [dbo].[Order] ([OrderId], [ProductId], [AgentId], [OrderDate], [ProductAmount], [OrderTime]) VALUES (276, 21, 25, CAST(N'2016-07-19' AS Date), 19, CAST(N'00:00:00' AS Time))
INSERT [dbo].[Order] ([OrderId], [ProductId], [AgentId], [OrderDate], [ProductAmount], [OrderTime]) VALUES (277, 44, 19, CAST(N'2014-03-17' AS Date), 1, CAST(N'00:00:00' AS Time))
INSERT [dbo].[Order] ([OrderId], [ProductId], [AgentId], [OrderDate], [ProductAmount], [OrderTime]) VALUES (278, 16, 12, CAST(N'2011-06-14' AS Date), 13, CAST(N'00:00:00' AS Time))
INSERT [dbo].[Order] ([OrderId], [ProductId], [AgentId], [OrderDate], [ProductAmount], [OrderTime]) VALUES (279, 29, 76, CAST(N'2017-05-20' AS Date), 13, CAST(N'00:00:00' AS Time))
INSERT [dbo].[Order] ([OrderId], [ProductId], [AgentId], [OrderDate], [ProductAmount], [OrderTime]) VALUES (280, 1, 53, CAST(N'2010-04-13' AS Date), 6, CAST(N'00:00:00' AS Time))
INSERT [dbo].[Order] ([OrderId], [ProductId], [AgentId], [OrderDate], [ProductAmount], [OrderTime]) VALUES (281, 1, 12, CAST(N'2019-10-15' AS Date), 9, CAST(N'00:00:00' AS Time))
INSERT [dbo].[Order] ([OrderId], [ProductId], [AgentId], [OrderDate], [ProductAmount], [OrderTime]) VALUES (282, 43, 48, CAST(N'2019-10-08' AS Date), 20, CAST(N'00:00:00' AS Time))
INSERT [dbo].[Order] ([OrderId], [ProductId], [AgentId], [OrderDate], [ProductAmount], [OrderTime]) VALUES (283, 21, 33, CAST(N'2018-04-08' AS Date), 8, CAST(N'00:00:00' AS Time))
INSERT [dbo].[Order] ([OrderId], [ProductId], [AgentId], [OrderDate], [ProductAmount], [OrderTime]) VALUES (284, 34, 30, CAST(N'2012-06-14' AS Date), 2, CAST(N'00:00:00' AS Time))
INSERT [dbo].[Order] ([OrderId], [ProductId], [AgentId], [OrderDate], [ProductAmount], [OrderTime]) VALUES (285, 28, 62, CAST(N'2012-04-23' AS Date), 3, CAST(N'00:00:00' AS Time))
INSERT [dbo].[Order] ([OrderId], [ProductId], [AgentId], [OrderDate], [ProductAmount], [OrderTime]) VALUES (286, 27, 61, CAST(N'2015-08-17' AS Date), 6, CAST(N'00:00:00' AS Time))
INSERT [dbo].[Order] ([OrderId], [ProductId], [AgentId], [OrderDate], [ProductAmount], [OrderTime]) VALUES (287, 29, 51, CAST(N'2016-09-14' AS Date), 7, CAST(N'00:00:00' AS Time))
INSERT [dbo].[Order] ([OrderId], [ProductId], [AgentId], [OrderDate], [ProductAmount], [OrderTime]) VALUES (288, 4, 6, CAST(N'2012-03-23' AS Date), 15, CAST(N'00:00:00' AS Time))
INSERT [dbo].[Order] ([OrderId], [ProductId], [AgentId], [OrderDate], [ProductAmount], [OrderTime]) VALUES (289, 38, 55, CAST(N'2010-11-17' AS Date), 5, CAST(N'00:00:00' AS Time))
INSERT [dbo].[Order] ([OrderId], [ProductId], [AgentId], [OrderDate], [ProductAmount], [OrderTime]) VALUES (290, 40, 37, CAST(N'2016-11-17' AS Date), 13, CAST(N'00:00:00' AS Time))
INSERT [dbo].[Order] ([OrderId], [ProductId], [AgentId], [OrderDate], [ProductAmount], [OrderTime]) VALUES (291, 44, 24, CAST(N'2010-05-03' AS Date), 19, CAST(N'00:00:00' AS Time))
INSERT [dbo].[Order] ([OrderId], [ProductId], [AgentId], [OrderDate], [ProductAmount], [OrderTime]) VALUES (292, 12, 15, CAST(N'2019-03-06' AS Date), 1, CAST(N'00:00:00' AS Time))
INSERT [dbo].[Order] ([OrderId], [ProductId], [AgentId], [OrderDate], [ProductAmount], [OrderTime]) VALUES (293, 24, 16, CAST(N'2017-10-14' AS Date), 20, CAST(N'00:00:00' AS Time))
INSERT [dbo].[Order] ([OrderId], [ProductId], [AgentId], [OrderDate], [ProductAmount], [OrderTime]) VALUES (294, 50, 80, CAST(N'2017-02-08' AS Date), 3, CAST(N'00:00:00' AS Time))
INSERT [dbo].[Order] ([OrderId], [ProductId], [AgentId], [OrderDate], [ProductAmount], [OrderTime]) VALUES (295, 13, 25, CAST(N'2017-08-02' AS Date), 3, CAST(N'00:00:00' AS Time))
INSERT [dbo].[Order] ([OrderId], [ProductId], [AgentId], [OrderDate], [ProductAmount], [OrderTime]) VALUES (296, 8, 82, CAST(N'2017-03-09' AS Date), 18, CAST(N'00:00:00' AS Time))
INSERT [dbo].[Order] ([OrderId], [ProductId], [AgentId], [OrderDate], [ProductAmount], [OrderTime]) VALUES (297, 39, 33, CAST(N'2017-11-13' AS Date), 18, CAST(N'00:00:00' AS Time))
INSERT [dbo].[Order] ([OrderId], [ProductId], [AgentId], [OrderDate], [ProductAmount], [OrderTime]) VALUES (298, 39, 30, CAST(N'2015-12-02' AS Date), 19, CAST(N'00:00:00' AS Time))
INSERT [dbo].[Order] ([OrderId], [ProductId], [AgentId], [OrderDate], [ProductAmount], [OrderTime]) VALUES (299, 9, 27, CAST(N'2011-06-14' AS Date), 19, CAST(N'00:00:00' AS Time))
GO
INSERT [dbo].[Order] ([OrderId], [ProductId], [AgentId], [OrderDate], [ProductAmount], [OrderTime]) VALUES (300, 1, 63, CAST(N'2014-08-14' AS Date), 16, CAST(N'00:00:00' AS Time))
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ProductId], [Name], [ProductTypeId], [Articul], [PeopleToDevelop], [WorkShop], [MinAgentPrice]) VALUES (1, N'Попрыгунчик детский красный 1289', 1, N'82925345', 4, 10, 1919)
INSERT [dbo].[Product] ([ProductId], [Name], [ProductTypeId], [Articul], [PeopleToDevelop], [WorkShop], [MinAgentPrice]) VALUES (2, N'Попрыгунчик детский желтый 6678', 2, N'80007300', 2, 1, 1768)
INSERT [dbo].[Product] ([ProductId], [Name], [ProductTypeId], [Articul], [PeopleToDevelop], [WorkShop], [MinAgentPrice]) VALUES (3, N'Попрыгунчик детский 6888', 1, N'13875235', 4, 12, 1972)
INSERT [dbo].[Product] ([ProductId], [Name], [ProductTypeId], [Articul], [PeopleToDevelop], [WorkShop], [MinAgentPrice]) VALUES (4, N'Попрыгунчик для мальчиков 3929', 1, N'2158097', 1, 9, 255)
INSERT [dbo].[Product] ([ProductId], [Name], [ProductTypeId], [Articul], [PeopleToDevelop], [WorkShop], [MinAgentPrice]) VALUES (5, N'Попрыгунчик детский 2071', 1, N'3157982', 3, 6, 275)
INSERT [dbo].[Product] ([ProductId], [Name], [ProductTypeId], [Articul], [PeopleToDevelop], [WorkShop], [MinAgentPrice]) VALUES (6, N'Попрыгунчик для собачек 5096', 3, N'67975083', 4, 9, 1465)
INSERT [dbo].[Product] ([ProductId], [Name], [ProductTypeId], [Articul], [PeopleToDevelop], [WorkShop], [MinAgentPrice]) VALUES (7, N'Попрыгунчик для мальчиков 5389', 3, N'70873532', 3, 2, 1739)
INSERT [dbo].[Product] ([ProductId], [Name], [ProductTypeId], [Articul], [PeopleToDevelop], [WorkShop], [MinAgentPrice]) VALUES (8, N'Попрыгунчик детский розовый 5376', 1, N'74291677', 4, 6, 1889)
INSERT [dbo].[Product] ([ProductId], [Name], [ProductTypeId], [Articul], [PeopleToDevelop], [WorkShop], [MinAgentPrice]) VALUES (9, N'Попрыгунчик для мальчиков 3307', 4, N'30269726', 4, 10, 1533)
INSERT [dbo].[Product] ([ProductId], [Name], [ProductTypeId], [Articul], [PeopleToDevelop], [WorkShop], [MinAgentPrice]) VALUES (10, N'Попрыгунчик для кошечек 2604', 1, N'11890154', 2, 7, 842)
INSERT [dbo].[Product] ([ProductId], [Name], [ProductTypeId], [Articul], [PeopleToDevelop], [WorkShop], [MinAgentPrice]) VALUES (11, N'Шар 6366', 3, N'25514523', 4, 4, 1932)
INSERT [dbo].[Product] ([ProductId], [Name], [ProductTypeId], [Articul], [PeopleToDevelop], [WorkShop], [MinAgentPrice]) VALUES (12, N'Попрыгунчик детский желтый 6051', 4, N'88211092', 4, 12, 727)
INSERT [dbo].[Product] ([ProductId], [Name], [ProductTypeId], [Articul], [PeopleToDevelop], [WorkShop], [MinAgentPrice]) VALUES (13, N'Попрыгунчик для девочек 2311', 3, N'25262035', 4, 1, 1308)
INSERT [dbo].[Product] ([ProductId], [Name], [ProductTypeId], [Articul], [PeopleToDevelop], [WorkShop], [MinAgentPrice]) VALUES (14, N'Попрыгунчик для собачек 4387', 5, N'89607276', 3, 8, 912)
INSERT [dbo].[Product] ([ProductId], [Name], [ProductTypeId], [Articul], [PeopleToDevelop], [WorkShop], [MinAgentPrice]) VALUES (15, N'Попрыгун 3016', 4, N'74919447', 1, 12, 615)
INSERT [dbo].[Product] ([ProductId], [Name], [ProductTypeId], [Articul], [PeopleToDevelop], [WorkShop], [MinAgentPrice]) VALUES (16, N'Попрыгунчик детский красный 3240', 2, N'88098604', 3, 8, 882)
INSERT [dbo].[Product] ([ProductId], [Name], [ProductTypeId], [Articul], [PeopleToDevelop], [WorkShop], [MinAgentPrice]) VALUES (17, N'Попрыгунчик детский розовый 1657', 1, N'86558177', 4, 3, 662)
INSERT [dbo].[Product] ([ProductId], [Name], [ProductTypeId], [Articul], [PeopleToDevelop], [WorkShop], [MinAgentPrice]) VALUES (18, N'Попрыгунчик детский красный 6591', 3, N'79704172', 5, 7, 592)
INSERT [dbo].[Product] ([ProductId], [Name], [ProductTypeId], [Articul], [PeopleToDevelop], [WorkShop], [MinAgentPrice]) VALUES (19, N'Попрыгунчик для девочек 1895', 4, N'54983244', 4, 4, 1586)
INSERT [dbo].[Product] ([ProductId], [Name], [ProductTypeId], [Articul], [PeopleToDevelop], [WorkShop], [MinAgentPrice]) VALUES (20, N'Попрыгунчик для кошечек 3741', 3, N'43987093', 5, 4, 1668)
INSERT [dbo].[Product] ([ProductId], [Name], [ProductTypeId], [Articul], [PeopleToDevelop], [WorkShop], [MinAgentPrice]) VALUES (21, N'Попрыгунчик детский красный 3839', 2, N'26655484', 5, 2, 1921)
INSERT [dbo].[Product] ([ProductId], [Name], [ProductTypeId], [Articul], [PeopleToDevelop], [WorkShop], [MinAgentPrice]) VALUES (22, N'Попрыгунчик детский красный 4969', 1, N'10614909', 5, 12, 913)
INSERT [dbo].[Product] ([ProductId], [Name], [ProductTypeId], [Articul], [PeopleToDevelop], [WorkShop], [MinAgentPrice]) VALUES (23, N'Попрыгунчик для собачек 5754', 4, N'79018408', 2, 8, 633)
INSERT [dbo].[Product] ([ProductId], [Name], [ProductTypeId], [Articul], [PeopleToDevelop], [WorkShop], [MinAgentPrice]) VALUES (24, N'Попрыгунчик для собачек 4485', 3, N'33440129', 2, 12, 1995)
INSERT [dbo].[Product] ([ProductId], [Name], [ProductTypeId], [Articul], [PeopleToDevelop], [WorkShop], [MinAgentPrice]) VALUES (25, N'Попрыгунчик для девочек 1656', 4, N'22217580', 5, 6, 1494)
INSERT [dbo].[Product] ([ProductId], [Name], [ProductTypeId], [Articul], [PeopleToDevelop], [WorkShop], [MinAgentPrice]) VALUES (26, N'Попрыгунчик для мальчиков 4791', 2, N'45540528', 3, 11, 1260)
INSERT [dbo].[Product] ([ProductId], [Name], [ProductTypeId], [Articul], [PeopleToDevelop], [WorkShop], [MinAgentPrice]) VALUES (27, N'Попрыгунчик для девочек 6849', 3, N'10084400', 1, 11, 933)
INSERT [dbo].[Product] ([ProductId], [Name], [ProductTypeId], [Articul], [PeopleToDevelop], [WorkShop], [MinAgentPrice]) VALUES (28, N'Попрыгунчик детский желтый 1371', 4, N'85514178', 3, 7, 252)
INSERT [dbo].[Product] ([ProductId], [Name], [ProductTypeId], [Articul], [PeopleToDevelop], [WorkShop], [MinAgentPrice]) VALUES (29, N'Попрыгунчик для девочек 3389', 3, N'26434211', 3, 10, 597)
INSERT [dbo].[Product] ([ProductId], [Name], [ProductTypeId], [Articul], [PeopleToDevelop], [WorkShop], [MinAgentPrice]) VALUES (30, N'Попрыгунчик детский розовый 5197', 4, N'89612317', 1, 3, 1948)
INSERT [dbo].[Product] ([ProductId], [Name], [ProductTypeId], [Articul], [PeopleToDevelop], [WorkShop], [MinAgentPrice]) VALUES (31, N'Попрыгунчик для собачек 3500', 2, N'79994924', 2, 9, 1142)
INSERT [dbo].[Product] ([ProductId], [Name], [ProductTypeId], [Articul], [PeopleToDevelop], [WorkShop], [MinAgentPrice]) VALUES (32, N'Попрыгун 6882', 5, N'12732041', 1, 6, 809)
INSERT [dbo].[Product] ([ProductId], [Name], [ProductTypeId], [Articul], [PeopleToDevelop], [WorkShop], [MinAgentPrice]) VALUES (33, N'Попрыгунчик для кошечек 4740', 5, N'80698285', 1, 6, 1973)
INSERT [dbo].[Product] ([ProductId], [Name], [ProductTypeId], [Articul], [PeopleToDevelop], [WorkShop], [MinAgentPrice]) VALUES (34, N'Шар 2243', 3, N'42536654', 3, 12, 1247)
INSERT [dbo].[Product] ([ProductId], [Name], [ProductTypeId], [Articul], [PeopleToDevelop], [WorkShop], [MinAgentPrice]) VALUES (35, N'Попрыгунчик детский красный 1740', 3, N'43330133', 5, 3, 1749)
INSERT [dbo].[Product] ([ProductId], [Name], [ProductTypeId], [Articul], [PeopleToDevelop], [WorkShop], [MinAgentPrice]) VALUES (36, N'Попрыгунчик детский красный 5400', 3, N'68237918', 4, 5, 1570)
INSERT [dbo].[Product] ([ProductId], [Name], [ProductTypeId], [Articul], [PeopleToDevelop], [WorkShop], [MinAgentPrice]) VALUES (37, N'Попрыгунчик для девочек 1560', 1, N'47378395', 5, 6, 235)
INSERT [dbo].[Product] ([ProductId], [Name], [ProductTypeId], [Articul], [PeopleToDevelop], [WorkShop], [MinAgentPrice]) VALUES (38, N'Шар 4124', 4, N'39025230', 5, 8, 1160)
INSERT [dbo].[Product] ([ProductId], [Name], [ProductTypeId], [Articul], [PeopleToDevelop], [WorkShop], [MinAgentPrice]) VALUES (39, N'Попрыгунчик детский желтый 2582', 3, N'32125209', 3, 11, 1730)
INSERT [dbo].[Product] ([ProductId], [Name], [ProductTypeId], [Articul], [PeopleToDevelop], [WorkShop], [MinAgentPrice]) VALUES (40, N'Попрыгунчик детский 6029', 2, N'69184347', 3, 7, 419)
INSERT [dbo].[Product] ([ProductId], [Name], [ProductTypeId], [Articul], [PeopleToDevelop], [WorkShop], [MinAgentPrice]) VALUES (41, N'Попрыгун 2299', 3, N'34750945', 2, 2, 1688)
INSERT [dbo].[Product] ([ProductId], [Name], [ProductTypeId], [Articul], [PeopleToDevelop], [WorkShop], [MinAgentPrice]) VALUES (42, N'Попрыгунчик детский красный 1972', 2, N'59509797', 1, 7, 794)
INSERT [dbo].[Product] ([ProductId], [Name], [ProductTypeId], [Articul], [PeopleToDevelop], [WorkShop], [MinAgentPrice]) VALUES (43, N'Попрыгунчик детский 5117', 2, N'80875656', 3, 12, 338)
INSERT [dbo].[Product] ([ProductId], [Name], [ProductTypeId], [Articul], [PeopleToDevelop], [WorkShop], [MinAgentPrice]) VALUES (44, N'Попрыгунчик детский розовый 5501', 3, N'25409940', 2, 7, 652)
INSERT [dbo].[Product] ([ProductId], [Name], [ProductTypeId], [Articul], [PeopleToDevelop], [WorkShop], [MinAgentPrice]) VALUES (45, N'Попрыгунчик детский розовый 6346', 4, N'30282346', 1, 10, 1024)
INSERT [dbo].[Product] ([ProductId], [Name], [ProductTypeId], [Articul], [PeopleToDevelop], [WorkShop], [MinAgentPrice]) VALUES (46, N'Попрыгун 6412', 2, N'28152672', 2, 9, 523)
INSERT [dbo].[Product] ([ProductId], [Name], [ProductTypeId], [Articul], [PeopleToDevelop], [WorkShop], [MinAgentPrice]) VALUES (47, N'Попрыгунчик детский 1916', 3, N'73345857', 5, 8, 832)
INSERT [dbo].[Product] ([ProductId], [Name], [ProductTypeId], [Articul], [PeopleToDevelop], [WorkShop], [MinAgentPrice]) VALUES (48, N'Попрыгунчик для собачек 4529', 2, N'81713527', 3, 6, 1923)
INSERT [dbo].[Product] ([ProductId], [Name], [ProductTypeId], [Articul], [PeopleToDevelop], [WorkShop], [MinAgentPrice]) VALUES (49, N'Попрыгунчик для собачек 4381', 4, N'27301447', 2, 5, 1234)
INSERT [dbo].[Product] ([ProductId], [Name], [ProductTypeId], [Articul], [PeopleToDevelop], [WorkShop], [MinAgentPrice]) VALUES (50, N'Попрыгунчик детский розовый 2694', 2, N'13340356', 4, 6, 1691)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductType] ON 

INSERT [dbo].[ProductType] ([ProductTypeId], [Name], [Coef]) VALUES (1, N'Для маленьких деток', 1)
INSERT [dbo].[ProductType] ([ProductTypeId], [Name], [Coef]) VALUES (2, N'Для больших деток', 1)
INSERT [dbo].[ProductType] ([ProductTypeId], [Name], [Coef]) VALUES (3, N'Взрослый', 1)
INSERT [dbo].[ProductType] ([ProductTypeId], [Name], [Coef]) VALUES (4, N'Цифровой', 1)
INSERT [dbo].[ProductType] ([ProductTypeId], [Name], [Coef]) VALUES (5, N'Упругий', 1)
SET IDENTITY_INSERT [dbo].[ProductType] OFF
GO
ALTER TABLE [dbo].[Agent] ADD  CONSTRAINT [DF_Agent_OrderAmount]  DEFAULT ((0)) FOR [OrderAmount]
GO
ALTER TABLE [dbo].[Agent] ADD  CONSTRAINT [DF_Agent_OrderSumm]  DEFAULT ((0)) FOR [OrderSumm]
GO
ALTER TABLE [dbo].[ProductType] ADD  CONSTRAINT [DF_ProductType_Coef]  DEFAULT ((1)) FOR [Coef]
GO
ALTER TABLE [dbo].[Agent]  WITH CHECK ADD  CONSTRAINT [FK_Agent_AgentType] FOREIGN KEY([AgentTypeId])
REFERENCES [dbo].[AgentType] ([AgentTypeId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Agent] CHECK CONSTRAINT [FK_Agent_AgentType]
GO
ALTER TABLE [dbo].[Material]  WITH CHECK ADD  CONSTRAINT [FK_Material_MaterialType] FOREIGN KEY([MaterialTypeId])
REFERENCES [dbo].[MaterialType] ([MaterialTypeId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Material] CHECK CONSTRAINT [FK_Material_MaterialType]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Agent] FOREIGN KEY([AgentId])
REFERENCES [dbo].[Agent] ([AgentId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Agent]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Product]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_ProductType] FOREIGN KEY([ProductTypeId])
REFERENCES [dbo].[ProductType] ([ProductTypeId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_ProductType]
GO
ALTER TABLE [dbo].[ProductMaterial]  WITH CHECK ADD  CONSTRAINT [FK_ProductMaterial_Material] FOREIGN KEY([MaterialId])
REFERENCES [dbo].[Material] ([MaterialId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductMaterial] CHECK CONSTRAINT [FK_ProductMaterial_Material]
GO
ALTER TABLE [dbo].[ProductMaterial]  WITH CHECK ADD  CONSTRAINT [FK_ProductMaterial_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductMaterial] CHECK CONSTRAINT [FK_ProductMaterial_Product]
GO
/****** Object:  Trigger [dbo].[AgentAddOrder]    Script Date: 05.04.2022 18:20:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create trigger [dbo].[AgentAddOrder] on [dbo].[Order] 
after insert as 
begin
update Agent set Agent.OrderAmount = Agent.OrderAmount+1
where Agent.AgentId = (select AgentId from inserted);
update Agent set Agent.OrderSumm = Agent.OrderSumm + 
(select MinAgentPrice from inserted join Product on Product.ProductId = inserted.ProductId)
where Agent.AgentId = (select AgentId from inserted);
end
GO
ALTER TABLE [dbo].[Order] ENABLE TRIGGER [AgentAddOrder]
GO
USE [master]
GO
ALTER DATABASE [Jumper] SET  READ_WRITE 
GO
