devtools::load_all()
port <- commandArgs(TRUE)
shiny::runApp(
  appDir = "../inst/examples/circularVisualEncoding/app.R",
  port = as.numeric(port)
)
