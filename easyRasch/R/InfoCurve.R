#' Plot the information curve
#'
#' Make a test information 
#'
#' @param raschObj An object of class Rasch
#' @param lower The lower limites of integration
#' @param upper The upper limites of integration
#' @param EAP whether to have EAP added to the plot
#'
#' @author Luwei Ying
#' @note This function is created to visualize the Rasch functions
#' @examples
#' 
#' Trump <- new("Rasch", name = "Trump", a = -3:3, y = c(1, 1, 0, 0, 1, 0, 1))
#' PlotRasch(Trump)
#' @rdname PlotRasch
#' @aliases PlotRasch,ANY-method
#' @export
setGeneric(name="PlotRasch",
           def=function(raschObj, lower=-6, upper=6, EAP=TRUE)
           {standardGeneric("PlotRasch")}
)

#' @export
setMethod(f="PlotRasch",
          definition=function(raschObj, lower=-6, upper=6, EAP=TRUE){
            theta <- seq(lower, upper, by = 0.001)
            prob <- sapply(theta, function(x) exp(x - raschObj@a)/(1 + exp(x - raschObj@a)))
            plot(NULL,
                 xlim = c(lower, upper),
                 ylim = c(0, 1),
                 xlab = "Theta",
                 ylab = "Probability of getting the question corect",
                 main = paste("Item Characteristic Curve for", raschObj@name))
            sapply(1:length(raschObj@a), 
                   function(x) lines(theta, prob[x, ], lty = 1))
            if (EAP) {
              abline(v = EAPRasch(raschObj, lower, upper), lty = 2)
              legend("bottomright",
                     legend = c("Each line for each question", "Posteriori value"),
                     lty = c(1, 2),
                     col = "black",
                     cex = .5)
            } else {
              legend("bottomright",
                     legend = "Each line for each question",
                     lty = 1,
                     col = "black",
                     cex = .5)
            }
          }
)