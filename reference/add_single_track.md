# Add a single track

Add a single track to the plot of a mark type ( plot type ). This
function constructs a single track from the inputs. The inputs can be
id, data, mark etc. Please check gosling.js documentation for usage.

## Usage

``` r
add_single_track(
  id = NULL,
  data = NULL,
  mark = NULL,
  assembly = NULL,
  row = NULL,
  size = NULL,
  color = NULL,
  strokeWidth = NULL,
  opacity = NULL,
  x = NULL,
  xe = NULL,
  x1 = NULL,
  x1e = NULL,
  y = NULL,
  stroke = NULL,
  width = NULL,
  height = NULL,
  dataTransform = NULL,
  ...
)
```

## Arguments

- id:

  Optional argument to assign an id to the track.

- data:

  An object of from track_data() function.

- mark:

  Type of plot. One of c("point", "line", "rect", "bar", "area", "link",
  "triangle", "text"). Each mark type has some supported visual channel.

  Different marks support different visual channels:

  - point: x, y, row, size, color, strokeWidth, opacity

  - line: x, y, row, color, strokeWidth

  - rect: x, xe, row, color, strokeWidth, opacity

  - bar: x, y, row, color, strokeWidth, opacity

  - area: x, y, row, color, strokeWidth

  - link: x, xe, x1, x1e, color, opacity

  - triangle: x, xe, row, size, color, opacity

  - text: x, xe, row, color, opacity

  For more info visit http://gosling-lang.org/tutorials/

- assembly:

  Currently support "hg38", "hg19", "hg18", "hg17", "hg16", "mm10",
  "mm9". Defaults to "hg38".

- row:

  An object of from visual_channel_row().

- size:

  An object of from visual_channel_size() OR an atomic number.

- color:

  An object of from visual_channel_color() OR and atomic character hex
  code of the form "#123456".

- strokeWidth:

  An object of from visual_channel_stroke_width() OR an atomic number.

- opacity:

  An object of from visual_channel_opacity() OR and atomic ratio from 0
  to 1.

- x:

  An object of from visual_channel_x() OR an atomic value.

- xe:

  An object of from visual_channel_x() OR an atomic value.

- x1:

  An object of from visual_channel_x() OR an atomic value.

- x1e:

  An object of from visual_channel_x() OR an atomic value.

- y:

  An object of from visual_channel_y() OR an atomic value.

- stroke:

  An object of from visual_channel_stroke() function OR a character of
  hex color code like "#123456".

- width:

  A number interpreted in units of pixel.

- height:

  A number interpreted in units of pixel.

- dataTransform:

  An object of from track_data_transform() function.

- ...:

  Any other arguments to be passed onto gosling.js.

## Value

list object.

## Examples

``` r
if(interactive()) {
  library(shiny)
  library(shiny.gosling)

  cistrome_data <-
    "https://server.gosling-lang.org/api/v1/tileset_info/?d=cistrome-multivec"

  single_track <- add_single_track(
    id = "track1",
    data = track_data(
      url = cistrome_data,
      type = "multivec",
      row = "sample",
      column = "position",
      value = "peak",
      categories = c("sample 1", "sample 2", "sample 3", "sample 4"),
      binSize = 4,
    ),
    mark = "rect",
    x = visual_channel_x(field = "start", type = "genomic", axis = "top"),
    xe = visual_channel_x(field = "end", type = "genomic"),
    row = visual_channel_row(
      field = "sample",
      type = "nominal",
      legend = TRUE
    ),
    color = visual_channel_color(
      field = "peak",
      type = "quantitative",
      legend = TRUE
    ),
    tooltip = visual_channel_tooltips(
      visual_channel_tooltip(field = "start", type = "genomic",
                             alt = "Start Position"),
      visual_channel_tooltip(field = "end", type = "genomic",
                             alt = "End Position"),
      visual_channel_tooltip(
        field = "peak",
        type = "quantitative",
        alt = "Value",
        format = "0.2"
      )
    ),
    width = 600,
    height = 130
  )

  single_composed_track <- compose_view(
    tracks = single_track
  )

  single_composed_views <- arrange_views(
    title = "Single Track",
    subtitle = "This is the simplest single track visualization with a linear layout",
    layout = "circular", #"linear"
    views = single_composed_track,
    xDomain = list(
      chromosome = "chr1",
      interval = c(1, 3000500)
    )
  )

  ui <- fluidPage(
    use_gosling(),
    fluidRow(
      column(6, goslingOutput("gosling_plot")),
      column(
        1, br(), actionButton(
          "download_png",
          "PNG",
          icon = icon("cloud-arrow-down")
        )
      )
    )
  )


  server <- function(input, output, session) {
    output$gosling_plot <- renderGosling({
      gosling(
        component_id = "component_1",
        single_composed_views,
        clean_braces = TRUE
      )
    })

    observeEvent(input$download_png, {
      export_png(component_id = "component_1")
    })
  }

  shinyApp(ui, server)

}
```
