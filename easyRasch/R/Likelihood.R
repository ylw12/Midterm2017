#' Calculate the likelihood
#'
#' Calculate the ``likelihood" of a proposed value, theta, given the responses we have 
#' observed from the test taker
#'
#' @param raschObj An object of class Rasch
#' @param theta A proposed value of theta.
#'
#' @return The output containing
#'  \item{Likelihood}{The joint probability of all of the observed responses given our guess of theta} 
#' @author Luwei Ying
#' @note This is to calculate the ``likelihood" of a proposed value
#' @examples
#' 
#' Trump <- new("Rasch", name = "Trump", a = -3:3, y = c(1, 1, 0, 0, 1, 0, 1))
#' theta <- 1
#' LikelihoodRasch(Trump, theta)
#' @rdname LikelihoodRasch
#' @aliases LikelihoodRasch,ANY-method
#' @export
setGeneric(name="LikelihoodRasch",
           def=function(raschObj, theta)
           {standardGeneric("LikelihoodRasch")}
           )

#' @export
setMethod(f="LikelihoodRasch",
          definition=function(raschObj, theta){
            # The probability of getting right
            P <- exp(theta - raschObj@a)/(1 + exp(theta - raschObj@a))
            # The probability of getting wrong
            Q <- 1-P
            # The joint probability
            Likelihood <- prod(P^raschObj@y * Q^(1-raschObj@y))
            return(Likelihood)
          }
          )
