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




