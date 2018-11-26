USE B_DB14_2018
GO

IF OBJECT_ID('GetOwnersByLastName', 'P') IS NOT NULL
DROP PROC GetOwnersByLastName
GO

CREATE PROCEDURE GetOwnersByLastName
(
	@OwnersLastName varchar(20) = NULL
)
AS
	SELECT [OwnerID],
		   [OwnerLastName],
		   [OwnerFirstName],
		   [OwnerPhone],
		   [OwnerEmail]
	FROM PET_OWNER
	WHERE OwnerLastName = ISNULL(@OwnersLastName, OwnerLastName)
