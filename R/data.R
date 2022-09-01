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
