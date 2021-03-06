/****** Script for SelectTopNRows command from SSMS  ******/

SELECT TOP 4000 [CODE]
	, [DATE_NOS]
	  , Year = FLOOR((DATE_NOS - DATE_NOS%10000)/10000)
		,Month = FLOOR(DATE_NOS/100 % 100)
		,Season = CEILING((DATE_NOS/100 % 100) /3)
  FROM [ClaimData1_Zanjan].[dbo].[SAR_NOSKHE]
  
  ALTER TABLE [ClaimData1_Zanjan].[dbo].[SAR_NOSKHE]
  ADD Season INT


/*Seprating Data Formating----- Extract Year and Month*/
  ALTER TABLE [ClaimData1_Zanjan].[dbo].[SAR_NOSKHE]
 ADD Season INT

UPDATE [ClaimData1_Zanjan].[dbo].[SAR_NOSKHE]
SET Year = FLOOR((DATE_NOS - DATE_NOS%10000)/10000)
		,Month = FLOOR(DATE_NOS/100 % 100)
		,Season = CEILING((DATE_NOS/100 % 100) /3)

UPDATE [ClaimData1_Zanjan].[dbo].[SAR_NOSKHE]
SET Year = [YEAR_NOS]
WHERE DATE_NOS = 0 

/*----------------------------------------------------*/
/**/
/**/
/**/
/*Grouping for normalizing*/
ALTER TABLE [ClaimData1_Zanjan].[dbo].[SAR_NOSKHE]
 ADD Adj_year INT
SELECT 
	[Year]
	,COUNT(CODE) as c
	  FROM [ClaimData1_Zanjan].[dbo].[SAR_NOSKHE]
	  GROUP BY Year;
/*-------------------------*/
/**/
/**/
/**/
/*Adding Adjusment Column*/
UPDATE [ClaimData1_Zanjan].[dbo].[SAR_NOSKHE]
SET Adj_year =  c
FROM (SELECT 
	COUNT(CODE) as c
	FROM [ClaimData1_Zanjan].[dbo].[SAR_NOSKHE]
	  GROUP BY Year)
WHERE [Year] != 0
/*-------------------------------------------*/
/**/
/**/
/**/
SELECT TOP 1000 CODE,Year,DATE_NOS ,[YEAR_NOS]
FROM [ClaimData1_Zanjan].[dbo].[SAR_NOSKHE]
WHERE DATE_NOS = 0



SELECT DATE_NOS AS S
FROM [ClaimData1_Zanjan].[dbo].[SAR_NOSKHE]
WHERE FLOOR((DATE_NOS - DATE_NOS%10000)/10000) = 1395




SELECT TOP 1000 DATE_NOS , CEILING((DATE_NOS-(DATE_NOS%(1000000)))/1000000) AS A
FROM [ClaimData1_Zanjan].[dbo].[SAR_NOSKHE]
WHERE CEILING((DATE_NOS-(DATE_NOS%(1000000)))/1000000) != 13

UPDATE [ClaimData1_Zanjan].[dbo].[SAR_NOSKHE] 
SET DATE_NOS = DATE_NOS * 1000000 + DATE_NOS
WHERE CEILING((DATE_NOS-(DATE_NOS%(1000000)))/1000000) != 13

SELECT TOP 1000 DATE_NOS*10000000
FROM [ClaimData1_Zanjan].[dbo].[SAR_NOSKHE]