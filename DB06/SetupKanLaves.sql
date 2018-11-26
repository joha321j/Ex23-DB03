USE B_DB14_2018
GO

CREATE TABLE [exercise_customer](
	[customerid] [int] NOT NULL,
	[cprnr] [nvarchar](10) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[address] [nvarchar](50) NOT NULL,
	[postcode] [int] NOT NULL,
 CONSTRAINT [PK_exercise_customer] PRIMARY KEY CLUSTERED 
(
	[customerid] ASC
) ON [PRIMARY]
) ON [PRIMARY]

CREATE TABLE [exercise_postcode](
	[postcode] [int] NOT NULL,
	[city] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_exercise_postcode] PRIMARY KEY CLUSTERED 
(
	[postcode] ASC
) ON [PRIMARY]
) ON [PRIMARY]


CREATE TABLE [exercise_order](
	[orderid] [int] NOT NULL,
	[customerid] [int] NOT NULL,
	[orderdate] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_exercise_order] PRIMARY KEY CLUSTERED 
(
	[orderid] ASC
) ON [PRIMARY]
) ON [PRIMARY]

CREATE TABLE [exercise_orderline](
	[orderid] [int] NOT NULL,
	[lineid] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[productid] [int] NOT NULL,
 CONSTRAINT [PK_exercise_orderline] PRIMARY KEY CLUSTERED 
(
	[orderid] ASC,
	[lineid] ASC
) ON [PRIMARY]
) ON [PRIMARY]

CREATE TABLE [exercise_product](
	[productid] [int] NOT NULL,
	[name] [nvarchar](40) NOT NULL,
	[price] [int] NOT NULL,
 CONSTRAINT [PK_exercise_product] PRIMARY KEY CLUSTERED 
(
	[productid] ASC
) ON [PRIMARY]
) ON [PRIMARY]


INSERT INTO [exercise_customer]
           ([customerid]
           ,[cprnr]
           ,[name]
           ,[address]
           ,[postcode])
     VALUES (1,'1111111111','Allan','havnegade 7',5000),
            (2,'2222222222','Kasper','nyhavn 33',5000),
            (3,'3333333333','Hans','havnegade 21',7100),
            (4,'4444444444','Tove','æblevænget 17',5000),
            (5,'5555555555','Jan','østrekaj 14',5000);

INSERT INTO [exercise_postcode]
           ([postcode]
           ,[city])
     VALUES (5000,'Odense'),
            (7100,'Vejle');

INSERT INTO [exercise_order]
           ([orderid]
           ,[customerid]
           ,[orderdate])
     VALUES
           (1,1,'14-12-2015'),
           (2,5,'14-12-2015'),
           (3,1,'14-12-2015'),
           (4,2,'14-12-2015'),
           (5,3,'14-12-2015'),
           (6,4,'14-12-2015'),
           (7,5,'14-12-2015');

INSERT INTO [exercise_orderline]
           ([orderid]
           ,[lineid]
           ,[quantity]
           ,[productid])
     VALUES
           (1,1,1,1),
           (1,2,1,2),
           (1,3,5,5),
           (2,1,1,3),
           (2,2,1,4),
           (3,1,1,1),
           (4,1,1,2),
           (5,1,2,4),
           (6,1,2,3),
           (6,2,1,2),
           (7,1,2,2),
           (7,2,5,5);

INSERT INTO [exercise_product]
           ([productid]
           ,[name]
           ,[price])
     VALUES
           (1,'comb',10),
           (2,'scissor',30),
           (3,'shampo',15),
           (4,'headband',20),
           (5,'rubber band',5);
