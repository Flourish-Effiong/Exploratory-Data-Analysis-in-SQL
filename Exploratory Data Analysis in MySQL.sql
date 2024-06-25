-- Exploratory Data Analysis

select *
from layoffs_staging2;

-- Looking at the years the datset covers
select min(`date`), max(`date`)
from layoffs_staging2;

-- Looking at Percentage to see how big these layoffs were
select max(total_laid_off), max(percentage_laid_off)
from layoffs_staging2;

-- Which companies had 1 which is basically 100 percent of they company laid off
select *
from layoffs_staging2
where percentage_laid_off = 1
order by funds_raised_millions;
-- These are mostly startups it looks like who all went out of business during this time


-- Companies with the most Total Layoffs
select company, sum(total_laid_off)
from layoffs_staging2
group by company
order by 2 desc
limit 10;

-- Industries with the most Total Layoffs
select industry, sum(total_laid_off)
from layoffs_staging2
group by industry
order by 2 desc
limit 5;

-- Countries with the most Total Layoffs
select country, sum(total_laid_off)
from layoffs_staging2
group by country
order by 2 desc
limit 10;

-- Total Layoffs by location
SELECT location, SUM(total_laid_off)
FROM world_layoffs.layoffs_staging2
GROUP BY location
ORDER BY 2 DESC
LIMIT 10;

-- Total layoffs in the past 3 years or in the dataset
select year(`date`), sum(total_laid_off)
from layoffs_staging2
group by year(`date`)
order by 1 desc;

-- Total layoffs by the stage of the companies
select stage, sum(total_laid_off)
from layoffs_staging2
group by stage
order by 2 desc;

-- Rolling Total of Layoffs Per Month
select substring(`date`,1,7) as `month`, sum(total_laid_off)
from layoffs_staging2
where substring(`date`,1,7) is not null
group by substring(`date`,1,7)
order by 1;

with rolling_total as
(
select substring(`date`,1,7) as `month`, sum(total_laid_off) as total_off
from layoffs_staging2
where substring(`date`,1,7) is not null
group by substring(`date`,1,7)
order by 1
)
select `month`, total_off, sum(total_off) over(order by `month` ) as rolling_total2
from rolling_total;

-- Total Layoffs of companies per year
select company, year(`date`),  sum(total_laid_off)
from layoffs_staging2
group by company, year(`date`)
order by 3;

-- Top 5 Companies with highest layoffs per year
with company_year (company, years, total_laid_off) as 
(
select company, year(`date`),  sum(total_laid_off)
from layoffs_staging2
group by company, year(`date`)
order by 3
), company_year_rank as 
(
select *, dense_rank() over(partition by years order by total_laid_off desc) as ranking
from company_year
where years is not null
)
select *
from company_year_rank
where ranking <= 5
;

-- Top 5 Industries with highest layoffs per year
with Industry_year (industry, years, total_laid_off) as 
(
select industry, year(`date`),  sum(total_laid_off)
from layoffs_staging2
group by industry, year(`date`)
order by 3
), industry_year_rank as 
(
select *, dense_rank() over(partition by years order by total_laid_off desc) as ranking
from industry_year
where years is not null
)
select *
from industry_year_rank
where ranking <= 5
;































































































