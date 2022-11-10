
#' Data object builder
#'
#' Build the data object for golsing plots
#'
#' @param url
#' @param type
#' @param separator
#' @param sampleLength
#' @param headerNames
#' @param genomicFields
#' @param chromosomeField
#' @param ...
#'
#' @details For info visit http://gosling-lang.org/docs/data
#'
#' @return list of data specs
#' @export
#'
#' @examples
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

#' Data transformer
#'
#' Do data transformations
#'
#' @param type
#' @param field
#' @param oneOf
#' @param not
#' @param ...
#'
#' @details For info visit http://gosling-lang.org/docs/data#data-transform
#'
#' @return list of data transformations specs
#' @export
#'
#' @examples
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

#' Combine multiple data transforms
#'
#' @param ... Multiple data transform specs separated by comma
#'
#' @return list of multiple data transform specs
#' @export
#'
#' @examples
track_data_transforms <- function(...) {
  list(...)
}
