# Runs a shiny.gosling example

Runs a shiny.gosling example

## Usage

``` r
run_example(example = NA)
```

## Arguments

- example:

  A character indicating a valid example.

## Value

A Shiny App is launched.

## Examples

``` r
if (interactive()) {
  run_example("circularLinearWithBrush")
}
```
