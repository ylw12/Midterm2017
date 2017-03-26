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

# -------------- Test the Functions in the Package ------------------

# Define two respondents
Trump <- new("Rasch", name = "Trump", a = -3:3, y = c(1, 1, 0, 0, 1, 0, 1))
Box <- new("Rasch", name = "Box", a = rnorm(5, mean = 1, sd = 1), y = c( 0, 0, 0, 1, 0))

# This will not pass the validity check and throw an error
Smith <- new("Rasch", name = "Box", a = rnorm(8, mean = 1, sd = 1), y = c( 1, 0, 0, 1, 0))

# Test the probability function
ProbRasch(Trump, 9)
ProbRasch(Box, 2)

# Test the Likelihood function
LikelihoodRasch(Box, 3.3)

# Test the Prior function
Prior(3.3)

# Test the EAP function
EAPRasch(Box, -4, 5)

# Test the Plot function
PlotRasch(Box)
PlotRasch(Trump, lower=-4, upper=7, EAP=FALSE)

# Test the Fisher's Information function.
FisherTasch(Box, 3.3)

# Test the Information Curve function.
InfoCurve(Trump)
