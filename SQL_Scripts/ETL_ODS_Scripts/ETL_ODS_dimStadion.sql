/*
DimStadionSt; dbo.Stadiony dbo.Adresy
*/
SELECT [IdStadiony]
      ,[Nazwa]
      ,[Miasto]
      ,[Ulica]
      ,[NrLokalu]
      ,[KodPocztowy]
from Stadiony s inner join Adresy a on a.IdAdresu = s.IdAdresu
	where s.[DataModyfikacji] >= dateadd(day,-1,cast(CURRENT_TIMESTAMP as date))
union 
SELECT [IdStadiony]
      ,[Nazwa]
      ,[Miasto]
      ,[Ulica]
      ,[NrLokalu]
      ,[KodPocztowy]
from Stadiony s inner join Adresy a on a.IdAdresu = s.IdAdresu
	where a.[DataModyfikacji] >= dateadd(day,-1,cast(CURRENT_TIMESTAMP as date))