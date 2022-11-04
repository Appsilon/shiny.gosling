
#' Data object builder
#'
#' Build the data object for golsing plots
#'
#' @param url A character. Specify the URL address of the data file.
#' @param type A character. Type of data. One of "csv", "json", "bigwig", "bam",
#' "vcf", "vector", "multivec" and "beddb". For usage refer to http://gosling-lang.org/docs/data#supported-data-formats.
#' @param separator A character. Specify file separator, Default: ','
#' @param sampleLength A number. Specify the number of rows loaded from the URL. Default: 1000
#' @param headerNames A character vector. Specify the names of data fields if a CSV file is headerless.
#' @param genomicFields A character vector. Specify the name of genomic data fields.
#' @param chromosomeField A character. Specify the name of chromosome data fields.
#' @param ... Any other parameters passed to json data object.
#'
#' @details For info visit http://gosling-lang.org/docs/data.
#' Check the various supported data formats and their parameters. All of them can be
#' constructed using this function.
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
#' @param type A character. One of "filter", "concat", "replace", "log",
#'  "displace", "exonSplit", "coverage", "genomicLength", "svType" and "subjson".
#'  Check usage details at http://gosling-lang.org/docs/data/#data-transform.
#' @param field A character.  filter is applied based on the values of the specified data field.
#' @param oneOf A vector of characters or numbers. Check whether the value is an element in the provided list.
#' @param not. A Boolean. When {"not": true}, apply a NOT logical operation to the filter. Default: false.
#' @param ...
#'
#' @details For info visit http://gosling-lang.org/docs/data#data-transform
#' There are multiple ways to transform data. Check documentation for details of usage.
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
