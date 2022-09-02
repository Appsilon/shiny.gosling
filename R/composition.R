#' @export
add_single_track <- function(
    id = NULL, data = NULL, mark = NULL, assembly = NULL, row = NULL, size = NULL, color = NULL,
    strokeWidth = NULL, opacity = NULL,
    x = NULL, xe = NULL, x1 = NULL, x1e = NULL, y = NULL,
    stroke = NULL, width = NULL, height = NULL, dataTransform = NULL, ...
) {
  visual_channel = add_mark(
    x, xe, x1, x1e, y,
    strokeWidth, opacity, row, size,
    color, stroke
  )
  defaults <- list(
    id = id, data = data, dataTransform = dataTransform, mark = mark,
    assembly = assembly, width = width, height = height
  )
  options <- list(...)
  list_rm_null(
    c(
      defaults, options, visual_channel
    )
  )
}

#' @export
compose_single_track_view <- function(
    multi = FALSE,
    layout = NULL, width = NULL, height = NULL,
    centerRadius = NULL, tracks, ...
) {
  list_rm_null(
    list(
      ..., layout = layout, width = width, height = height,
      centerRadius = centerRadius,
      tracks = ifelse(
        multi, list(tracks),
        list(tracks)
      )
    )
  )
}

#' @export
arrange_views <- function(
    layout = NULL, views = NULL, ...
) {
  list_rm_null(
    list(
      ..., layout = layout, views = list(views)
    )
  )
}

#' @export
add_multi_tracks <- function(...) {
  list(...)
}
