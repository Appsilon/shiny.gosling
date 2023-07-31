devtools::load_all()
port <- commandArgs(TRUE)
shiny::shinyAppDir(
  appDir = "../inst/examples/multiTrackApp",
  port = port = as.numeric(port)
)
