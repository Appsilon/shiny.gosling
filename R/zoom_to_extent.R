#' Zoom to extent
#' @description
#' Zooms out to see the entire view_id passed to this function.
#' @param component_id A character. The id of the component_id prop passed to the
#' GoslingComponent function.
#' @param view_id A character. The ID of a view that you want to control. This ID
#' is consistent to what you specify as track.id in your spec.
#' @param duration A numeric. A duration of the animated transition in ms
#' (Default: 1000).
#' @param session A shiny session object.
#' @return None.
#' @importFrom shiny getDefaultReactiveDomain
#' @export
zoom_to_extent <- function(component_id, view_id, duration = 1000, session = getDefaultReactiveDomain()) {
  session$sendCustomMessage(
    'zoom_to_extent',
    list(
      component_id = component_id,
      view_id = view_id,
      duration = duration
    )
  )
}
