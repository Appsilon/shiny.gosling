devtools::load_all()
port <- commandArgs(TRUE)
shiny::runApp(
  appDir = "../inst/examples/textMarks/app.R",
  port = as.numeric(port)
)
