# Circular track 1 ----
circular_track1_data <- track_data(
  url = "https://server.gosling-lang.org/api/v1/tileset_info/?d=cistrome-multivec",
  type = "multivec",
  row = "sample",
  column = "position",
  value = "peak",
  categories = c("sample 1", "sample 2", "sample 3", "sample 4"),
  binSize = 4
)

circular_track1_x <- visual_channel_x(field = "start", type = "genomic")
circular_track1_xe <- visual_channel_x(field = "end", type = "genomic")

circular_track1_y <- visual_channel_y(field = "peak", type = "quantitative")

circular_track1_row <- visual_channel_row(
  field = "sample", type = "nominal"
)

circular_track1_color <- visual_channel_color(
  field = "sample", type = "nominal"
)

circular_track1_tracks <- add_multi_tracks(
  add_single_track(
    mark = "bar"
  ),
  add_single_track(
    mark = "brush",
    x = visual_channel_x(linkingId = "detail-1"),
    color = "blue"
  ),
  add_single_track(
    mark = "brush",
    x = visual_channel_x(linkingId = "detail-2"),
    color = "red"
  )
)

circular_track1_styles <- default_track_styles(
  outlineWidth = 0
)

circular_track1 <- add_single_track(
  id = "circular_track1", alignment = "overlay", data = circular_track1_data,
  x = circular_track1_x, xe = circular_track1_xe,
  y = circular_track1_y, row = circular_track1_row,
  color = circular_track1_color,
  stroke =  "black", strokeWidth = 0.3,
  tracks = circular_track1_tracks,
  style = circular_track1_styles,
  width = 500, height = 100
)


# Circular track 2 ----
circular_track2_data_transform1 <- track_data_transform(
  type = "filter", field = "chr1",
  oneOf = list("1", "16", "14", "9", "6", "5", "3")
)

circular_track2_data_transform2 <- track_data_transform(
  type = "filter", field = "chr2",
  oneOf = list("1", "16", "14", "9", "6", "5", "3")
)

circular_track2_data <- track_data(
  url = "https://raw.githubusercontent.com/sehilyi/gemini-datasets/master/data/rearrangements.bulk.1639.simple.filtered.pub",
  type = "csv",
  headerNames = c(
    "chr1",
    "p1s",
    "p1e",
    "chr2",
    "p2s",
    "p2e",
    "type",
    "id",
    "f1",
    "f2",
    "f3",
    "f4",
    "f5",
    "f6"
  ),
  separator = "\t",
  genomicFieldsToConvert = c(
    list(
      chromosomeField = "chr1",
      genomicFields = c("p1s", "p1e")
    ),
    list(
      chromosomeField = "chr2",
      genomicFields = c("p2s", "p2e")
    )
  )
)

circular_track2_dataTransform <- c(
  circular_track2_data_transform1, circular_track2_data_transform2
)

circular_track2_x <- visual_channel_x(field = "p1s", type = "genomic")
circular_track2_xe <- visual_channel_x(field = "p1e", type = "genomic")
circular_track2_x1 <- visual_channel_x(field = "p2s", type = "genomic")
circular_track2_x1e <- visual_channel_x(field = "p2e", type = "genomic")

circular_track2_stroke <- visual_channel_stroke(
  field = "type", type = "nominal",
  domain = c("deletion", "inversion", "translocation", "tandem-duplication")
)

circular_track2 <- add_single_track(
  id = "circular_track2", data = circular_track2_data,
  dataTransform = circular_track2_dataTransform,
  mark = "withinLink",
  x = circular_track2_x,
  xe = circular_track2_xe,
  x1 = circular_track2_x1,
  x1e = circular_track2_x1e,
  stroke = ,
  strokeWidth = 0.8,
  opacity = 0.15,
  width = 500, height = 100
)

# Compose Circular track ----
circular_composed_view <- compose_view(
  multi = TRUE,
  tracks = add_multi_tracks(
    circular_track1, circular_track2
  ),
  static = TRUE, layout = "circular", alignment = "stack"
)

# Linear track 1 ----

linear_track1_data <- track_data(
  url = "https://server.gosling-lang.org/api/v1/tileset_info/?d=cistrome-multivec",
  type = "multivec",
  row = "sample",
  column = "position",
  value = "peak",
  categories = c("sample 1", "sample 2", "sample 3", "sample 4"),
  binSize = 4
)

linear_track1_x <- visual_channel_x(
  field = "start", type = "genomic", linkingId = "detail-1",
  domain = list(chromosome = "chr5")
)

linear_track1_xe <- visual_channel_x(field = "end", type = "genomic")
linear_track1_y <- visual_channel_y(field = "peak", type = "quantitative")

linear_track1_row <- visual_channel_row(
  field = "sample", type = "nominal"
)

linear_track1_color <- visual_channel_color(
  field = "sample", type = "nominal"
)

linear_track1 <- add_single_track(
  id = "linear_track1", data = linear_track1_data,
  mark = "bar",
  x = linear_track1_x,
  xe = linear_track1_xe,
  y = linear_track1_y,
  row = linear_track1_row,
  color = linear_track1_color,
  stroke = "black",
  strokeWidth = 0.3,
  default_track_styles(background = "blue"),
  width = 245, height = 150
)

# Linear track 2 ----

linear_track2_data <- track_data(
  url = "https://server.gosling-lang.org/api/v1/tileset_info/?d=cistrome-multivec",
  type = "multivec",
  row = "sample",
  column = "position",
  value = "peak",
  categories = c("sample 1", "sample 2", "sample 3", "sample 4"),
  binSize = 4
)

linear_track2_x <- visual_channel_x(
  field = "start", type = "genomic", linkingId = "detail-2",
  domain = list(chromosome = "chr16")
)

linear_track2_xe <- visual_channel_x(field = "end", type = "genomic")
linear_track2_y <- visual_channel_y(field = "peak", type = "quantitative")

linear_track2_row <- visual_channel_row(
  field = "sample", type = "nominal"
)

linear_track2_color <- visual_channel_color(
  field = "sample", type = "nominal"
)

linear_track2 <- add_single_track(
  id = "linear_track2", data = linear_track2_data,
  mark = "bar",
  x = linear_track2_x,
  xe = linear_track2_xe,
  y = linear_track2_y,
  row = linear_track2_row,
  color = linear_track2_color,
  stroke = "black",
  strokeWidth = 0.3,
  default_track_styles(background = "red"),
  width = 245, height = 150
)

# Compose Circular track ----
linear_composed_view <- compose_view(
  multi = TRUE,
  tracks = add_multi_tracks(linear_track1, linear_track2),
  spacing = 10, arrangement = "horizontal",
  style = default_track_styles(backgroundOpacity = 0.1)
)

# Arrange final view
circular_linear_view <- arrange_views(
  arrangement = "horizontal",
  views = list(circular_composed_view, linear_composed_view)
)

function(input, output, session) {

  observeEvent(input$download_png, {
    export_png(component_id = "circular_component")
  })

  observeEvent(input$download_pdf, {
    export_pdf(component_id = "circular_component")
  })

  observeEvent(input$go_to_chr, {
    zoom_to(
      component_id = "circular_component",
      view_id = "linear_track1",
      position = input$chromosomes
    )
  })

  output$gosling_plot_circular <- renderGosling({
    gosling(
      component_id = "circular_component",
      circular_linear_view, clean_braces = FALSE
    )
  })
}
