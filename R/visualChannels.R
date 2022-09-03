#' @export
visual_channel <- function(
    field = NULL, type = NULL, range = NULL, domain = NULL, ...
) {
  list_rm_null(list(
    field = field, type = type, range = range, domain = domain, ...
  ))
}

#' @export
visual_channel_x <- function(
    field = NULL, type = NULL, legend = NULL, grid = NULL,
    axis = NULL, # c("none", "top", "bottom", "left", "right")
    aggregate = NULL, #c("max", "min", "mean", "bin", "count")
    ...
) {
  visual_channel(
    field = field, type = type, legend = legend, grid = grid,
    axis = axis, aggregate = aggregate, ...
  )
}

#' @export
visual_channel_y <- function(
    field = NULL, zeroBaseline = NULL,
    type = NULL, # c("quantitative", "nominal", "genomic")
    legend = NULL, grid = NULL, flip = NULL, baseline = NULL,
    axis = NULL, # c("none", "top", "bottom", "left", "right")
    aggregate = NULL, #c("max", "min", "mean", "bin", "count")
    ...
) {
  visual_channel(
    field = field, type = type, legend = legend, grid = grid,
    axis = axis, aggregate = aggregate, ...
  )
}

#' @export
visual_channel_row <- function(
    field = NULL, type = NULL, padding = NULL,
    legend = NULL, grid = NULL, clip = NULL, ...
) {
  visual_channel(
    field = field, type = type, legend = legend, grid = grid,
    axis = axis, aggregate = aggregate, ...
  )
}

#' Range to be specified like `range = c(min_size, max_size)`
#' @export
visual_channel_size <- function(
    field = NULL, type = NULL, # c("quantitative", "nominal")
    range = NULL, domain = NULL, ...
) {
  visual_channel(
    field = field, type = type, range = range, domain = domain, ...
  )
}

#' @export
visual_channel_text <- function(
    field = NULL, type = NULL,
    range = NULL, domain = NULL, ...) {
  visual_channel(
    field = field, type = type, range = range, domain = domain, ...
  )
}

#' @export
visual_channel_color <- function(
    field = NULL, title = NULL, type = NULL, scaleOffset = NULL,
    scale = NULL, legend = NULL, ...
) {
  visual_channel(
    field = field, type = type, legend = legend, grid = grid,
    axis = axis, aggregate = aggregate, ...
  )
}

#' @export
visual_channel_stroke <- function(
    field = NULL, title = NULL, type = NULL, scaleOffset = NULL,
    legend = NULL, ...
) {
  visual_channel(
    field = field, type = type, legend = legend, grid = grid,
    axis = axis, aggregate = aggregate, ...
  )
}

#' @export
visual_channel_stroke_width <- function(
    field = NULL, type = NULL,
    range = NULL, domain = NULL, ...
) {
  visual_channel(
    field = field, type = type, range = range, domain = domain, ...
  )
}

#' @export
visual_channel_opacity <- function(
    field = NULL, type = NULL,
    range = NULL, domain = NULL, ...
) {
  visual_channel(
    field = field, type = type, range = range, domain = domain, ...
  )
}

#' @export
visual_channel_tooltip <- function(
field = NULL, type = NULL, alt = NULL, ...
) {
  visual_channel(
    field = field, type = type, alt = alt, ...
  )
}

#' @export
visual_channel_tooltips <- function(...) {
  json_list(...)
}
