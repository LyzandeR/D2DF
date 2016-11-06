#' Removes Correlated Variables
#'
#' Removes Correlated Variables
#'
#' Calculates the correlation matrix using \code{cor}. Then for each variable checks the correlation
#' against all the other variables and removes the ones that are highly correlated according to the
#' set threshold. Repeats the process until there are no correlated variables left.
#'
#' @param data The data.frame to check for multicollinearity.
#' 
#' @param threshold Correlation threshold.
#'
#' @return The name of the correlated variables.
#'
#' @examples
#' remove_cor(mtcars)
#'
#' @export
remove_cor <- function(data, threshold = 0.8) {
 
 #check
 if (threshold < 0 | threshold > 1) stop('threshold must be between 0 and 1')
 
 #get correlation matrix
 correlations <- stats::cor(data)
 
 #initiate removed and i
 removed <- NULL
 i <- 1
 
 while (i < ncol(correlations)) {
  
  #calculate the indices of correlated
  indices <- which(abs(as.numeric(correlations[, i])) > threshold & 
                    abs(as.numeric(correlations[, i])) < 1)
  
  #the names of the variables to be removed
  to_remove <- row.names(correlations)[indices]
  
  #check if more are correlated
  if (length(to_remove) != 0L) {
   removed <- c(removed, to_remove)
   i <- 1
   correlations <- stats::cor(data[!names(data) %in% removed])
  } else {
   i <- i + 1
  }
  
 }
 
 #return
 removed
 
}