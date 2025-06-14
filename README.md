# StepMania .ssc/.sm files extractor project

## Used technologies:
**C++, MySQL, Power BI, Excel (VBA), Python**

## Description:

The program, written in C++, extracts all necessary information from .ssc or .sm files into ChartsData.txt and NotesData.txt, structured for easy import into tools such as Excel, Power BI, SQL, and Python.

An .ssc/.sm file is used in the rhythm game "StepMania"; in short, each individual file stores all information about a song and its corresponding chart.

## What goals can I achieve with this program?

- automate the data extraction process for entire song packs
- easily identify and fix data issues or inconsistency
- gain valuable insights through data analysis, which can be used to improve balance and design in your own StepMania packs!

## How does the program work?
To make the extraction program work:
- Place your StepMania song packs (or custom ones made by other people available at [itgpacks.com](https://itgpacks.com)) into the following folder path:

bin -> x64 -> Debug -> Packs -> (PASTE SONG PACK HERE) -> Chart Folder -> (here .ssc/.sm and audio .ogg/mp3 files are located)
- Run the executable:

StepMania .ssc/.sm files extractor.exe (located in the bin -> x64 -> Debug folder)
- follow the instructions (you can display data in console or save data to .txt files or close program)
- if you decide to save, data will be saved in ChartsData.txt and NotesData.txt for future data cleaning and analysis!

## My own analysis project I made for around 45000 charts that were extracted in program mentioned above:
- Excel + VBA Folder - Contains a .bas file with excel macro (works with data copied from ChartsData.txt to excel) and some manual data cleaning of data
- MySQL Folder – Contains a Python script to import data into MySQL Workbench, .csv tables generated from the Excel/VBA cleaned data, data analysis SQL queries, and a ready-to-use database in .sql files
- Python Folder - Contains a Python file with data cleaning and analysis (using the same data as for MySQL) + code to generate an additional table useful for Power BI visualisation
- PowerBI visualisation Folder – Contains the Power BI .pbix visualization file using the fully prepared dataset (MySQL tables and additional table made in Python), along with example screenshots.