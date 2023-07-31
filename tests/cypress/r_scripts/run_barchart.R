devtools::load_all()
port <- commandArgs(TRUE)
shiny::runApp(
  appDir = "../inst/examples/barChart/app.R",
  port = as.numeric(port)
)
