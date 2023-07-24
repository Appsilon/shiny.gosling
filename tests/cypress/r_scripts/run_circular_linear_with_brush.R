#!/usr/bin/Rscript
devtools::load_all()
shiny::shinyAppDir(
    "../inst/examples/circularLinearWithBrush/",
    options = list(port = 8888)
)
