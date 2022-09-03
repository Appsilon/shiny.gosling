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
json_list <- function(...) {
  list(...)
}

atomic_values_to_list <- function(property_list) {
  if(isTRUE(length(property_list) != 0)) {
    for (x in seq(length(property_list))) {
      if(!is.null(property_list[[x]])) {
        if(isTRUE(!names(property_list[x]) %in% c(
          "id", "mark", "width", "height", "title", "subtitle", "alignment",
          "row"
        )) &&
           class(property_list[[x]]) != "list") {
          property_list[[x]] <- list(
            value = property_list[[x]]
          )
        }
      }
    }
  }
  property_list
}
