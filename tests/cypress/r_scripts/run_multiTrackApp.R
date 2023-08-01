devtools::load_all()
port <- commandArgs(TRUE)
shiny::shinyAppDir(
  appDir = "../inst/examples/multiTrackApp",
  options = list(port = as.numeric(port))
)
