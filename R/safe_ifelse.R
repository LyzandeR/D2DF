#' A safe version of ifelse that preserves class
#'
#' A safe version of ifelse that preserves class
#' 
#' A safe version of ifelse that preserves class. Taken from 
#' \url{http://stackoverflow.com/questions/6668963/how-to-prevent-ifelse-from-turning-date-objects-into-numeric-objects}
#'
#' @param test An object which can be coerced to logical mode.
#'
#' @param yes return values for true elements of test.
#'  
#' @param no	return values for false elements of test.
#' 
#' @return Same as ifelse but preserving the class (works with dates).
#'
#' @examples
#' dates <- as.Date(c('2011-01-01', '2011-01-02', '2011-01-03', '2011-01-04', '2011-01-05'))
#' safe_ifelse(dates == '2011-01-01', dates - 1, dates)
#'
#' @export
safe_ifelse <- function(test, yes, no) { 
 
 #save class
 class.y <- class(yes)
 
 #ifelse
 X <- ifelse(test, yes, no)
 
 #convert back to class
 class(X) <-class.y 
 
 #return
 X

}