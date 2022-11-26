#' Generic visual channel builder
#'
#' @param field A character. Name of the data field.
#' @param type A character. Must be "genomic". Specify the data type.
#' @param range A vector of characters or numbers. Values of the visual channel.
#' @param domain A vector of characters or numbers. Values of the data.
#' @param ... Any other parameters to pass to gosling.js.
#'
#' @details For more info visit
#' http://gosling-lang.org/docs/visual-channel#encode-a-visual-channel
#'
#' @return List object.
#'
visual_channel <- function(field = NULL, type = NULL, range = NULL,
                           domain = NULL, ...) {
  list_rm_null(list(
    field = field, type = type, range = range, domain = domain, ...
  ))
}

#' x and xe axis visual channel
#'
#' @param field A character. Name of the data field.
#' @param type A character. Must be "genomic". Specify the data type.
#' @param legend A Boolean. Whether to display legend. Default: FALSE.
#' @param grid A Boolean. Whether to display grid. Default: FALSE.
#' @param axis A character. One of "none", "top", "bottom", "left", "right".
#' Specify where should the axis be put.
#' @param aggregate A character. One of "max", "min", "mean", "bin", "count".
#' Specify how to aggregate data. Default: undefined.
#' @param ... Any other parameters to pass to gosling.js.
#' @examples
#' if (interactive()) {
#'   library(shiny)
#'   library(shiny.gosling)
#'
#'   cistrome_data <-
#'     "https://server.gosling-lang.org/api/v1/tileset_info/?d=cistrome-multivec" # nolint
#'
#'   single_track <- add_single_track(
#'     id = "track1",
#'     data = track_data(
#'       url = cistrome_data,
#'       type = "multivec",
#'       row = "sample",
#'       column = "position",
#'       value = "peak",
#'       categories = c("sample 1", "sample 2", "sample 3", "sample 4"),
#'       binSize = 4,
#'     ),
#'     mark = "rect",
#'     x = visual_channel_x(field = "start", type = "genomic", axis = "top"),
#'     xe = visual_channel_x(field = "end", type = "genomic"),
#'     row = visual_channel_row(
#'       field = "sample",
#'       type = "nominal",
#'       legend = TRUE
#'     ),
#'     color = visual_channel_color(
#'       field = "peak",
#'       type = "quantitative",
#'       legend = TRUE
#'     ),
#'     tooltip = visual_channel_tooltips(
#'       visual_channel_tooltip(
#'         field = "start", type = "genomic",
#'         alt = "Start Position"
#'       ),
#'       visual_channel_tooltip(
#'         field = "end", type = "genomic",
#'         alt = "End Position"
#'       ),
#'       visual_channel_tooltip(
#'         field = "peak",
#'         type = "quantitative",
#'         alt = "Value",
#'         format = "0.2"
#'       )
#'     ),
#'     width = 600,
#'     height = 130
#'   )
#'
#'   single_composed_track <- compose_view(
#'     tracks = single_track
#'   )
#'
#'   single_composed_views <- arrange_views(
#'     title = "Single Track",
#'     subtitle = "This is the simplest single track visualization with a linear layout", # nolint
#'     layout = "circular", # "linear"
#'     views = single_composed_track,
#'     xDomain = list(
#'       chromosome = "chr1",
#'       interval = c(1, 3000500)
#'     )
#'   )
#'
#'   ui <- fluidPage(
#'     use_gosling(),
#'     fluidRow(
#'       column(6, gosling_output("gosling_plot")),
#'       column(
#'         1, br(), actionButton(
#'           "download_pdf",
#'           "PDF",
#'           icon = icon("cloud-arrow-down")
#'         )
#'       )
#'     )
#'   )
#'
#'
#'   server <- function(input, output, session) {
#'     output$gosling_plot <- render_gosling({
#'       gosling(
#'         component_id = "component_1",
#'         single_composed_views,
#'         clean_braces = TRUE
#'       )
#'     })
#'
#'     observeEvent(input$download_pdf, {
#'       export_pdf(component_id = "component_1")
#'     })
#'   }
#'
#'   shinyApp(ui, server)
#' }
#'
#' @details For more info visit
#' http://gosling-lang.org/docs/visual-channel#x--xe
#'
#' @return List object.
#' @export
visual_channel_x <- function(field = NULL, type = NULL, legend = NULL,
                             grid = NULL, axis = NULL, aggregate = NULL, ...) {
  visual_channel(
    field = field, type = type, legend = legend, grid = grid,
    axis = axis, aggregate = aggregate, ...
  )
}

#' y and ye axis visual channel
#'
#' @param field A character. Name of the data field.
#' @param zero_baseline A Boolean. Specify whether to use zero baseline.
#' Default: TRUE.
#' @param type A character. Must be "genomic". Specify the data type.
#' @param legend A Boolean. Whether to display legend. Default: FALSE.
#' @param grid A Boolean. Whether to display grid. Default: FALSE.
#' @param flip A Boolean. Whether to flip the y-axis. This is done by
#' inverting the range property. Default: FALSE.
#' @param baseline A character or number. Custom baseline of the y-axis.
#' Default: 0.
#' @param axis A character. One of "none", "top", "bottom", "left", "right".
#' Specify where should the axis be put.
#' @param aggregate A character. One of "max", "min", "mean", "bin", "count".
#' Specify how to aggregate data. Default: undefined.
#' @param ... Any other parameters to pass to gosling.js.
#' @examples
#' if (interactive()) {
#'   library(shiny)
#'   library(shiny.gosling)
#'
#'   # Circular track 1 ----
#'   circular_track1_data <- track_data(
#'     url = "https://server.gosling-lang.org/api/v1/tileset_info/?d=cistrome-multivec", # nolint
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
#'   circular_track1_y <- visual_channel_y(
#'     field = "peak", type = "quantitative"
#'   )
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
#'     outline_width = 0
#'   )
#'
#'   circular_track1 <- add_single_track(
#'     id = "circular_track1", alignment = "overlay",
#'     data = circular_track1_data,
#'     x = circular_track1_x, xe = circular_track1_xe,
#'     y = circular_track1_y, row = circular_track1_row,
#'     color = circular_track1_color,
#'     stroke = "black", stroke_width = 0.3,
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
#'       column(6, gosling_output("gosling_plot"))
#'     )
#'   )
#'
#'
#'   server <- function(input, output, session) {
#'     output$gosling_plot <- render_gosling({
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
#' @details For more info visit
#' http://gosling-lang.org/docs/visual-channel#y--ye
#'
#' @return List object.
#' @export
#'
visual_channel_y <- function(field = NULL, zero_baseline = NULL,
                             type = NULL, legend = NULL, grid = NULL,
                             flip = NULL, baseline = NULL, axis = NULL,
                             aggregate = NULL, ...) {
  visual_channel(
    field = field, type = type, legend = legend, grid = grid,
    axis = axis, aggregate = aggregate, ...
  )
}

#' row visual channel
#'
#' @param field A character. Name of the data field.
#' @param type A character. Must be "genomic". Specify the data type.
#' @param padding A number. Determines the size of inner white spaces on the
#' top and bottom of individiual rows. Default: 0.
#' @param legend A Boolean. Whether to display legend. Default: FALSE.
#' @param grid A Boolean. Whether to display grid. Default: FALSE.
#' @param clip A Boolean. Clip row when the actual y value exceeds the max
#' value of the y scale. Used only for bar marks at the moment. Default: TRUE.
#' @param axis A character. One of "none", "top", "bottom", "left", "right".
#' Specify where should the axis be put.
#' @param aggregate A character. One of "max", "min", "mean", "bin", "count".
#' Specify how to aggregate data. Default: undefined.
#' @param ... Any other parameters to pass to gosling.js.
#' @examples
#' if (interactive()) {
#'   library(shiny)
#'   library(shiny.gosling)
#'
#'   # Circular track 1 ----
#'   circular_track1_data <- track_data(
#'     url = "https://server.gosling-lang.org/api/v1/tileset_info/?d=cistrome-multivec", # nolint
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
#'   circular_track1_y <- visual_channel_y(
#'     field = "peak", type = "quantitative"
#'   )
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
#'     outline_width = 0
#'   )
#'
#'   circular_track1 <- add_single_track(
#'     id = "circular_track1", alignment = "overlay",
#'     data = circular_track1_data,
#'     x = circular_track1_x, xe = circular_track1_xe,
#'     y = circular_track1_y, row = circular_track1_row,
#'     color = circular_track1_color,
#'     stroke = "black", stroke_width = 0.3,
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
#'       column(6, gosling_output("gosling_plot"))
#'     )
#'   )
#'
#'
#'   server <- function(input, output, session) {
#'     output$gosling_plot <- render_gosling({
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
#' @details For more info visit
#' http://gosling-lang.org/docs/visual-channel#row
#'
#' @return List object.
#' @export
#'
visual_channel_row <- function(field = NULL, type = NULL, padding = NULL,
                               legend = NULL, grid = NULL, clip = NULL,
                               axis = NULL, aggregate = NULL, ...) {
  visual_channel(
    field = field, type = type, legend = legend, grid = grid,
    axis = axis, aggregate = aggregate, ...
  )
}

#' size visual channel
#'
#' @param field A character. Name of the data field.
#' @param type A character. Must be "genomic". Specify the data type.
#' @param range A vector of characters or numbers. Values of the visual
#' channel. Range to be specified like `range = c(min_size, max_size)`
#' @param domain A vector of characters or numbers. Values of the data.
#' @param ... Any other parameters to pass to gosling.js.
#'
#' @details For more info visit
#' http://gosling-lang.org/docs/visual-channel#size
#'
#' @return List object.
#' @export
#'
visual_channel_size <- function(field = NULL, type = NULL,
                                range = NULL, domain = NULL, ...) {
  visual_channel(
    field = field, type = type, range = range, domain = domain, ...
  )
}


#' text visual channel
#'
#' @param field A character. Name of the data field.
#' @param type A character. Must be "genomic". Specify the data type.
#' @param range A vector of characters or numbers. Values of the visual channel.
#' @param domain A vector of characters or numbers. Values of the data.
#' @param ... Any other parameters to pass to gosling.js.
#' @examples
#' if (interactive()) {
#'   library(shiny)
#'   library(shiny.gosling)
#'
#'   # View 2 Track 3----
#'   view2_track3_data <- track_data(
#'     url = "https://server.gosling-lang.org/api/v1/tileset_info/?d=NC_045512_2-multivec", # nolint
#'     type = "multivec",
#'     row = "base",
#'     column = "position",
#'     value = "count",
#'     categories = c("A", "T", "G", "C"),
#'     start = "start",
#'     end = "end"
#'   )
#'
#'   view2_track3a <- add_single_track(
#'     mark = "bar",
#'     y = visual_channel_y(
#'       field = "count", type = "quantitative", axis = "none"
#'     )
#'   )
#'
#'   view2_track3b <- add_single_track(
#'     data_transform = track_data_transform(
#'       type = "filter",
#'       field = "count",
#'       one_of = list(0),
#'       not = TRUE
#'     ),
#'     mark = "text",
#'     x = visual_channel_x(
#'       field = "start", type = "genomic"
#'     ),
#'     xe = visual_channel_x(
#'       field = "end", type = "genomic"
#'     ),
#'     size = 24,
#'     color = "white",
#'     visibility = list(
#'       list(
#'         operation = "less-than",
#'         measure = "width",
#'         threshold = "|xe-x|",
#'         transitionPadding = 30,
#'         target = "mark"
#'       ),
#'       list(
#'         operation = "LT",
#'         measure = "zoomLevel",
#'         threshold = 40,
#'         target = "track"
#'       )
#'     )
#'   )
#'
#'   view2_track3_x <- visual_channel_x(
#'     field = "position", type = "genomic"
#'   )
#'
#'   view2_track3_color <- visual_channel_color(
#'     field = "base",
#'     type = "nominal",
#'     domain = c("A", "T", "G", "C"),
#'     legend = TRUE
#'   )
#'
#'   view2_track3_text <- visual_channel_text(
#'     field = "base", type = "nominal"
#'   )
#'
#'   view2_track3_style <- default_track_styles(
#'     inline_legend = TRUE
#'   )
#'
#'   view2_track3 <- add_single_track(
#'     title = "NC_045512.2 Sequence",
#'     alignment = "overlay",
#'     data = view2_track3_data,
#'     tracks = add_multi_tracks(
#'       view2_track3a, view2_track3b
#'     ),
#'     x = view2_track3_x,
#'     color = view2_track3_color,
#'     text = view2_track3_text,
#'     style = view2_track3_style,
#'     width = 800, height = 40
#'   )
#'
#'   view2 <- compose_view(
#'     multi = TRUE,
#'     center_radius = 0,
#'     xDomain = list(interval = c(1, 29903)),
#'     linkingId = "detail",
#'     alignment = "stack",
#'     tracks = add_multi_tracks(
#'       view2_track3
#'     )
#'   )
#'
#'   combined_view <- arrange_views(
#'     title = "SARS-CoV-2",
#'     subtitle = "Data Source: WashU Virus Genome Browser, NCBI, GISAID",
#'     assembly = list(list("NC_045512.2", 29903)),
#'     layout = "linear",
#'     spacing = 50,
#'     views = list(view2),
#'     listify = FALSE
#'   )
#'
#'   ui <- fluidPage(
#'     use_gosling(),
#'     fluidRow(
#'       column(6, gosling_output("gosling_plot"))
#'     )
#'   )
#'
#'
#'   server <- function(input, output, session) {
#'     output$gosling_plot <- render_gosling({
#'       gosling(
#'         component_id = "sars_cov2",
#'         combined_view
#'       )
#'     })
#'   }
#'
#'   shinyApp(ui, server)
#' }
#'
#' @details For more info visit
#' http://gosling-lang.org/docs/visual-channel#text
#'
#' @return List object.
#' @export
#'
visual_channel_text <- function(field = NULL, type = NULL,
                                range = NULL, domain = NULL, ...) {
  visual_channel(
    field = field, type = type, range = range, domain = domain, ...
  )
}

#' color visual channel
#'
#' @param field A character. Name of the data field.
#' @param title A character. Title of the legend. Default: undefined.
#' @param type A character. Must be "genomic". Specify the data type.
#' @param scale_offset A number vector of the form c(1, 2). Whether
#' to use offset of the domain proportionally. This is bound to brushes
#' on the color legend. Default: c(0, 1).
#' @param scale A character. One of "linear", "log".
#' @param legend A Boolean. Whether to display legend. Default: FALSE.
#' @param grid A Boolean. Whether to display grid. Default: FALSE.
#' @param axis A character. One of "none", "top", "bottom", "left", "right".
#' Specify where should the axis be put.
#' @param aggregate A character. One of "max", "min", "mean", "bin", "count".
#' Specify how to aggregate data. Default: undefined.
#' @param ... Any other parameters to pass to gosling.js.
#' @examples
#' if (interactive()) {
#'   library(shiny)
#'   library(shiny.gosling)
#'
#'   # View 2 Track 3----
#'   view2_track3_data <- track_data(
#'     url = "https://server.gosling-lang.org/api/v1/tileset_info/?d=NC_045512_2-multivec", # nolint
#'     type = "multivec",
#'     row = "base",
#'     column = "position",
#'     value = "count",
#'     categories = c("A", "T", "G", "C"),
#'     start = "start",
#'     end = "end"
#'   )
#'
#'   view2_track3a <- add_single_track(
#'     mark = "bar",
#'     y = visual_channel_y(
#'       field = "count", type = "quantitative", axis = "none"
#'     )
#'   )
#'
#'   view2_track3b <- add_single_track(
#'     data_transform = track_data_transform(
#'       type = "filter",
#'       field = "count",
#'       one_of = list(0),
#'       not = TRUE
#'     ),
#'     mark = "text",
#'     x = visual_channel_x(
#'       field = "start", type = "genomic"
#'     ),
#'     xe = visual_channel_x(
#'       field = "end", type = "genomic"
#'     ),
#'     size = 24,
#'     color = "white",
#'     visibility = list(
#'       list(
#'         operation = "less-than",
#'         measure = "width",
#'         threshold = "|xe-x|",
#'         transitionPadding = 30,
#'         target = "mark"
#'       ),
#'       list(
#'         operation = "LT",
#'         measure = "zoomLevel",
#'         threshold = 40,
#'         target = "track"
#'       )
#'     )
#'   )
#'
#'   view2_track3_x <- visual_channel_x(
#'     field = "position", type = "genomic"
#'   )
#'
#'   view2_track3_color <- visual_channel_color(
#'     field = "base",
#'     type = "nominal",
#'     domain = c("A", "T", "G", "C"),
#'     legend = TRUE
#'   )
#'
#'   view2_track3_text <- visual_channel_text(
#'     field = "base", type = "nominal"
#'   )
#'
#'   view2_track3_style <- default_track_styles(
#'     inline_legend = TRUE
#'   )
#'
#'   view2_track3 <- add_single_track(
#'     title = "NC_045512.2 Sequence",
#'     alignment = "overlay",
#'     data = view2_track3_data,
#'     tracks = add_multi_tracks(
#'       view2_track3a, view2_track3b
#'     ),
#'     x = view2_track3_x,
#'     color = view2_track3_color,
#'     text = view2_track3_text,
#'     style = view2_track3_style,
#'     width = 800, height = 40
#'   )
#'
#'   view2 <- compose_view(
#'     multi = TRUE,
#'     center_radius = 0,
#'     xDomain = list(interval = c(1, 29903)),
#'     linkingId = "detail",
#'     alignment = "stack",
#'     tracks = add_multi_tracks(
#'       view2_track3
#'     )
#'   )
#'
#'   combined_view <- arrange_views(
#'     title = "SARS-CoV-2",
#'     subtitle = "Data Source: WashU Virus Genome Browser, NCBI, GISAID",
#'     assembly = list(list("NC_045512.2", 29903)),
#'     layout = "linear",
#'     spacing = 50,
#'     views = list(view2),
#'     listify = FALSE
#'   )
#'
#'   ui <- fluidPage(
#'     use_gosling(),
#'     fluidRow(
#'       column(6, gosling_output("gosling_plot"))
#'     )
#'   )
#'
#'
#'   server <- function(input, output, session) {
#'     output$gosling_plot <- render_gosling({
#'       gosling(
#'         component_id = "sars_cov2",
#'         combined_view
#'       )
#'     })
#'   }
#'
#'   shinyApp(ui, server)
#' }
#'
#' @details For more info visit
#' http://gosling-lang.org/docs/visual-channel#color
#'
#' @return List object.
#' @export
#'
visual_channel_color <- function(field = NULL, title = NULL, type = NULL,
                                 scale_offset = NULL, scale = NULL,
                                 legend = NULL, grid = NULL, axis = NULL,
                                 aggregate = NULL, ...) {
  visual_channel(
    field = field, type = type, legend = legend, grid = grid,
    axis = axis, aggregate = aggregate, ...
  )
}


#' stroke visual channel
#'
#' @param field A character. Name of the data field.
#' @param title A character. Title of the legend. Default: undefined.
#' @param type A character. Must be "genomic". Specify the data type.
#' @param scale_offset A number vector of the form c(1, 2). Whether to use
#' offset of the domain proportionally. This is bound to brushes on the color
#' legend. Default: c(0, 1).
#' @param legend A Boolean. Whether to display legend. Default: FALSE.
#' @param grid A Boolean. Whether to display grid. Default: FALSE.
#' @param axis A character. One of "none", "top", "bottom", "left", "right".
#' Specify where should the axis be put.
#' @param aggregate A character. One of "max", "min", "mean", "bin", "count".
#' Specify how to aggregate data. Default: undefined.
#' @param ... Any other parameters to pass to gosling.js.
#' @examples
#' if (interactive()) {
#'   library(shiny)
#'   library(shiny.gosling)
#'
#'   track5_styles <- default_track_styles(
#'     legend_title = "SV Class"
#'   )
#'   track5_data <- track_data(
#'     url = "https://s3.amazonaws.com/gosling-lang.org/data/cancer/rearrangement.PD35930a.csv", # nolint
#'     type = "csv",
#'     genomicFieldsToConvert = json_list(
#'       json_list(
#'         chromosome_field = "chr1",
#'         genomic_fields = c("start1", "end1")
#'       ),
#'       json_list(
#'         chromosome_field = "chr2",
#'         genomic_fields = c("start2", "end2")
#'       )
#'     )
#'   )
#'   track5_tracks <- add_multi_tracks(
#'     add_single_track(
#'       mark = "rect"
#'     ),
#'     add_single_track(
#'       mark = "withinLink", x = visual_channel_x(linkingId = "mid-scale"),
#'       stroke_width = 0
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
#'     stroke_width = 1, opacity = 0.6, style = track5_styles
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
#'       column(6, gosling_output("gosling_plot"))
#'     )
#'   )
#'
#'
#'   server <- function(input, output, session) {
#'     output$gosling_plot <- render_gosling({
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
#' @details For more info visit
#' http://gosling-lang.org/docs/visual-channel#stroke
#'
#' @return List object.
#' @export
#'
visual_channel_stroke <- function(field = NULL, title = NULL, type = NULL,
                                  scale_offset = NULL, legend = NULL,
                                  grid = NULL, axis = NULL, aggregate = NULL,
                                  ...) {
  visual_channel(
    field = field, type = type, legend = legend, grid = grid,
    axis = axis, aggregate = aggregate, ...
  )
}

#' stroke width visual channel
#'
#' @param field A character. Name of the data field.
#' @param type A character. Must be "genomic". Specify the data type.
#' @param range A vector of characters or numbers. Values of the visual channel.
#' @param domain A vector of characters or numbers. Values of the data.
#' @param ... Any other parameters to pass to gosling.js.
#'
#' @details For more info visit
#' http://gosling-lang.org/docs/visual-channel#stroke_width
#'
#' @return List object.
#' @export
#'
visual_channel_stroke_width <- function(field = NULL, type = NULL,
                                        range = NULL, domain = NULL, ...) {
  visual_channel(
    field = field, type = type, range = range, domain = domain, ...
  )
}


#' opacity visual channel
#'
#' @param field A character. Name of the data field.
#' @param type A character. Must be "genomic". Specify the data type.
#' @param range A vector of characters or numbers. Values of the visual channel.
#' @param domain A vector of characters or numbers. Values of the data.
#' @param ... Any other parameters to pass to gosling.js.
#'
#' @details For more info visit
#' http://gosling-lang.org/docs/visual-channel#opacity
#'
#' @return List object.
#' @export
#'
visual_channel_opacity <- function(field = NULL, type = NULL,
                                   range = NULL, domain = NULL, ...) {
  visual_channel(
    field = field, type = type, range = range, domain = domain, ...
  )
}


#' tooltip visual channel
#'
#' @param field A character. Name of the data field.
#' @param type A character. Must be "genomic". Specify the data type.
#' @param alt A character.
#' @param ... Any other parameters to pass to gosling.js.
#'
#' @examples
#' if (interactive()) {
#'   library(shiny)
#'   library(shiny.gosling)
#'
#'   cistrome_data <-
#'     "https://server.gosling-lang.org/api/v1/tileset_info/?d=cistrome-multivec" # nolint
#'
#'   single_track <- add_single_track(
#'     id = "track1",
#'     data = track_data(
#'       url = cistrome_data,
#'       type = "multivec",
#'       row = "sample",
#'       column = "position",
#'       value = "peak",
#'       categories = c("sample 1", "sample 2", "sample 3", "sample 4"),
#'       binSize = 4,
#'     ),
#'     mark = "rect",
#'     x = visual_channel_x(field = "start", type = "genomic", axis = "top"),
#'     xe = visual_channel_x(field = "end", type = "genomic"),
#'     row = visual_channel_row(
#'       field = "sample",
#'       type = "nominal",
#'       legend = TRUE
#'     ),
#'     color = visual_channel_color(
#'       field = "peak",
#'       type = "quantitative",
#'       legend = TRUE
#'     ),
#'     tooltip = visual_channel_tooltips(
#'       visual_channel_tooltip(
#'         field = "start", type = "genomic",
#'         alt = "Start Position"
#'       ),
#'       visual_channel_tooltip(
#'         field = "end", type = "genomic",
#'         alt = "End Position"
#'       ),
#'       visual_channel_tooltip(
#'         field = "peak",
#'         type = "quantitative",
#'         alt = "Value",
#'         format = "0.2"
#'       )
#'     ),
#'     width = 600,
#'     height = 130
#'   )
#'
#'   single_composed_track <- compose_view(
#'     tracks = single_track
#'   )
#'
#'   single_composed_views <- arrange_views(
#'     title = "Single Track",
#'     subtitle = "This is the simplest single track visualization with a linear layout", # nolint
#'     layout = "circular", # "linear"
#'     views = single_composed_track,
#'     xDomain = list(
#'       chromosome = "chr1",
#'       interval = c(1, 3000500)
#'     )
#'   )
#'
#'   ui <- fluidPage(
#'     use_gosling(),
#'     fluidRow(
#'       column(6, gosling_output("gosling_plot")),
#'       column(
#'         1, br(), actionButton(
#'           "download_pdf",
#'           "PDF",
#'           icon = icon("cloud-arrow-down")
#'         )
#'       )
#'     )
#'   )
#'
#'
#'   server <- function(input, output, session) {
#'     output$gosling_plot <- render_gosling({
#'       gosling(
#'         component_id = "component_1",
#'         single_composed_views,
#'         clean_braces = TRUE
#'       )
#'     })
#'
#'     observeEvent(input$download_pdf, {
#'       export_pdf(component_id = "component_1")
#'     })
#'   }
#'
#'   shinyApp(ui, server)
#' }
#'
#' @details For more info visit
#' https://gosling.js.org/ and check for tooltip implementation
#'
#' @return List object. list object with tooltip list object
#' @export
#'
visual_channel_tooltip <- function(field = NULL, type = NULL, alt = NULL, ...) {
  visual_channel(
    field = field, type = type, alt = alt, ...
  )
}


#' Combine tooltips into a list
#'
#' @param ... Any other parameters to pass to gosling.js.
#'
#' @examples
#' if (interactive()) {
#'   library(shiny)
#'   library(shiny.gosling)
#'
#'   cistrome_data <-
#'     "https://server.gosling-lang.org/api/v1/tileset_info/?d=cistrome-multivec" # nolint
#'
#'   single_track <- add_single_track(
#'     id = "track1",
#'     data = track_data(
#'       url = cistrome_data,
#'       type = "multivec",
#'       row = "sample",
#'       column = "position",
#'       value = "peak",
#'       categories = c("sample 1", "sample 2", "sample 3", "sample 4"),
#'       binSize = 4,
#'     ),
#'     mark = "rect",
#'     x = visual_channel_x(field = "start", type = "genomic", axis = "top"),
#'     xe = visual_channel_x(field = "end", type = "genomic"),
#'     row = visual_channel_row(
#'       field = "sample",
#'       type = "nominal",
#'       legend = TRUE
#'     ),
#'     color = visual_channel_color(
#'       field = "peak",
#'       type = "quantitative",
#'       legend = TRUE
#'     ),
#'     tooltip = visual_channel_tooltips(
#'       visual_channel_tooltip(
#'         field = "start", type = "genomic",
#'         alt = "Start Position"
#'       ),
#'       visual_channel_tooltip(
#'         field = "end", type = "genomic",
#'         alt = "End Position"
#'       ),
#'       visual_channel_tooltip(
#'         field = "peak",
#'         type = "quantitative",
#'         alt = "Value",
#'         format = "0.2"
#'       )
#'     ),
#'     width = 600,
#'     height = 130
#'   )
#'
#'   single_composed_track <- compose_view(
#'     tracks = single_track
#'   )
#'
#'   single_composed_views <- arrange_views(
#'     title = "Single Track",
#'     subtitle = "This is the simplest single track visualization with a linear layout", # nolint
#'     layout = "circular", # "linear"
#'     views = single_composed_track,
#'     xDomain = list(
#'       chromosome = "chr1",
#'       interval = c(1, 3000500)
#'     )
#'   )
#'
#'   ui <- fluidPage(
#'     use_gosling(),
#'     fluidRow(
#'       column(6, gosling_output("gosling_plot")),
#'       column(
#'         1, br(), actionButton(
#'           "download_pdf",
#'           "PDF",
#'           icon = icon("cloud-arrow-down")
#'         )
#'       )
#'     )
#'   )
#'
#'
#'   server <- function(input, output, session) {
#'     output$gosling_plot <- render_gosling({
#'       gosling(
#'         component_id = "component_1",
#'         single_composed_views,
#'         clean_braces = TRUE
#'       )
#'     })
#'
#'     observeEvent(input$download_pdf, {
#'       export_pdf(component_id = "component_1")
#'     })
#'   }
#'
#'   shinyApp(ui, server)
#' }
#' @return List object. json list with tooltips combined into a single spec
#' @export
#'
visual_channel_tooltips <- function(...) {
  json_list(...)
}
