use B_DB14_2018

if OBJECT_ID('LINE_ITEM', 'U') is not null
drop table LINE_ITEM
go

if OBJECT_ID('INVOICE', 'U') is not null
drop table INVOICE
go

if OBJECT_ID('PRODUCT', 'U') is not null
drop table PRODUCT
go

create table INVOICE
(
InvoiceNumber int not null,
InvoiceDate date not null,
SubTotal float not null,
TaxPct float not null,
Total float not null,
constraint INVOICE_PK primary key (InvoiceNumber)
)
go

create table PRODUCT
(
ProductNumber int not null,
ProductType varchar not null default 'unknown',
ProductDescription varchar,
UnitPrice float not null,
constraint PRODUCT_PK primary key (ProductNumber)
)
go

create table LINE_ITEM
(
InvoiceNumber int not null,
LineNumber int not null,
ProductNumber int not null,
Quantity int not null,
Unitprice float not null,
Total float not null
constraint LINE_ITEM_PK primary key (InvoiceNumber, LineNumber),
constraint Invoice_FK foreign key (InvoiceNumber)
	references INVOICE (InvoiceNumber)
	on update cascade
	on delete no action,
constraint Product_FK foreign key (ProductNumber)
	references PRODUCT (ProductNumber)
	on update cascade
	on delete no action
)
go
