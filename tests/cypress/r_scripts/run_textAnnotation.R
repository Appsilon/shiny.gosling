devtools::load_all()
port <- commandArgs(TRUE)
shiny::runApp(
  appDir = "../inst/examples/textAnnotation/app.R",
  port = as.numeric(port)
)
