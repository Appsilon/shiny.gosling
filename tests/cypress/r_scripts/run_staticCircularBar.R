devtools::load_all()
port <- commandArgs(TRUE)
shiny::runApp(
  appDir = "../inst/examples/staticCircularBar/app.R",
  port = as.numeric(port)
)
