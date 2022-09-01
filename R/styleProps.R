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

brush_styles <- function(
    strokeWidth = NULL, strokeOpacity = NULL, stroke = NULL, opacity = NULL,
    color = NULL
) {
  list_rm_null(list(
    strokeWidth = strokeWidth, strokeOpacity = strokeOpacity,
    stroke = stroke, opacity = opacity, color = color
  ))
}

#' @export
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
