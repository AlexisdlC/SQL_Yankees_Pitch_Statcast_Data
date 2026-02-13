/*
=================================================================================
Create view to extract create dimension table containing Yankees' game info
=================================================================================
*/

IF OBJECT_ID('gold.dim_nyy_games', 'V') IS NOT NULL
	DROP VIEW  gold.dim_nyy_games
GO

CREATE VIEW gold.dim_nyy_games AS

SELECT
	game_id,
	game_date,
	game_type AS game_type_abbr,
	-- Create column with explicit name for game types
	CASE game_type
		WHEN 'R' THEN 'Regular'
		WHEN 'F' THEN 'Wild Card'
		WHEN 'D' THEN 'ALDS'
		WHEN 'L' THEN 'ALCS'
		WHEN 'W' THEN 'World Series'
	END AS game_type,
	-- Create a column to label if a game is home or away
	CASE
		WHEN home_team_id = 147 THEN 'home'
		ELSE 'away'
	END AS game_home_away,
	-- Extract game's opponent id
	CASE
		WHEN home_team_id = 147 THEN away_team_id
		ELSE home_team_id
	END AS game_opponent_id,
	doubleheader AS game_doubleheader,
	game_num AS game_dh_number,
	-- Extract final score for the Yankees
	CASE home_team_id
		WHEN 147 THEN home_score
		ELSE away_score
	END AS game_nyy_score,
	-- Extract final score of Yankee's opponent
	CASE home_team_id
		WHEN 147 THEN away_score
		ELSE home_score
	END AS game_opponent_score,
	-- Extract final result, from Yankees' perspective (Yankees' id=147)
	CASE
		WHEN home_team_id = 147 THEN
			CASE
				WHEN home_score > away_score THEN 'Win'
				WHEN home_score < away_score THEN 'Loss'
				ELSE 'Tie'
			END
		ELSE 
			CASE
				WHEN home_score < away_score THEN 'Win'
				WHEN home_score > away_score THEN 'Loss'
				ELSE 'Tie'
			END
	END AS game_result
FROM silver.games_2015_2025_all_filtered
-- Filter to keep only Yankees games
WHERE home_team_id = 147 OR away_team_id = 147
