# ironhack-week-4-wikidata-sql
Collaboration between Jayashree &amp; Daniel on Week 4's challenge

## Scope
### Dataset: Wikimedia Statistics

### Business Framing:

**Overview:** Wikipedia is one of the world’s most visited websites and also the source for factual information for billions of people all over the world. While Wikipedia exists since twenty years, the user base is fluctuating constantly. Although one could think that Wikipedia is growing, which is the case for many of the world’s most spoken languages such as English, Spanish or French, the German language Wikipedia is actually shrinking throughout the past years. We want to investigate reasons for this anomaly. 

### What was analysed?:
1. User Engagement by Locale (yearly)
2. Content Growth
3. Impact of Active Editors on Edits
4. Impact of Edits on Page Views
5. Device Usage Patterns

Tl;Dr: What’s causing German Wikipedia to decrease in views YoY? <br>
**Hypothesis 1:** When we see the user engagement by Locale. We observe that There is a significant difference in the number of active editors per year between the DE, EN, and FR locales on Wikipedia. EN being the highest and FR being the lowest.<br>
![user_engagement_by_locale](images/user_engagement_by_locale.PNG)<br>
**Hypothesis 2:** The number of new articles created each year has increased over the years across all locales. But articles created in DE is less when compared to EN.<br>
![content_growth_de](images/content_growth_de.PNG)
![content_growth_en](images/content_growth_en.PNG)
![content_growth_fr](images/content_growth_fr.PNG)
<br>
<br>
**Hypothesis 3:** The number of edits made by active editors is positively correlated with the number of total edits. When observed the total number of active editors for DE is 6 times less when compared to active editors for EN and it is the same with total number of edits as well.<br>
![impact_of_active_editors](images/impact_of_active_editors.PNG)<br>
<br>
**Hypothesis 4:** More number of edits equate to more number of average page views. When compared DE has 6 times less average edits than EN and 8 times less average page views than EN.<br>
![impact_of_edits_on_page_views](images/impact_of_edits_on_page_views.PNG)<br>
<br>
**Hypothesis 5:** Overall users prefer mobile devices to use wikipedia compared to Desktops.<br>
![device_usage_patterns](images/device_usage_patterns.PNG)<br>
<br>

### ERD Diagram
![ERD Diagram](images/ERD.PNG 'Wikipedia ERD Diagram')


 **Project Planning:** Trello Board can be found [here](https://trello.com/b/NWCTnIAx/ironhack-week-4-jd) 


**NOTES:**

* Notebooks files can be found in `notebook` folder
* SQL files can be found in `sql` folder
* Image files can be found in `images` folder
* Slides can be found in `slides` folder