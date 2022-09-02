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
