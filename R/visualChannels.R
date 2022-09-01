#' @export
visual_channel_x <- function(
    field, type = NULL, legend = NULL, grid = NULL,
    axis = NULL, # c("none", "top", "bottom", "left", "right")
    aggregate = NULL, #c("max", "min", "mean", "bin", "count")
    ...
) {
  list_rm_null(
    list(
      field = field, type = type,
      legend = legend, grid = grid,
      axis = axis, aggregate = aggregate, ...
    )
  )
}

#' @export
visual_channel_y <- function(
    field, zeroBaseline = NULL,
    type = NULL, # c("quantitative", "nominal", "genomic")
    legend = NULL, grid = NULL, flip = NULL, baseline = NULL,
    axis = NULL, # c("none", "top", "bottom", "left", "right")
    aggregate = NULL, #c("max", "min", "mean", "bin", "count")
    ...
) {
  list_rm_null(
    list(
      field = field, zeroBaseline = zeroBaseline, type = type,
      legend = legend, grid = grid, flip = flip, baseline = baseline,
      axis = axis, aggregate = aggregate, ...
    )
  )
}

#' @export
visual_channel_row <- function(
    field, type = NULL, padding = NULL,
    legend = NULL, grid = NULL, clip = NULL, ...
) {
  list_rm_null(list(
    field = field, type = type, padding = padding, legend = legend,
    grid = grid, clip = clip, ...
  ))
}

#' Range to be specified like `range = c(min_size, max_size)`
#' @export
visual_channel_size <- function(
    field, type = NULL, # c("quantitative", "nominal")
    range, ...
) {
  list_rm_null(list(
    field = field, type = type, range = range, ...
  ))
}

#' @export
visual_channel_text <- function(field, type = NULL, ...) {
  list_rm_null(list(
    field = field, type = type, ...
  ))
}

#' @export
visual_channel_color <- function(
    field, title = NULL, type = NULL, scaleOffset = NULL,
    scale = NULL, legend = NULL, ...
) {
  list_rm_null(list(
    field = field, title = title, type = type, scaleOffset = scaleOffset,
    scale = scale, legend = legend, ...
  ))
}

#' @export
visual_channel_stroke <- function(
    field, title = NULL, type = NULL, scaleOffset = NULL,
    legend = NULL, ...
) {
  list_rm_null(list(
    field = field, title = title, type = type, scaleOffset = scaleOffset,
    legend = legend, ...
  ))
}

#' @export
visual_channel_stroke_width <- function(
    field, type = NULL, ...
) {
  list_rm_null(list(
    field = field, type = type, ...
  ))
}

#' @export
visual_channel_opacity <- function(
    field, type = NULL, ...
) {
  list_rm_null(list(
    field = field, type = type, ...
  ))
}

#' @export
visual_channel_tooltip <- function(
    field, type = NULL, alt = NULL, ...
) {
  list(
    field = field, type = type, alt = alt, ...
  )
}

#' @export
visual_channel_tooltips <- function(
    ...
) {
  list(
    ...
  )
}
