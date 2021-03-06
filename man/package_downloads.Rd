% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/package_downloads.R
\name{package_downloads}
\alias{package_downloads}
\title{Download package counts}
\usage{
package_downloads(packages = c("tableHTML", "RDota2", "colf"),
  when = "last-month", from, to)
}
\arguments{
\item{packages}{packages to count downloads.}

\item{when}{last_day, last_week or last_month. If this is given, then from and to are ignored.}

\item{from}{Start date, in yyyy-mm-dd format, or last-day. It is ignored if when is given.}

\item{to}{End date, in yyyy-mm-dd format, or last-day. It is ignored if when is given.}
}
\value{
A data.table with the package downloads. Each package will be a column.
}
\description{
Download package counts
}
\details{
\code{package_downloads} will download the number of downloads of the specified packages 
and also format the table nicely.
}
\examples{
package_downloads(c('tableHTML', 'RDota2', 'colf'), 'last-week')

}

