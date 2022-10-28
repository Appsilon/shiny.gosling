#' @param outputId
#'
#' @export
goslingOutput <- function(outputId) {
  shiny.react::reactOutput(outputId)
}

#' @param expr
#'
#' @export
renderGosling <- function(
    expr) {
  shiny.react::renderReact(
    expr = expr
  )
}
