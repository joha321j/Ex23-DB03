/* Til tabellen PET, opret en Stored Procedure (SP), navngiv den InsertPet, som indsætter en række i tabellen. */
USE B_DB14_2018
GO
IF OBJECT_ID('InsertPet', 'P') IS NOT NULL
DROP PROC InsertPet
IF OBJECT_ID('InsertPetOwner', 'P') IS NOT NULL
DROP PROC InsertPetOwner
IF OBJECT_ID('InsertBreed', 'P') IS NOT NULL
DROP PROC InsertBreed
GO

CREATE PROCEDURE InsertPet
(
	@PetInsertName varchar(20),
	@PetInsertType varchar(20),
	@PetInsertBreed varchar(50),
	@PetInsertDOB datetime2(7),
	@PetInsertWeight numeric(8,2),
	@OwnerInsertPk int
)
AS
BEGIN
	INSERT INTO PET
	(
		PetName,
		PetType,
		PetBreed,
		PetDOB,
		PetWeight,
		OwnerPK
	)
	VALUES
	(
	@PetInsertName,
	@PetInsertType,
	@PetInsertBreed,
	@PetInsertDOB,
	@PetInsertWeight,
	@OwnerInsertPk	
	)
END
GO

CREATE PROCEDURE InsertPetOwner
(
	@OwnerLastName varchar(20) = 'unknown',
	@OwnerFirstName varchar(20) = 'unknown',
	@OwnerPhone varchar(15) = 'unknown',
	@OwnerEmail varchar(50) = 'unknown'
)
AS
BEGIN
	INSERT INTO PET_OWNER
	(
		OwnerLastName,
		OwnerFirstName,
		OwnerPhone,
		OwnerEmail
	)
	VALUES
	(
	@OwnerLastName,
	@OwnerFirstName,
	@OwnerPhone,
	@OwnerEmail
	)
END
GO

CREATE PROCEDURE InsertBreed
(
	@BreedName varchar(50),
	@MinWeight float,
	@MaxWeight float,
	@AverageLifeExpectancy int

)
AS
BEGIN
	INSERT INTO BREED
	(
	BreedName,
	MinWeight,
	MaxWeight,
	AverageLifeExpectancy
	)
	VALUES
	(
	@BreedName,
	@MinWeight,
	@MaxWeight,
	@AverageLifeExpectancy
	)
END
GO
