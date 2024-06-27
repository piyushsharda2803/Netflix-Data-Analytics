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
   - Ensure you have a SQL database (e.g., SQL Server, PostgreSQL) set up.
   - Import the Netflix data into your database. Example:
     ```sql
     -- Example for SQL Server
     BULK INSERT netflix_raw FROM 'path_to_csv_file/netflix_titles.csv' WITH (FORMAT='CSV', FIRSTROW=2);
     ```

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
