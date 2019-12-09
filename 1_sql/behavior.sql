use AdventureWorks2017;
GO

--view
CREATE view vw_Person
as
select firstname, lastname
FROM Person.Person;
go

--Add SchemaBinding
ALTER view vw_Person with SCHEMABINDING
as
select firstname, lastname
FROM Person.Person;
go

select * FROM vw_Person;
go

--FUNCTION
CREATE FUNCTION fn_Person(@first nvarchar(50))
returns TABLE
as
return
select firstname, lastname
FROM Person.Person
where Firstname = @first;
go

select * FROM fn_Person('joshua');
GO

--Scalar Function
CREATE FUNCTION fn_FullName(@first nvarchar(50), @middle nvarchar(50), @last nvarchar(50))
returns nvarchar(200)
AS
BEGIN 
    --RETURN @first + " " + @middle + " " + @last >>> doesn't check is middle is null

    RETURN @first + COALESCE(' ' + @middle, ' ') + ' ' + @last
    --RETURN @first + isNull(' ' + @middle, ' ') + " " + @last
END;
go

select dbo.fn_FullName(FirstName, null, LastName) FROM fn_Person('joshua');
go

--Stored Procedures
CREATE PROCEDURE sp_InsertName(@first nvarchar(50), @middle nvarchar(50), @last nvarchar(50))
AS
BEGIN
    DECLARE @mname NVARCHAR(50) = @middle;

    if(@middle is null)
    BEGIN
        set @mname = ''
    END

    INSERT into Person.Person(FirstName, LastName, MiddleName )
    values (@first, @last, @mname)
END;
go

--ExpectionHandle -Errors
CREATE PROCEDURE sp_InsertName2(@first nvarchar(50), @middle nvarchar(50), @last nvarchar(50))
AS
BEGIN
    BEGIN TRAN
        begin try
            DECLARE @mname NVARCHAR(50) = @middle;

            if(@middle is null)
            BEGIN
                set @mname = ''
            END

            CHECKPOINT --save up to here, saves data temporarily then continue, AKA Save point

            INSERT into Person.Person(FirstName, LastName, MiddleName )
            values (@first, @last, @mname)

            COMMIT TRAN
        end TRY

    BEGIN CATCH
        print error_message() --message of error
        PRINT error_line()
        print error_severity() --how critical the error is Level1: Database Error, Level2: Usually permissions error, Level3: Something wrong with Data, Level4: , Level5: 
        print error_state() --Is it external or internal or user-generated
        print error_number() --0-10000 machie generated anything higher is custom

        ROLLBACK TRAN
    END CATCH
END;
go

EXECUTE sp_InsertName2 'fred', null, 'Belotte'
go

--Trigger
create trigger tr_InsertName 
on Person.Person
instead of insert
as
UPDATE pp
set firstname = inserted.firstname
from Person.Person as pp
where pp.BusinessEntityID = inserted.BusinessEntityID;