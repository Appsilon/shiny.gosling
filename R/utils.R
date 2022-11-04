#' Remove null from list
#'
#' @param r_list An r list with NULL values
#'
#' @return r list without NULL values
#' @export
#'
list_rm_null <- function(r_list) {
  Filter(
    Negate(is.null),
    r_list
  )
}

#' Build gosling spec from R list
#'
#' @param r_list R list object built with other gosling functions
#' @param single_track Whether single track. If FALSE then there must be more than 1 track in r_list
#' @param pretty Whether to get json with indentation, line breaks etc.
#' @param auto_unbox If TRUE will automatically unbox() all atomic vectors of length 1.
#'
#' @return json spec for the gosling output
#' @export
#'
build_json <- function(r_list, single_track = TRUE, pretty = TRUE, auto_unbox = TRUE) {
  if(single_track) {
    jsonlite::toJSON(r_list, pretty = pretty, auto_unbox = auto_unbox)
  } else {
    json <- jsonlite::toJSON(r_list, pretty = FALSE, auto_unbox = auto_unbox)
    edited_json <- gsub("\\]\\]", "]", gsub("\\[\\[", "[", json))
    jsonlite::prettify(edited_json)
  }
}

#' Create list
#'
#' @param ... Items to be put in a list
#'
#' @return list of items
#' @export
#'
json_list <- function(...) {
  list(...)
}

#' Title
#'
#' @param property_list A character or number or another atomic value.
#'
#' @return List.
#' @export
#'
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

#' Initiate gosling
#'
#' Add this function at the begining of ui. This is needed for gosling to work in shiny plots.
#'
#' @return Gosling initiator HTML.
#' @export
use_gosling <- function() {
  GoslingComponent(
    spec = shiny.react::JS(
      build_json(
        NULL
      )
    )
  )
}


#' Build gosling plot object
#'
#' @param component_id Assign a component id to use other api like zoom.
#' @param composed_views The views composed with arrange_views.
#' @param single_track Whether single track view.
#'
#' @return Gosling component for rendering on R shiny apps
#' @export
#'
gosling <- function(component_id, composed_views, single_track) {
  GoslingComponent(
    component_id = component_id,
    spec = shiny.react::JS(
      build_json(
        composed_views, single_track = single_track
      )
    )
  )
}
