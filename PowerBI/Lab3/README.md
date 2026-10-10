# Kickstarter Projects Dashboard (Power BI)

A portfolio-style Power BI project that analyzes Kickstarter projects using cleaned and modeled data from Kaggle exports for **2016** and **2018**.

## Project overview

This dashboard focuses on:
- Project volume and status distribution
- Funding behavior (goal vs pledged)
- Backer engagement
- Trend and segmentation analysis by time, category, currency, and geography

## Dashboard snapshots

> Screenshot references are included using the platform-provided image mapping.

### 1) Dashboard overview
![Dashboard Overview](image3)

### 2) Category and year analysis
![Category and Year Analysis](image2)

### 3) Model and measures view
![Model and Measures View](image1)

## Data source

- **Dataset:** Kickstarter Projects (Kaggle)
- **URL:** https://www.kaggle.com/kemical/kickstarter-projects
- **Files used:** Two CSV snapshots (2016 and 2018)

## Data preparation (Power Query / M)

1. Load the two CSV files.
2. Add a custom column that stores each row's source file/year (for example: `2016` or `ks-projects-201612`).
3. Append (union) both files into one consolidated table.
4. Rename the final table clearly (for example: `KSProjects`, `Projects`, or `AllProjects`).
5. Keep helper/source queries only as needed; hide or remove them from the model for clarity.

## Data model and measures

### Hierarchy
Create a hierarchy named **Project Hierarchy**:
1. Main Category
2. Category
3. Project Name

### Core measures
- **Number of Projects** (`# Projects`)
- **Number of Backers**
- **Total Pledged**
- **Total Goal**

### Supplementary measures (as shown in screenshots)
- **No. Successful Projects**
- **Successful Rate**
- **Sum of Pledged**

> Note: This README documents measure intent only and does not assume exact DAX formulas that are not explicitly provided.

## Visual design and report pages

Recommended visuals (measure-driven):
- Card: **Number of Projects**
- Card: **Number of Backers**
- Card: **Total Pledged**
- Card: **Total Goal**
- Chart: **# Projects by State**
- Drill-down chart: **# Projects by Project Hierarchy**
- Time chart: **# Projects by Launched (Year)**
- Comparison chart: **Total Pledged by Currency** or **Country**

Design guidelines used:
- Clear, meaningful chart titles
- Consistent color palette
- Readable spacing and alignment
- Slicers/filters for interactive exploration
- Measures preferred over raw columns in visuals

## Workflow (end-to-end)

1. **Ingestion** - Download 2016 and 2018 CSV files.
2. **Transformation** - Add source column, standardize fields, append data.
3. **Modeling** - Build `Project Hierarchy`, organize visible model objects.
4. **Measures** - Create core KPIs and supplementary success metrics.
5. **Visualization** - Build cards/charts with drill-down and filtering.
6. **Validation** - Verify counts/totals, check drill-down behavior, review slicer interactions.

## Setup and usage

1. Download the Kickstarter dataset from Kaggle.
2. Open the Power BI report file (if included in this folder/repository clone).
3. In **Power Query**, verify source paths and refresh the queries.
4. Confirm the appended table and source column are correctly populated.
5. Refresh the data model and visuals.
6. Interact with:
   - **Project Hierarchy** drill-down
   - Slicers/filters (for year, category, state, country, currency)

## Data dictionary (key fields)

| Field | Description |
|---|---|
| `ID` | Unique project identifier |
| `name` / Project Name | Project title |
| `main_category` | Top-level Kickstarter category |
| `category` | Sub-category under main category |
| `launched` | Project launch date/time |
| `deadline` | Project deadline date/time |
| `country` | Country code/location context |
| `currency` | Currency used in the campaign |
| `state` | Outcome/status (e.g., successful, failed, canceled) |
| `goal` | Funding goal amount |
| `pledged` | Amount pledged (native currency) |
| `usd_pledged` | Pledged amount normalized to USD |
| `backers` | Number of backers |
| `data source` | File/year origin tag from custom Power Query column |

## Results and analysis capabilities

This dashboard supports:
- Reviewing **status distribution** across project states
- Exploring **project trends over time** (launch year perspective)
- Comparing **categories and countries/currencies**
- Analyzing **pledged vs goal** behavior
- Inspecting **successful-project metrics** (count and rate)

## Limitations and reproducibility

- `pledged` values may differ by currency; compare with care against `usd_pledged`.
- Source data quality (missing/inconsistent labels) can affect outputs.
- Coverage is limited to the selected snapshots (2016 and 2018 files).
- To reproduce results, refresh using the same transformation logic (source column + append + model conventions).

## Repository contents

This repository currently contains multiple BI learning labs. For this Kickstarter dashboard area (`PowerBI/Lab3`):
- `README.md` (this documentation)

Depending on project updates, this folder may also include:
- Power BI report assets (for example `.pbix`)
- Supporting notebooks or exported data artifacts
- Local documentation assets/images

## Acknowledgements

- Kickstarter Projects dataset by **Kaggle contributor kemical**: https://www.kaggle.com/kemical/kickstarter-projects

## License and data-use note

This README does not assume a repository-wide license. Use the Kaggle dataset in accordance with its published terms and attribution requirements.
