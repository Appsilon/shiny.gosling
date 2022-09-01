add_point_mark <- function(
    x = NULL, y = NULL, row = NULL, size = NULL, color = NULL,
    strokeWidth = NULL, opacity = NULL, stroke = NULL) {
  list_rm_null(list(
    x = x, y = y, row = row, size = size, color = color,
    strokeWidth = strokeWidth, opacity = opacity, stroke = stroke
  ))
}

add_line_mark <- function(x = NULL, y = NULL, row = NULL,
                          color = NULL, strokeWidth = NULL) {
  list_rm_null(list(
    x = x, y = y, row = row, color = color,
    strokeWidth = strokeWidth
  ))
}

add_rect_mark <- function(x = NULL, xe = NULL, row = NULL, color = NULL,
                          strokeWidth = NULL, opacity = NULL, stroke = NULL) {
  list_rm_null(list(
    x = x, xe = xe, row = row, color = color,
    strokeWidth = strokeWidth, opacity = opacity, stroke = stroke
  ))
}

add_bar_mark <- function(x = NULL, y = NULL, row = NULL, color = NULL,
                         strokeWidth = NULL, opacity = NULL, stroke = NULL) {
  list_rm_null(list(
    x = x, y = y, row = row, color = color,
    strokeWidth = strokeWidth, opacity = opacity, stroke = stroke
  ))
}

add_area_mark <- function(x = NULL, y = NULL, row = NULL,
                          color = NULL, strokeWidth = NULL, stroke = NULL) {
  list_rm_null(list(
    x = x, y = y, row = row, color = color,
    strokeWidth = strokeWidth, stroke = stroke
  ))
}

add_link_mark <- function(x = NULL, xe = NULL, x1 = NULL, x1e = NULL,
                          color = NULL, opacity = NULL, stroke = NULL) {
  list_rm_null(list(
    x = x, xe = xe, x1 = x1, x1e = x1e, color = color, opacity = opacity,
    stroke = stroke
  ))
}


add_triangle_mark <- function(x = NULL, xe = NULL, row = NULL,
                              size = NULL, color = NULL, opacity = NULL) {
  list_rm_null(list(
    x = x, xe = xe, row = row, size = size, color = color,
    opacity = opacity
  ))
}


add_text_mark <- function(x = NULL, xe = NULL, row = NULL, color = NULL,
                          opacity = NULL) {
  list_rm_null(list(
    x = x, y = y, row = row, size = size, color = color,
    strokeWidth = strokeWidth, opacity = opacity
  ))
}
