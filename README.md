# History, culture, place, and environment in the Congaree Biosphere Reserve

This repository was put together as part of a Geoscientists-in-the-parks summer internship in 2019. The primary goal of creating this was to make the heritage, history, and culture of Congaree Biosphere Reserve more accessible to all. The secondary goal was to produce a data product and framework for data visualization that are easily adaptable, reproducable, and able to be edited and viewed by anyone with a computer and an internet connection.


In this repository you will find:

* `edit_historical_markers.Rmd` - An R markdown document that allows a user to input new data into the historical markers dataset without manually altering a pre-existing file. When data is entered, it automatically appends it to the most recently updated data file, then creates a new file. Historical marker data is stored as a geojson (aka the most incredible data format for vector data that exists)

*`interactive_map.Rmd` - An R markdown document that creates the html map that we all know and love.

* `clean_kml_to_geojson.R` - A script that takes the raw kml with all of its bizarre fields, parses them with a smattering of regular expressions, then outputs the clean version to a geojson for your viewing pleasure. Please note that `line 32` was originally uncommented because some of the data had to be edited by hand. The manually edited data is then read back in in `line 45`.
