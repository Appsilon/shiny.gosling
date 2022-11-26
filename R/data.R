
#' Data object builder
#'
#' Build the data object for golsing plots
#'
#' @param url A character. Specify the URL address of the data file.
#' @param type A character. Type of data. One of "csv", "json", "bigwig", "bam",
#' "vcf", "vector", "multivec" and "beddb". For usage refer to
#' http://gosling-lang.org/docs/data#supported-data-formats.
#' @param separator A character. Specify file separator, Default: ','
#' @param sampleLength A number. Specify the number of rows loaded from
#' the URL. Default: 1000
#' @param headerNames A character vector. Specify the names of data fields
#' if a CSV file is headerless.
#' @param genomicFields A character vector. Specify the name of genomic
#' data fields.
#' @param chromosomeField A character. Specify the name of chromosome
#' data fields.
#' @param ... Any other parameters passed to json data object.
#'
#' @examples
#' if(interactive()) {
#'   library(shiny)
#'   library(shiny.gosling)
#'
#'   # View 2 Track 3----
#'   view2_track3_data <- track_data(
#'     url = "https://server.gosling-lang.org/api/v1/tileset_info/?d=NC_045512_2-multivec",
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
#'     dataTransform = track_data_transform(
#'       type = "filter",
#'       field = "count",
#'       oneOf = list(0),
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
#'     visibility = list(list(
#'       operation = "less-than",
#'       measure = "width",
#'       threshold = "|xe-x|",
#'       transitionPadding = 30,
#'       target = "mark"
#'     ),
#'     list(
#'       operation = "LT",
#'       measure = "zoomLevel",
#'       threshold = 40,
#'       target = "track"
#'     ))
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
#'     inlineLegend = TRUE
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
#'     centerRadius = 0,
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
#'       column(6, goslingOutput("gosling_plot"))
#'     )
#'   )
#'
#'
#'   server <- function(input, output, session) {
#'     output$gosling_plot <- renderGosling({
#'       gosling(
#'         component_id = "sars_cov2",
#'         combined_view
#'       )
#'     })
#'   }
#'
#'   shinyApp(ui, server)
#'
#' }
#' @details For info visit http://gosling-lang.org/docs/data.
#' Check the various supported data formats and their parameters.
#' All of them can be
#' constructed using this function.
#'
#' @return list of data specs
#' @export
#'
track_data <- function(
    url, type, separator = NULL, sampleLength = NULL,
    headerNames = NULL, genomicFields = NULL, chromosomeField = NULL, ...
) {
  list_rm_null(
    list(
      url = url, type = type, separator = separator,
      sampleLength = sampleLength, headerNames = headerNames,
      genomicFields = genomicFields, chromosomeField = chromosomeField, ...
    )
  )
}

#' Data transformer
#'
#' Do data transformations
#'
#' @param type A character. One of "filter", "concat", "replace", "log",
#'  "displace", "exonSplit", "coverage", "genomicLength", "svType"
#'  and "subjson".
#'  Check usage details at http://gosling-lang.org/docs/data/#data-transform.
#' @param field A character.  filter is applied based on the values of the
#' specified data field.
#' @param oneOf A vector of characters or numbers. Check whether the value is
#' an element in the provided list.
#' @param not A Boolean. When {"not": true}, apply a NOT logical operation to
#' the filter. Default: false.
#' @param ... Any other parameters to pass to gosling.js.
#'
#' @examples
#' if(interactive()) {
#'   library(shiny)
#'   library(shiny.gosling)
#'
#'   # View 2 Track 3----
#'   view2_track3_data <- track_data(
#'     url = "https://server.gosling-lang.org/api/v1/tileset_info/?d=NC_045512_2-multivec",
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
#'     dataTransform = track_data_transform(
#'       type = "filter",
#'       field = "count",
#'       oneOf = list(0),
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
#'     visibility = list(list(
#'       operation = "less-than",
#'       measure = "width",
#'       threshold = "|xe-x|",
#'       transitionPadding = 30,
#'       target = "mark"
#'     ),
#'     list(
#'       operation = "LT",
#'       measure = "zoomLevel",
#'       threshold = 40,
#'       target = "track"
#'     ))
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
#'     inlineLegend = TRUE
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
#'     centerRadius = 0,
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
#'       column(6, goslingOutput("gosling_plot"))
#'     )
#'   )
#'
#'
#'   server <- function(input, output, session) {
#'     output$gosling_plot <- renderGosling({
#'       gosling(
#'         component_id = "sars_cov2",
#'         combined_view
#'       )
#'     })
#'   }
#'
#'   shinyApp(ui, server)
#'
#' }
#' @details For info visit http://gosling-lang.org/docs/data#data-transform
#' There are multiple ways to transform data. Check documentation for details
#' of usage.
#'
#' @return list of data transformations specs
#' @export
#'
track_data_transform <- function(
    type = NULL, field = NULL, oneOf = NULL,
    not = NULL, ...
) {
  list(
    list_rm_null(
      list(
        type = type, field = field,
        oneOf = oneOf, not = not, ...
      )
    )
  )
}

#' Combine multiple data transforms
#'
#' @param ... Multiple data transform specs separated by comma.
#'
#' @return list of multiple data transform specs
#' @export
#'
track_data_transforms <- function(...) {
  list(...)
}
