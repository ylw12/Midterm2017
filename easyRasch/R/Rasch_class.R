#' An object representing a student who has completed an exam
#' 
#' Object of class \code{Rasch}
#'
#' 
#' An object of the class ``Rasch" has the following slots:
#' \itemize{
#' \item \code{name} The name of the test taker
#' \item \code{a} A vector of question-item parameters
#' \item \code{y} A vector of answers 
#' }
#'
#' @author Luwei Ying: \email{luwei.ying@@wustl.edu}
#' @aliases Rasch-class initialize,Rasch-method 
#' @rdname Rasch
#' @export
setClass(Class="Rasch",
         representation = representation(
           name = "character",
           a = "numeric",
           y = "numeric"
           )
         )

#' @export
setMethod("initialize", "Rasch", 
          function(.Object, ...){
            value=callNextMethod()
            return(value)
          }
          ) 

#' @export
setValidity("Rasch", 
            function(object){
              if(sum(is.na(object@a))){
                return("The question-item parameter, a, contains NAs")
              }
              if(sum(is.na(object@y))){
                return("The answer vector, y, contains NAs")
              }
              if(length(object@a) != length(object@y)){
                return("a and y must be of the same length")
              }
            }
           )

