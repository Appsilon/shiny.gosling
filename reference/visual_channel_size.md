# size visual channel

size visual channel

## Usage

``` r
visual_channel_size(
  field = NULL,
  type = NULL,
  range = NULL,
  domain = NULL,
  ...
)
```

## Arguments

- field:

  A character. Name of the data field.

- type:

  A character. Must be "genomic". Specify the data type.

- range:

  A vector of characters or numbers. Values of the visual channel. Range
  to be specified like `range = c(min_size, max_size)`

- domain:

  A vector of characters or numbers. Values of the data.

- ...:

  Any other parameters to pass to gosling.js.

## Value

List object.

## Details

For more info visit http://gosling-lang.org/docs/visual-channel#size
