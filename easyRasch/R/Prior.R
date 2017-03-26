#' Calculate the prior
#'
#' Calculate the height of the normal curve, given our believe that the prior is 
#' always going to be a normal distribution
#'
#' @param theta A proposed value of theta.
#'
#' @return The output containing
#'  \item{h}{The height of the specified normal curve evaluated at theta} 
#' @author Luwei Ying
#' @note This helps to work in a Bayesian framework
#' @examples
#' 
#' theta <- 1
#' Prior(theta)
#' @rdname Prior
#' @aliases Prior,ANY-method
#' @export
setGeneric(name="Prior",
           def=function(theta)
           {standardGeneric("Prior")}
           )

#' @export
setMethod(f="Prior",
          definition=function(theta){
            # Biscally speaking, our prior function is the same as dnorm.
            h <- dnorm(x = theta, mean = 0, sd = 3)
            return(h)
          }
          )
