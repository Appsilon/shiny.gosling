valid_examples <- c(
  "circularLinearWithBrush", "circularVisualEncoding", "multiTrackApp", "sarsCov2", "staticCircularBar",
  "structuralVariant", "textAnnotation"
)

package_name <- "shiny.gosling"

#' Runs a shiny.gosling example
#' @param example A character indicating a valid example.
#'
#' @export
run_example <- function(example) {
  examples <- list.files(system.file("examples", package = package_name))
  app_dir <- system.file("examples", example, package = package_name)
  if (!example %in% valid_examples) {
    stop(
      'Please select a valid example, the valid examples are:\n',
      paste(valid_examples, collapse = ", "),
      call. = FALSE
    )
  }
  shiny::runApp(app_dir, display.mode = "normal")
}
