#' @export
add_single_track <- function(
    id, data, mark, assembly = NULL, row = NULL, size = NULL, color = NULL,
    strokeWidth = NULL, opacity = NULL,
    x, xe = NULL, x1 = NULL, x1e = NULL, y = NULL,
    stroke = NULL, width = NULL, height = NULL, dataTransform = NULL, ...
) {
  visual_channel <- switch(
    mark,
    "point" = add_point_mark(x, y, row, size, color, strokeWidth, opacity, stroke),
    "line" = add_line_mark(x, y, row, color, strokeWidth),
    "rect" = add_rect_mark(x, xe, row, color, strokeWidth, opacity, stroke),
    "bar" = add_bar_mark(x, y, row, color, strokeWidth, opacity, stroke),
    "area" = add_area_mark(x, y, row, color, strokeWidth, stroke),
    "link" = add_link_mark(x, xe, x1, x1e, color, opacity, stroke),
    "triangle" = add_triangle_mark(x, xe, row, size, color, opacity),
    "text" = add_text_mark(x, xe, row, color, opacity)
  )
  defaults <- list(
    id = id, data = data, dataTransform = dataTransform, mark = mark,
    assembly = assembly, width = width, height = height
  )
  options <- list(...)
  list_rm_null(
    c(
      defaults, visual_channel, options
    )
  )
}

#' @export
compose_single_track_view <- function(
    layout = NULL, width = NULL, height = NULL,
    centerRadius = NULL, tracks, ...
) {
  list_rm_null(
    list(
      layout = layout, width = width, height = height,
      centerRadius = centerRadius, tracks = list(tracks), ...
    )
  )
}

#' @export
arrange_views <- function(
    single_track = TRUE, layout = NULL, views = NULL, ...
) {
  if(!single_track) {

  } else {
    list_rm_null(
      list(
        layout = layout, ..., views = list(views)
      )
    )
  }
}
