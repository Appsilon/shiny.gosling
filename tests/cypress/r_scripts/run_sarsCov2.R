devtools::load_all()
port <- commandArgs(TRUE)
shiny::shinyAppDir(
  appDir = "../inst/examples/sarsCov2/",
  port = port = as.numeric(port)
)
