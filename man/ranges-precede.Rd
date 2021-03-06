% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ranges-join-precede.R
\name{join_precede}
\alias{join_precede}
\alias{join_precede_right}
\alias{join_precede_downstream}
\title{Find preceding Ranges}
\usage{
join_precede(x, y, suffix = c(".x", ".y"))

join_precede_right(x, y, suffix = c(".x", ".y"))

join_precede_downstream(x, y, suffix = c(".x", ".y"))
}
\arguments{
\item{x, y}{Ranges objects, which ranges in x precede those in y.}

\item{suffix}{A character vector of length two used to identify
metadata columns coming from x and y.}
}
\value{
A Ranges object corresponding to the ranges in \code{y} that are
preceded by the ranges in \code{x}, all metadata is copied over from the
right-hand side ranges \code{y}.
}
\description{
Find preceding Ranges
}
\details{
By default \code{join_precede} will return the ranges
in x that come before the ranges in y and ignore any strand information.
The function \code{join_precede_right} will find all ranges in y
that are on the right-hand side of the ranges in x ignoring any strand
information. Finally, \code{join_precede_downstream} will find all ranges in y
that are that are downstream of the ranges in x. On the positive strand this
will result in ranges in y that are right of those in x and on the negative
strand it will result in ranges in y that are left of those in x.
}
\examples{
subject <- data.frame(start = c(5,10, 15,20), width = 5, gc = runif(4)) \%>\%
             as_iranges()
query <- data.frame(start = 2:6, width = 3:7, label = letters[1:5]) \%>\%
             as_iranges()

join_precede(query, subject)

query  <- data.frame(seqnames = "chr1",
               start = c(11,101),
               end = c(21, 200),
               name = c("a1", "a2"),
               strand = c("+", "-"),
               score = c(1,2)) \%>\%
           as_granges()
subject <- data.frame(seqnames = "chr1",
                      strand = c("+", "-", "+", "-"),
                      start = c(21,91,101,201),
                      end = c(30,101,110,210),
                      name = paste0("b", 1:4),
                      score = 1:4) \%>\%
                   as_granges()

join_precede(query, subject)
join_precede_right(query, subject)
join_precede_downstream(query, subject)
}
