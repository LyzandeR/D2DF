#' Replacing NAs with value
#'
#' Replacing NAs with value
#' 
#' \code{na2value} uses data.table::set to do the replacement which is efficient and 
#' does not copy-on-modify.
#'
#' @param DT data.frame or data.table.
#'
#' @param names The column names to check and replace NAs.
#' 
#' @param value The value to replace NAs with.
#' 
#' @return A data.table without NAs in the selected columns.
#'
#' @examples
#' df <- data.frame(a = c(1, 2, 3, NA, NA, 5), b = 1:6)
#' na2value(df)
#'
#' @export
na2value = function(DT, names = colnames(DT), value = 0) {
 
 #set to data.table
 data.table::setDT(DT)
 for (j in names) data.table::set(DT, which(is.na(DT[[j]])), j, value)
 
}