#' Remove null from list
#'
#' @param r_list An r list with NULL values
#'
#' @return r list without NULL values
#'
list_rm_null <- function(r_list) {
  Filter(
    Negate(is.null),
    r_list
  )
}

#' Build gosling spec from R list
#'
#' @param r_list R list object built with other gosling functions
#' @param clean_braces Whether to remove extra square brackets
#' from the json string.
#' @param pretty Whether to get json with indentation, line breaks etc.
#' @param auto_unbox If TRUE will automatically unbox() all atomic
#' vectors of length 1.
#'
#' @return json spec for the gosling output
#' @export
#'
build_json <- function(r_list, clean_braces = TRUE, pretty = TRUE,
                       auto_unbox = TRUE) {
  if(clean_braces) {
    jsonlite::toJSON(r_list, pretty = pretty, auto_unbox = auto_unbox)
  } else {
    json <- jsonlite::toJSON(r_list, pretty = FALSE, auto_unbox = auto_unbox)
    edited_json <- gsub("\\]\\]", "]", gsub("\\[\\[", "[", json))
    jsonlite::prettify(edited_json)
  }
}

#' Create list
#'
#' @param ... Items to be put in a list
#' @examples
#' if(interactive()) {
#'   library(shiny)
#'   library(shiny.gosling)
#'
#'   track5_styles <- default_track_styles(
#'     legendTitle = "SV Class"
#'   )
#'   track5_data <- track_data(
#'     url = "https://s3.amazonaws.com/gosling-lang.org/data/cancer/rearrangement.PD35930a.csv",
#'     type = "csv",
#'     genomicFieldsToConvert = json_list(
#'       json_list(
#'         chromosomeField = "chr1",
#'         genomicFields = c("start1", "end1")
#'       ),
#'       json_list(
#'         chromosomeField = "chr2",
#'         genomicFields = c("start2", "end2")
#'       )
#'     )
#'   )
#'   track5_tracks <- add_multi_tracks(
#'     add_single_track(
#'       mark = "rect"
#'     ),
#'     add_single_track(
#'       mark = "withinLink", x = visual_channel_x(linkingId = "mid-scale"),
#'       strokeWidth = 0
#'     )
#'   )
#'   track5_color <- visual_channel_color(
#'     field = "svclass",
#'     type = "nominal",
#'     legend = TRUE,
#'     domain = json_list(
#'       "tandem-duplication", "translocation", "delection", "inversion"
#'     ),
#'     range = json_list(
#'       "#569C4D", "#4C75A2", "#DA5456", "#EA8A2A"
#'     )
#'   )
#'   track5_stroke <- visual_channel_stroke(
#'     field = "svclass",
#'     type = "nominal",
#'     domain = json_list(
#'       "tandem-duplication", "translocation", "delection", "inversion"
#'     ),
#'     range = json_list(
#'       "#569C4D", "#4C75A2", "#DA5456", "#EA8A2A"
#'     )
#'   )
#'   track5_x <- visual_channel_x(field = "start1", type = "genomic")
#'   track5_xe <- visual_channel_x(field = "end2", type = "genomic")
#'   track5 <- add_single_track(
#'     id = "track5", title = "Structural Variant",
#'     data = track5_data, mark = "withinLink",
#'     x = track5_x, xe = track5_xe,
#'     color = track5_color, width = 500, height = 80, stroke = track5_stroke,
#'     strokeWidth = 1, opacity = 0.6, style = track5_styles
#'   )
#'
#'   composed_track <- compose_view(
#'     multi = TRUE,
#'     tracks = add_multi_tracks(
#'       track5
#'     ),
#'     xOffset = 190, layout = "circular", spacing = 1
#'   )
#'
#'   composed_views <- arrange_views(
#'     views = composed_track,
#'     arrangement = "vertical"
#'   )
#'
#'   ui <- fluidPage(
#'     use_gosling(),
#'     fluidRow(
#'       column(6, goslingOutput("gosling_plot"))
#'     )
#'   )
#'
#'
#'   server <- function(input, output, session) {
#'     output$gosling_plot <- renderGosling({
#'       gosling(
#'         component_id = "component_2",
#'         composed_views, clean_braces = FALSE
#'       )
#'     })
#'   }
#'
#'   shinyApp(ui, server)
#'
#' }
#' @return list of items
#' @export
#'
json_list <- function(...) {
  list(...)
}

#' Title
#'
#' @param property_list A character or number or another atomic value.
#'
#' @return List.
#'
atomic_values_to_list <- function(property_list) {
  if(isTRUE(length(property_list) != 0)) {
    for (x in seq(length(property_list))) {
      if(!is.null(property_list[[x]])) {
        if(isTRUE(!names(property_list[x]) %in% c(
          "id", "mark", "width", "height", "title", "subtitle", "alignment",
          "row"
        )) &&
           !is.list(property_list[[x]])) {
          property_list[[x]] <- list(
            value = property_list[[x]]
          )
        }
      }
    }
  }
  property_list
}

#' Initiate gosling
#'
#' Add this function at the begining of ui. This is needed for
#' gosling to work in shiny plots.
#'
#' @return Gosling initiator HTML.
#' @export
use_gosling <- function() {
  GoslingComponent(
    spec = shiny.react::JS(
      build_json(
        NULL
      )
    )
  )
}


#' Build gosling plot object
#'
#' @param component_id Assign a component id to use other api like zoom.
#' @param composed_views The views composed with arrange_views.
#' @param clean_braces Whether to remove extra square brackets from the
#' json string.
#'
#' @return Gosling component for rendering on R shiny apps
#' @export
#'
gosling <- function(component_id, composed_views, clean_braces = TRUE) {
  GoslingComponent(
    component_id = component_id,
    spec = shiny.react::JS(
      build_json(
        composed_views, clean_braces = clean_braces
      )
    )
  )
}
