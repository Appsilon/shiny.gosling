#' Zoom to gene
#' @description
#' This function makes a view navigate to a certain gene with animated transition.
#' @param component_id A character. The id of the component_id prop passed to the
#' GoslingComponent function.
#' @param view_id A character. The ID of a view that you want to control. This ID
#' is consistent to what you specify as track.id in your spec.
#' @param gene A character. The target gene symbol that your view
#' should be navigated to (e.g., MYC).
#' @param padding A numeric. This determines the padding around the specified position.
#' The unit of this number is a base pair (Default: 0).
#' @param duration A numeric. A duration of the animated transition in ms
#' (Default: 1000).
#' @param session A shiny session object.
#' @importFrom shiny getDefaultReactiveDomain
#' @export
zoom_to_gene <- function(
    component_id, view_id, gene, padding = 0,
    duration = 1000, session = getDefaultReactiveDomain()) {
  session$sendCustomMessage(
    'zoom_to_gene',
    list(
      component_id = component_id,
      view_id = view_id,
      padding = padding,
      gene = gene,
      duration = duration
    )
  )
}
