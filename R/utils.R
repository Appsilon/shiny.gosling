list_rm_null <- function(r_list) {
  Filter(
    Negate(is.null),
    r_list
  )
}

#' @export
build_json <- function(r_list, single_track = TRUE, pretty = TRUE, auto_unbox = TRUE) {
  if(single_track) {
    jsonlite::toJSON(r_list, pretty = pretty, auto_unbox = auto_unbox)
  } else {
    json <- jsonlite::toJSON(r_list, pretty = FALSE, auto_unbox = auto_unbox)
    edited_json <- gsub("\\]\\]", "]", gsub("\\[\\[", "[", json))
    jsonlite::prettify(edited_json)
  }



}

#' @export
generic_list <- function(...) {
  list(...)
}
