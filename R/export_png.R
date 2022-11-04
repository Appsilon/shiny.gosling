#' Export PNG
#' @description
#' Exports PNG
#' @param component_id A character. The id of the component_id prop passed to the
#' GoslingComponent function.
#' @param transparent_background A Boolean. Determine if the background
#' should be transparent or not (Default: false).
#' @param session A shiny session object.
#' @importFrom shiny getDefaultReactiveDomain
#' @export
export_png <- function(component_id, transparent_background = FALSE, session = getDefaultReactiveDomain()) {
  session$sendCustomMessage(
    'export_png',
    list(
      component_id = component_id,
      transparent_background = transparent_background
    )
  )
}
