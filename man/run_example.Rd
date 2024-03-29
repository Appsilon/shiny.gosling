% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/examples.R
\name{run_example}
\alias{run_example}
\title{Runs a shiny.gosling example}
\usage{
run_example(example = NA)
}
\arguments{
\item{example}{A character indicating a valid example.}
}
\value{
A Shiny App is launched.
}
\description{
Runs a shiny.gosling example
}
\examples{
if (interactive()) {
  run_example("circularLinearWithBrush")
}
}
