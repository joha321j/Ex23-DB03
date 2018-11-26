use B_DB14_2018
go

alter table PET
add constraint LMT_PetWeight check (PetWeight < 250)