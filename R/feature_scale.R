#' Scales vector between 0 and 1
#'
#' Scales vector between 0 and 1
#'
#' Feature scaling is a technique used to transform a set of values between 0 and 1.
#'
#' @param x The atomic vector.
#' 
#' @return The scaled vector.
#'
#' @examples
#' feature_scale(0:10)
#'
#' @export
feature_scale <- function(x) {
 
 #check
 if (!is.atomic(x) | !is.numeric(x)) stop('x needs to be a numeric atomic vector.')
 
 (x - min(x)) / (max(x) - min(x))
 
}