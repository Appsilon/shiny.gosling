# shiny.gosling <a href="https://appsilon.github.io/shiny.gosling/"><img src="man/figures/logo.png" align="right" alt="shiny.gosling logo" style="height: 140px;"></a>

> _R Shiny wrapper for Gosling.js - Grammar-based Toolkit for Scalable and Interactive Genomics Data Visualization_

<!-- badges: start -->
[![BiocCheck](https://github.com/Appsilon/shiny.gosling/actions/workflows/bioc-check.yml/badge.svg)](https://github.com/Appsilon/shiny.gosling/actions/workflows/bioc-check.yml)
[![R-CMD-checks](https://github.com/Appsilon/shiny.gosling/actions/workflows/r-cmd-check.yml/badge.svg)](https://github.com/Appsilon/shiny.gosling/actions/workflows/r-cmd-check.yml)
<!-- badges: end -->

Based on [gosling.js](http://gosling-lang.org/) and powered by [shiny.react](https://appsilon.github.io/shiny.react/).

## Getting started

To install the packages, run:

```R
remotes::install_github("Appsilon/shiny.react")
remotes::install_github("Appsilon/shiny.gosling")
```

Take a look at [basic example app](https://github.com/Appsilon/shiny.gosling/blob/main/inst/examples/staticCircularBar/app.R) to start working with _shiny.gosling_.

To learn about the Gosling language, follow [Gosling docs](http://gosling-lang.org/tutorials/).

## Examples

Use the `run_example` function in order to see the working examples:
For example to run the *multiTrackApp* example:
```R
run_example("multiTrackApp")
```

Here is a preview of what's there:

### Simple Single Track Shiny App
![Simple Single Track Shiny App](https://github.com/Appsilon/shiny.gosling.js/raw/main/examples/singleTrackShiny.gif)

### Interactive Circular Plot with Linear Brush
![Circular Plot with Linear Brush](https://github.com/Appsilon/shiny.gosling.js/raw/70efce34abe21adf11ac1312de5673e219e62b73/examples/circularLinearBrush.gif)

### SARS CoV 2 Example
![SARS CoV 2 Example](https://github.com/Appsilon/shiny.gosling.js/raw/main/examples/sarsCov2.gif)

## Appsilon

<img src="https://avatars0.githubusercontent.com/u/6096772" align="right" alt="" width="6%" />

Appsilon is a **Posit (formerly RStudio) Full Service Certified Partner**.<br/>
Learn more
at [appsilon.com](https://appsilon.com).

Get in touch [opensource@appsilon.com](mailto:opensource@appsilon.com)

Check our [Open Source tools](https://shiny.tools).

<a href = "https://appsilon.com/careers/" target="_blank"><img src="http://d2v95fjda94ghc.cloudfront.net/hiring.png" alt="We are hiring!"/></a>
