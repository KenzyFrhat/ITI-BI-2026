# Kickstarter Dashboard (Power BI)

## Overview
This dashboard summarizes Kickstarter campaign performance and helps track funding outcomes, category trends, and campaign timing.

## Screenshots

![image3](image3)
![image2](image2)
![image1](image1)

## Data source
- **Dataset:** Kickstarter Projects (Kaggle)
- **Attribution/Link:** https://www.kaggle.com/datasets/kemical/kickstarter-projects

## Data preparation and model (summary)
- Cleaned common quality issues (missing values and inconsistent data types).
- Prepared campaign date fields for time-based analysis.
- Used a single analytical model to support campaign-level, category-level, and time-level reporting.

## Key measures and visuals
- **Measures:** total pledged, funding goal, success rate, number of campaigns.
- **Visuals:** KPI cards, category comparison charts, time trend charts, and status breakdowns.

## Limitations
- Results depend on the quality and coverage of the source dataset.
- Currency, dates, and campaign status values may require normalization for cross-country comparisons.
- Insights are descriptive and should be validated before decision-making.

## Data dictionary (concise)
- `name`: campaign title.
- `category` / `main_category`: project classification.
- `goal`: target funding amount.
- `pledged`: pledged amount.
- `state`: campaign outcome (for example: successful, failed, canceled).
- `launched` / `deadline`: campaign start and end timestamps.

