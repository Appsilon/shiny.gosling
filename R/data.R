#' Data object builder
#'
#' Build the data object for gosling plots
#'
#' @param url A character. Specify the URL address of the data file.
#' @param type A character. Type of data. One of "csv", "json", "bigwig", "bam",
#' "vcf", "vector", "multivec" and "beddb". For usage refer to
#' http://gosling-lang.org/docs/data#supported-data-formats.
#' @param separator A character. Specify file separator, Default: ','
#' @param sampleLength A number. Specify the number of rows loaded from
#' the URL. Default: 1000
#' @param headerNames A character vector. Specify the names of data fields
#' if a CSV file does not have header row.
#' @param genomicFields A character vector. Specify the name of genomic
#' data fields.
#' @param chromosomeField A character. Specify the name of chromosome
#' data fields.
#' @param genomicFieldsToConvert Define the genomic fields from the data
#' in list format. Experimental Property. Each object follows the format
#' \code{{"chromosomeField":"string","genomicFields":"string[]"} ( )}
#' @param ... Any other parameters passed to json data object.
#'
#' @examples
#' if (interactive()) {
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
    url = NULL, type, separator = NULL, sampleLength = NULL,
    headerNames = NULL, genomicFields = NULL, chromosomeField = NULL,
    genomicFieldsToConvert = NULL, ...) {
  list_rm_null(
    list(
      url = url, type = type, separator = separator,
      sampleLength = sampleLength, headerNames = headerNames,
      genomicFields = genomicFields, chromosomeField = chromosomeField, ...
    )
  )
}


#' Data object builder for a csv file
#'
#' Build the data object for gosling plots
#'
#' @param file A character. Specify the URL address or local file name in the www directory of the data file.
#' @param genomicFields A character vector. Specify the name of genomic data fields.
#' @param chromosomeField A character. Specify the name of chromosome data fields.
#' @param separator A character. Specify file separator, Default: ','
#' @param sampleLength A number. Specify the number of rows loaded from
#' the URL. Default: 1000
#' @param headerNames A character vector. Specify the names of data fields
#' if a CSV file does not have header row.
#' @param ... Any other parameters passed to json data object.
#'
#' @examples
#' if (interactive()) {
#' library(shiny.gosling)
#' library(shiny)
#' library(GenomicRanges)
#'
#' url <- "https://rb.gy/7y3fx"
#' temp_file <- file.path(tempdir(), "GSM1295076_CBX6_BF_ChipSeq_mergedReps_peaks.bed.gz")
#' download.file(url, destfile = temp_file)
#' df <- read.delim(
#'   temp_file,
#'   header = FALSE,
#'   comment.char = "#"
#' )
#' gr <- GRanges(
#'   seqnames = df$V1,
#'   ranges = IRanges(df$V2, df$V3)
#' )
#'
#' if (!dir.exists("data")) {
#'   dir.create("data")
#' }
#' utils::write.csv(gr, "data/ChipSeqPeaks.csv", row.names = FALSE)
#'
#' ui <- fluidPage(
#'   use_gosling(clear_files = FALSE),
#'   goslingOutput("gosling_plot")
#' )
#'
#' track_1 <- add_single_track(
#'   width = 800,
#'   height = 180,
#'   data = track_data_csv(
#'     "data/ChipSeqPeaks.csv", chromosomeField = "seqnames",
#'     genomicFields = c("start", "end")
#'   ),
#'   mark = "bar",
#'   x = visual_channel_x(
#'     field = "start", type = "genomic", axis = "bottom"
#'   ),
#'   xe = visual_channel_x(field = "end", type = "genomic"),
#'   y = visual_channel_y(
#'     field = "width", type = "quantitative", axis = "right"
#'   ),
#'   size = list(value = 5)
#' )
#'
#' composed_view <- compose_view(
#'   layout = "linear",
#'   tracks = track_1
#' )
#'
#' arranged_view <- arrange_views(
#'   title = "Basic Marks: bar",
#'   subtitle = "Tutorial Examples",
#'   views = composed_view
#' )
#'
#' server <- function(input, output, session) {
#'   output$gosling_plot <- renderGosling({
#'     gosling(
#'       component_id = "component_1",
#'       arranged_view
#'     )
#'   })
#' }
#'
#' shiny::shinyApp(ui, server)
#' }
#'
#' @return list of data specs for a csv file
#' @export
track_data_csv <- function(
    file, genomicFields = NULL, chromosomeField = NULL,
    separator = ",", sampleLength = 1000, headerNames = NULL, ...) {
  file_name <- add_file_to_resource_path(file_path = file)
  get_file_track_data(
    file_name,
    genomicFields = genomicFields, chromosomeField = chromosomeField,
    separator = separator, sampleLength = sampleLength, headerNames = headerNames, ...
  )
}

#' Track data object builder for local csv files
#'
#' Get an object for using local csv to build plots
#'
#' @param file_name A character. Specify the file_name.
#' @param genomicFields A character vector. Specify the name of genomic data fields.
#' @param chromosomeField A character. Specify the name of chromosome data fields.
#' @param separator A character. Specify file separator, Default: ','
#' @param sampleLength A number. Specify the number of rows loaded from
#' the URL. Default: 1000
#' @param headerNames A character vector. Specify the names of data fields
#' if a CSV file does not have header row.
#' @param ... Any other parameters passed to json data object.
#'
#' @return list of data specs for a local csv file
get_file_track_data <- function(
    file_name, chromosomeField = NULL, genomicFields = NULL,
    separator = ",", sampleLength = 1000, headerNames = NULL, ...) {
  list_rm_null(
    track_data(
      url = paste0("gosling/", file_name), type = "csv",
      genomicFields = genomicFields, chromosomeField = chromosomeField,
      separator = separator, sampleLength = sampleLength, headerNames = headerNames, ...
    )
  )
}

#' Track data object builder for local csv files
#'
#' Get an object for using local csv to build plots
#'
#' @param file_path A character. Specify the file_path to the local csv file.
#' @param object A gr ranges object.
#'
#' @return list of data specs for a local csv file
add_file_to_resource_path <- function(file_path = NULL, object = NULL) {
  if (!is.null(file_path)) {
    object <- utils::read.csv(file_path)
  }
  file_name <- paste0(digest::digest(object), ".csv")
  if (!file_name %in% list.files(".gosling")) {
    utils::write.csv(object, paste0(".gosling/", file_name), row.names = FALSE)
  }
  file_name
}

#' Data object builder for a GRanges object by locally saving it
#'
#' Build the data object for gosling plots
#'
#' @param granges A GRanges object from the GenomicRanges package with seqnames and ranges
#' @param genomicFields A character vector. Specify the name of genomic data fields.
#' @param chromosomeField A character. Specify the name of chromosome data fields.
#' @param separator A character. Specify file separator, Default: ','
#' @param sampleLength A number. Specify the number of rows loaded from
#' the URL. Default: 1000
#' @param headerNames A character vector. Specify the names of data fields
#' if a CSV file does not have header row.
#' @param ... Any other parameters passed to json data object.
#'
#' @examples
#' if (interactive()) {
#' library(shiny.gosling)
#' library(shiny)
#' library(GenomicRanges)
#'
#' url <- "https://rb.gy/7y3fx"
#' temp_file <- file.path(tempdir(), "GSM1295076_CBX6_BF_ChipSeq_mergedReps_peaks.bed.gz")
#' download.file(url, destfile = temp_file)
#' df <- read.delim(
#'   temp_file,
#'   header = FALSE,
#'   comment.char = "#"
#' )
#' gr <- GRanges(
#'   seqnames = df$V1,
#'   ranges = IRanges(df$V2, df$V3)
#' )
#'
#' ui <- fluidPage(
#'   use_gosling(clear_files = FALSE),
#'   goslingOutput("gosling_plot")
#' )
#'
#' track_1 <- add_single_track(
#'   width = 800,
#'   height = 180,
#'   data = track_data_gr(
#'     gr, chromosomeField = "seqnames",
#'     genomicFields = c("start", "end")
#'   ),
#'   mark = "bar",
#'   x = visual_channel_x(
#'     field = "start", type = "genomic", axis = "bottom"
#'   ),
#'   xe = visual_channel_x(field = "end", type = "genomic"),
#'   y = visual_channel_y(
#'     field = "width", type = "quantitative", axis = "right"
#'   ),
#'   size = list(value = 5)
#' )
#'
#' composed_view <- compose_view(
#'   layout = "linear",
#'   tracks = track_1
#' )
#'
#' arranged_view <- arrange_views(
#'   title = "Basic Marks: bar",
#'   subtitle = "Tutorial Examples",
#'   views = composed_view
#' )
#'
#' server <- function(input, output, session) {
#'   output$gosling_plot <- renderGosling({
#'     gosling(
#'       component_id = "component_1",
#'       arranged_view
#'     )
#'   })
#' }
#'
#' shiny::shinyApp(ui, server)
#' }
#'
#' @return list of data specs for a csv file
#' @export
track_data_gr <- function(
    granges, chromosomeField = NULL, genomicFields = NULL,
    separator = ",", sampleLength = 1000, headerNames = NULL, ...) {
  file_name <- add_file_to_resource_path(object = granges)
  get_file_track_data(
    file_name,
    genomicFields = genomicFields, chromosomeField = chromosomeField,
    separator = separator, sampleLength = sampleLength, headerNames = headerNames, ...
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
#' @param not A Boolean. When \code{{"not": true}}, apply a NOT logical operation to
#' the filter. Default: false.
#' @param ... Any other parameters to pass to gosling.js.
#'
#' @examples
#' if (interactive()) {
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
    not = NULL, ...) {
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
