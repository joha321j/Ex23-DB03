USE B_DB14_2018
GO

IF OBJECT_ID('GetPets', 'P') IS NOT NULL
DROP PROC GetPets
GO

CREATE PROCEDURE GetPets
AS
	SELECT [PetID],
		   [PetName],
		   [PetType],
		   [PetBreed],
		   [PetDOB],
		   [PetWeight],
		   [OwnerPK]
	FROM PET
