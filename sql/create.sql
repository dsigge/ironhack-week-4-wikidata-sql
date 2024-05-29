create table wikipedia_date (
month datetime primary key,
YEAR INT
);

alter table wikipedia_data_de add foreign key (month) references wikipedia_date(month);

alter table wikipedia_data_en add foreign key (month) references wikipedia_date(month);

alter table wikipedia_data_fr add foreign key (month) references wikipedia_date(month);

select FLOOR(AVG(wiki_views_de)) as avg_views_de  from wikipedia_data_de;
select FLOOR(AVG(wiki_views_en)) as avg_views_en  from wikipedia_data_en;
select FLOOR(AVG(wiki_views_fr)) as avg_views_fr  from wikipedia_data_fr;


-- User Engagement by Locale
-- Hypothesis: There is a significant difference in the number of active editors per year between the DE, EN, and FR locales on Wikipedia. EN being the highest and FR being the lowest.
-- Query to calculate the average number of active editors by locale per year

-- Note: We are using more than one table so we should use Alias. If we use single table no need to write Alias at the end.
SELECT 
    locale,
    year,
    ROUND(AVG(active_editors)) AS avg_active_editors
FROM (
    SELECT 
        'DE' AS locale, year, active_editors_de AS active_editors
    FROM wikipedia_data_de
    UNION ALL
    SELECT 
        'EN' AS locale, year, active_editors_en AS active_editors
    FROM wikipedia_data_en
    UNION ALL
    SELECT 
        'FR' AS locale, year, active_editors_fr AS active_editors
    FROM wikipedia_data_fr
) AS combined_data
GROUP BY locale, year
ORDER BY year desc;


-- Content Growth
-- Hypothesis: The number of new articles created each year has increased over the years across all locales.
-- Query to analyze the trend in new articles created over time
SELECT 
        year, 'DE' AS locale, SUM(total_pages_de) AS total_pages
FROM wikipedia_data_de
GROUP BY year
ORDER BY year desc;

SELECT 
        year, 'EN' AS locale, SUM(total_pages_en) AS total_pages
FROM wikipedia_data_en
GROUP BY year
ORDER BY year desc;

SELECT 
        year, 'FR' AS locale, SUM(total_pages_fr) AS total_pages
FROM wikipedia_data_fr
GROUP BY year
ORDER BY year desc;


-- Impact of Active Editors on Edits
-- Hypothesis: The number of edits made by active editors is positively correlated with the number of total edits.
-- Query to determine the relationship between active editors and total edits
SELECT 
    locale,
    SUM(active_editors) AS total_active_editors,
    SUM(edits) AS total_edits
FROM (
    SELECT 
        'DE' AS locale, active_editors_de AS active_editors, edits_de AS edits
    FROM wikipedia_data_de
    UNION ALL
    SELECT 
        'EN' AS locale, active_editors_en AS active_editors, edits_en AS edits
    FROM wikipedia_data_en
    UNION ALL
    SELECT 
        'FR' AS locale, active_editors_fr AS active_editors, edits_fr AS edits
    FROM wikipedia_data_fr
) AS combined_data
GROUP BY locale;


-- Impact of Edits on Page Views
-- Hypothesis: Pages that are frequently edited experience higher page views.
-- Query to examine the relationship between edits and page views
SELECT 
    locale,
    ROUND(AVG(edits)) AS avg_edits,
    ROUND(AVG(wiki_views)) AS avg_page_views
FROM (
    SELECT 
        'DE' AS locale, edits_de AS edits, wiki_views_de AS wiki_views
    FROM wikipedia_data_de
    UNION ALL
    SELECT 
        'EN' AS locale, edits_en AS edits, wiki_views_en AS wiki_views
    FROM wikipedia_data_en
    UNION ALL
    SELECT 
        'FR' AS locale, edits_fr AS edits, wiki_views_fr AS wiki_views
    FROM wikipedia_data_fr
) AS combined_data
GROUP BY locale;


-- Device Usage Patterns
-- Hypothesis: Wikipedia articles are widely viewed on Mobile devices than Desktop.
-- Query to compare the proportion of views on mobile devices to desktop devices
SELECT 
    'DE' AS locale,
    SUM(devices_de_mobile) AS mobile_views,
    SUM(devices_de_desktop) AS desktop_views
FROM wikipedia_data_de
UNION ALL
SELECT 
    'EN' AS locale,
    SUM(devices_en_mobile) AS mobile_views,
    SUM(devices_en_desktop) AS desktop_views
FROM wikipedia_data_en
UNION ALL
SELECT 
    'FR' AS locale,
    SUM(devices_fr_mobile) AS mobile_views,
    SUM(devices_fr_desktop) AS desktop_views
FROM wikipedia_data_fr;


-- Growth in Total Pages
-- Hypothesis: The number of total pages on Wikipedia has steadily increased over the years in each locale.
-- Query to assess the trend in the number of total pages over time
SELECT 
    year,
    locale,
    SUM(total_pages) AS total_pages
FROM (
    SELECT 
        year, 'DE' AS locale, total_pages_de AS total_pages
    FROM wikipedia_data_de
    UNION ALL
    SELECT 
        year, 'EN' AS locale, total_pages_en AS total_pages
    FROM wikipedia_data_en
    UNION ALL
    SELECT 
        year, 'FR' AS locale, total_pages_fr AS total_pages
    FROM wikipedia_data_fr
) AS combined_data
GROUP BY year, locale
ORDER BY year desc;


-- Query to calculate the average number of views per year by locale
SELECT 
    locale,
    year,
    ROUND(AVG(wiki_views)) AS avg_wiki_views
FROM (
    SELECT 
        'DE' AS locale, year, wiki_views_de AS wiki_views
    FROM wikipedia_data_de
    UNION ALL
    SELECT 
        'EN' AS locale, year, wiki_views_en AS wiki_views
    FROM wikipedia_data_en
    UNION ALL
    SELECT 
        'FR' AS locale, year, wiki_views_fr AS wiki_views
    FROM wikipedia_data_fr
) AS combined_data
GROUP BY locale, year
ORDER BY year desc;









