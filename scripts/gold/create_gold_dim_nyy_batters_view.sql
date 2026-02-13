/*
=================================================================================
Create view to extract create dimension table containing Yankees' batter info
=================================================================================
*/

IF OBJECT_ID('gold.dim_nyy_batters', 'V') IS NOT NULL
	DROP VIEW  gold.dim_nyy_batters
GO

CREATE VIEW gold.dim_nyy_batters AS

SELECT
	player_id,
	-- Concatenate and capitalize first and last name of player
	CONCAT(UPPER(SUBSTRING(name_first,1,1)),SUBSTRING(name_first,2,LEN(name_first)), ' ',
	UPPER(SUBSTRING(name_last,1,1)),SUBSTRING(name_last,2,LEN(name_last))) AS player_name,
	--Extract year only for first and last seasons
	YEAR(first_season) AS first_season,
	YEAR(last_season) AS last_season
FROM silver.batters
