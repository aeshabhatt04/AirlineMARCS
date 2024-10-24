USE [AirlinesMARCS]
GO
/****** Object:  Table [dbo].[Airline]    Script Date: 2024-10-21 12:56:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Airline](
	[AirlineId] [varchar](10) NOT NULL,
	[PetFlag] [bit] NOT NULL,
	[FlightId] [varchar](20) NOT NULL,
	[MealFlag] [bit] NOT NULL,
	[AirlineName] [varchar](20) NOT NULL,
	[BaggageAllowance] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AirlineId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AirlineTransaction]    Script Date: 2024-10-21 12:56:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AirlineTransaction](
	[ReferenceId] [varchar](100) NOT NULL,
	[TransactionTimestamp] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ReferenceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Airport]    Script Date: 2024-10-21 12:56:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Airport](
	[AirportId] [int] NOT NULL,
	[AirportCode] [varchar](10) NOT NULL,
	[FlightId] [varchar](20) NOT NULL,
	[AirportCity] [varchar](50) NOT NULL,
	[Province] [varchar](100) NOT NULL,
	[Country] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AirportId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Flight]    Script Date: 2024-10-21 12:56:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Flight](
	[FlightId] [varchar](20) NOT NULL,
	[DepartureCity] [varchar](50) NOT NULL,
	[ArrivalCity] [varchar](50) NOT NULL,
	[DepartureDate] [date] NOT NULL,
	[ArrivalDate] [date] NOT NULL,
	[DepartureTime] [time](7) NULL,
	[ArrivalTime] [time](7) NULL,
	[DepartureProvince] [varchar](100) NOT NULL,
	[ArrivalProvince] [varchar](100) NOT NULL,
	[FlightDuration] [time](7) NOT NULL,
 CONSTRAINT [PK__Flight__8A9E14EE408979E8] PRIMARY KEY CLUSTERED 
(
	[FlightId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Meal]    Script Date: 2024-10-21 12:56:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Meal](
	[MealId] [int] NOT NULL,
	[MealCategory] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MealId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PassengerRecord]    Script Date: 2024-10-21 12:56:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PassengerRecord](
	[UserId] [nvarchar](50) NOT NULL,
	[DepartureDate] [date] NOT NULL,
	[DepartureCity] [varchar](50) NOT NULL,
	[ArrivalCity] [varchar](50) NOT NULL,
	[Budget] [float] NULL,
	[PetFlag] [bit] NOT NULL,
	[NumberOfPet] [int] NULL,
	[WeightOfPet] [float] NULL,
	[MealId] [int] NOT NULL,
	[FlightId] [varchar](20) NULL,
	[ClassOfService] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Registration]    Script Date: 2024-10-21 12:56:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Registration](
	[UserId] [nvarchar](50) NOT NULL,
	[UserPassword] [nvarchar](20) NOT NULL,
	[UserName] [nvarchar](100) NOT NULL,
	[DateOfBirth] [date] NOT NULL,
	[ContactNumber] [varchar](15) NOT NULL,
	[EmailID] [varchar](60) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Report]    Script Date: 2024-10-21 12:56:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Report](
	[ReportId] [int] IDENTITY(1,1) NOT NULL,
	[NumberOfSearch] [int] NOT NULL,
	[NumberOfFlight] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ReportId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reviews]    Script Date: 2024-10-21 12:56:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reviews](
	[ReviewId] [int] NOT NULL,
	[FlightId] [varchar](20) NOT NULL,
	[Review] [nvarchar](max) NULL,
	[Rating] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ReviewId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[Airline] ([AirlineId], [PetFlag], [FlightId], [MealFlag], [AirlineName], [BaggageAllowance]) VALUES (N'AC', 1, N'AC8098', 1, N'Air Canada', 20)
INSERT [dbo].[Airline] ([AirlineId], [PetFlag], [FlightId], [MealFlag], [AirlineName], [BaggageAllowance]) VALUES (N'DEL', 0, N'DEL7812', 0, N'Delta', 15)
INSERT [dbo].[Airline] ([AirlineId], [PetFlag], [FlightId], [MealFlag], [AirlineName], [BaggageAllowance]) VALUES (N'EM', 0, N'EM7812', 1, N'Emirates', 20)
INSERT [dbo].[Airline] ([AirlineId], [PetFlag], [FlightId], [MealFlag], [AirlineName], [BaggageAllowance]) VALUES (N'ET', 1, N'ET8142', 0, N'Ethiopian', 26)
GO
INSERT [dbo].[Airport] ([AirportId], [AirportCode], [FlightId], [AirportCity], [Province], [Country]) VALUES (1, N'ABC', N'AC8098', N'Edmonton', N'Alberta', N'Canada')
INSERT [dbo].[Airport] ([AirportId], [AirportCode], [FlightId], [AirportCity], [Province], [Country]) VALUES (2, N'QWE', N'AC8099', N'Waterloo', N'Ontario', N'Canada')
INSERT [dbo].[Airport] ([AirportId], [AirportCode], [FlightId], [AirportCity], [Province], [Country]) VALUES (3, N'YYZ', N'EM7812', N'Toronto', N'Ontario', N'Canada')
GO
INSERT [dbo].[Flight] ([FlightId], [DepartureCity], [ArrivalCity], [DepartureDate], [ArrivalDate], [DepartureTime], [ArrivalTime], [DepartureProvince], [ArrivalProvince], [FlightDuration]) VALUES (N'AC8098', N'Edmonton', N'Calgary', CAST(N'2022-12-12' AS Date), CAST(N'2022-12-12' AS Date), CAST(N'17:00:00' AS Time), CAST(N'21:30:00' AS Time), N'Alberta', N'Alberta', CAST(N'04:30:00' AS Time))
INSERT [dbo].[Flight] ([FlightId], [DepartureCity], [ArrivalCity], [DepartureDate], [ArrivalDate], [DepartureTime], [ArrivalTime], [DepartureProvince], [ArrivalProvince], [FlightDuration]) VALUES (N'AC8099', N'Waterloo', N'Toronto', CAST(N'2022-11-12' AS Date), CAST(N'2022-12-01' AS Date), CAST(N'10:00:00' AS Time), CAST(N'12:00:00' AS Time), N'Ontario', N'Ontario', CAST(N'02:00:00' AS Time))
INSERT [dbo].[Flight] ([FlightId], [DepartureCity], [ArrivalCity], [DepartureDate], [ArrivalDate], [DepartureTime], [ArrivalTime], [DepartureProvince], [ArrivalProvince], [FlightDuration]) VALUES (N'AT', N'London', N'Windsor', CAST(N'2022-06-12' AS Date), CAST(N'2022-06-12' AS Date), CAST(N'12:00:00' AS Time), CAST(N'02:44:00' AS Time), N'Ontario', N'Ontario', CAST(N'02:44:00' AS Time))
INSERT [dbo].[Flight] ([FlightId], [DepartureCity], [ArrivalCity], [DepartureDate], [ArrivalDate], [DepartureTime], [ArrivalTime], [DepartureProvince], [ArrivalProvince], [FlightDuration]) VALUES (N'DEL7812', N'Toronto', N'Edmonton', CAST(N'2022-12-29' AS Date), CAST(N'2022-12-29' AS Date), CAST(N'08:35:00' AS Time), CAST(N'09:38:00' AS Time), N'Ontario', N'Ontario', CAST(N'01:38:00' AS Time))
INSERT [dbo].[Flight] ([FlightId], [DepartureCity], [ArrivalCity], [DepartureDate], [ArrivalDate], [DepartureTime], [ArrivalTime], [DepartureProvince], [ArrivalProvince], [FlightDuration]) VALUES (N'EM7812', N'Toronto', N'Brampton', CAST(N'2022-12-01' AS Date), CAST(N'2022-12-01' AS Date), CAST(N'08:00:00' AS Time), CAST(N'10:00:00' AS Time), N'Ontario', N'Ontario', CAST(N'02:00:00' AS Time))
INSERT [dbo].[Flight] ([FlightId], [DepartureCity], [ArrivalCity], [DepartureDate], [ArrivalDate], [DepartureTime], [ArrivalTime], [DepartureProvince], [ArrivalProvince], [FlightDuration]) VALUES (N'ET8142', N'Calgary', N'Thunder Bay', CAST(N'2022-11-17' AS Date), CAST(N'2022-11-17' AS Date), CAST(N'08:55:00' AS Time), CAST(N'01:33:00' AS Time), N'Ontario', N'Ontario', CAST(N'05:30:00' AS Time))
INSERT [dbo].[Flight] ([FlightId], [DepartureCity], [ArrivalCity], [DepartureDate], [ArrivalDate], [DepartureTime], [ArrivalTime], [DepartureProvince], [ArrivalProvince], [FlightDuration]) VALUES (N'PA', N'Ottawa', N'Thunder Bay', CAST(N'2022-09-17' AS Date), CAST(N'2022-09-17' AS Date), CAST(N'08:45:00' AS Time), CAST(N'01:33:00' AS Time), N'Ontario', N'Ontario', CAST(N'04:48:00' AS Time))
INSERT [dbo].[Flight] ([FlightId], [DepartureCity], [ArrivalCity], [DepartureDate], [ArrivalDate], [DepartureTime], [ArrivalTime], [DepartureProvince], [ArrivalProvince], [FlightDuration]) VALUES (N'WJ', N'Toronto', N'Windsor', CAST(N'2022-12-19' AS Date), CAST(N'2022-12-19' AS Date), CAST(N'06:35:00' AS Time), CAST(N'07:38:00' AS Time), N'Ontario', N'Ontario', CAST(N'01:03:00' AS Time))
GO
INSERT [dbo].[Meal] ([MealId], [MealCategory]) VALUES (1, N'Vegetarian')
INSERT [dbo].[Meal] ([MealId], [MealCategory]) VALUES (2, N'Non-Vegetarian')
INSERT [dbo].[Meal] ([MealId], [MealCategory]) VALUES (3, N'Vegan')
INSERT [dbo].[Meal] ([MealId], [MealCategory]) VALUES (4, N'No Meal')
GO
INSERT [dbo].[PassengerRecord] ([UserId], [DepartureDate], [DepartureCity], [ArrivalCity], [Budget], [PetFlag], [NumberOfPet], [WeightOfPet], [MealId], [FlightId], [ClassOfService]) VALUES (N'sagar.ao!', CAST(N'2022-01-01' AS Date), N'eee', N'rrr', 2000, 1, 2, 2.2, 1, N'AC8098', NULL)
INSERT [dbo].[PassengerRecord] ([UserId], [DepartureDate], [DepartureCity], [ArrivalCity], [Budget], [PetFlag], [NumberOfPet], [WeightOfPet], [MealId], [FlightId], [ClassOfService]) VALUES (N'sagar.ao!', CAST(N'2022-11-11' AS Date), N'toronto', N'windsor', 2000, 1, 2, 1.5, 1, N'AC8099', NULL)
INSERT [dbo].[PassengerRecord] ([UserId], [DepartureDate], [DepartureCity], [ArrivalCity], [Budget], [PetFlag], [NumberOfPet], [WeightOfPet], [MealId], [FlightId], [ClassOfService]) VALUES (N'rakshini.v02', CAST(N'2022-04-04' AS Date), N'waterloo', N'toronto', 2000, 0, 0, 0, 1, N'AC8098', NULL)
INSERT [dbo].[PassengerRecord] ([UserId], [DepartureDate], [DepartureCity], [ArrivalCity], [Budget], [PetFlag], [NumberOfPet], [WeightOfPet], [MealId], [FlightId], [ClassOfService]) VALUES (N'sample', CAST(N'2022-02-02' AS Date), N'waterloo', N'toronto', 2000, 1, 2, 1.5, 1, N'AC8098', NULL)
INSERT [dbo].[PassengerRecord] ([UserId], [DepartureDate], [DepartureCity], [ArrivalCity], [Budget], [PetFlag], [NumberOfPet], [WeightOfPet], [MealId], [FlightId], [ClassOfService]) VALUES (N'aesha', CAST(N'2022-12-12' AS Date), N'Waterloo', N'toronto', 5000, 1, 1, 3.5, 1, N'AC8098', NULL)
INSERT [dbo].[PassengerRecord] ([UserId], [DepartureDate], [DepartureCity], [ArrivalCity], [Budget], [PetFlag], [NumberOfPet], [WeightOfPet], [MealId], [FlightId], [ClassOfService]) VALUES (N'test', CAST(N'2022-12-12' AS Date), N'Waterloo', N'calgary', 2000, 0, 0, 0, 4, N'AC8098', NULL)
INSERT [dbo].[PassengerRecord] ([UserId], [DepartureDate], [DepartureCity], [ArrivalCity], [Budget], [PetFlag], [NumberOfPet], [WeightOfPet], [MealId], [FlightId], [ClassOfService]) VALUES (N'love', CAST(N'2022-12-12' AS Date), N'Calgary', N'Windsor', 2000, 1, 1, 5.5, 2, N'AC8098', NULL)
INSERT [dbo].[PassengerRecord] ([UserId], [DepartureDate], [DepartureCity], [ArrivalCity], [Budget], [PetFlag], [NumberOfPet], [WeightOfPet], [MealId], [FlightId], [ClassOfService]) VALUES (N'sample', CAST(N'2022-12-12' AS Date), N'toronto', N'windsor', 5000, 0, 0, 0, 1, N'AC8098', NULL)
INSERT [dbo].[PassengerRecord] ([UserId], [DepartureDate], [DepartureCity], [ArrivalCity], [Budget], [PetFlag], [NumberOfPet], [WeightOfPet], [MealId], [FlightId], [ClassOfService]) VALUES (N'sample', CAST(N'2022-12-02' AS Date), N'toronto', N'windsor', 4000, 1, 1, 50, 1, N'AC8098', N'22')
INSERT [dbo].[PassengerRecord] ([UserId], [DepartureDate], [DepartureCity], [ArrivalCity], [Budget], [PetFlag], [NumberOfPet], [WeightOfPet], [MealId], [FlightId], [ClassOfService]) VALUES (N'aesha.bhatt04', CAST(N'2022-12-05' AS Date), N'Calgary', N'Toronto', 4000, 1, 12, 12, 1, N'AC8098', N'Business')
INSERT [dbo].[PassengerRecord] ([UserId], [DepartureDate], [DepartureCity], [ArrivalCity], [Budget], [PetFlag], [NumberOfPet], [WeightOfPet], [MealId], [FlightId], [ClassOfService]) VALUES (N'aesha.bhatt04', CAST(N'2022-12-12' AS Date), N'toronto', N'calgary', 5000, 0, 0, 0, 1, N'AC8098', N'Business')
INSERT [dbo].[PassengerRecord] ([UserId], [DepartureDate], [DepartureCity], [ArrivalCity], [Budget], [PetFlag], [NumberOfPet], [WeightOfPet], [MealId], [FlightId], [ClassOfService]) VALUES (N'test1', CAST(N'2022-12-12' AS Date), N'Edmonton', N'Calgary', 10000, 1, 1, 20, 4, N'AC8098', N'22')
INSERT [dbo].[PassengerRecord] ([UserId], [DepartureDate], [DepartureCity], [ArrivalCity], [Budget], [PetFlag], [NumberOfPet], [WeightOfPet], [MealId], [FlightId], [ClassOfService]) VALUES (N'test1', CAST(N'2022-12-12' AS Date), N'Edmonton', N'calgary', 20000, 1, 1, 20, 1, N'AC8098', N'Business')
INSERT [dbo].[PassengerRecord] ([UserId], [DepartureDate], [DepartureCity], [ArrivalCity], [Budget], [PetFlag], [NumberOfPet], [WeightOfPet], [MealId], [FlightId], [ClassOfService]) VALUES (N'sample', CAST(N'2022-12-05' AS Date), N'toronto', N'windsor', 4000, 1, 1, 12, 1, N'AC8098', N'Business')
INSERT [dbo].[PassengerRecord] ([UserId], [DepartureDate], [DepartureCity], [ArrivalCity], [Budget], [PetFlag], [NumberOfPet], [WeightOfPet], [MealId], [FlightId], [ClassOfService]) VALUES (N'test1', CAST(N'2022-12-12' AS Date), N'Edmonton', N'Calgary', 40000, 1, 12, 12, 1, N'AC8098', N'First')
INSERT [dbo].[PassengerRecord] ([UserId], [DepartureDate], [DepartureCity], [ArrivalCity], [Budget], [PetFlag], [NumberOfPet], [WeightOfPet], [MealId], [FlightId], [ClassOfService]) VALUES (N'meghna12', CAST(N'2022-12-12' AS Date), N'Edmonton', N'Calgary', 4000, 1, 1, 15, 4, N'AC8098', N'Business')
INSERT [dbo].[PassengerRecord] ([UserId], [DepartureDate], [DepartureCity], [ArrivalCity], [Budget], [PetFlag], [NumberOfPet], [WeightOfPet], [MealId], [FlightId], [ClassOfService]) VALUES (N'meghna12', CAST(N'2022-12-12' AS Date), N'edmonton', N'calgary', 40000, 1, 1, 20, 4, N'AC8098', N'Business')
INSERT [dbo].[PassengerRecord] ([UserId], [DepartureDate], [DepartureCity], [ArrivalCity], [Budget], [PetFlag], [NumberOfPet], [WeightOfPet], [MealId], [FlightId], [ClassOfService]) VALUES (N'ash', CAST(N'2022-12-12' AS Date), N'Edmonton', N'Calgary', 4000, 1, 1, 20, 4, N'AC8098', N'Business')
INSERT [dbo].[PassengerRecord] ([UserId], [DepartureDate], [DepartureCity], [ArrivalCity], [Budget], [PetFlag], [NumberOfPet], [WeightOfPet], [MealId], [FlightId], [ClassOfService]) VALUES (N'ash', CAST(N'2022-12-12' AS Date), N'edmonton', N'calgary', 20000, 1, 1, 12, 1, N'AC8098', N'Business')
INSERT [dbo].[PassengerRecord] ([UserId], [DepartureDate], [DepartureCity], [ArrivalCity], [Budget], [PetFlag], [NumberOfPet], [WeightOfPet], [MealId], [FlightId], [ClassOfService]) VALUES (N'jomis', CAST(N'2022-12-12' AS Date), N'Edmonton', N'Calgary', 4000, 1, 1, 12, 1, N'AC8098', N'Business')
GO
INSERT [dbo].[Registration] ([UserId], [UserPassword], [UserName], [DateOfBirth], [ContactNumber], [EmailID]) VALUES (N'aesha', N'aesha', N'Aeshu', CAST(N'2000-08-04' AS Date), N'2256543538', N'aesha@gmail.com')
INSERT [dbo].[Registration] ([UserId], [UserPassword], [UserName], [DateOfBirth], [ContactNumber], [EmailID]) VALUES (N'aesha.bhatt04', N'abcd#1234', N'Aesha Bhatt', CAST(N'2000-08-04' AS Date), N'1234567891', N'Abhatt6732@conestogac.on.ca')
INSERT [dbo].[Registration] ([UserId], [UserPassword], [UserName], [DateOfBirth], [ContactNumber], [EmailID]) VALUES (N'ash', N'ash', N'Aesha Bhatt', CAST(N'2000-08-04' AS Date), N'9685325412', N'ash@gmail.com')
INSERT [dbo].[Registration] ([UserId], [UserPassword], [UserName], [DateOfBirth], [ContactNumber], [EmailID]) VALUES (N'Chiddima.Nwe', N'asdfghjkl', N'Christina Ndubuisi Nweke', CAST(N'1993-05-13' AS Date), N'5728449555', N'ChiddimaChris@conestogac.on.ca')
INSERT [dbo].[Registration] ([UserId], [UserPassword], [UserName], [DateOfBirth], [ContactNumber], [EmailID]) VALUES (N'Jomis', N'Jomis', N'Jomis John', CAST(N'1999-05-05' AS Date), N'6854785236', N'jomis@gmail.com')
INSERT [dbo].[Registration] ([UserId], [UserPassword], [UserName], [DateOfBirth], [ContactNumber], [EmailID]) VALUES (N'love', N'love', N'Love', CAST(N'2000-10-13' AS Date), N'8879864567', N'love@gmail.com')
INSERT [dbo].[Registration] ([UserId], [UserPassword], [UserName], [DateOfBirth], [ContactNumber], [EmailID]) VALUES (N'Meghbhatia21', N'poiuytrewq', N'Meghna Bhatia', CAST(N'1998-08-22' AS Date), N'6675444398', N'Meghbhatia@conestogac.on.ca')
INSERT [dbo].[Registration] ([UserId], [UserPassword], [UserName], [DateOfBirth], [ContactNumber], [EmailID]) VALUES (N'Meghna12', N'meghna12', N'Meghna Bhatia', CAST(N'2000-12-19' AS Date), N'9865985632', N'meghubhatia@gmail.com')
INSERT [dbo].[Registration] ([UserId], [UserPassword], [UserName], [DateOfBirth], [ContactNumber], [EmailID]) VALUES (N'rakshini.v02', N'qwerty', N'Rakshini Vallinayagam', CAST(N'2001-04-04' AS Date), N'5263415263', N'Raksh02@conestogac.on.ca')
INSERT [dbo].[Registration] ([UserId], [UserPassword], [UserName], [DateOfBirth], [ContactNumber], [EmailID]) VALUES (N'sagar.ao!', N'zxcvbnm', N'Sagar Arora', CAST(N'1990-08-02' AS Date), N'5263444555', N'Sagar02@conestogac.on.ca')
INSERT [dbo].[Registration] ([UserId], [UserPassword], [UserName], [DateOfBirth], [ContactNumber], [EmailID]) VALUES (N'sample', N'sample', N'Sample Name', CAST(N'1998-09-09' AS Date), N'2266576633', N'sample@gmail.com')
INSERT [dbo].[Registration] ([UserId], [UserPassword], [UserName], [DateOfBirth], [ContactNumber], [EmailID]) VALUES (N'test', N'test', N'test', CAST(N'2000-12-13' AS Date), N'9987654324', N'test@gmail.com')
INSERT [dbo].[Registration] ([UserId], [UserPassword], [UserName], [DateOfBirth], [ContactNumber], [EmailID]) VALUES (N'test1', N'test1', N'Aesha', CAST(N'2000-05-05' AS Date), N'8000015890', N'test1@gmail.com')
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Registra__7ED91AEE28308129]    Script Date: 2024-10-21 12:56:27 PM ******/
ALTER TABLE [dbo].[Registration] ADD UNIQUE NONCLUSTERED 
(
	[EmailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Airline]  WITH CHECK ADD  CONSTRAINT [FK__Airline__FlightI__4CA06362] FOREIGN KEY([FlightId])
REFERENCES [dbo].[Flight] ([FlightId])
GO
ALTER TABLE [dbo].[Airline] CHECK CONSTRAINT [FK__Airline__FlightI__4CA06362]
GO
ALTER TABLE [dbo].[Airport]  WITH CHECK ADD  CONSTRAINT [FK__Airport__FlightI__2C3393D0] FOREIGN KEY([FlightId])
REFERENCES [dbo].[Flight] ([FlightId])
GO
ALTER TABLE [dbo].[Airport] CHECK CONSTRAINT [FK__Airport__FlightI__2C3393D0]
GO
ALTER TABLE [dbo].[PassengerRecord]  WITH CHECK ADD FOREIGN KEY([FlightId])
REFERENCES [dbo].[Flight] ([FlightId])
GO
ALTER TABLE [dbo].[PassengerRecord]  WITH CHECK ADD FOREIGN KEY([MealId])
REFERENCES [dbo].[Meal] ([MealId])
GO
ALTER TABLE [dbo].[PassengerRecord]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[Registration] ([UserId])
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD FOREIGN KEY([FlightId])
REFERENCES [dbo].[Flight] ([FlightId])
GO
