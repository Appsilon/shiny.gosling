#' Mouse event styles
#'
#' The styles defined here will be applied to the targets of mouse events,
#' such as a point mark after user click mouse.
#'
#' @param stroke_width A number. stroke width of the marks when mouse events
#' are triggered.
#' @param stroke_opacity A number.
#' @param stroke A character. Stroke color of the marks when mouse events are
#' triggered.
#' @param opacity A number. Opacity of the marks when mouse events
#' are triggered.
#' @param color A character. Color of the marks when mouse events
#' are triggered.
#' @param arrange A character. One of "behind", "front". Show event effects
#' behind or in front of marks.
#'
#' @details For more info visit
#' http://gosling-lang.org/docs/visual-channel/#type-eventstyle
#'
#' @return List object with event styles.
#'
event_styles <- function(stroke_width = NULL, stroke_opacity = NULL,
                         stroke = NULL, opacity = NULL, color = NULL,
                         arrange = NULL) {
  list_rm_null(list(
    stroke_width = stroke_width, stroke_opacity = stroke_opacity,
    stroke = stroke, opacity = opacity, color = color,
    arrange = arrange
  ))
}

#' style of the brush mark
#'
#' Customize the style of the brush mark in the `rangeSelect` mouse event.
#'
#' @param stroke_width A number. stroke width of the marks when mouse events
#' are triggered.
#' @param stroke_opacity A number.
#' @param stroke A character. Stroke color of the marks when mouse events
#' are triggered.
#' @param opacity A number. Opacity of the marks when mouse events are
#' triggered.
#' @param color A character. Color of the marks when mouse events are
#' triggered.
#'
#' @details For more info visit
#' http://gosling-lang.org/docs/visual-channel/#type-brush
#'
#' @return List object with brush styles.
#'
brush_styles <- function(stroke_width = NULL, stroke_opacity = NULL,
                         stroke = NULL, opacity = NULL, color = NULL) {
  list_rm_null(list(
    stroke_width = stroke_width, stroke_opacity = stroke_opacity,
    stroke = stroke, opacity = opacity, color = color
  ))
}

#' Default styles for tracks
#'
#' @param text_stroke_width A number. Specify the stroke width of text marks.
#' Can also be specified using the stroke_width channel option of text marks.
#' @param text_stroke A character. Specify the stroke of text marks. Can also
#' be specified using the stroke channel option of text marks.
#' @param text_font_weight A character. One of "bold", "normal". Specify the
#' font weight of text marks.
#' @param text_font_size A number. Specify the font size of text marks. Can
#' also be specified using the size channel option of text marks.
#' @param text_anchor A character. One of "start", "middle", "end". Specify
#' the alignment of text marks to a given point.
#' @param select An object returned by event_styles(). Customize visual
#' effects of rangeSelect events on marks.
#' @param outline_width A number.
#' @param outline A character.
#' @param mouse_over An object returned by event_styles(). Customize
#' visual effects of mouse_over events on marks.
#' @param matrix_extent A character.One of "full", "upper-right", "lower-left".
#' Determine to show only one side of the diagonal in a HiGlass matrix.
#' Default: "full".
#' @param link_style A character. One of "elliptical", "circular", "straight",
#' "experimentalEdgeBundling". The style of withinLink and betweenLink marks.
#' Default: 'circular' 'elliptical' will be used as a default option.
#' @param link_min_height A number. The minimum height of withinLink and
#' betweenLink marks. Unit is a percentagle. Default: 0.5.
#' @param link_connection_type  A character. One of "straight", "curve",
#' "corner". Specify the connetion type of betweenLink marks. Default: "corner".
#' @param line_pattern A list of the form list(size="number",type="string").
#'  One of "triangleLeft", "triangleRight".) Specify the pattern of dashes
#'  and gaps for rule marks.
#' @param legend_title A character. If defined, show legend title on the top
#' or left.
#' @param inline_legend A Boolean. Specify whether to show legend in a single
#' horizontal line?
#' @param enable_smooth_path A Boolean. Whether to enable smooth paths when
#' drawing curves. Default: FALSE.
#' @param dy A number. Offset the position of marks in y direction. This
#' property is currently only supported for text marks.
#' @param dx A number. Offset the position of marks in x direction. This
#' property is currently only supported for text marks.
#' @param dashed An vector of number like c(1, 2). Specify the pattern of
#' dashes and gaps for rule marks.
#' @param curve A character. One of "top", "bottom", "left", "right".
#' Specify the curve of rule marks.
#' @param brush An object returned by brush_styles(). Customize the
#' style of the brush mark in the rangeSelect mouse event.
#' @param background_opacity A number.
#' @param background A character.
#' @param align A character. One of "left", "right". Specify the alignment
#' of marks. This property is currently only supported for triangle marks.
#' @param ... Any other styles to be passed to gosling.js.
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
#' @details For more info visit
#' http://gosling-lang.org/docs/visual-channel/#style-related-properties
#'
#' @return List object with default styles.
#' @export
#'
default_track_styles <- function(text_stroke_width = NULL, text_stroke = NULL,
                                 text_font_weight = NULL, text_font_size = NULL,
                                 text_anchor = NULL, select = NULL,
                                 outline_width = NULL, outline = NULL,
                                 mouse_over = NULL, matrix_extent = NULL,
                                 link_style = NULL, link_min_height = NULL,
                                 link_connection_type = NULL, line_pattern = NULL,
                                 legend_title = NULL, inline_legend = NULL,
                                 enable_smooth_path = NULL, dy = NULL, dx = NULL,
                                 dashed = NULL, curve = NULL, brush = NULL,
                                 background_opacity = NULL, background = NULL,
                                 align = NULL, ...) {
  list_rm_null(
    list(
      text_stroke_width = text_stroke_width, text_stroke = text_stroke,
      text_font_weight = text_font_weight, text_font_size = text_font_size,
      text_anchor = text_anchor, select = select, outline_width = outline_width,
      outline = outline, mouse_over = mouse_over, mouse_over = mouse_over,
      link_style = link_style, link_min_height = link_min_height,
      link_connection_type = link_connection_type, line_pattern = line_pattern,
      legend_title = legend_title, inline_legend = inline_legend,
      enable_smooth_path = enable_smooth_path, dy = dy, dx = dx,
      dashed = dashed, curve = curve, brush = brush,
      background_opacity = background_opacity, background = background,
      align = align, ...
    )
  )
}
