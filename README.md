# Introduction

⚾ The goal of this project is to build an ETL pipeline loading statcast data into a SQL Data Warehouse, which can then be loaded to Power BI for visualization and analysis. 

🐍 The data used in this project was obtained using the [PyBaseball](https://github.com/jldbc/pybaseball/tree/master/pybaseball) package in python, and the batter, pitcher, games and team info is available [source data](/source_data) folder in .csv files. The actual pitch by pitch data is not included in the folder as it is ~1Go and exceeds limits set by Github.

🗽 The project for the moment focuses only on New York Yankees' player statistics, batters or pitchers, and only when playing with the New York Yankees between 2015 and 2025. So the totals, averages or head-to-head data is a focus only on games played with the New York Yankees, and excludes games played with other teams, or outside of the 2015-2025 time window.

# Background

🏟️ Passionate about data, baseball and especially about the Yankees, I wanted to take the opportunity to join my two passions and use baseball statistics to practice and train my skills in building a proper data pipeline. This project expands on another project ([Yankee Overall Data Project](https://github.com/AlexisdlC/SQL_Yankees_Data/tree/main)) which focused on global statistics of Yankee players in Yankee games. With this project, I wanted to expand to larger datasets, for which pitch-by-pitch data is perfect.

### My main goals with this project:

* Build a database gathering pitch by pitch data from Yankees' batters and Yankees' pitchers perspective. 📊
* Build interactive dashboards to explore different aspects of the data. 📉
* Share my work with others.
* Develop my skills in data analytics tools, using larger datasets and build best practice habits.

### Who Am I?

My name is **Alexis** and I am a Physics PhD with a passion for Data and Baseball. I am also on Twitter behind the account @PinstripesFr, where I provide news, updates, visuals and analysis about the New York Yankees in French. Don't hesitate to contact me if you have questions, ideas or suggestions!

[![text](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/alexisdlc/)
[![text](https://img.shields.io/badge/X-000000?style=for-the-badge&logo=x&logoColor=white)](https://x.com/PinstripesFr)

# Tools I Used

To develop this project, I used three main tools:

* **Python**: I used Python in order to query the MLB API through the [PyBaseball](https://github.com/jldbc/pybaseball/tree/master/pybaseball) package, gather and pre-process the data which was then stored in CSV files. The code for this first step is not included in this repository.
* **SQL**: Then, I used SQL to build a simple data warehouse with multiple layers to load, process, transform and clean the tables. The code for this step is the core content of this repository.
* **Power BI**: Finally, I loaded the database final layer into PowerBI and used Power Query and Dax to build several pages of an interactive dashboard allowing users to explore the data in different ways. The Power BI file is provided in the repository.

# Data Warehouse Structure

The Data Warehouse was built in SQL using *SQL Server*, and in the *"Medaillon Structure"*.

## Bronze Layer

The **_Bronze Layer_** is used to load the unprocessed data from the source CSV files, with no transformations. The data is stored in tables using the *"Truncate and Insert"* method and no data model is applied at that stage.

## Silver Layer

The **_Silver Layer_** is used to store clean, processed and transformed data. The data is loaded using the *"Truncate and Insert"* method from the Bronze Layer. The data is stored in tables, cleaned, normalized, enriched and standardized.

## Gold Layer

The **_Gold Layer_** is the final layer of the Data Warehouse, with ready to use data for reporting and analytics. The data is stored in Views, with a Star Schema Model.

![Architecture of the model of the Gold Layer](/assets/DataMarts_Structure.drawio.png)

# Dashboards

The dashboards were built by connecting and loading the **_Gold Layer_** to **Power BI**. Power Query was used to transform some of the data (translating some terms to French for example) and DAX was used as well to build Measures allowing for a responsive experience.

The **Power BI** file is provided in the repository, and contains several pages. It can also be accessed using this link: [Dashboard hcange link](changelink)

## Batter Overview
![Screenshot of the Dashboard Page, "Batter Overview"](/assets/BatterOverviewv2.PNG)

This page of the dashboard presents an overview of Yankees Batter data and is composed of the following sections:

**!Reminder:!** The statistics presented are only for games in the period 2015-2025, and only for games played <ins>_with_</ins> the New York Yankees.

* **Selection Panel**: Panel with a slicer where a player can be selected, as well as slicers to focus on specific years (played with the Yankees), opponents and game type (regular season, playoffs, ...). The panel also presents overall data: Player Picture, Number of Games, At Bats,  Hits, Home Runs, Batting Average, Slugging and the Number of Pitches included in the analysis presented in the rest of the dashboard.
* **Pitch By Pitch Global Analysis**: Panel with a table presenting the performance of the player against each pitch type he faced. The metrics included in the panel are the total number of pitches of each type faced, the percentage it represents among the total of pitches faced by the batter, the number of plate appearances and at bats which ended against each pitch, the batting average and slugging against each pitch, the number of home runs hit against each pich, the whiff and strikeout rates against each pitch and the wOBA (weighted On Base Average) and Run Value of the batter against each pitch.
* **Pitch Focus**: Panel with a focus on one specific pitch. A slicer allows the selection of one pitch, and the table underneath presents the same metrics than what is shown in the _Pitch By Pitch Global Analysis_ but this time with a year by year breakdown. Another slicer is present to select one of the statistics, whose year over year evolution will be presented in the plot next to the table.
* **Situational Hitting**: Panel presenting several tables to analyse the performance of a batter in different situations. The statistic presented in the tables is selected with a slicer at the top of the panel, and it can also be refined by eventually selecting a pitch to focus on. There are three tables, breaking down different situations: number of outs, number of runners on base, runners in scoring position, with the Yankees leading or not, at home or away and the handedness of the pitcher.
* **Performance vs At Bat Count**: Panel containing a histogram, presenting the performance of the batter in different at bat counts, measured by the number of hits and several averages.

## Batter Head To Head
![Screenshot of the Dashboard Page, "Batter Head To Head"](/assets/BatterH2H.PNG)

This page of the dashboard presents head to head data of a Yankees' batter against a selected opposing pitcher (<ins>Note:</ins> it is possible to select multiple opposing pitcher to see the combined performance of one batter against multiple pitchers. However, only one batter can be selected). The page is compose of the following sections:

**!Reminder:!** The statistics presented are only for games in the period 2015-2025, and only for games the batter played <ins>_with_</ins> the New York Yankees.

* **Selection Panels**: Two panels at the top allow for the selection of a NYY batter and opposing pitcher(s).
* **Head to Head Data**: At the center of the page, a table summarizes the head to head data of tthe Yankees' batter against the selected pitcher(s). It shows the number of pitches, at bats, hits, home runs, strikeouts, run value and averages.
* **Pitch Strikzone Location**: Scatter plot showing the location of every pitch from the chosen pitcher(s) thrown to the selected batter. The color highlights the result of the pitch (ball, strike, hit in play), and hovering each point gives tooltips such as the velocity of the pitch thrown. Horizontal and vertical lines highight the location of the strikezone. The horizontal lines adjust depending on the selected batter.
* **Batted Ball In Play Location**: Scatter plot showing the landing location of each pitch which ended in a batted ball in play. The color indicates the result of the batted ball (field_out, single, home run, ...), and tool tips give informations such as the projected hit distance. A baseball field is used as a background to highlight the hit location within a ball park, but it is worth noting that the image used is one of a standard baseball field, and does not represent an accurate position, especially with regards to the outfield walls (you can note some home runs look like they are not out of the park, but this is simply due to the fact that the dimensions of the ballpark in the image differ from the actual ballpark it was hit in).

## Pitcher Overview
![Screenshot of the Dashboard Page, "Pitcher Overview"](/assets/PitcherOverview.PNG)
