USE B_DB14_2018
GO

IF OBJECT_ID('GetOwners', 'P') IS NOT NULL
DROP PROC GetOwners
GO

CREATE PROCEDURE GetOwners
AS
	SELECT [OwnerID],
		   [OwnerLastName],
		   [OwnerFirstName],
		   [OwnerPhone],
		   [OwnerEmail]
	FROM PET_OWNER