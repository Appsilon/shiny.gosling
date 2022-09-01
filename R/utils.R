list_rm_null <- function(r_list) {
  Filter(
    Negate(is.null),
    r_list
  )
}

#' @export
build_json <- function(r_list) {
  jsonlite::toJSON(r_list, pretty = TRUE, auto_unbox = TRUE)
}
