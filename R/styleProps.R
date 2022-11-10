#' Mouse event styles
#'
#' The styles defined here will be applied to the targets of mouse events, such as a point mark after user click mouse.
#'
#' @param strokeWidth
#' @param strokeOpacity
#' @param stroke
#' @param opacity
#' @param color
#' @param arrange
#'
#' @details For more info visit http://gosling-lang.org/docs/visual-channel/#type-eventstyle
#'
#' @return list of event styles
#' @export
#'
#' @examples
event_styles <- function(
    strokeWidth = NULL, strokeOpacity = NULL, stroke = NULL, opacity = NULL,
    color = NULL, arrange = NULL # c("behind", "front")
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
#' @param strokeWidth
#' @param strokeOpacity
#' @param stroke
#' @param opacity
#' @param color
#'
#' @details For more info visit http://gosling-lang.org/docs/visual-channel/#type-brush
#'
#' @return
#' @export
#'
#' @examples
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
#' @param textStrokeWidth
#' @param textStroke
#' @param textFontWeight
#' @param textFontSize
#' @param textAnchor
#' @param select
#' @param outlineWidth
#' @param outline
#' @param mouseOver
#' @param matrixExtent
#' @param linkStyle
#' @param linkMinHeight
#' @param linkConnectionType
#' @param linePattern
#' @param legendTitle
#' @param inlineLegend
#' @param enableSmoothPath
#' @param dy
#' @param dx
#' @param dashed
#' @param curve
#' @param brush
#' @param backgroundOpacity
#' @param background
#' @param align
#' @param ...
#'
#' @details For more info visit http://gosling-lang.org/docs/visual-channel/#style-related-properties
#'
#' @return
#' @export
#'
#' @examples
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
