#' Calculate the expected a posteriori value
#'
#' Calculate the expected a posteriori value for theta, given the likelihood function and the prior
#' function
#'
#' @param raschObj An object of class Rasch
#' @param lower The lower limites of integration
#' @param upper The upper limites of integration
#'
#' @return The output containing
#'  \item{theta_hat}{expected a posteriori value for theta} 
#' @author Luwei Ying
#' @note This helps to work in a Bayesian framework
#' @examples
#' 
#' Trump <- new("Rasch", name = "Trump", a = -3:3, y = c(1, 1, 0, 0, 1, 0, 1))
#' EAPRasch(Trump, -5, 5)
#' @rdname EAPRasch
#' @aliases EAPRasch,ANY-method
#' @export
setGeneric(name="EAPRasch",
           def=function(raschObj, lower=-6, upper=6)
           {standardGeneric("EAPRasch")}
           )

#' @export
setMethod(f="EAPRasch",
          definition=function(raschObj, lower=-6, upper=6){
            int <- integrate(f = function(x) LikelihoodRasch(raschObj, x)*Prior(x),
                              lower = lower,
                              upper = upper)
            return(int["value"])
          }
          )
