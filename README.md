# Netflix Data Analysis Project

Welcome to Netflix Data Analytics, your comprehensive toolkit for exploring and analyzing Netflix movie and TV show data. This repository contains SQL queries and scripts designed to extract insights and perform data manipulation tasks on the Netflix dataset.

## Table of Contents

- [Overview](#overview)
- [Setup](#setup)
- [Data Description](#data-description)
- [Analysis Queries](#analysis-queries)
- [Usage](#usage)

## Overview

The project aims to analyze Netflix data to derive insights such as:

- Number of movies and TV shows per director.
- Countries with the highest number of comedy movies.
- Directors with the most movies released each year.
- Average duration of movies in each genre.
- Directors who have directed both horror and comedy movies.

The repository uses SQL queries to manipulate and analyze data stored in a SQL database.

## Setup

To reproduce the analysis or run the queries, follow these steps:

1. **Database Setup:**
   - Ensure PostgreSQL is Installed: Make sure PostgreSQL is installed on your local machine or server where you intend to host the database.
   - Create a Database: Create a database named netflix (or any preferred name) where you will import your Netflix data.

2. **Query Execution:**
   - Execute the SQL queries provided in the repository against your database.
   - Adjust connection strings (`engine`) and table names (`netflix_raw`, `netflix_genre`, etc.) as per your setup.

## Data Description

The Netflix dataset (`netflix_raw`) contains the following columns:

- `show_id`: Unique identifier for each show or movie.
- `type`: Type of content (Movie or TV Show).
- `title`: Title of the show or movie.
- `date_added`: Date when the title was added to Netflix.
- `release_year`: Year of release.
- `rating`: Content rating.
- `duration`: Duration of the movie or number of seasons for TV shows.
- `description`: Brief synopsis of the content.
- `listed_in`: Categories or genres listed for the title.
- `director`: Director(s) of the title.
- `country`: Country or countries where the content was produced.

## Analysis Queries

Here are some example queries used for analyzing the Netflix data:

1. Query to count movies and TV shows per director.
2. Query to find the country with the highest number of comedy movies.
3. Query to identify directors with the most movies released each year.
4. Query to calculate the average duration of movies in each genre.
5. Query to list directors who have directed both horror and comedy movies.

## Usage

- Clone this repository to your local machine.
- Set up your SQL database and import the Netflix dataset.
- Execute the SQL queries in your SQL environment.
  
## Conclusion
Netflix Data Analytics has provided insightful findings into various aspects of Netflix content using SQL queries and data analysis techniques. 
Below are the key insights derived from the analysis:

1. Key Insights and Visual Summaries Movies and TV Shows per Director

Insight: Analysis reveals the distribution of movies and TV shows among directors on Netflix.
Visual Summary: 
![graph_visualiser-1719501507590](https://github.com/piyushsharda2803/Netflix-Data-Analytics/assets/87650893/90a4503e-4fa4-4d80-882d-e5dea031068e)


2. Country with the Highest Number of Comedy Movies

Insight: Identified the country with the most comedy movies available on Netflix.
Visual Summary: 
![graph_visualiser-1719502134099](https://github.com/piyushsharda2803/Netflix-Data-Analytics/assets/87650893/7e5a9513-866f-430f-85e0-d515eed571a7)

3. Directors with the Most Movies Released Each Year

Insight: Highlighted directors with the highest number of movies released annually.
Visual Summary: 
![3](https://github.com/piyushsharda2803/Netflix-Data-Analytics/assets/87650893/cbb17790-7d2e-478a-8898-2e0505db2be1)



4. Average Duration of Movies in Each Genre

Insight: Calculated the average duration of movies across different genres.
Visual Summary: 
![4](https://github.com/piyushsharda2803/Netflix-Data-Analytics/assets/87650893/40b34588-a5f0-42a7-858c-50c209b8f3d0)


5. Directors Who Have Directed Both Horror and Comedy Movies

Insight: Listed directors who have contributed to both horror and comedy genres on Netflix.
Visual Summary:
![5](https://github.com/piyushsharda2803/Netflix-Data-Analytics/assets/87650893/4a9351f7-b685-4f81-ad06-9246a7e580e4)
