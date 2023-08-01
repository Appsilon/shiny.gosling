devtools::load_all()
port <- commandArgs(TRUE)
shiny::runApp(
  appDir = "../inst/examples/structuralVariant/app.R",
  port = as.numeric(port)
)
