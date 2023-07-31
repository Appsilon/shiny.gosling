devtools::load_all()
port <- commandArgs(TRUE)
shiny::runApp(
  appDir = "../inst/examples/ruleMarks/app.R",
  port = port = as.numeric(port)
)
