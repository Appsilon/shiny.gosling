devtools::load_all()
port <- commandArgs(TRUE)
shiny::runApp(
  appDir = "../inst/examples/<<<var_1>>>/app.R",
  port = as.numeric(port)
)
