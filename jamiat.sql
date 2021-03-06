/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP 1000 [Column 0]
      ,[PROVINCEID]
      ,[province_sahar]
      ,[province_stat]
      ,[province_sql]
      ,[province_abs]
      ,[province_farsi]
      ,[province]
      ,[sex]
      ,[pred_sp]
      ,[age]
  FROM [test].[dbo].[population]

   select [province_sahar] , [sex] , count(*)
   from [test].[dbo].[population]
   grouP by cube([province_sahar] , [sex]) 

   select [province_sql]
      from [test].[dbo].[population]
where [province_sql] = 'Khorasan'

   select [province_sahar] , COUNT(*)
   from [test].[dbo].[population]
   group by [province_sahar]
--------------------------------------
   select [province_sql] , SUM(ceiling(CAST([pred_sp] as float)))
from [test].[dbo].[population]
group by [province_sql]
order by [province_sql]
---------------------------------------
