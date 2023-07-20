#' Mouse event styles
#'
#' The styles defined here will be applied to the targets of mouse events,
#' such as a point mark after user click mouse.
#'
#' @param strokeWidth A number. stroke width of the marks when mouse events
#' are triggered.
#' @param strokeOpacity A number.
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
event_styles <- function(
  strokeWidth = NULL, strokeOpacity = NULL, stroke = NULL, opacity = NULL,
  color = NULL, arrange = NULL
) {
  list_rm_null(list(
    strokeWidth = strokeWidth, strokeOpacity = strokeOpacity,
    stroke = stroke, opacity = opacity, color = color,
    arrange = arrange
  ))
}

#' style of the brush mark
#'
#' Customize the style of the brush mark in the `rangeSelect` mouse event.
#'
#' @param strokeWidth A number. stroke width of the marks when mouse events
#' are triggered.
#' @param strokeOpacity A number.
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
brush_styles <- function(
  strokeWidth = NULL, strokeOpacity = NULL, stroke = NULL, opacity = NULL,
  color = NULL
) {
  list_rm_null(list(
    strokeWidth = strokeWidth, strokeOpacity = strokeOpacity,
    stroke = stroke, opacity = opacity, color = color
  ))
}

#' Default styles for tracks
#'
#' @param textStrokeWidth A number. Specify the stroke width of text marks.
#' Can also be specified using the strokeWidth channel option of text marks.
#' @param textStroke A character. Specify the stroke of text marks. Can also
#' be specified using the stroke channel option of text marks.
#' @param textFontWeight A character. One of "bold", "normal". Specify the
#' font weight of text marks.
#' @param textFontSize A number. Specify the font size of text marks. Can
#' also be specified using the size channel option of text marks.
#' @param textAnchor A character. One of "start", "middle", "end". Specify
#' the alignment of text marks to a given point.
#' @param select An object returned by event_styles(). Customize visual
#' effects of rangeSelect events on marks.
#' @param outlineWidth A number.
#' @param outline A character.
#' @param mouseOver An object returned by event_styles(). Customize
#' visual effects of mouseOver events on marks.
#' @param matrixExtent A character.One of "full", "upper-right", "lower-left".
#' Determine to show only one side of the diagonal in a HiGlass matrix.
#' Default: "full".
#' @param linkStyle A character. One of "elliptical", "circular", "straight",
#' "experimentalEdgeBundling". The style of withinLink and betweenLink marks.
#' Default: 'circular' 'elliptical' will be used as a default option.
#' @param linkMinHeight A number. The minimum height of withinLink and
#' betweenLink marks. Unit is a percentage Default: 0.5.
#' @param linkConnectionType  A character. One of "straight", "curve",
#' "corner". Specify the connection type of betweenLink marks. Default: "corner".
#' @param linePattern A list of the form list(size="number",type="string").
#'  One of "triangleLeft", "triangleRight".) Specify the pattern of dashes
#'  and gaps for rule marks.
#' @param legendTitle A character. If defined, show legend title on the top
#' or left.
#' @param inlineLegend A Boolean. Specify whether to show legend in a single
#' horizontal line?
#' @param enableSmoothPath A Boolean. Whether to enable smooth paths when
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
#' @param backgroundOpacity A number.
#' @param background A character.
#' @param align A character. One of "left", "right". Specify the alignment
#' of marks. This property is currently only supported for triangle marks.
#' @param ... Any other styles to be passed to gosling.js.
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
#' @details For more info visit
#' http://gosling-lang.org/docs/visual-channel/#style-related-properties
#'
#' @return List object with default styles.
#' @export
#'
default_track_styles <- function(
  textStrokeWidth = NULL, textStroke = NULL, textFontWeight = NULL,
  textFontSize = NULL, textAnchor = NULL, select = NULL,
  outlineWidth = NULL, outline = NULL, mouseOver = NULL,
  matrixExtent = NULL, linkStyle = NULL, linkMinHeight = NULL,
  linkConnectionType = NULL, linePattern = NULL, legendTitle = NULL,
  inlineLegend = NULL, enableSmoothPath = NULL, dy = NULL, dx = NULL,
  dashed = NULL, curve = NULL, brush = NULL,
  backgroundOpacity = NULL, background = NULL, align = NULL, ...
) {
  list_rm_null(
    list(
      textStrokeWidth = textStrokeWidth, textStroke = textStroke,
      textFontWeight = textFontWeight, textFontSize = textFontSize,
      textAnchor = textAnchor, select = select, outlineWidth = outlineWidth,
      outline = outline, mouseOver = mouseOver, mouseOver = mouseOver,
      linkStyle = linkStyle, linkMinHeight = linkMinHeight,
      linkConnectionType = linkConnectionType, linePattern = linePattern,
      legendTitle = legendTitle, inlineLegend = inlineLegend,
      enableSmoothPath = enableSmoothPath, dy = dy, dx = dx,
      dashed = dashed, curve = curve, brush = brush,
      backgroundOpacity = backgroundOpacity, background = background,
      align = align, ...
    )
  )
}
