# Data object builder for a GRanges object by locally saving it

Build the data object for gosling plots

## Usage

``` r
track_data_gr(
  granges,
  chromosomeField = NULL,
  genomicFields = NULL,
  separator = ",",
  sampleLength = 1000,
  headerNames = NULL,
  ...
)
```

## Arguments

- granges:

  A GRanges object from the GenomicRanges package with seqnames and
  ranges

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

list of data specs for a csv file

## Examples

``` r
if (interactive()) {
library(shiny.gosling)
library(shiny)
library(GenomicRanges)

url <- paste0(
  "https://www.ncbi.nlm.nih.gov/geo/download/",
  "?acc=GSM1295076&format=file&file=GSM1295076_CBX6_BF_ChipSeq_mergedReps_peaks.bed.gz"
)
temp_file <- file.path(tempdir(), "GSM1295076_CBX6_BF_ChipSeq_mergedReps_peaks.bed.gz")
download.file(url, destfile = temp_file)
df <- read.delim(
  temp_file,
  header = FALSE,
  comment.char = "#"
)
gr <- GRanges(
  seqnames = df$V1,
  ranges = IRanges(df$V2, df$V3)
)

ui <- fluidPage(
  use_gosling(clear_files = FALSE),
  goslingOutput("gosling_plot")
)

track_1 <- add_single_track(
  width = 800,
  height = 180,
  data = track_data_gr(
    gr, chromosomeField = "seqnames",
    genomicFields = c("start", "end")
  ),
  mark = "bar",
  x = visual_channel_x(
    field = "start", type = "genomic", axis = "bottom"
  ),
  xe = visual_channel_x(field = "end", type = "genomic"),
  y = visual_channel_y(
    field = "width", type = "quantitative", axis = "right"
  ),
  size = list(value = 5)
)

composed_view <- compose_view(
  layout = "linear",
  tracks = track_1
)

arranged_view <- arrange_views(
  title = "Basic Marks: bar",
  subtitle = "Tutorial Examples",
  views = composed_view
)

server <- function(input, output, session) {
  output$gosling_plot <- renderGosling({
    gosling(
      component_id = "component_1",
      arranged_view
    )
  })
}

shiny::shinyApp(ui, server)
}
```
