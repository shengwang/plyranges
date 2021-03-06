% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/class-GroupedRanges.R, R/dplyr-groups.R
\docType{class}
\name{GroupedGenomicRanges-class}
\alias{GroupedGenomicRanges-class}
\alias{GroupedIntegerRanges-class}
\alias{group_by-ranges}
\alias{group_by.GenomicRanges}
\alias{ungroup.GroupedGenomicRanges}
\alias{groups.GroupedGenomicRanges}
\alias{groups.GroupedIntegerRanges}
\title{Group a Ranges by one or more variables}
\usage{
\method{group_by}{GenomicRanges}(.data, ..., add = FALSE)

\method{ungroup}{GroupedGenomicRanges}(x, ...)

\method{groups}{GroupedGenomicRanges}(x)

\method{groups}{GroupedIntegerRanges}(x)
}
\arguments{
\item{.data}{a Ranges object.}

\item{...}{Variable names to group by. These can be either metadata columns
or the core variables of a Ranges.}

\item{add}{if \code{.data} is already a GroupedRanges object, when add = FALSE
the (default), \code{group_by()} will override existing groups. If add = TRUE,
additional groups will be added.}

\item{x}{a GroupedRanges object.}
}
\value{
The \code{group_by()} function will return a GroupedRanges object.
These have the same appearance as a regular Ranges object but with an
additional groups slot.
}
\description{
The function \code{group_by} takes a Ranges object and defines
groups by one or more variables. Operations are then performed on the Ranges
by their "group". \code{ungroup()} removes grouping.
}
\details{
\code{group_by()} creates a new object of class \code{GroupedGenomicRanges} if
the input is a \code{GRanges} object or an object of class \code{GroupedIntegerRanges}
if the input is a \code{IRanges} object. Both of these classes contain a slot
called \code{groups} corresponding to the names of grouping variables. They
also inherit from their parent classes, \code{Ranges} and \code{GenomicRanges}
respectively. \code{ungroup()} removes the grouping and will return
either a \code{GRanges} or \code{IRanges} object.
}
\section{Accessors}{

To return grouping variables on a grouped Ranges use either
\itemize{
\item{\code{groups(x)}}{Returns a list of symbols}
\item{\code{group_vars(x)}}{Returns a character vector}
}
}

\examples{
set.seed(100)
df <- data.frame(start = 1:10,
                 width = 5,
                 gc = runif(10),
                 cat = sample(letters[1:2], 10, replace = TRUE))
rng <- as_iranges(df)
rng_by_cat <- rng \%>\% group_by(cat)
# grouping does not change appearance or shape of Ranges
rng_by_cat
# a list of symbols
groups(rng_by_cat)
# ungroup removes any grouping
ungroup(rng_by_cat)
# group_by works best with other verbs
grng <- as_granges(df,
                   seqnames = "chr1",
                   strand = sample(c("+", "-"), size = 10, replace = TRUE))

grng_by_strand <- grng \%>\% group_by(strand)
grng_by_strand
# grouping with other verbs
grng_by_strand \%>\% summarise(gc = mean(gc))
grng_by_strand \%>\% filter(gc == min(gc))
grng_by_strand \%>\%
  ungroup() \%>\%
  summarise(gc = mean(gc))


}
