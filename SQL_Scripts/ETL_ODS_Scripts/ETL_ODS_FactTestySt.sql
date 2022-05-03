--FactTestySt
USE [ABD_GR04_SRC2]
SELECT [IdWyniku]
      ,[DataWykonania]
      ,[Ocena]
      ,[Opis]
      ,[IdTestu]
      ,[IdZawodnika] 
FROM WynikiTestow 
	--where [DataModyfikacji] >= dateadd(day,-1,cast(CURRENT_TIMESTAMP as date))