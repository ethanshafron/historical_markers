# History, culture, place, and environment in the Congaree Biosphere Reserve

## About this repository

This repository was put together as part of a Geoscientists-in-the-parks summer internship in 2019. The primary goal of creating this was to make the heritage, history, and culture of Congaree Biosphere Reserve more accessible to all. The secondary goal was to produce a data product and framework for data visualization that are easily adaptable, reproducable, and able to be edited and viewed by anyone with a computer and an internet connection.

In this repository you will find:

* `edit_historical_markers.Rmd` - An R markdown document that allows a user to input new data into the historical markers dataset without manually altering a pre-existing file. When data is entered, it automatically appends it to the most recently updated data file, then creates a new file. Historical marker data is stored as a geojson (aka the most incredible data format for vector data that exists)

* `interactive_map.Rmd` - An R markdown document that creates the html map that we all know and love.

* `clean_kml_to_geojson.R` - A script that takes the raw kml with all of its bizarre fields, parses them with a smattering of regular expressions, then outputs the clean version to a geojson for your viewing pleasure. Please note that `line 32` was originally uncommented because some of the data had to be edited by hand. The manually edited data is then read back in in `line 45`.


## How to use this repository (if you're really unfamiliar with Git and R)

1.	Download R and R studio. Follow the instructions [here](https://www.ics.uci.edu/~sternh/courses/210/InstallingRandRStudio.pdf)

### If you want to edit the data or code

   a.	Download Git bash by following instructions [here](https://www.atlassian.com/git/tutorials/install-git) 
    
   -  Note: If you plan on trying to make changes to the html document permanently, you will actually need to learn how to use Git and R outside of this mini-tutorial
        
   b.	Make a github account at https://github.com/
    
   c.	Right click into a directory of your choosing – this will be where all the mapping data and code lives. Click “git bash here” from the little right click drop-down menu

  d.	A little window should appear. Now you need to set up a username for git so that you can interact with github. Type the following commands and press enter: 
    
        i.	git config --global user.name "firstname lastname"
        
        ii.	git config –global user.email your email address
        
   e.	Confirm you set your username correctly by typing
    
        i.	Git config --global user.name
        
   -	It should print out your username
        
   f.	Fork the whole historical marker repository into your directory by navigating to it in your browser and, while logged in to your account, clicking “fork this repository.” Then, type the following commands in sequence to get it onto your local machine:
    
        i.	Git init
        
        ii.	Git clone https://github.com/<your_user_name>/historical_markers.git
        
   g.	Edit your new repository all you want. If you want to submit changes to our central biosphere data-managing authority, before you make any changes you should also type (again, in your git bash window in that directory):
    
        i.	Git remote add origin https://github.com/<your_user_name>/historical_markers.git
        
        ii.	Git add .
        
   h.	Then, in order for your changes to be solidified, you send them back to the remote repository. You first need to say “yeah, I like these changes,” and add a message to track your changes, then you send them by “pushing” them to the master branch of your remote repository.
    
        i.	Git commit –m “I changed a bunch of stuff”
        
        ii.	Git push origin master

### If you just want to view the map, data, or code on your local drive
3.	Navigate to https://github.com/ethanshafron/historical_markers and click “download zip” under the “clone or download” menu. Unzip it and you are good to go.

4.	To add data in the edit_historical_marker_data.rmd file, just click “knit with parameters” under the “knit” dropdown menu, enter the parameters, and press “knit.” For the interactive_map.rmd file, just press “knit” to produce a map with the most recent data created.

    -	Note: If you change the directory structure of the repository, none of this will work.

