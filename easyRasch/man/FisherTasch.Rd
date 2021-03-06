% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Fisher.R
\name{FisherTasch}
\alias{FisherTasch}
\alias{FisherTasch,ANY-method}
\title{Getting the Fisher's Information}
\usage{
FisherTasch(raschObj, theta)
}
\arguments{
\item{raschObj}{An object of class Rasch}

\item{theta}{A proposed value of theta.}
}
\value{
The output containing
 \item{I}{The Fisher Information about a test taker}
}
\description{
Calculate the amount of Fisher's Information we gain about a test taker
}
\note{
A parameter showing how much we know about the test taker from the test
}
\examples{

Trump <- new("Rasch", name = "Trump", a = -3:3, y = c(1, 1, 0, 0, 1, 0, 1))
theta <- 1 
FisherTasch(Trump, theta)
}
\author{
Luwei Ying
}

