create database PlanMyTripDB;
use PlanMyTripDB;

create table tblUsers
(
Uid int identity(1,1) primary key not null,
Username nvarchar(50)Null, 
Password nvarchar(25)Null,
Email nvarchar(50)Null,
Name nvarchar(100)Null,
Usertype nvarchar(20) default 'User'
)

CREATE TABLE tblDestination(
	[DestinationID] [int] IDENTITY(1,1) NOT NULL primary key,
	[DestinationName] [nvarchar](100) NULL,
)

CREATE TABLE tblDuration(
	[DurationID] [int] IDENTITY(1,1) NOT NULL primary key,
	[DurationName] [nvarchar](100) NULL,
	--[PDestinationID] [int]
	--Constraint [FK_tblDestination_tblDuration] FOREIGN KEY (PDestinationID) REFERENCES [tblDestination] (DestinationID),
)

CREATE TABLE tblPerson(
	[PersonID] [int] IDENTITY(1,1) NOT NULL primary key,
	[PersonName] [nvarchar](100) NULL,
	--[PDestinationID] [int],
	--[PDurationID] [int],
	--Constraint [FK_tblDestination_tblPerson] FOREIGN KEY (PDestinationID) REFERENCES [tblDestination] (DestinationID),
	--Constraint [FK_tblDuration_tblPerson] FOREIGN KEY (PDurationID) REFERENCES [tblDuration] (DurationID),
)

CREATE TABLE tblDetail(
	[DetailID] [int] IDENTITY(1,1) NOT NULL primary key,
	[DetailName] [nvarchar](500) NULL,
	--[PDestinationID] [int],
	--[PDurationID] [int],
	--[PPersonID][int],
	--Constraint [FK_tblDestination_tblDetail] FOREIGN KEY (PDestinationID) REFERENCES [tblDestination] (DestinationID),
	--Constraint [FK_tblDuration_tblDetail] FOREIGN KEY (PDurationID) REFERENCES [tblDuration] (DurationID),
	--Constraint [FK_tblPerson_tblDetail] FOREIGN KEY ([PPersonID]) REFERENCES [tblPerson] (PersonID),
)

CREATE TABLE tblPackage(
	[PID] [int] IDENTITY(1,1) NOT NULL primary key,
	[PName] [nvarchar](500) NULL,
	PPrice money,
	PDisPrice money,
	PDestinationID int,
	PDurationID int,
	PDetailID int,
	PPersonID int,

	PDescription nvarchar(MAX),
	Constraint [FK_tblDestination_tblPackage] FOREIGN KEY (PDestinationID) REFERENCES [tblDestination] (DestinationID),
	Constraint [FK_tblDuration_tblPackage] FOREIGN KEY (PDurationID) REFERENCES [tblDuration] ([DurationID]),
	Constraint [FK_tblDetail_tblPackage] FOREIGN KEY ([PDetailID]) REFERENCES [tblDetail] (DetailID),
	Constraint [FK_tblPerson_tblPackage] FOREIGN KEY ([PPersonID]) REFERENCES [tblPerson] (PersonID),
)

CREATE TABLE tblPackageImages(
	[PIMGID] [int] IDENTITY(1,1) NOT NULL,
	[PID] [int] NULL,
	[Name] [nvarchar](max) NULL,
	[Extention] [nvarchar](500) NULL,
	Constraint [FK_tblPackage_tblPackageImages] FOREIGN KEY (PID) REFERENCES [tblPackage] (PID),
)

Create table tblBooking
(
	[BookingID] [int] IDENTITY(1,1) NOT NULL,
	[UID] [int] NULL,
	[PID] [int] NULL,
	[PName] [nvarchar](500) NULL,
	[PPrice] [money] NULL,
	[PDisPrice] [money] NULL,
	[Qty] [int] NULL,
)

CREATE TABLE tblOrders(
	[OrderID] [int] IDENTITY(1,1) NOT NULL primary key,
	[UserID] [int] NULL,
	[EMail] [nvarchar](max) NULL,
	[BookingAmount] [money] NULL,
	[BookingDiscount] [money] NULL,
	[TotalPaid] [money] NULL,
	[PaymentType] [nvarchar](50) NULL,
	[PaymentStatus] [nvarchar](50) NULL,
	[DateOfPurchase] [datetime] NULL,
	[Name] [nvarchar](200) NULL,
	[Address] [nvarchar](max) NULL,
	[MobileNumber] [nvarchar](50) NULL,
	[OrderStatus] [nvarchar](50) NULL,
	[OrderNumber] [nvarchar](50) NULL,
	Constraint [FK_tblOrders_ToTable] FOREIGN KEY ([UserID]) REFERENCES [tblUsers] ([Uid])
)

CREATE TABLE tblOrderPackages(
	[OrderPackID] [int] IDENTITY(1,1) NOT NULL primary key,
	[OrderID] [nvarchar](50) NULL,
	[UserID] [int] NULL,
	[PID] [int] NULL,
	[Products] [nvarchar](max) NULL,
	[Quantity] [int] NULL,
	[OrderDate] [datetime] NULL,
	[Status] [nvarchar](100) NULL,
Constraint [FK_tblOrderPackages_ToTable] FOREIGN KEY ([UserID]) REFERENCES [tblUsers] ([Uid])
)


select*from tblUsers

Create procedure sp_InsertPackage
(
@PName nvarchar(500),
@PPrice money,
@PDisPrice money,
@PDestinationID int,
@PDurationID int,
@PDetailID int,
@PPersonID int,
@PDescription nvarchar(MAX)
)
AS

insert into tblPackage values(@PName,@PPrice,@PDisPrice,@PDestinationID,@PDurationID,
@PDetailID,@PPersonID,@PDescription) 
select SCOPE_IDENTITY()
Return 0

create PROCEDURE SP_BindBookingNumberToUser
(
@UserID int
)
AS
SELECT * FROM tblBooking D CROSS APPLY ( SELECT TOP 1 E.Name,Extention FROM tblPackageImages E WHERE E.PID = D.PID) Name where D.UID = @UserID



<----ok------>

Create procedure packBindAllPackages
AS
select A.*,B.*,C.DestinationName ,A.PPrice-A.PDisPrice as DiscAmount,
B.Name as ImageName, C.DestinationName as DestinationName,
D.DurationName as Duration,E.PersonName as Person,
F.DetailName as Details from tblPackage A
inner join tblDestination C on C.DestinationID =A.PDestinationID
inner join tblDuration D on D.DurationID = A.PDurationID
inner join tblPerson E on E.PersonID = A.PPersonID
inner join tblDetail F on F.DetailID = A.PDetailID
cross apply(
select top 1 * from tblPackageImages B where B.PID= A.PID order by B.PID desc
)B
order by A.PID desc
Return 0

create procedure SP_BindPackageDetails
(
@PID int
)
AS
select A.*,B.*,C.DestinationName,A.PDescription,A.PPrice-A.PDisPrice as DiscAmount,
B.Name as ImageName, C.DestinationName as DestinationName,
D.DurationName as Duration,E.PersonName as Person,
F.DetailName as Details from tblPackage A
inner join tblDestination C on C.DestinationID =A.PDestinationID
inner join tblDuration D on D.DurationID = A.PDurationID
inner join tblPerson E on E.PersonID = A.PPersonID
inner join tblDetail F on F.DetailID = A.PDetailID
cross apply(
select top 1 * from tblPackageImages B where B.PID= A.PID and A.PID = @PID order by B.PID desc
)B
order by A.PID desc

Create procedure SP_InsertBooking
(
@UID int,
@PID int,
@PName nvarchar(500),
@PPrice money,
@PDisPrice money,
@Qty int
)
AS

insert into tblBooking values(@UID,@PID,@PName,@PPrice,@PDisPrice,@Qty) 
select SCOPE_IDENTITY()
Return 0

create PROCEDURE SP_BindUserBooking
(
@UserID int
)
AS

Select A.*,B.*,A.PDescription,
A.PPrice-A.PDisPrice as DiscAmount,
C.DestinationName as DestinationName,
D.DurationName as Duration,E.PersonName as Person,
F.DetailName as Details
from tblPackage A
inner join tblDestination C on C.DestinationID =A.PDestinationID
inner join tblDuration D on D.DurationID = A.PDurationID
inner join tblPerson E on E.PersonID = A.PPersonID
inner join tblDetail F on F.DetailID = A.PDetailID
inner join tblBooking B on B.PID = A.PID

CROSS APPLY ( SELECT TOP 1 G.Name,Extention FROM tblPackageImages G WHERE B.PID = G.PID and A.PID = G.PID) Name 
where B.UID = @UserID


Create procedure SP_DeleteBooking
(
@UID int,
@BookingID int
)
AS
BEGIN
DELETE FROM tblBooking WHERE BookingID=@BookingID and @UID = UID
END

CREATE PROCEDURE SP_InsertOrder
(
@UserID int,
@Email nvarchar(MAX),
@BookingAmount money,
@BookingDiscount money,
@TotalPaid money,
@PaymentType nvarchar(50),
@PaymentStatus nvarchar(50),
@DateOfPurchase datetime,
@Name nvarchar(200),
@Address nvarchar(MAX),
@MobileNumber nvarchar(50),
@OrderStatus nvarchar(50),
@OrderNumber nvarchar(50)
)
AS
INSERT INTO tblOrders VALUES(@UserID,@Email,@BookingAmount,@BookingDiscount,@TotalPaid,@PaymentType,@PaymentStatus,@DateOfPurchase,@Name,@Address,@MobileNumber,@OrderStatus,@OrderNumber)
SELECT SCOPE_IDENTITY()

create PROCEDURE SP_InsertOrderPackages
(
@OrderID nvarchar(50),
@UserID int,
@PID int,
@Products nvarchar(MAX),
@Quantity int,
@OrderDate datetime,
@Status nvarchar(100)
)
AS
INSERT INTO tblOrderPackages VALUES (@OrderID,@UserID,@PID,@Products,@Quantity,@OrderDate,@Status)
SELECT SCOPE_IDENTITY()

create PROCEDURE SP_EmptyBooking
@UserID int,
@PID int
AS
BEGIN
DELETE FROM tblBooking WHERE tblBooking.UID=@UserID and tblBooking.PID=@PID
END

CREATE PROCEDURE SP_FindOrderNumber @FindOrderNumber nvarchar(100)
AS
SELECT * FROM tblOrders WHERE OrderNumber = @FindOrderNumber


create procedure Sp_BindBookingHistory
(
@UserID int
)
AS

select B.OrderNumber,H.Name as UserName,
C.DestinationName as Destination,A.PName as PackageName,
D.DurationName as Duration,E.PersonName as PackageCategory,
F.DetailName as PackageInclusion,B.TotalPaid as AmountPaid,
B.DateOfPurchase,B.MobileNumber from tblPackage A
inner join tblOrders B on B.UserID = @UserID
inner join tblDestination C on C.DestinationID =A.PDestinationID
inner join tblDuration D on D.DurationID = A.PDurationID
inner join tblPerson E on E.PersonID = A.PPersonID
inner join tblDetail F on F.DetailID = A.PDetailID
inner join tblUsers H on H.Uid = B.UserID
cross apply(
select * from tblOrderPackages G where A.PID=G.PID and G.UserID = @UserID and G.OrderID=B.OrderNumber
)G

select*from tblUsers