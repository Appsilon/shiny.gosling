# nocov start
library(optparse)
devtools::load_all()

assert_if_app_exists <- function(app_path, app_name) {
  exists <- file.exists(app_path)
  if (!exists) {
    stop(paste("The example application", app_name, "does not exist."))
  }
  cat("Example app exists!\n")
}

assert_if_spec_exists <- function(spec_path, app_name) {
  exists <- file.exists(spec_path)
  if (!exists) {
    stop(paste("The e2e spec", app_name, "does not exist."))
  }
  cat("Spec exists!\n")
}

# Parsing options
option_list <- list(
  make_option(
    opt_str = c("-p", "--port"),
    type = "character",
    default = 8888,
    help = "Port in which the shiny app will run [default= %default]",
    metavar = "numeric"
  ),
  make_option(
    opt_str = c("-a", "--app"),
    type = "character",
    default = NULL,
    help = "Name of the application as it is named in the inst/examples folder",
    metavar = "character"
  )
)

# Reading options
opt_parser <- OptionParser(option_list = option_list)
opt <- parse_args(opt_parser)
app_name <- opt$app
port <- as.numeric(opt$port)

# Defining paths
package_path <- path.package(package = "shiny.gosling")
app_path <- file.path(package_path, "inst", "examples", app_name)
spec_path <- file.path(package_path, "e2e", "cypress", "e2e", paste0(app_name, ".cy.js"))

# Assert that the paths to the Example apps and the spec files exist
assert_if_app_exists(app_path, app_name)
assert_if_spec_exists(spec_path, app_name)

tryCatch({
  shiny::runApp(
    appDir = file.path(app_path, "app.R"),
    port = as.numeric(port)
  )
}, error = function(cond) {
  shiny::shinyAppDir(
    appDir = app_path,
    options = list(port = as.numeric(port))
  )
})
# nocov end
