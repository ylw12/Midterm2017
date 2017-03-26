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
check(current.code)

# --------------Code for reference------------------

## Here is some example code showing how each function works.
getSquares
getMethod(getSquares, "Squares")
getMethod(getSquares, "AllSquares")
getMethod(allSquares)

## Let's try it out
x<-c(1,2)
y<-c(3,4)
allObj <- allSquares(x, y)
allObj
getSquares(allObj)

## Moving between classes
addObj <- addSquares(x,y)
addObj
as(object=addObj, Class="AllSquares")



