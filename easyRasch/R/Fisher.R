#' Getting the Fisher's Information
#'
#' Calculate the amount of Fisher's Information we gain about a test taker
#'
#' @param raschObj An object of class Rasch
#' @param theta A proposed value of theta.
#'
#' @return The output containing
#'  \item{I}{The Fisher Information about a test taker}
#' @author Luwei Ying
#' @note A parameter showing how much we know about the test taker from the test
#' @examples
#' 
#' Trump <- new("Rasch", name = "Trump", a = -3:3, y = c(1, 1, 0, 0, 1, 0, 1))
#' theta <- 1 
#' FisherTasch(Trump, theta)
#' @rdname FisherTasch
#' @aliases FisherTasch,ANY-method
#' @export
setGeneric(name="FisherTasch",
           def=function(raschObj, theta)
           {standardGeneric("FisherTasch")}
)

#' @export
setMethod(f="FisherTasch",
          definition=function(raschObj, theta){
            P <- exp(theta - raschObj@a)/(1 + exp(theta - raschObj@a))
            Q <- 1-P
            I <- P*Q
            return(I)
          }
)