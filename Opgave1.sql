use B_DB14_2018

IF OBJECT_ID('PET', 'U') IS NOT NULL
DROP TABLE PET
GO

IF OBJECT_ID('PET_OWNER', 'U') IS NOT NULL
DROP TABLE PET_OWNER
GO

drop table if exists BREED;

CREATE TABLE PET_OWNER
(
OwnerID	int identity(1,1) NOT NULL,
OwnerLastName varchar(20) NOT NULL,
OwnerFirstName varchar(20) NOT NULL,
OwnerPhone varchar(15),
OwnerEmail varchar(50) NOT NULL,

CONSTRAINT OwnerPK PRIMARY KEY (OwnerID)
)
GO



create table BREED
(
BreedName varchar(50) not null,
MinWeight float,
MaxWeight float,
AverageLifeExpectancy int,
constraint BreedPK primary key (BreedName),

);


CREATE TABLE PET
(
PetID int identity NOT NULL,
PetName varchar(20) NOT NULL,
PetType varchar(20) NOT NULL default 'Unknown',
PetBreed varchar(50) NOT NULL,
PetDOB datetime2,
PetWeight numeric(8,2) NOT NULL,
OwnerPK int NOT NULL,
CONSTRAINT PetPK PRIMARY KEY (PetID),
CONSTRAINT FK_PET_OwnerID FOREIGN KEY (OwnerPK)
	REFERENCES PET_OWNER (OwnerID)
	ON DELETE NO ACTION
	ON UPDATE CASCADE,
constraint PetBreedFK FOREIGN KEY (PetBreed)
	references BREED (BreedName) 
	on delete no action
	on update cascade
)	
GO


if OBJECT_ID('PET_OWNER', 'U') is not null
	insert into PET_OWNER (OwnerLastName, OwnerFirstName, OwnerPhone, OwnerEmail) values ('Downs', 'Marsha', '555 537 8765', 'Marsha.Downs@somewhere.com')
	insert into PET_OWNER (OwnerLastName, OwnerFirstName, OwnerPhone, OwnerEmail) values ('James', 'Richard', '555 537 7654', 'Richard.James@somewhere.som')
	insert into PET_OWNER (OwnerLastName, OwnerFirstName, OwnerPhone, OwnerEmail) values ('Frier', 'Liz', '555 537 6543', 'Liz.Frier@somewhere.com')
	insert into PET_OWNER (OwnerLastName, OwnerFirstName, OwnerEmail) values ('Trent', 'Miles', 'Miles.Trent@somewhere.com')
go

if OBJECT_ID('BREED', 'U') is not null
	insert into BREED (BreedName, MinWeight, MaxWeight, AverageLifeExpectancy) values ('Border Collie', 15.0, 22.5, 20),
	('Cashmere', 10.0, 15.0, 12),
	('Collie Mix', 17.5, 25.0, 18),
	('Std. Poodle', 22.5, 30.0, 18)
	insert into BREED (BreedName) values ('Unknown')
go

if OBJECT_ID('PET', 'U') is not null
	insert into PET (PetName, PetType, PetBreed, PetDOB, PetWeight, OwnerPK) values ('King', 'Dog', 'Std. Poodle', '2011-02-21', 25.5, 1)
	insert into PET (PetName, PetType, PetBreed, PetDOB, PetWeight, OwnerPK) values ('Teddy', 'Cat', 'Cashmere', '2012-02-01', 10.5, 2)
	insert into PET (PetName, PetType, PetBreed, PetDOB, PetWeight, OwnerPK) values ('Fido', 'Dog', 'Std. Poodle', '2010-07-17', 28.5, 1)
	insert into PET (PetName, PetType, PetBreed, PetDOB, PetWeight, OwnerPK) values ('AJ', 'Dog', 'Collie Mix', '2011-05-05', 20.0, 3)
	insert into PET (PetName, PetType, PetBreed, PetDOB, PetWeight, OwnerPK) values ('Cedro', 'Cat', 'Unknown', '2009-06-06', 9.5, 2)
	insert into PET (PetName, PetType, PetBreed, PetWeight, OwnerPK) values ('Wooley', 'Cat', 'Unknown', 9.5, 2)
	insert into PET (PetName, PetType, PetBreed, PetDOB, PetWeight, OwnerPK) values ('Buster', 'Dog', 'Border Collie', '2008-12-11', 25.0, 4)
go

