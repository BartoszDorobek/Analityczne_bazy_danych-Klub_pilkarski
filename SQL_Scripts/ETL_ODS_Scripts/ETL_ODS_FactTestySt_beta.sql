--FactTestySt
USE [ABD_GR04_SRC2]
SELECT [IdWyniku]
      ,[DataWykonania]
      ,[Ocena]
      ,w.[Opis]
      ,t.[IdTestu]
      ,[IdZawodnika]
	  ,[IdPodmiotu]
FROM WynikiTestow w inner join Testy t on t.IdTestu = w.IdTestu
	where w.[DataModyfikacji] >= dateadd(day,-1,cast(CURRENT_TIMESTAMP as date))
