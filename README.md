# History, culture, place, and environment in the Congaree Biosphere Reserve

## About this repository

This repository was put together as part of a Geoscientists-in-the-parks summer internship in 2019. The primary goal of creating this was to make the heritage, history, and culture of Congaree Biosphere Reserve more accessible to all. The secondary goal was to produce a data product and framework for data visualization that are easily adaptable, reproducable, and able to be edited and viewed by anyone with a computer and an internet connection.

In this repository you will find:

* `edit_historical_markers.Rmd` - An R markdown document that allows a user to input new data into the historical markers dataset without manually altering a pre-existing file. When data is entered, it automatically appends it to the most recently updated data file, then creates a new file. Historical marker data is stored as a geojson (aka the most incredible data format for vector data that exists)

* `interactive_map.Rmd` - An R markdown document that creates the html map that we all know and love.

* `clean_kml_to_geojson.R` - A script that takes the raw kml with all of its bizarre fields, parses them with a smattering of regular expressions, then outputs the clean version to a geojson for your viewing pleasure. Please note that `line 32` was originally uncommented because some of the data had to be edited by hand. The manually edited data is then read back in in `line 45`.


## How to use this repository (if you're really unfamiliar with Git and R)

First, before anything - Download R and R studio. Follow the instructions [here](https://www.ics.uci.edu/~sternh/courses/210/InstallingRandRStudio.pdf). Whether you want to reproduce the map, edit the data, or add a whole bunch of functionality to the interactive map, you will need R. It's relatively easy to use and endlessly practical in day-to-day data tasks. To learn how to use R, see [Garrett Grolemund's Hands-on Programming with R](https://rstudio-education.github.io/hopr/), [Hadley Wickham's R for Data Science](https://r4ds.had.co.nz/), and for R markdown, check out [R Markdown: The definitive Guide from Yihui Xie, J. J. Allaire, and Garrett Grolemund](https://bookdown.org/yihui/rmarkdown/) (it really is definitive).

### If you want to edit the data or code

   1.	Download Git bash by following instructions [here](https://www.atlassian.com/git/tutorials/install-git) 
    
   -  Note: If you plan on trying to make changes to the html document permanently, you will actually need to learn how to use Git and R outside of this mini-tutorial
        
  2.	Make a github account at https://github.com/
    
  3.	Right click into a directory of your choosing – this will be where all the mapping data and code lives. Click “git bash here” from the little right click drop-down menu

  4. A little window should appear. Now you need to set up a username for git so that you can interact with github. Type the following commands and press enter: 
    
`git config --global user.name "firstname lastname"`
        
`git config –global user.email your email address`
        
 5. Confirm you set your username correctly by typing
    
`Git config --global user.name`
        
   -	It should print out your username
        
 6. Fork the whole historical marker repository into your directory by navigating to it in your browser and, while logged in to your account, clicking “fork this repository.” Then, type the following commands in sequence to get it onto your local machine:
    
`Git init`
        
`Git clone https://github.com/<your_user_name>/historical_markers.git`
        
 7.	Edit your new repository all you want. If you want to submit changes to our central biosphere data-managing authority, before you make any changes you should also type (again, in your git bash window in that directory):
    
`Git remote add origin https://github.com/<your_user_name>/historical_markers.git`
        
`Git add .`
        
8.	Then, in order for your changes to be solidified, you send them back to the remote repository. You first need to say “yeah, I like these changes,” and add a message to track your changes, then you send them by “pushing” them to the master branch of your remote repository.
    
`Git commit –m “I changed a bunch of stuff”`
        
`Git push origin master`

### If you just want to view the map, data, or code on your local drive
1.	Navigate to https://github.com/ethanshafron/historical_markers and click “download zip” under the “clone or download” menu. Unzip it and you are good to go.

2.	To add data in the edit_historical_marker_data.rmd file, just click “knit with parameters” under the “knit” dropdown menu, enter the parameters, and press “knit.” For the interactive_map.rmd file, just press “knit” to produce a map with the most recent data created.

    -	Note: If you change the directory structure of the repository, none of this will work.

