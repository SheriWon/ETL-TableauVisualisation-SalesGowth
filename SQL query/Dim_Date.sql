/****** Script for SelectTopNRows command from SSMS  ******/
-- Cleansed DIM_Date Table --
SELECT 
  [DateKey], 
  [FullDateAlternateKey] AS Date, 
  [EnglishDayNameOfWeek] AS Day, 
  [WeekNumberOfYear] AS WeekNr, 
  [EnglishMonthName] AS Month, 
  Left([EnglishMonthName], 3) AS MonthShort, 
  -- Useful for front end date navigation and front end graphs.
  [MonthNumberOfYear] AS MonthNo, 
  [CalendarQuarter] AS Quarter, 
  [CalendarYear] AS Year 
FROM 
  [AdventureWorksDW2022].[dbo].[DimDate] 
WHERE 
  [CalendarYear] >= YEAR(
    DATEADD(
      YEAR, 
      -4,
      GETDATE()
    )
  )