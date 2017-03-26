#' Getting the probabilities
#'
#' Finds the the probabilities that a test taker get each question right
#'
#' @param raschObj An object of class Rasch
#' @param theta A proposed value of theta.
#'
#' @return The output containing
#'  \item{P}{A vetor representing the probability of answering the question correctly} 
#'  \item{PQ}{A vetor representing P if the answer is correct and Q if wrong}
#' @author Luwei Ying
#' @note This function is created for later calculation
#' @examples
#' 
#' Trump <- new("Rasch", name = "Trump", a = -3:3, y = c(1, 1, 0, 0, 1, 0, 1))
#' theta <- 1 
#' ProbRasch(Trump, theta)
#' @seealso \code{\link{Rasch_class}}
#' @rdname ProbRasch
#' @aliases ProbRasch,ANY-method
#' @export
setGeneric(name="ProbRasch",
           def=function(raschObj, theta)
           {standardGeneric("ProbRasch")}
)

#' @export
setMethod(f="ProbRasch",
          definition=function(raschObj, theta){
            P <- exp(theta - raschObj@a)/(1 + exp(theta - raschObj@a))
            Q <- 1-P
            PQ <- NULL
            for (i in 1:length(raschObj@y)){
             if (raschObj@y[i] == 1){
               PQ[i] <- P[i]
             } else {
               PQ[i] <- Q[i]
             }
            }
            return(cbind(P, PQ))
          }
)

