####################################################
## Midterm2017 To make an S4 Package named easyRasch
## Luwei YING 
####################################################

# Load libraries and set working directory
library(devtools)
library(roxygen2)
setwd("~/Desktop/ASP/Midterm2017")

# Create the easyRasch package in this folder.
create("easyRasch")

# Now, go to the R folder to create the *.R files.

# Run this every time when I update the code
current.code <- as.package("easyRasch")
load_all(current.code)
document(current.code)

# --------------Code for reference------------------

PlotRasch(Trump)
Trump <- new("Rasch", name = "Trump", a = -3:3, y = c(1, 1, 0, 0, 1, 0, 1))
Box <- new("Rasch", name = "Box", a = rnorm(5, mean = 1, sd = 1), y = c( 0, 0, 0, 1, 0))
PlotRasch(Box, -4, 7)
