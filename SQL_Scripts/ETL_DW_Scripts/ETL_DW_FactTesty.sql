use ABD_GR04_ODS
SELECT [DataWykonania]
      ,[IdZawodnika]
      ,[IdTestu]
      ,[IdPodmiotu]
	  ,SUM(CASE WHEN Ocena < 7 THEN 0 WHEN Ocena >= 7 THEN 1 END) AS CzyPozytywny
      ,SUM(Ocena) AS Ocena
  FROM [dbo].[FactTestySt]
group by [IdZawodnika]
      ,[DataWykonania]
      ,[IdTestu]
      ,[IdPodmiotu]