#' @export
visual_channel_x <- function(
    field = NULL, type = NULL, legend = NULL, grid = NULL,
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
    field = NULL, zeroBaseline = NULL,
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
    field = NULL, type = NULL, padding = NULL,
    legend = NULL, grid = NULL, clip = NULL, ...
) {
  list_rm_null(list(
    field = field, type = type, padding = padding, legend = legend,
    grid = grid, clip = clip, ...
  ))
}

#' @export
visual_channel <- function(
    field = NULL, type = NULL, range = NULL, domain = NULL, ...
) {
  list_rm_null(list(
    field = field, type = type, range = range, domain = domain, ...
  ))
}

# TODO
#' Range to be specified like `range = c(min_size, max_size)`
#' @export
visual_channel_size <- function(
    field = NULL, type = NULL, # c("quantitative", "nominal")
    range = NULL, domain = NULL, ...
) {
  list_rm_null(list(
    field = field, type = type, range = range, ...
  ))
}

# TODO
#' @export
visual_channel_text <- function(field = NULL, type = NULL, ...) {
  list_rm_null(list(
    field = field, type = type, ...
  ))
}

#' @export
visual_channel_color <- function(
    field = NULL, title = NULL, type = NULL, scaleOffset = NULL,
    scale = NULL, legend = NULL, ...
) {
  list_rm_null(list(
    field = field, title = title, type = type, scaleOffset = scaleOffset,
    scale = scale, legend = legend, ...
  ))
}

#' @export
visual_channel_stroke <- function(
    field = NULL, title = NULL, type = NULL, scaleOffset = NULL,
    legend = NULL, ...
) {
  list_rm_null(list(
    field = field, title = title, type = type, scaleOffset = scaleOffset,
    legend = legend, ...
  ))
}

# TODO
#' @export
visual_channel_stroke_width <- function(
    field = NULL, type = NULL, ...
) {
  list_rm_null(list(
    field = field, type = type, ...
  ))
}

# TODO
#' @export
visual_channel_opacity <- function(
    field = NULL, type = NULL, ...
) {
  list_rm_null(list(
    field = field, type = type, ...
  ))
}

#' @export
visual_channel_tooltip <- function(
    field = NULL, type = NULL, alt = NULL, ...
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
