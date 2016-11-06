#' A vectorised version of switch
#'
#' A vectorised version of switch
#'
#' @param EXPR An expression evaluating to a number or a character string.
#'
#' @param type \code{switchv} uses \code{vapply} so this is the type returned from each iteration.
#' Same as FUN.VALUE argument in \code{vapply}.
#'  
#' @param ...	the list of alternatives.
#' 
#' @return Same as \code{switch} but used on a vector.
#'
#' @examples
#' myvec <- c('apple', 'cabbage')
#' switchv(myvec, 
#'         apple = 'fruit',
#'         cabbage = 'veggetable')
#'
#' @export
switchv <- function(EXPR, type = character(1), ...) {
 
 #for each value in EXPR do the mapping
 unname(vapply(EXPR, function(y) switch(y, ...), FUN.VALUE = type))

}