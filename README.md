# Exploratory-Data-Analysis-in-SQL
This project focuses on performing exploratory data analysis on a dataset containing information about global layoffs. The aim is to uncover key patterns and trends in the data, providing insights into layoffs across various industries, companies, and regions.

Dataset
•	File: layoffs.csv
•	Columns:
 - company: Name of the company
 - location: Location of the company
 - industry: Industry of the company
 - total_laid_off: Total number of employees laid off
 - percentage_laid_off: Percentage of the workforce laid off
 - date: Date of the layoffs
 - stage: Stage of the company (Series A, Post-IPO)
 - country: Country of the company
 - funds_raised_millions: Total funds raised by the company in millions
   
Key Steps
1.	Data Loading: The dataset is loaded into a staging table for analysis.
2.	Initial Data Exploration:
  	- Determine the range of dates covered by the dataset.
    - Identify the maximum values for total layoffs and percentage laid off.
3.	Company Analysis:
  	- Identify companies that laid off 100% of their workforce.
    - List companies with the highest total number of layoffs.
4.	Industry and Country Analysis:
    - Identify industries most affected by layoffs.
    - Determine the countries with the highest total layoffs.
5.	Location Analysis: Aggregate total layoffs by location.
6.	Stage Analysis: Analyze layoffs based on the stage of the company.
