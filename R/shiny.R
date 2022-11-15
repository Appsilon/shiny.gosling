
#' gosling output function
#'
#' gosling output function for shiny use.
#' Must use this function instead of shiny output functions.
#'
#' @param outputId ID of the output element
#'
#' @return reactOutput HTML for UI render
#' @export
#'
goslingOutput <- function(outputId) {
  shiny.react::reactOutput(outputId)
}


#' gosling render function
#'
#' gosling render function for shiny use
#'
#' @param expr The code for rendering gosling plot.
#' Must be a gosling object built with shiny.gosling::gosling()
#'
#' @return A function which can be assigned to an output in a Shiny server function.
#' @export
#'
renderGosling <- function(
    expr) {
  shiny.react::renderReact(
    expr = expr
  )
}
