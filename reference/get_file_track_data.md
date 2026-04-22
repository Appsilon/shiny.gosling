# Track data object builder for local csv files

Get an object for using local csv to build plots

## Usage

``` r
get_file_track_data(
  file_name,
  chromosomeField = NULL,
  genomicFields = NULL,
  separator = ",",
  sampleLength = 1000,
  headerNames = NULL,
  ...
)
```

## Arguments

- file_name:

  A character. Specify the file_name.

- chromosomeField:

  A character. Specify the name of chromosome data fields.

- genomicFields:

  A character vector. Specify the name of genomic data fields.

- separator:

  A character. Specify file separator, Default: ','

- sampleLength:

  A number. Specify the number of rows loaded from the URL. Default:
  1000

- headerNames:

  A character vector. Specify the names of data fields if a CSV file
  does not have header row.

- ...:

  Any other parameters passed to json data object.

## Value

list of data specs for a local csv file
