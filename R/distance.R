#' distance
#'
#' Calculates the distance between two vectors 
#'
#' Calculates the distance between two vectors. Euclidean, manhattan, canberra and minkowski are
#' supported.
#'
#' @param x The x vector.
#' 
#' @param y The y vector.
#' 
#' @param data If data is provided x and y will be taken from data.
#' 
#' @param method One of euclidean, manhattan, canberra, minkowski. 
#' 
#' @param p Only used if method is minkowski.
#'
#' @return The distance between x and y.
#'
#' @examples
#' set.seed(10)
#' distance(runif(100), runif(100))
#'
#' @export
distance <- function(x, y, data = NULL, 
                     method = c('euclidean', 'manhattan', 'canberra', 'minkowski'), p = 2L) {
  
 #get x and y from data
 if (!is.null(data)) {
  
  #convert to data.frame if not
  data <- as.data.frame(data)
  x <- data[[as.character(substitute(x))]]
  y <- data[[as.character(substitute(y))]]
   
 }

 #checks
 method <- match.arg(method)
 if (length(x) != length(y)) stop('x and y need to have the same length')
 if (is.factor(x)) x <- as.numeric(x)
 if (is.factor(y)) y <- as.numeric(y)
 if (!is.numeric(x) | !is.numeric(y)) stop('x and y need to be numeric')
 if (method != 'minkowski') p <- 2
 if (p < 1) stop('P cannot be less than 1')
 
 #NA handling
 temp <- stats::na.omit(cbind(x, y))
 x    <- temp[, 'x']
 y    <- temp[, 'y']

 #calculate distance
 i <-  switch(method,
              manhattan = 1L,
              euclidean = 2L,
              canberra  = 0L,
              minkowski = p)
 
 if (i != 0L) {
   sum(abs(x - y)^i) ^ (1 / i)
 }else{
   sum(abs(x - y) / (abs(x) + abs(y)))
 }
 
}


