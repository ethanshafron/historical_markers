
packages <- c("leaflet", "rgdal", "dplyr", "tidyr", "sf", "readxl", "here")

if (length(setdiff(packages, rownames(installed.packages))) > 0){install.packages(setdiff(packages, rownames(installed.packages())))}


library(leaflet)
library(rgdal)
library(dplyr)
library(tidyr)
library(sf)
library(readxl)

setwd('../data')

markers <- st_read("input/S.C. Historical Marker Map.kml/doc.kml")

markers_htmlified <- markers %>%
  separate(Description, c('County',
                          'Marker name - front',
                          'Marker name - reverse',
                          'Coordinates',
                          'City',
                          'Address/Location',
                          'Text - front',
                          'Text - reverse',
                          'Sponsor',
                          'Year approved',
                          'Keywords',
                          'Time period'),
           sep = "(<br>)")
#write.xlsx(markers_htmlified, "markers_for_manual_cleaning.csv")

markers_htmlified <- markers_htmlified %>% mutate(ID = row_number())

good_geometry <- data.frame(markers_htmlified$geometry, markers_htmlified$ID)
names(good_geometry) <- c('geometry', 'ID')

good_name <- data.frame(gsub('(Marker Name - Front:)', '', markers_htmlified$`Marker name - front`), markers_htmlified$ID)
names(good_name) <- c('Marker name - front', 'ID')

for_merging <- st_as_sf(merge(good_geometry, good_name, by = "ID"))


markers_cleaned <- read_xlsx('input/markers_for_manual_cleaning_cleaned.xlsx')


markers_htmlified <- markers_cleaned


### Get rows that aren't messed up. Some entries didn't use the <br> as a sep so instead of going through a mess of regexes I filtered them out
#markers_htmlified <- markers_cleaned[grepl("Time Period:", markers_htmlified$`Time period`), ]

markers_htmlified$`Marker name - reverse` <- gsub('(Marker Name - Reverse:)', '',
                                                  markers_htmlified$`Marker name - reverse`)
markers_htmlified$`Marker name - front` <- gsub('(Marker Name - Front:)', '',
                                                markers_htmlified$`Marker name - front`)
markers_htmlified$City <- gsub('(City/Vicinity:)', '',
                               markers_htmlified$City)
markers_htmlified$`Address/Location` <- gsub('(Address/Location:)', '',
                                             markers_htmlified$`Address/Location`)
markers_htmlified$`Text - front` <- gsub('(Text - Front:)', '',
                                         markers_htmlified$`Text - front`)
markers_htmlified$`Text - reverse` <- gsub('(Text - Reverse:)', '',
                                           markers_htmlified$`Text - reverse`)
markers_htmlified$Sponsor <-  gsub('(Sponsor:)', '',
                                   markers_htmlified$Sponsor)
markers_htmlified$`Year approved` <- gsub('(Year Approved:)', '',
                                          markers_htmlified$`Year approved`)
markers_htmlified$`Time period` <- gsub('(Time Period:)', '',
                                        markers_htmlified$`Time period`)
markers_htmlified$County <- gsub('(County:)', '',
                                 markers_htmlified$County)

#names(markers_htmlified) <- make.names(names(markers_htmlified))

markers_jank_rmvd <- unite_(markers_htmlified, "Text", c("Text - front", "Text - reverse"), sep = " ")


markers_clean <- markers_jank_rmvd %>%
  dplyr::select(`Marker name - front`, Text, `Year approved`, Sponsor)

markers_clean <- st_as_sf(merge(markers_clean, for_merging, by = 'Marker name - front'))

st_write(markers_clean, "input/marker_data.geojson")

