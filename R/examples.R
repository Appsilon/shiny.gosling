package_name <- "shiny.gosling"

#' Runs a shiny.gosling example
#' @param example A character indicating a valid example.
#'
#' @examples
#' if (interactive()) {
#'   run_example("circularLinearWithBrush")
#' }
#' @return A Shiny App is launched.
#' @export
run_example <- function(example = NA) {
  valid_examples <- list.files(system.file("examples", package = package_name))
  app_dir <- system.file("examples", example, package = package_name)
  if (!example %in% valid_examples) {
    stop(
      "Please select a valid example, the valid examples are:\n",
      paste(valid_examples, collapse = ", "),
      call. = FALSE
    )
  }
  shiny::runApp(app_dir, display.mode = "normal")
}
