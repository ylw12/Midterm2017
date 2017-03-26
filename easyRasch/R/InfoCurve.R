#' Plot the information curve
#'
#' Plot a test information curve to see how much information we gain about test takers 
#' for a broad range of abilities.
#'
#' @param raschObj An object of class Rasch
#' @param lower The lower limit of integration
#' @param upper The upper limit of integration
#'
#' @author Luwei Ying
#' @note This function is created to visualize the Fisher's Information
#' @examples
#' 
#' Trump <- new("Rasch", name = "Trump", a = -3:3, y = c(1, 1, 0, 0, 1, 0, 1))
#' InfoCurve(Trump)
#' @rdname InfoCurve
#' @aliases InfoCurve,ANY-method
#' @export
setGeneric(name="InfoCurve",
           def=function(raschObj, lower=-6, upper=6)
           {standardGeneric("InfoCurve")}
)

#' @export
setMethod(f="InfoCurve",
          definition=function(raschObj, lower=-6, upper=6){
            theta <- seq(lower, upper, by = 0.02)
            Info <- sapply(theta, function(x) sum(FisherTasch(raschObj, x)))
            plot(x = theta,
                 y = Info,
                 xlab = "Theta",
                 ylab = "The total Information",
                 main = paste("Information Cure for in testing", raschObj@name),
                 type = "l")
            #text(4, 0.8, paste("The sum of", expression(I_i* theta), cex = 0.8)
          }
)
