devtools::load_all()
port <- commandArgs(TRUE)
shiny::runApp(
  appDir = "../inst/examples/lineChart/app.R",
  port = as.numeric(port)
)
