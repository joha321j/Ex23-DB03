use B_DB14_2018
go

SELECT OwnerLastName, OwnerFirstName, OwnerEmail
FROM PET_OWNER
WHERE OwnerEmail LIKE '%somewhere.com'
go

SELECT PetName, PetBreed
FROM PET
ORDER BY PetName
go

SELECT count(DISTINCT PetBreed) AS NumberOfBreeds
FROM PET
go

SELECT MIN(PetWeight) as MinDogWeight,
	   MAX(PetWeight) as MaxDogWeight,
	   AVG(PetWeight) as AvgDogWeight
FROM PET
WHERE PetType = 'Dog'
go

SELECT PetBreed, AVG(PetWeight) as AvgWeight
FROM PET
group by PetBreed
go

SELECT PetBreed, AVG(PetWeight) as AvgWeight
FROM PET
group by PetBreed
having count(*) > 1
go

SELECT PetBreed, AVG(PetWeight) as AvgWeight
FROM PET
where PetBreed != 'Unknown'
group by PetBreed
having count(*) > 1
go

select OwnerFirstName, OwnerLastName, OwnerEmail
from PET_OWNER
where OwnerID in (select OwnerPk from PET where PetType = 'Cat')
go

select OwnerFirstName, OwnerLastName, OwnerEmail
from PET_OWNER
where OwnerID in (select OwnerPk from PET where PetType = 'Cat' and PetName = 'Teddy')
go

select OwnerLastName, OwnerFirstName, OwnerEmail
from PET_OWNER
where OwnerID in (select OwnerPK from PET where PetBreed in (select BreedName from BREED where AverageLifeExpectancy > 15))

select distinct OwnerFirstName, OwnerLastName, OwnerEmail
from PET_OWNER left join PET  on PET_OWNER.OwnerID = PET.OwnerPK
where PetType = 'Cat'

select OwnerFirstName, OwnerLastName, OwnerEmail
from PET_OWNER left join PET on PET_OWNER.OwnerID = PET.OwnerPK
where PetType = 'Cat' and PetName = 'Teddy'

select distinct OwnerLastName, OwnerFirstName, OwnerEmail
from PET_OWNER left join PET on PET_OWNER.OwnerID = PET.OwnerPK left join BREED on PET.PetBreed = BREED.BreedName
where AverageLifeExpectancy > 15

select distinct OwnerLastName, OwnerFirstName, OwnerEmail, PetName, PetType, PetBreed, AverageLifeExpectancy
from PET_OWNER left join PET on PET_OWNER.OwnerID = PET.OwnerPK left join BREED on PET.PetBreed = BREED.BreedName
where PetBreed != 'Unknown'