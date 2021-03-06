% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/io-bigwig.R
\name{write_bigwig}
\alias{write_bigwig}
\title{Write a BigWig file}
\usage{
write_bigwig(x, file)
}
\arguments{
\item{x}{A GRanges object}

\item{file}{File name, URL or connection specifying a file to write x to.
Compressed files with extensions such as '.gz' are handled
automatically.}
}
\value{
The write functions return a BigWigFile invisibly
}
\description{
This is a lightweight wrapper to the export family
of functions defined in \pkg{rtracklayer}.
}
\examples{
\dontrun{
 if (.Platform$OS.type != "windows") {
  test_path <- system.file("tests", package = "rtracklayer")
  bw_file <- file.path(test_path, "test.bw")
  gr <- read_bigwig(bw_file)
  gr
  bw_out <- file.path(tempdir(), "test_out.bw")
  write_bigwig(gr ,bw_out)
  read_bigwig(bw_out)
 }
}
}
\seealso{
\code{rtracklayer::\link[rtracklayer:BigWigFile-class]{BigWigFile()}}
}
