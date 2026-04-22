# Default styles for tracks

Default styles for tracks

## Usage

``` r
default_track_styles(
  textStrokeWidth = NULL,
  textStroke = NULL,
  textFontWeight = NULL,
  textFontSize = NULL,
  textAnchor = NULL,
  select = NULL,
  outlineWidth = NULL,
  outline = NULL,
  mouseOver = NULL,
  matrixExtent = NULL,
  linkStyle = NULL,
  linkMinHeight = NULL,
  linkConnectionType = NULL,
  linePattern = NULL,
  legendTitle = NULL,
  inlineLegend = NULL,
  enableSmoothPath = NULL,
  dy = NULL,
  dx = NULL,
  dashed = NULL,
  curve = NULL,
  brush = NULL,
  backgroundOpacity = NULL,
  background = NULL,
  align = NULL,
  ...
)
```

## Arguments

- textStrokeWidth:

  A number. Specify the stroke width of text marks. Can also be
  specified using the strokeWidth channel option of text marks.

- textStroke:

  A character. Specify the stroke of text marks. Can also be specified
  using the stroke channel option of text marks.

- textFontWeight:

  A character. One of "bold", "normal". Specify the font weight of text
  marks.

- textFontSize:

  A number. Specify the font size of text marks. Can also be specified
  using the size channel option of text marks.

- textAnchor:

  A character. One of "start", "middle", "end". Specify the alignment of
  text marks to a given point.

- select:

  An object returned by event_styles(). Customize visual effects of
  rangeSelect events on marks.

- outlineWidth:

  A number.

- outline:

  A character.

- mouseOver:

  An object returned by event_styles(). Customize visual effects of
  mouseOver events on marks.

- matrixExtent:

  A character.One of "full", "upper-right", "lower-left". Determine to
  show only one side of the diagonal in a HiGlass matrix. Default:
  "full".

- linkStyle:

  A character. One of "elliptical", "circular", "straight",
  "experimentalEdgeBundling". The style of withinLink and betweenLink
  marks. Default: 'circular' 'elliptical' will be used as a default
  option.

- linkMinHeight:

  A number. The minimum height of withinLink and betweenLink marks. Unit
  is a percentage Default: 0.5.

- linkConnectionType:

  A character. One of "straight", "curve", "corner". Specify the
  connection type of betweenLink marks. Default: "corner".

- linePattern:

  A list of the form list(size="number",type="string"). One of
  "triangleLeft", "triangleRight".) Specify the pattern of dashes and
  gaps for rule marks.

- legendTitle:

  A character. If defined, show legend title on the top or left.

- inlineLegend:

  A Boolean. Specify whether to show legend in a single horizontal line?

- enableSmoothPath:

  A Boolean. Whether to enable smooth paths when drawing curves.
  Default: FALSE.

- dy:

  A number. Offset the position of marks in y direction. This property
  is currently only supported for text marks.

- dx:

  A number. Offset the position of marks in x direction. This property
  is currently only supported for text marks.

- dashed:

  An vector of number like c(1, 2). Specify the pattern of dashes and
  gaps for rule marks.

- curve:

  A character. One of "top", "bottom", "left", "right". Specify the
  curve of rule marks.

- brush:

  An object returned by brush_styles(). Customize the style of the brush
  mark in the rangeSelect mouse event.

- backgroundOpacity:

  A number.

- background:

  A character.

- align:

  A character. One of "left", "right". Specify the alignment of marks.
  This property is currently only supported for triangle marks.

- ...:

  Any other styles to be passed to gosling.js.

## Value

List object with default styles.

## Details

For more info visit
http://gosling-lang.org/docs/visual-channel/#style-related-properties

## Examples

``` r
if(interactive()) {
  library(shiny)
  library(shiny.gosling)

  track5_styles <- default_track_styles(
    legendTitle = "SV Class"
  )
  track5_data <- track_data(
    url = "https://s3.amazonaws.com/gosling-lang.org/data/cancer/rearrangement.PD35930a.csv",
    type = "csv",
    genomicFieldsToConvert = json_list(
      json_list(
        chromosomeField = "chr1",
        genomicFields = c("start1", "end1")
      ),
      json_list(
        chromosomeField = "chr2",
        genomicFields = c("start2", "end2")
      )
    )
  )
  track5_tracks <- add_multi_tracks(
    add_single_track(
      mark = "rect"
    ),
    add_single_track(
      mark = "withinLink", x = visual_channel_x(linkingId = "mid-scale"),
      strokeWidth = 0
    )
  )
  track5_color <- visual_channel_color(
    field = "svclass",
    type = "nominal",
    legend = TRUE,
    domain = json_list(
      "tandem-duplication", "translocation", "deletion", "inversion"
    ),
    range = json_list(
      "#569C4D", "#4C75A2", "#DA5456", "#EA8A2A"
    )
  )
  track5_stroke <- visual_channel_stroke(
    field = "svclass",
    type = "nominal",
    domain = json_list(
      "tandem-duplication", "translocation", "deletion", "inversion"
    ),
    range = json_list(
      "#569C4D", "#4C75A2", "#DA5456", "#EA8A2A"
    )
  )
  track5_x <- visual_channel_x(field = "start1", type = "genomic")
  track5_xe <- visual_channel_x(field = "end2", type = "genomic")
  track5 <- add_single_track(
    id = "track5", title = "Structural Variant",
    data = track5_data, mark = "withinLink",
    x = track5_x, xe = track5_xe,
    color = track5_color, width = 500, height = 80, stroke = track5_stroke,
    strokeWidth = 1, opacity = 0.6, style = track5_styles
  )

  composed_track <- compose_view(
    multi = TRUE,
    tracks = add_multi_tracks(
      track5
    ),
    xOffset = 190, layout = "circular", spacing = 1
  )

  composed_views <- arrange_views(
    views = composed_track,
    arrangement = "vertical"
  )

  ui <- fluidPage(
    use_gosling(),
    fluidRow(
      column(6, goslingOutput("gosling_plot"))
    )
  )


  server <- function(input, output, session) {
    output$gosling_plot <- renderGosling({
      gosling(
        component_id = "component_2",
        composed_views, clean_braces = FALSE
      )
    })
  }

  shinyApp(ui, server)

}
```
