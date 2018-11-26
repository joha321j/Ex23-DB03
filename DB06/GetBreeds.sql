USE B_DB14_2018
GO

IF OBJECT_ID('GetBreeds', 'P') IS NOT NULL
DROP PROC GetBreeds
GO

CREATE PROCEDURE GetBreeds
AS
	SELECT [BreedName],
	       [MinWeight],
		   [MaxWeight],
		   [AverageLifeExpectancy]
	FROM BREED