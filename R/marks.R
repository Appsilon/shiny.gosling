#' Visual marks
#'
#' Visual marks (e.g., points, lines, and bars) are
#' the basic graphical elements of a visualization.
#'
#' @param x
#' @param xe
#' @param x1
#' @param x1e
#' @param y
#' @param strokeWidth
#' @param opacity
#' @param row
#' @param size
#' @param color
#' @param stroke
#'
#' @details For info visit http://gosling-lang.org/docs/mark
#'
#' @return list of mark specifications
#' @export
#'
#' @examples
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
