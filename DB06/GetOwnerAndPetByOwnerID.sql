USE B_DB14_2018
GO

IF OBJECT_ID('GetOwnerAndPetByOwnerID', 'P') IS NOT NULL
DROP PROC GetOwnerAndPetByOwnerID
GO

CREATE PROCEDURE GetOwnerAndPetByOwnerID
(
	@OwnerID int
)
AS
	SELECT OwnerFirstName + ' ' + OwnerLastName,
		   PetName,
		   PetType,
		   PetBreed,
		   AverageLifeExpectancy
	FROM PET_OWNER JOIN PET ON PET_OWNER.OwnerID = PET.OwnerPK JOIN BREED on PET.PetBreed = BREED.BreedName
	WHERE OwnerID = @OwnerID
