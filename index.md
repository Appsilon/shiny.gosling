# shiny.gosling

> *R Shiny wrapper for Gosling.js - Grammar-based Toolkit for Scalable
> and Interactive Genomics Data Visualization*

Based on [gosling.js](http://gosling-lang.org/) and powered by
[shiny.react](https://appsilon.github.io/shiny.react/).

## Getting started

To install the packages, run:

``` r
if (!require("BiocManager", quietly = TRUE))
    install.packages("BiocManager")

BiocManager::install("shiny.gosling")
```

Take a look at [basic example
app](https://github.com/Appsilon/shiny.gosling/blob/main/inst/examples/staticCircularBar/app.R)
to start working with *shiny.gosling*.

To learn about the Gosling language, follow [Gosling
docs](http://gosling-lang.org/tutorials/).

## Examples

Use the `run_example` function in order to see the working examples: For
example to run the *multiTrackApp* example:

``` r
run_example("multiTrackApp")
```

Here is a preview of what’s there:

### Simple Single Track Shiny App

![Simple Single Track Shiny
App](https://github.com/Appsilon/shiny.gosling.js/raw/main/examples/singleTrackShiny.gif)

Simple Single Track Shiny App

### Interactive Circular Plot with Linear Brush

![Circular Plot with Linear
Brush](https://github.com/Appsilon/shiny.gosling.js/raw/70efce34abe21adf11ac1312de5673e219e62b73/examples/circularLinearBrush.gif)

Circular Plot with Linear Brush

### SARS CoV 2 Example

![SARS CoV 2
Example](https://github.com/Appsilon/shiny.gosling.js/raw/main/examples/sarsCov2.gif)

SARS CoV 2 Example

## Appsilon

![](https://avatars0.githubusercontent.com/u/6096772)

Appsilon is a **Posit (formerly RStudio) Full Service Certified
Partner**.  
Learn more at [appsilon.com](https://appsilon.com).

Get in touch <opensource@appsilon.com>

Explore the [Rhinoverse](https://rhinoverse.dev) - a family of R
packages built around [Rhino](https://appsilon.github.io/rhino/)!

[![We are
hiring!](https://raw.githubusercontent.com/Appsilon/website-cdn/gh-pages/WeAreHiring1.png)](https://appsilon.com/careers/)
