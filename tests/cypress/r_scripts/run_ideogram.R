devtools::load_all()
port <- commandArgs(TRUE)
shiny::runApp(
  appDir = "../inst/examples/ideograms/app.R",
  port = as.numeric(port)
)
