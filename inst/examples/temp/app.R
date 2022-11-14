if(interactive()) {
  library(shiny)
  library(shiny.gosling)

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
      circular_track2
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
      column(6, goslingOutput("gosling_plot"))
    )
  )


  server <- function(input, output, session) {
    output$gosling_plot <- renderGosling({
      gosling(
        component_id = "circular_component",
        circular_linear_view, clean_braces = FALSE
      )
    })
  }

  shinyApp(ui, server)

}
