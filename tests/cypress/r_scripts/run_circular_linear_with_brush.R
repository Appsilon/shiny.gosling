#!/usr/bin/Rscript
devtools::load_all()
port <- commandArgs(TRUE)
shiny::shinyAppDir(
    "../inst/examples/circularLinearWithBrush/",
    options = list(port = as.numeric(port))
)
