# StepMania .ssc/.sm files extractor project

## Used technologies:
**C++, MySQL, Power BI, Excel (VBA), Python**

## Description:

The program, written in C++, extracts all necessary information from .ssc or .sm files into ChartsData.txt and NotesData.txt, structured for easy import into tools such as Excel, Power BI, SQL, and Python.
An .ssc/.sm file is used in the rhythm game "StepMania"; in short, each individual file stores all information about a song and its corresponding chart.

## What goals can I achieve with this program?

- automate the data extraction process for entire song packs
- easily identify and fix data issues
- gain valuable insights through data analysis, which can be used to improve balance and design in your own StepMania packs!

## How does the program work?
To make the extraction program work:
- Place your StepMania song packs (available at itgpacks.com) into the following folder path:
bin -> x64 -> Debug -> Packs -> example pack 1 -> song folder -> (place .ssc and/or .sm files here)
- Run the executable:
StepMania .ssc/.sm files extractor.exe (located in the bin -> x64 -> Debug folder)
- data will be saved in ChartsData.txt and NotesData.txt for future data cleaning and analysis!

## Folders:
- SQL Folder – .csv tables, data cleaning/data analysis queries and ready database in .sql files
- PowerBI visualization Folder – visualization .pbix file and example screenshots
- VBA Folder - .bas file with excel macro (works with ChartsData.txt data) and example
- Python Folder - .ipynb file with data cleaning and analysis in Python (Jupyter Notebook)