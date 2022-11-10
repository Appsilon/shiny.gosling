#' Generic visual channel builder
#'
#' @param field
#' @param type
#' @param range
#' @param domain
#' @param ...
#'
#' @details For more info visit http://gosling-lang.org/docs/visual-channel#encode-a-visual-channel
#'
#' @return
#' @export
#'
#' @examples
visual_channel <- function(
    field = NULL, type = NULL, range = NULL, domain = NULL, ...
) {
  list_rm_null(list(
    field = field, type = type, range = range, domain = domain, ...
  ))
}

#' x and xe axis visual channel
#'
#' @param field
#' @param type
#' @param legend
#' @param grid
#' @param axis
#' @param aggregate
#' @param ...
#'
#' @details For more info visit http://gosling-lang.org/docs/visual-channel#x--xe
#'
#' @return
#' @export
#'
#' @examples
visual_channel_x <- function(
    field = NULL, type = NULL, legend = NULL, grid = NULL,
    axis = NULL,
    aggregate = NULL,
    ...
) {
  visual_channel(
    field = field, type = type, legend = legend, grid = grid,
    axis = axis, aggregate = aggregate, ...
  )
}

#' y and ye axis visual channel
#'
#' @param field
#' @param zeroBaseline
#' @param type
#' @param legend
#' @param grid
#' @param flip
#' @param baseline
#' @param axis
#' @param aggregate
#' @param ...
#'
#' @details For more info visit http://gosling-lang.org/docs/visual-channel#y--ye
#'
#' @return
#' @export
#'
#' @examples
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

#' row visual channel
#'
#' @param field
#' @param type
#' @param padding
#' @param legend
#' @param grid
#' @param clip
#' @param ...
#'
#' @details For more info visit http://gosling-lang.org/docs/visual-channel#row
#'
#' @return
#' @export
#'
#' @examples
visual_channel_row <- function(
    field = NULL, type = NULL, padding = NULL,
    legend = NULL, grid = NULL, clip = NULL, ...
) {
  visual_channel(
    field = field, type = type, legend = legend, grid = grid,
    axis = axis, aggregate = aggregate, ...
  )
}

#' size visual channel
#'
#' @param field
#' @param type
#' @param range Range to be specified like `range = c(min_size, max_size)`
#' @param domain
#' @param ...
#'
#' @details For more info visit http://gosling-lang.org/docs/visual-channel#size
#'
#' @return
#' @export
#'
#' @examples
visual_channel_size <- function(
    field = NULL, type = NULL, # c("quantitative", "nominal")
    range = NULL, domain = NULL, ...
) {
  visual_channel(
    field = field, type = type, range = range, domain = domain, ...
  )
}


#' text visual channel
#'
#' @param field
#' @param type
#' @param range
#' @param domain
#' @param ...
#'
#' @details For more info visit http://gosling-lang.org/docs/visual-channel#text
#'
#' @return
#' @export
#'
#' @examples
visual_channel_text <- function(
    field = NULL, type = NULL,
    range = NULL, domain = NULL, ...) {
  visual_channel(
    field = field, type = type, range = range, domain = domain, ...
  )
}


#' color visual channel
#'
#' @param field
#' @param title
#' @param type
#' @param scaleOffset
#' @param scale
#' @param legend
#' @param ...
#'
#' @details For more info visit http://gosling-lang.org/docs/visual-channel#color
#'
#' @return
#' @export
#'
#' @examples
visual_channel_color <- function(
    field = NULL, title = NULL, type = NULL, scaleOffset = NULL,
    scale = NULL, legend = NULL, ...
) {
  visual_channel(
    field = field, type = type, legend = legend, grid = grid,
    axis = axis, aggregate = aggregate, ...
  )
}


#' stroke visual channel
#'
#' @param field
#' @param title
#' @param type
#' @param scaleOffset
#' @param legend
#' @param ...
#'
#' @details For more info visit http://gosling-lang.org/docs/visual-channel#stroke
#'
#' @return
#' @export
#'
#' @examples
visual_channel_stroke <- function(
    field = NULL, title = NULL, type = NULL, scaleOffset = NULL,
    legend = NULL, ...
) {
  visual_channel(
    field = field, type = type, legend = legend, grid = grid,
    axis = axis, aggregate = aggregate, ...
  )
}

#' stroke width visual channel
#'
#' @param field
#' @param type
#' @param range
#' @param domain
#' @param ...
#'
#' @details For more info visit http://gosling-lang.org/docs/visual-channel#strokewidth
#'
#' @return
#' @export
#'
#' @examples
visual_channel_stroke_width <- function(
    field = NULL, type = NULL,
    range = NULL, domain = NULL, ...
) {
  visual_channel(
    field = field, type = type, range = range, domain = domain, ...
  )
}


#' opacity visual channel
#'
#' @param field
#' @param type
#' @param range
#' @param domain
#' @param ...
#'
#' @details For more info visit http://gosling-lang.org/docs/visual-channel#opacity
#'
#' @return
#' @export
#'
#' @examples
visual_channel_opacity <- function(
    field = NULL, type = NULL,
    range = NULL, domain = NULL, ...
) {
  visual_channel(
    field = field, type = type, range = range, domain = domain, ...
  )
}


#' tooltip visual channel
#'
#' @param field
#' @param type
#' @param alt
#' @param ...
#'
#' @details For more info visit https://gosling.js.org/ and check for tooltip implementation
#'
#' @return list object with tooltip list object
#' @export
#'
#' @examples
visual_channel_tooltip <- function(
field = NULL, type = NULL, alt = NULL, ...
) {
  visual_channel(
    field = field, type = type, alt = alt, ...
  )
}


#' Combine tooltips into a list
#'
#' @param ...
#'
#' @return json list with tooltips combined into a single spec
#' @export
#'
#' @examples
visual_channel_tooltips <- function(...) {
  json_list(...)
}
