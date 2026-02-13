/*
==================================================================================
Stored Procedure: Load Bronze Layer (Source -> Bronze)
==================================================================================
Script Purpose:
  This stored procedure loads data in the 'Bronze' schema from external CSV files.
  It perfoms the following actions:
    - Truncates the bronze tables before loading data.
    - Use the `BULK INSERT` command to load data from CSV files to bronze tables.

Parameters: 
  None.
  This stored procedure does not accept any parameters or return any values.

Usage Example:
  EXEC bronze.load_bronze;
==================================================================================
*/

CREATE OR ALTER PROCEDURE bronze.load_bronze AS

BEGIN
	DECLARE @start_time DATETIME, @end_time DATETIME, @global_start_time DATETIME;

	SET @global_start_time = GETDATE();

	PRINT '=================================';
	PRINT 'Loading Bronze Layer';
	PRINT '=================================';

	SET @start_time = GETDATE();

	PRINT '---------------------------------------------------------------';
	PRINT '>> Truncating Table: bronze.pitch_data_filtered_batters';
	PRINT '---------------------------------------------------------------';

	TRUNCATE TABLE bronze.pitch_data_filtered_batters;

	PRINT '---------------------------------------------------------------';
	PRINT '>> Inserting Data Into: bronze.pitch_data_filtered_batters';
	PRINT '---------------------------------------------------------------';

	BULK INSERT bronze.pitch_data_filtered_batters
	FROM 'G:\My Drive\SQL_pitchData\data_source\pitch_data_filtered_batters.csv'
	WITH (
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		ROWTERMINATOR = '0x0a',
		FORMAT = 'CSV',
		CODEPAGE = '65001'
	);

	SET @end_time = GETDATE();
	PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';

	SET @start_time = GETDATE();

	PRINT '---------------------------------------------------------------';
	PRINT '>> Truncating Table: bronze.pitch_data_filtered_pitchers';
	PRINT '---------------------------------------------------------------';

	TRUNCATE TABLE bronze.pitch_data_filtered_pitchers;

	PRINT '---------------------------------------------------------------';
	PRINT '>> Inserting Data Into: bronze.pitch_data_filtered_pitchers';
	PRINT '---------------------------------------------------------------';

	BULK INSERT bronze.pitch_data_filtered_pitchers
	FROM 'G:\My Drive\SQL_pitchData\data_source\pitch_data_filtered_pitchers.csv'
	WITH (
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		ROWTERMINATOR = '0x0a',
		FORMAT = 'CSV',
		CODEPAGE = '65001'
	);

	SET @end_time = GETDATE();
	PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';

	SET @start_time = GETDATE();

	PRINT '---------------------------------------------------------------';
	PRINT '>> Truncating Table: bronze.games_2015_2025_all_filtered';
	PRINT '---------------------------------------------------------------';

	TRUNCATE TABLE bronze.games_2015_2025_all_filtered;

	PRINT '---------------------------------------------------------------';
	PRINT '>> Inserting Data Into: bronze.games_2015_2025_all_filtered';
	PRINT '---------------------------------------------------------------';

	BULK INSERT bronze.games_2015_2025_all_filtered
	FROM 'G:\My Drive\SQL_pitchData\data_source\games_2015_2025_all_filtered.csv'
	WITH (
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		ROWTERMINATOR = '0x0a',
		FORMAT = 'CSV',
		CODEPAGE = '65001'
	);

	SET @end_time = GETDATE();
	PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';

	SET @start_time = GETDATE();

	PRINT '---------------------------------------------------------------';
	PRINT '>> Truncating Table: bronze.team_info';
	PRINT '---------------------------------------------------------------';

	TRUNCATE TABLE bronze.team_info;

	PRINT '---------------------------------------------------------------';
	PRINT '>> Inserting Data Into: bronze.team_info';
	PRINT '---------------------------------------------------------------';

	BULK INSERT bronze.team_info
	FROM 'G:\My Drive\SQL_pitchData\data_source\team_info.csv'
	WITH (
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		ROWTERMINATOR = '0x0a',
		FORMAT = 'CSV',
		CODEPAGE = '65001'
	);

	SET @end_time = GETDATE();
	PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';

	SET @start_time = GETDATE();

	PRINT '---------------------------------------------------------------';
	PRINT '>> Truncating Table: bronze.pitchers';
	PRINT '---------------------------------------------------------------';

	TRUNCATE TABLE bronze.pitchers;

	PRINT '---------------------------------------------------------------';
	PRINT '>> Inserting Data Into: bronze.pitchers';
	PRINT '---------------------------------------------------------------';

	BULK INSERT bronze.pitchers
	FROM 'G:\My Drive\SQL_pitchData\data_source\nyy_pitchers.csv'
	WITH (
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		ROWTERMINATOR = '0x0a',
		FORMAT = 'CSV',
		CODEPAGE = '65001'
	);

	SET @end_time = GETDATE();
	PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';

	SET @start_time = GETDATE();

	PRINT '---------------------------------------------------------------';
	PRINT '>> Truncating Table: bronze.opp_pitchers';
	PRINT '---------------------------------------------------------------';

	TRUNCATE TABLE bronze.opp_pitchers;

	PRINT '---------------------------------------------------------------';
	PRINT '>> Inserting Data Into: bronze.opp_pitchers';
	PRINT '---------------------------------------------------------------';

	BULK INSERT bronze.opp_pitchers
	FROM 'G:\My Drive\SQL_pitchData\data_source\opp_pitchers_full.csv'
	WITH (
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		ROWTERMINATOR = '0x0a',
		FORMAT = 'CSV',
		CODEPAGE = '65001'
	);

	SET @end_time = GETDATE();
	PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';

	SET @start_time = GETDATE();

	PRINT '---------------------------------------------------------------';
	PRINT '>> Truncating Table: bronze.batters';
	PRINT '---------------------------------------------------------------';

	TRUNCATE TABLE bronze.batters;

	PRINT '---------------------------------------------------------------';
	PRINT '>> Inserting Data Into: bronze.batters';
	PRINT '---------------------------------------------------------------';

	BULK INSERT bronze.batters
	FROM 'G:\My Drive\SQL_pitchData\data_source\nyy_batters.csv'
	WITH (
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		ROWTERMINATOR = '0x0a',
		FORMAT = 'CSV',
		CODEPAGE = '65001'
	);

	SET @end_time = GETDATE();
	PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';

	SET @start_time = GETDATE();

	PRINT '---------------------------------------------------------------';
	PRINT '>> Truncating Table: bronze.opp_batters';
	PRINT '---------------------------------------------------------------';

	TRUNCATE TABLE bronze.opp_batters;

	PRINT '---------------------------------------------------------------';
	PRINT '>> Inserting Data Into: bronze.opp_batters';
	PRINT '---------------------------------------------------------------';

	BULK INSERT bronze.opp_batters
	FROM 'G:\My Drive\SQL_pitchData\data_source\opp_batters_full.csv'
	WITH (
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		ROWTERMINATOR = '0x0a',
		FORMAT = 'CSV',
		CODEPAGE = '65001'
	);

	SET @end_time = GETDATE();
	PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';

	PRINT '=====================================';
	PRINT 'Loading Of Bronze Layer Is Completed';
	PRINT '		>> Total Load Duration: ' + CAST(DATEDIFF(second, @global_start_time, @end_time) AS NVARCHAR) + ' seconds';
	PRINT '=====================================';

END
