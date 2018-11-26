USE B_DB14_2018
GO

IF OBJECT_ID('GetOwnersByEmail', 'P') IS NOT NULL
DROP PROC GetOwnersByEmail
GO

CREATE PROCEDURE GetOwnersByEmail
(
	@InputEmail varchar(50),
	@InputFirstName varchar(20)
)
AS
	SELECT [OwnerID],
		   [OwnerLastName],
		   [OwnerFirstName],
		   [OwnerPhone],
		   [OwnerEmail]
	FROM PET_OWNER
	WHERE OwnerEmail = @InputEmail AND OwnerFirstName = @InputFirstName 