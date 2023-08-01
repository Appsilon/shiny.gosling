devtools::load_all()
port <- commandArgs(TRUE)
shiny::shinyAppDir(
  appDir = "../inst/examples/multiTrackApp",
  port = as.numeric(port)
)
