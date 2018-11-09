use B_DB14_2018

IF OBJECT_ID('dbo.PET', 'U') IS NOT NULL
DROP TABLE dbo.PET
GO

IF OBJECT_ID('dbo.PET_OWNER', 'U') IS NOT NULL
DROP TABLE dbo.PET_OWNER
GO

CREATE TABLE dbo.PET_OWNER
(
OwnerID	int NOT NULL,
OwnerLastName varchar(20) NOT NULL,
OwnerFirstName varchar(20) NOT NULL,
OwnerPhone varchar(15),
OwnerEmail varchar(50) NOT NULL,

CONSTRAINT OwnerPK PRIMARY KEY (OwnerID)
)
GO

CREATE TABLE dbo.PET
(
PetID int NOT NULL,
PetName varchar(20) NOT NULL,
PetType varchar(20) NOT NULL default 'unknown',
PetBreed varchar(20) NOT NULL,
PetDOB date,
PetWeight numeric(8,2) NOT NULL,
OwnerPK int NOT NULL,
CONSTRAINT PetPK PRIMARY KEY (PetID),
CONSTRAINT FK_PET_OwnerID FOREIGN KEY (OwnerPK)
	REFERENCES PET_OWNER (OwnerID)
	ON DELETE NO ACTION
	ON UPDATE CASCADE
)	
GO
