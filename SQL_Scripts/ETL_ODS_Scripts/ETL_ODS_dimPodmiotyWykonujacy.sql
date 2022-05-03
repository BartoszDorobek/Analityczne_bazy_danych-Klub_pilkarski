/* DimPodmiotWykonujacySt */
USE [ABD_GR04_SRC2]
SELECT [IdPodmiotu]
	  ,[Nazwa]
      ,[NumerTelefonu]
      ,[Mail]
FROM PodmiotyWykonujace
	where [DataModyfikacji] >= dateadd(day,-1,cast(CURRENT_TIMESTAMP as date))
