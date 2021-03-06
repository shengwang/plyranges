% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ranges-add-distance.R
\name{add_nearest_distance}
\alias{add_nearest_distance}
\alias{add_nearest_distance_left}
\alias{add_nearest_distance_right}
\alias{add_nearest_distance_upstream}
\alias{add_nearest_distance_downstream}
\title{Add distance to nearest neighbours between two Ranges objects}
\usage{
add_nearest_distance(x, y = x, name = "distance")

add_nearest_distance_left(x, y = x, name = "distance")

add_nearest_distance_right(x, y = x, name = "distance")

add_nearest_distance_upstream(x, y = x, name = "distance")

add_nearest_distance_downstream(x, y = x, name = "distance")
}
\arguments{
\item{x}{The query ranges}

\item{y}{the subject ranges within which the nearest ranges are found.
If missing, query ranges are used as the subject.}

\item{name}{column name to create containing distance values}
}
\value{
ranges in \code{x} with additional column containing the distance to the
nearest range in \code{y}.
}
\description{
Appends distance to nearest subject range to query ranges similar to setting
\code{distance} in \code{join_nearest_}. Distance is set to \code{NA} for features with no
nearest feature by the selected nearest metric.
}
\details{
By default \code{add_nearest_distance} will find arbitrary nearest
neighbours in either direction and ignore any strand information.
The \code{add_nearest_distance_left} and \code{add_nearest_distance_right}  methods
will find arbitrary nearest neighbour ranges on x that are left/right of
those on y and ignore any strand information.

The \code{add_nearest_distance_upstream} method will find arbitrary nearest
neighbour ranges on x that are upstream of those on y. This takes into
account strandedness of the ranges.
On the positive strand nearest upstream will be on the
left and on the negative strand nearest upstream will be on the right.

The \code{add_nearest_distance_downstream} method will find arbitrary nearest
neighbour ranges on x that are upstream of those on y. This takes into
account strandedness of the ranges. On the positive strand nearest downstream
will be on the right and on the negative strand nearest upstream will be on
the left.
}
\examples{
query <- data.frame(start = c(5,10, 15,20),
                   width = 5,
                   gc = runif(4)) \%>\%
             as_iranges()
subject <- data.frame(start = c(2:6, 24),
                      width = 3:8,
                      label = letters[1:6]) \%>\%
             as_iranges()
             
add_nearest_distance(query, subject)
add_nearest_distance_left(query, subject)
add_nearest_distance_left(query)
}
\seealso{
\code{\link{join_nearest}}
}
