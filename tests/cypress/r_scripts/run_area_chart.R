devtools::load_all()
port <- commandArgs(TRUE)
shiny::runApp(
  appDir = "../inst/examples/areaChart/app.R",
  port = as.numeric(port)
)
