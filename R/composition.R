#' Add a single track
#'
#' Add a single track to the plot of a mark type ( plot type ). This function
#' constructs a single track from the inputs. The inputs
#' can be id, data, mark etc. Please check gosling.js documentation for
#' advabced usage.
#'
#' @param id Optional argument to assign an id to the track.
#' @param data An object of from track_data() function.
#' @param mark Type of plot. One of c("point", "line", "rect", "bar", "area",
#' "link", "triangle", "text"). Each mark type has some supported
#' visual channel.
#'
#' Different marks support different visual channels:
#' - point: x, y, row, size, color, stroke_width, opacity
#' - line: x, y, row, color, stroke_width
#' - rect: x, xe, row, color, stroke_width, opacity
#' - bar: x, y, row, color, stroke_width, opacity
#' - area: x, y, row, color, stroke_width
#' - link: x, xe, x1, x1e, color, opacity
#' - triangle: x, xe, row, size, color, opacity
#' - text: x, xe, row, color, opacity
#'
#' For more info visit http://gosling-lang.org/tutorials/
#'
#' @param assembly Currently support "hg38", "hg19", "hg18",
#'  "hg17", "hg16", "mm10", "mm9". Defaults to "hg38".
#' @param row An object of from visual_channel_row().
#' @param size An object of from visual_channel_size() OR an atomic number.
#' @param color An object of from visual_channel_color() OR and atomic
#' character hex code of the form "#123456".
#' @param stroke_width An object of from visual_channel_stroke_width() OR an
#' atomic number.
#' @param opacity An object of from visual_channel_opacity() OR and atomic
#' ratio from 0 to 1.
#' @param x An object of from visual_channel_x() OR an atomic value.
#' @param xe An object of from visual_channel_x() OR an atomic value.
#' @param x1 An object of from visual_channel_x() OR an atomic value.
#' @param x1e An object of from visual_channel_x() OR an atomic value.
#' @param y An object of from visual_channel_y() OR an atomic value.
#' @param stroke An object of from visual_channel_stroke() function OR a
#' character of hex color code like "#123456".
#' @param width A number interpreted in units of pixel.
#' @param height A number interpreted in units of pixel.
#' @param data_transform An object of from track_data_transform() function.
#' @param ... Any other arguments to be passed onto gosling.js.
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
#'           "download_png",
#'           "PNG",
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
#'     observeEvent(input$download_png, {
#'       export_png(component_id = "component_1")
#'     })
#'   }
#'
#'   shinyApp(ui, server)
#' }
#' @return list object.
#' @export
add_single_track <- function(id = NULL, data = NULL, mark = NULL,
                             assembly = NULL, row = NULL, size = NULL,
                             color = NULL, stroke_width = NULL, opacity = NULL,
                             x = NULL, xe = NULL, x1 = NULL, x1e = NULL,
                             y = NULL, stroke = NULL, width = NULL,
                             height = NULL, data_transform = NULL, ...) {
  visual_channels <- add_mark(
    x, xe, x1, x1e, y,
    stroke_width, opacity, row, size,
    color, stroke
  )
  defaults <- list(
    id = id, data = data, data_transform = data_transform, mark = mark,
    assembly = assembly, width = width, height = height
  )
  options <- list(...)
  visual_channels <- atomic_values_to_list(visual_channels)
  defaults <- atomic_values_to_list(defaults)
  options <- atomic_values_to_list(options)
  list_rm_null(
    c(
      defaults, options, visual_channels
    )
  )
}

#' Compose views
#'
#' Compose views from add_single_track() and add_multi_tracks() functions.
#'
#' @param multi Whether multiple tracks in the view.
#' @param layout One of "linear" or "circular".
#' @param width A number interpreted in units of pixel.
#' @param height A number interpreted in units of pixel.
#' @param center_radius Specify the proportion of the radius of
#'  the center white space. A number between c(0,1), default=0.3
#' @param tracks The tracks with add_multi_tracks() function.
#' @param ... More arguments passed along with view to gosling.js.
#'
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
#' @return list object.
#' @export
compose_view <- function(multi = FALSE,
                         layout = NULL, width = NULL, height = NULL,
                         center_radius = NULL, tracks, ...) {
  list_rm_null(
    list(
      ...,
      layout = layout, width = width, height = height,
      center_radius = center_radius,
      tracks = if (multi) tracks else list(tracks)
    )
  )
}

#' Arrange views
#'
#' Arrange views from compose_view() function.
#'
#' @param layout One of "linear" or "circular".
#' @param listify A Boolean. Convert views to list..
#' @param views An object from compose_view() function.
#' @param ... More options passed to gosling.js.
#'
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
#' @return list object.
#' @export
arrange_views <- function(layout = NULL, views = NULL, listify = TRUE, ...) {
  list_rm_null(
    list(
      ...,
      layout = layout,
      views = if (listify) list(views) else views
    )
  )
}

#' Combine single tracks.
#'
#' @param ... Multiple tracks from add_single_track() function.
#'
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
#' @return json list.
#' @export
add_multi_tracks <- function(...) {
  json_list(...)
}
