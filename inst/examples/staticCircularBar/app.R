if (interactive()) {
  library(shiny)
  library(shiny.gosling)

  # Circular track 1 ----
  circular_track1_data <- track_data(
    url = "https://server.gosling-lang.org/api/v1/tileset_info/?d=cistrome-multivec", # nolint
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
    outline_width = 0
  )

  circular_track1 <- add_single_track(
    id = "circular_track1", alignment = "overlay", data = circular_track1_data,
    x = circular_track1_x, xe = circular_track1_xe,
    y = circular_track1_y, row = circular_track1_row,
    color = circular_track1_color,
    stroke =  "black", stroke_width = 0.3,
    tracks = circular_track1_tracks,
    style = circular_track1_styles,
    width = 500, height = 100
  )

  # Compose Circular track ----
  circular_composed_view <- compose_view(
    multi = TRUE,
    tracks = add_multi_tracks(
      circular_track1
    ),
    static = TRUE, layout = "circular", alignment = "stack"
  )

  # Arrange final view
  circular_linear_view <- arrange_views(
    arrangement = "horizontal",
    views = list(circular_composed_view)
  )




  ui <- fluidPage(
    use_gosling(),
    fluidRow(
      column(6, gosling_output("gosling_plot"))
    )
  )


  server <- function(input, output, session) {
    output$gosling_plot <- render_gosling({
      gosling(
        component_id = "circular_component",
        circular_linear_view, clean_braces = FALSE
      )
    })
  }

  shinyApp(ui, server)

}
