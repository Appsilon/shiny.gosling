#' Generic visual channel builder
#'
#' @param field A character. Name of the data field.
#' @param type A character. Must be "genomic". Specify the data type.
#' @param range A vector of characters or numbers. Values of the visual channel.
#' @param domain A vector of characters or numbers. Values of the data.
#' @param ... Any other parameters to pass to gosling.js.
#'
#' @details For more info visit
#' http://gosling-lang.org/docs/visual-channel#encode-a-visual-channel
#'
#' @return List object.
#'
visual_channel <- function(
    field = NULL, type = NULL, range = NULL, domain = NULL, ...
) {
  list_rm_null(list(
    field = field, type = type, range = range, domain = domain, ...
  ))
}

#' x and xe axis visual channel
#'
#' @param field A character. Name of the data field.
#' @param type A character. Must be "genomic". Specify the data type.
#' @param legend A Boolean. Whether to display legend. Default: FALSE.
#' @param grid A Boolean. Whether to display grid. Default: FALSE.
#' @param axis A character. One of "none", "top", "bottom", "left", "right".
#' Specify where should the axis be put.
#' @param aggregate A character. One of "max", "min", "mean", "bin", "count".
#' Specify how to aggregate data. Default: undefined.
#' @param ... Any other parameters to pass to gosling.js.
#'
#' @details For more info visit
#' http://gosling-lang.org/docs/visual-channel#x--xe
#'
#' @return List object.
#' @export
#'
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
#' @param field A character. Name of the data field.
#' @param zeroBaseline A Boolean. Specify whether to use zero baseline.
#' Default: TRUE.
#' @param type A character. Must be "genomic". Specify the data type.
#' @param legend A Boolean. Whether to display legend. Default: FALSE.
#' @param grid A Boolean. Whether to display grid. Default: FALSE.
#' @param flip A Boolean. Whether to flip the y-axis. This is done by
#' inverting the range property. Default: FALSE.
#' @param baseline A character or number. Custom baseline of the y-axis.
#' Default: 0.
#' @param axis A character. One of "none", "top", "bottom", "left", "right".
#' Specify where should the axis be put.
#' @param aggregate A character. One of "max", "min", "mean", "bin", "count".
#' Specify how to aggregate data. Default: undefined.
#' @param ... Any other parameters to pass to gosling.js.
#'
#' @details For more info visit
#' http://gosling-lang.org/docs/visual-channel#y--ye
#'
#' @return List object.
#' @export
#'
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
#' @param field A character. Name of the data field.
#' @param type A character. Must be "genomic". Specify the data type.
#' @param padding A number. Determines the size of inner white spaces on the
#' top and bottom of individiual rows. Default: 0.
#' @param legend A Boolean. Whether to display legend. Default: FALSE.
#' @param grid A Boolean. Whether to display grid. Default: FALSE.
#' @param clip A Boolean. Clip row when the actual y value exceeds the max
#' value of the y scale. Used only for bar marks at the moment. Default: TRUE.
#' @param axis A character. One of "none", "top", "bottom", "left", "right".
#' Specify where should the axis be put.
#' @param aggregate A character. One of "max", "min", "mean", "bin", "count".
#' Specify how to aggregate data. Default: undefined.
#' @param ... Any other parameters to pass to gosling.js.
#'
#' @details For more info visit
#' http://gosling-lang.org/docs/visual-channel#row
#'
#' @return List object.
#' @export
#'
visual_channel_row <- function(
    field = NULL, type = NULL, padding = NULL,
    legend = NULL, grid = NULL, clip = NULL, axis = NULL,
    aggregate = NULL, ...
) {
  visual_channel(
    field = field, type = type, legend = legend, grid = grid,
    axis = axis, aggregate = aggregate, ...
  )
}

#' size visual channel
#'
#' @param field A character. Name of the data field.
#' @param type A character. Must be "genomic". Specify the data type.
#' @param range A vector of characters or numbers. Values of the visual
#' channel. Range to be specified like `range = c(min_size, max_size)`
#' @param domain A vector of characters or numbers. Values of the data.
#' @param ... Any other parameters to pass to gosling.js.
#'
#' @details For more info visit
#' http://gosling-lang.org/docs/visual-channel#size
#'
#' @return List object.
#' @export
#'
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
#' @param field A character. Name of the data field.
#' @param type A character. Must be "genomic". Specify the data type.
#' @param range A vector of characters or numbers. Values of the visual channel.
#' @param domain A vector of characters or numbers. Values of the data.
#' @param ... Any other parameters to pass to gosling.js.
#'
#' @details For more info visit
#' http://gosling-lang.org/docs/visual-channel#text
#'
#' @return List object.
#' @export
#'
visual_channel_text <- function(
    field = NULL, type = NULL,
    range = NULL, domain = NULL, ...) {
  visual_channel(
    field = field, type = type, range = range, domain = domain, ...
  )
}


#' color visual channel
#'
#' @param field A character. Name of the data field.
#' @param title A character. Title of the legend. Default: undefined.
#' @param type A character. Must be "genomic". Specify the data type.
#' @param scaleOffset A number vector of the form c(1, 2). Whether
#' to use offset of the domain proportionally. This is bound to brushes
#' on the color legend. Default: c(0, 1).
#' @param scale A character. One of "linear", "log".
#' @param legend A Boolean. Whether to display legend. Default: FALSE.
#' @param grid A Boolean. Whether to display grid. Default: FALSE.
#' @param axis A character. One of "none", "top", "bottom", "left", "right".
#' Specify where should the axis be put.
#' @param aggregate A character. One of "max", "min", "mean", "bin", "count".
#' Specify how to aggregate data. Default: undefined.
#' @param ... Any other parameters to pass to gosling.js.
#'
#' @details For more info visit
#' http://gosling-lang.org/docs/visual-channel#color
#'
#' @return List object.
#' @export
#'
visual_channel_color <- function(
    field = NULL, title = NULL, type = NULL, scaleOffset = NULL,
    scale = NULL, legend = NULL, grid = NULL, axis = NULL,
    aggregate = NULL, ...
) {
  visual_channel(
    field = field, type = type, legend = legend, grid = grid,
    axis = axis, aggregate = aggregate, ...
  )
}


#' stroke visual channel
#'
#' @param field A character. Name of the data field.
#' @param title A character. Title of the legend. Default: undefined.
#' @param type A character. Must be "genomic". Specify the data type.
#' @param scaleOffset A number vector of the form c(1, 2). Whether to use
#' offset of the domain proportionally. This is bound to brushes on the color
#' legend. Default: c(0, 1).
#' @param legend A Boolean. Whether to display legend. Default: FALSE.
#' @param grid A Boolean. Whether to display grid. Default: FALSE.
#' @param axis A character. One of "none", "top", "bottom", "left", "right".
#' Specify where should the axis be put.
#' @param aggregate A character. One of "max", "min", "mean", "bin", "count".
#' Specify how to aggregate data. Default: undefined.
#' @param ... Any other parameters to pass to gosling.js.
#'
#' @details For more info visit
#' http://gosling-lang.org/docs/visual-channel#stroke
#'
#' @return List object.
#' @export
#'
visual_channel_stroke <- function(
    field = NULL, title = NULL, type = NULL, scaleOffset = NULL,
    legend = NULL, grid = NULL, axis = NULL, aggregate = NULL,  ...
) {
  visual_channel(
    field = field, type = type, legend = legend, grid = grid,
    axis = axis, aggregate = aggregate, ...
  )
}

#' stroke width visual channel
#'
#' @param field A character. Name of the data field.
#' @param type A character. Must be "genomic". Specify the data type.
#' @param range A vector of characters or numbers. Values of the visual channel.
#' @param domain A vector of characters or numbers. Values of the data.
#' @param ... Any other parameters to pass to gosling.js.
#'
#' @details For more info visit
#' http://gosling-lang.org/docs/visual-channel#strokewidth
#'
#' @return List object.
#' @export
#'
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
#' @param field A character. Name of the data field.
#' @param type A character. Must be "genomic". Specify the data type.
#' @param range A vector of characters or numbers. Values of the visual channel.
#' @param domain A vector of characters or numbers. Values of the data.
#' @param ... Any other parameters to pass to gosling.js.
#'
#' @details For more info visit
#' http://gosling-lang.org/docs/visual-channel#opacity
#'
#' @return List object.
#' @export
#'
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
#' @param field A character. Name of the data field.
#' @param type A character. Must be "genomic". Specify the data type.
#' @param alt A character.
#' @param ... Any other parameters to pass to gosling.js.
#'
#' @details For more info visit
#' https://gosling.js.org/ and check for tooltip implementation
#'
#' @return List object. list object with tooltip list object
#' @export
#'
visual_channel_tooltip <- function(
    field = NULL, type = NULL, alt = NULL, ...
) {
  visual_channel(
    field = field, type = type, alt = alt, ...
  )
}


#' Combine tooltips into a list
#'
#' @param ... Any other parameters to pass to gosling.js.
#'
#' @return List object. json list with tooltips combined into a single spec
#' @export
#'
visual_channel_tooltips <- function(...) {
  json_list(...)
}
