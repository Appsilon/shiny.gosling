#' Zoom to
#' @description
#' Zooms  to a specific genomic position with the animated transition.
#' @param component_id A character. The id of the component_id prop passed
#' to the
#' GoslingComponent function.
#' @param view_id A character. The ID of a view that you want to control.
#' This ID
#' is consistent to what you specify as track.id in your spec.
#' @param position A character. The genomic position that your view should be
#' navigated to. You can either specify chromosome (e.g., chr1) or a
#' chromosome and range pair (e.g., chr1:1-10000).
#' @param padding A numeric.  This determines the padding around the specified
#' position. The unit of this number is a base pair (Default: 0).
#' @param duration A numeric. A duration of the animated transition in ms
#' (Default: 1000).
#' @param session A shiny session object.
#' @return None.
#' @importFrom shiny getDefaultReactiveDomain
#' @export
zoom_to <- function(component_id, view_id, position, padding = 0,
                    duration = 1000, session = getDefaultReactiveDomain()) {
  session$sendCustomMessage(
    'zoom_to',
    list(
      component_id = component_id,
      view_id = view_id,
      position = position,
      padding = padding,
      duration = duration
    )
  )
}
