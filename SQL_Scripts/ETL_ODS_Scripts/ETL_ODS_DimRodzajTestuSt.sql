/*[dbo].[DimRodzajTestuSt]*/
USE [ABD_GR04_SRC2]
SELECT [IdTestu]
      ,[Rodzaj]
      ,[CzyObowiazkowy]
      ,[Nazwa]
FROM Testy 
	where [DataModyfikacji] >= dateadd(day,-1,cast(CURRENT_TIMESTAMP as date))


