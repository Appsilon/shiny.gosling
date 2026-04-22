# Build gosling spec from R list

Build gosling spec from R list

## Usage

``` r
build_json(r_list, clean_braces = TRUE, pretty = TRUE, auto_unbox = TRUE)
```

## Arguments

- r_list:

  R list object built with other gosling functions

- clean_braces:

  Whether to remove extra square brackets from the json string.

- pretty:

  Whether to get json with indentation, line breaks etc.

- auto_unbox:

  If TRUE will automatically unbox() all atomic vectors of length 1.

## Value

json spec for the gosling output
