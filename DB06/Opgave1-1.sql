USE B_DB14_2018
GO

ALTER PROCEDURE InsertPet
(
	@PetInsertName varchar(20) = 'unknown',
	@PetInsertType varchar(20) = 'unknown',
	@PetInsertBreed varchar(50) = 'unknown',
	@PetInsertDOB datetime2(7) = '0000-00-00',
	@PetInsertWeight numeric(8,2) = 0.0, 
	@OwnerInsertPk int = 'unknown'
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