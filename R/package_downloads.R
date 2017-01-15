#' Download package counts
#'
#' Download package counts
#' 
#' \code{package_downloads} will download the number of downloads of the specified packages 
#' and also format the table nicely.
#'
#' @param packages packages to count downloads.
#'
#' @param when last_day, last_week or last_month. If this is given, then from and to are ignored.
#' 
#' @param from Start date, in yyyy-mm-dd format, or last-day. It is ignored if when is given.
#' 
#' @param to End date, in yyyy-mm-dd format, or last-day. It is ignored if when is given.
#' 
#' @return A data.table with the package downloads. Each package will be a column.
#'
#' @examples
#' package_downloads(c('tableHTML', 'RDota2', 'colf'), 'last-week')
#'
#' @export
package_downloads = function(packages = c('tableHTML', 'RDota2', 'colf'), 
                             when = 'last-month', 
                             from, 
                             to) {
 
 #get downloads
 downloads <- cranlogs::cran_downloads(packages, when, from, to)
 
 #convert to data.table
 data.table::setDT(downloads)
 
 #format table
 data.table::dcast(downloads, date ~ package, value.var = 'count')
 
}