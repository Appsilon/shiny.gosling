function(input, output) {
  all_reactive_values <- reactiveValues(
    composed_views = NULL
  )
  observeEvent(input$layout, {
    track <- add_single_track(
      id = "track1",
      data = track_data(
        url = "https://server.gosling-lang.org/api/v1/tileset_info/?d=cistrome-multivec",
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
        visual_channel_tooltip(field = "start", type = "genomic", alt = "Start Position"),
        visual_channel_tooltip(field = "end", type = "genomic", alt = "End Position"),
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
    composed_track <- compose_single_track_view(
      tracks = track
    )
    all_reactive_values$composed_views <- arrange_views(
      title = "Single Track", subtitle = "This is the simplest single track visualization with a linear layout",
      layout = input$layout, views = composed_track,
      xDomain = list(chromosome = "chr1", interval = c(1, 3000500))
    )
  })
  output$gosling_plot <- renderUI({
    GoslingComponent(
      spec = shiny.react::JS(
        build_json(
          all_reactive_values$composed_views, single_track = TRUE
        )
      )
    )
  })
}
