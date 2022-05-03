use ABD_GR04_ODS
SELECT [IdStadiony]
      ,[IdMeczu]
      ,[IdZawodnika]
	  ,[DataMeczu]
	  ,SUM(BramkiStracone) As BramkiStracone
	  ,SUM(BramkiStrzelone) As BramkiStrzelone
	  ,SUM(CzasGry) As CzasGry
	  ,COUNT(CASE WHEN [CzyWyjsciowySklad]=1 THEN 1 END) AS CzyWyjsciowy
	  ,COUNT(CASE WHEN [Kartki]='Zolta' THEN 1 END) AS LiczbaZoltych
	  ,COUNT(CASE WHEN [Kartki]='Czerwona' THEN 1 END) AS LiczbaCzerwonych
	  ,SUM(CASE WHEN BramkiStracone > BramkiStrzelone THEN -1 WHEN BramkiStracone=BramkiStrzelone THEN 0 WHEN BramkiStracone<BramkiStrzelone THEN 1 END) AS Wynik
  FROM [dbo].[FactStatystykiSt]
group by [IdStadiony]
      ,[IdZawodnika]
      ,[IdMeczu]
	  ,[DataMeczu]
