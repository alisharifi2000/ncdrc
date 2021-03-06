/****** Script for SelectTopNRows command from SSMS  ******/
ALTER TABLE [ClaimData7_Hamedan].[dbo].[SAR_NOSKHE]
ADD MONTH_NOS INT;

UPDATE [ClaimData7_Hamedan].[dbo].[SAR_NOSKHE] SET MONTH_NOS = CAST(SUBSTRING(cast(DATE_NOS as nvarchar),5,2) AS INT)
WHERE LEN(DATE_NOS) = '8'

UPDATE [ClaimData7_Hamedan].[dbo].[SAR_NOSKHE] SET YEAR_NOS = CAST(SUBSTRING(cast(DATE_NOS as nvarchar),1,4) AS INT)
WHERE LEN(DATE_NOS) = '8'

select top 1000 DATE_NOS,YEAR_NOS,MONTH_NOS from [ClaimData7_Hamedan].[dbo].[SAR_NOSKHE]
 select DATE_NOS , ,	 CAST(SUBSTRING(cast(DATE_NOS as nvarchar),5,2) AS INT) from [ClaimData7_Hamedan].[dbo].[SAR_NOSKHE]