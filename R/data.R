#' @param url
#'
#' @param type
#' @param separator
#' @param sampleLength
#' @param headerNames
#' @param genomicFields
#' @param chromosomeField
#' @param ...
#'
#' @export
track_data <- function(
    url, type, separator = NULL, sampleLength = NULL,
    headerNames = NULL, genomicFields = NULL, chromosomeField = NULL, ...
) {
  list_rm_null(
    list(
      url = url, type = type, separator = separator,
      sampleLength = sampleLength, headerNames = headerNames,
      genomicFields = genomicFields, chromosomeField = chromosomeField, ...
    )
  )
}

#' @param type
#'
#' @param field
#' @param oneOf
#' @param not
#' @param ...
#'
#' @export
track_data_transform <- function(
    type = NULL, field = NULL, oneOf = NULL,
    not = NULL, ...
) {
  list(
    list_rm_null(
      list(
        type = type, field = field,
        oneOf = oneOf, not = not, ...
      )
    )
  )
}

#' @param ...
#'
#' @export
track_data_transforms <- function(...) {
  list(...)
}
