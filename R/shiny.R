#' @export
goslingOutput <- function(outputId) {
  shiny.react::reactOutput(outputId)
}

#' @export
renderGosling <- function(
    expr) {
  shiny.react::renderReact(
    expr = expr
  )
}
