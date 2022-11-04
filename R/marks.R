#' Visual marks
#'
#' Visual marks (e.g., points, lines, and bars) are
#' the basic graphical elements of a visualization.
#'
#' @param x An object returned by visual_channel_x().
#' @param xe An object returned by visual_channel_x().
#' @param x1 An object returned by visual_channel_x().
#' @param x1e An object returned by visual_channel_x().
#' @param y An object returned by visual_channel_y().
#' @param strokeWidth A number or an object returned by visual_channel_stroke_width().
#' @param opacity  A number or an object returned by visual_channel_opacity().
#' @param row A factor data column Channel row is used with channel y to stratify a visualization with categorical values.
#' @param size A number or an object returned by visual_channel_size().
#' @param color A character or an object returned by visual_channel_color().
#' @param stroke A number or an object returned by visual_channel_stroke().
#'
#' @details For info visit http://gosling-lang.org/docs/mark
#'
#' @return list of mark specifications
#' @export
#'
add_mark <- function(
    x = NULL, xe = NULL, x1 = NULL, x1e = NULL, y = NULL,
    strokeWidth = NULL, opacity = NULL, row = NULL, size = NULL,
    color = NULL, stroke = NULL
) {
  list_rm_null(list(
    x = x, xe = xe, x1 = x1, x1e = x1e, y = y,
    strokeWidth = strokeWidth, opacity = opacity, row = row,
    size = size, color = color, stroke = stroke
  ))
}
