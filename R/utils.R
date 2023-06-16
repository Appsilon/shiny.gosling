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
  if (clean_braces) {
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
#' if (interactive()) {
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
#' }
#' @return list of items
#' @export
#'
json_list <- function(...) {
  list(...)
}

#' is_atomic_field
#'
#' @param field_name A character or number or another atomic value.
#'
#' @return List.
#'
is_atomic_field <- function(field_name) {
  invalid_names <- c(
    "id", "mark", "width", "height", "title",
    "subtitle", "alignment", "row"
  )
  !field_name %in% invalid_names
}

#' atomic_values_to_list
#'
#' @param property_list A character or number or another atomic value.
#'
#' @return List.
#'
atomic_values_to_list <- function(property_list) {
  if (!rlang::is_empty(property_list)) {
    for (x in seq_along(property_list)) {
      if (!is.null(property_list[[x]])) {
        field_name <- names(property_list[x])
        if ((is_atomic_field(field_name)) && !is.list(property_list[[x]])) {
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
#' Add this function at the beginning of ui. This is needed for
#' gosling to work in shiny plots.
#'
#' @param clear_files default FALSE. To clear the locally stored csv files created by gosling or not.
#'
#' @examples
#' if (interactive()) {
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
#' }
#'
#' @return Gosling initiator HTML.
#' @export
use_gosling <- function(clear_files = TRUE) {
  if (!dir.exists(".gosling")) {
    dir.create(".gosling")
  }
  shiny::addResourcePath(".gosling", fs::path_wd(".gosling"))
  if (clear_files) {
    shiny::onStop(
      function() {
        unlink(".gosling", recursive = TRUE)
      },
      session = shiny::getDefaultReactiveDomain()
    )
  }
  GoslingComponent(
    spec = shiny.react::JS(
      build_json(
        NULL
      )
    )
  )
}

#' Print method for the gosling component
#'
#' @param x A gosling object
#'
#' @return r list without NULL values
#'
#' @export
print.gosling <- function(x) {
  component_json <- gsub("(^[^{]+)|([^}]+$)", "", htmltools::HTML(as.character(x))) |>
    rjson::fromJSON()
  print(utils::str(rjson::fromJSON(component_json$props$value$spec$value)))
}

#' Build gosling plot object
#'
#' @param component_id Assign a component id to use other api like zoom.
#' @param composed_views The views composed with arrange_views.
#' @param clean_braces Whether to remove extra square brackets from the
#' json string.
#'
#' @examples
#' if (interactive()) {
#'   library(shiny)
#'   library(shiny.gosling)
#'
#'   # Circular track 1 ----
#'   circular_track1_data <- track_data(
#'     url = "https://server.gosling-lang.org/api/v1/tileset_info/?d=cistrome-multivec",
#'     type = "multivec",
#'     row = "sample",
#'     column = "position",
#'     value = "peak",
#'     categories = c("sample 1", "sample 2", "sample 3", "sample 4"),
#'     binSize = 4
#'   )
#'
#'   circular_track1_x <- visual_channel_x(field = "start", type = "genomic")
#'   circular_track1_xe <- visual_channel_x(field = "end", type = "genomic")
#'
#'   circular_track1_y <- visual_channel_y(field = "peak", type = "quantitative")
#'
#'   circular_track1_row <- visual_channel_row(
#'     field = "sample", type = "nominal"
#'   )
#'
#'   circular_track1_color <- visual_channel_color(
#'     field = "sample", type = "nominal"
#'   )
#'
#'   circular_track1_tracks <- add_multi_tracks(
#'     add_single_track(
#'       mark = "bar"
#'     ),
#'     add_single_track(
#'       mark = "brush",
#'       x = visual_channel_x(linkingId = "detail-1"),
#'       color = "blue"
#'     ),
#'     add_single_track(
#'       mark = "brush",
#'       x = visual_channel_x(linkingId = "detail-2"),
#'       color = "red"
#'     )
#'   )
#'
#'   circular_track1_styles <- default_track_styles(
#'     outlineWidth = 0
#'   )
#'
#'   circular_track1 <- add_single_track(
#'     id = "circular_track1", alignment = "overlay", data = circular_track1_data,
#'     x = circular_track1_x, xe = circular_track1_xe,
#'     y = circular_track1_y, row = circular_track1_row,
#'     color = circular_track1_color,
#'     stroke = "black", strokeWidth = 0.3,
#'     tracks = circular_track1_tracks,
#'     style = circular_track1_styles,
#'     width = 500, height = 100
#'   )
#'
#'   # Compose Circular track ----
#'   circular_composed_view <- compose_view(
#'     multi = TRUE,
#'     tracks = add_multi_tracks(
#'       circular_track1
#'     ),
#'     static = TRUE, layout = "circular", alignment = "stack"
#'   )
#'
#'   # Arrange final view
#'   circular_linear_view <- arrange_views(
#'     arrangement = "horizontal",
#'     views = list(circular_composed_view)
#'   )
#'
#'
#'
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
#'         component_id = "circular_component",
#'         circular_linear_view, clean_braces = FALSE
#'       )
#'     })
#'   }
#'
#'   shinyApp(ui, server)
#' }
#'
#' @return Gosling component for rendering on R shiny apps
#' @export
#'
gosling <- function(component_id, composed_views, clean_braces = TRUE) {
  structure(
    GoslingComponent(
      component_id = component_id,
      spec = shiny.react::JS(
        build_json(
          composed_views,
          clean_braces = clean_braces
        )
      )
    ),
    class = c("gosling", "shiny.tag")
  )
}
