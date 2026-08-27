# Student Form Responses --- Data Cleaning & Visualization

## Project Overview

This project focuses on **cleaning and visualizing student form
responses** collected from a questionnaire.

The dataset contains responses to **three main questions**. The
objective is to transform inconsistent raw responses into cleaner,
standardized categorical data and then use visualization techniques to
make the cleaned results easier to understand.

The project uses:

-   **Python**
-   **Pandas** for data manipulation and cleaning
-   **Seaborn** for statistical visualization
-   **Matplotlib** for plotting and chart customization

------------------------------------------------------------------------

## Project Goal

The main goals of the project are:

1.  Clean the raw student form responses.
2.  Produce visualizations from the cleaned data.


------------------------------------------------------------------------

## Dataset Structure

The original dataset contains **4 columns**:

  -----------------------------------------------------------------------
  Column                  Description             Data Type / Nature
  ----------------------- ----------------------- -----------------------
  Column 1                Timestamp               Date/time

  Column 2                What's your go-to drink Multi-answer
                          in the morning?         categorical response

  Column 3                How often do you check  Multi-answer
                          your phone before ...?  categorical response

  Column 4                What's your main mode   Text response
                          of transportation to    
                          the institute?          
  -----------------------------------------------------------------------

The first column represents the response timestamp, while the remaining
three columns contain the answers that are analyzed.

------------------------------------------------------------------------

# Data Cleaning

The cleaning process was applied differently depending on the type of
data stored in each column.

## Column 1 --- Timestamp

The timestamp column was **not modified**.

It was preserved as originally collected because it already represents a
valid date/time value and was not required for the main cleaning and
visualization process.

------------------------------------------------------------------------

## Column 2 --- Morning Drink

**Question:**\
*What's your go-to drink in the morning?*

The main cleaning operation applied to this column was:

-   Remove emojis from the responses.

The objective was to keep the actual answer while removing visual
characters that could create unnecessary variations in the categorical
values.

For example:

``` text
Tea ☕  →  Tea
Coffee ☕  →  Coffee
Water 💧  →  Water
```

------------------------------------------------------------------------

## Column 3 --- Phone Checking Habit

**Question:**\
*How often do you check your phone before ...?*

The cleaning process included:

-   Remove emojis.
-   Simplify the text where possible.
-   Keep the meaningful part of the response while removing unnecessary
    visual characters or wording.

For example:

``` text
As soon as I open my eyes 👀
        ↓
Immediately
```

The purpose was to make responses more consistent before counting and
visualizing them.

------------------------------------------------------------------------

# Column 4 --- Transportation

**Question:**\
*What's your main mode of transportation to the institute?*

This column required a more detailed cleaning process because it was a
**free-text response**, so students could enter the same category in
different forms.

Examples of possible variations include:

``` text
Bus
bus
BUS
buss
carpool
metro
...
```

The cleaning was performed in two phases.

------------------------------------------------------------------------

## Phase 1 --- Basic Cleaning

### 1. Filter one-word responses

Responses containing a single word were processed first.

### 2. Remove unnecessary special characters

Unnecessary special characters were removed to obtain cleaner
categorical values.

### 3. Standardize letter casing

Values were converted to **Title Case**.

``` text
bus  →  Bus
metro → Metro
```

### 4. Handle Arabic responses

Arabic responses were converted to empty strings and then removed.

The reason is that the project uses a standardized set of **English
transportation categories**, so Arabic responses were not treated as
valid standardized categories.

Numeric-looking or otherwise invalid responses were also not interpreted
as transportation categories.


### 5. Save the result

The cleaned result from this phase was stored as:

**`Clean-1`**

------------------------------------------------------------------------

# Phase 2 --- Multi-Word Responses

After cleaning the one-word responses, multi-word responses were
processed separately.

### 1. Filter multi-word responses

Responses containing more than one word were identified.

### 2. Identify allowed values

`value_counts()` was used on the cleaned one-word responses to determine
the standardized values already present in the dataset.

These values became the reference categories for processing multi-word
responses.

### 3. Split responses into words

Each multi-word response was separated into individual words.

### 4. Search for category matches

The extracted words were compared with the previously identified allowed
transportation values.

### 5. Apply matching rules

The following rules were used:

  -----------------------------------------------------------------------
  Condition                           Action
  ----------------------------------- -----------------------------------
  The statistical mode appears in the Replace the entire response with
  response                            the mode

  Another allowed value is found      Replace the response with the first
                                      matching allowed value

  No allowed value is found           Replace the response with `NaN`
  -----------------------------------------------------------------------

This approach converts different free-text expressions into a smaller
and more consistent set of transportation categories.

### 6. Save the result

The final cleaned transportation data was stored as:

**`Clean-2`**

------------------------------------------------------------------------

# Cleaning Workflow

The overall cleaning process can be summarized as:

``` text
Raw Form Responses
        ↓
Column Identification
        ↓
Column-Specific Cleaning
        ↓
Text Standardization
        ↓
Invalid / Unusable Response Handling
        ↓
Clean-1
        ↓
Multi-Word Transportation Processing
        ↓
Category Matching
        ↓
Clean-2
        ↓
Visualization
```

------------------------------------------------------------------------

# Data Visualization

After completing the cleaning process, the cleaned data was visualized
to understand the distribution of student responses.

The main visualization method used was the **bar chart**, which is
appropriate for categorical response data because it makes frequency
differences between categories easy to compare.

The visualizations were created using:

-   **Seaborn**
-   **Matplotlib**

## Visualization 1 --- Morning Drink

A bar chart was used to show the number of students selecting each
morning drink category.

The chart helps identify the most common drink choices and compare their
frequencies.

------------------------------------------------------------------------

## Visualization 2 --- Phone Checking Habit

A bar chart was used to display the frequency of the different
phone-checking responses after cleaning and simplifying the text.

This makes it easier to compare how students' responses are distributed
across the available categories.

------------------------------------------------------------------------

## Visualization 3 --- Transportation

A bar chart was also used for transportation responses.

However, transportation responses can contain more categories and some
categories may have very small counts. To keep the visualization
readable, a **group count** approach was used.

### Grouping Less-Frequent Values

Less-counted transportation categories were grouped into a single
category such as:

``` text
Other
```

This prevents the chart from becoming crowded with many low-frequency
categories while preserving the overall distribution.

Conceptually:

``` text
Bus       █████████████
Metro     ███████
Carpool   ████
Other     ███
```

The exact grouping threshold depends on the analysis implementation.

------------------------------------------------------------------------


# Project Workflow

``` text
1. Load the raw form-response dataset
              ↓
2. Inspect columns and response types
              ↓
3. Clean Column 2
   - Remove emojis
              ↓
4. Clean Column 3
   - Remove emojis
   - Simplify text
              ↓
5. Clean Column 4
   - Standardize one-word responses
   - Remove special characters
   - Handle invalid responses
              ↓
6. Create Clean-1
              ↓
7. Process multi-word transportation responses
   - Extract words
   - Compare with allowed categories
   - Apply matching rules
              ↓
8. Create Clean-2
              ↓
9. Count cleaned categorical values
              ↓
10. Create bar-chart visualizations
              ↓
11. Group low-frequency transportation values
              ↓
12. Interpret the cleaned data
```

