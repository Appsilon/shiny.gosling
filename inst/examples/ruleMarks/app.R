# Based on https://gosling.js.org/?example=RULE

require(shiny)
require(shiny.gosling)

ui <- navbarPage(
  title = "shiny.gosling",
  tabPanel(
    "Area",
    use_gosling(),
    fluidPage(
      width = 12,
      fluidRow(
        column(
          width = 8,
          goslingOutput("gosling_plot_test")
        ),
        column(
          width = 4,
          fluidRow(
            column(
              2,
              actionButton(
                "download_png",
                "PNG",
                icon = icon("cloud-arrow-down")
              )
            ),
            column(
              2,
              actionButton(
                "download_pdf",
                "PDF",
                icon = icon("cloud-arrow-down")
              )
            )
          )
        )
      )
    )
  )
)

# Create first track ----
track_1_data <- track_data(
  url = "https://server.gosling-lang.org/api/v1/tileset_info/?d=cistrome-multivec",
  type = "multivec",
  row = "sample",
  column = "position",
  value = "peak",
  categories = list("sample 1"),
  binSize = 4
)

track_1_x <- visual_channel_x(
  field = "start", type = "genomic"
)

track_1_xe <- visual_channel_x(
  field = "end", type = "genomic"
)

track_1_y <- visual_channel_y(
  field = "peak", type = "quantitative", domain = list(0, 0.003)
)

track_1 <- add_single_track(
  data = track_1_data,
  mark = "bar",
  x = track_1_x,
  xe = track_1_xe,
  y = track_1_y,
  color = visual_channel_color(
    value = "lightgray"
  )
)

# Create second track ----
track_2_data <- track_data(
  type = "json",
  values = json_list(
    json_list(c = "chr2", p = 100000, v = 0.0001),
    json_list(c = "chr5", p = 100000, v = 0.0004),
    json_list(c = "chr10", p = 100000, v = 0.0009)
  ),
  chromosomeField = "c",
  genomicFields = list("p")
)

track_2 <- add_single_track(
  data = track_2_data,
  mark = "rule",
  x = visual_channel_x(
    field = "p", type = "genomic"
  ),
  y = visual_channel_y(
    field = "v", type = "quantitative", domain = list(0, 0.003)
  ),
  color = visual_channel_color(
    value = "red"
  ),
  strokeWidth = visual_channel_stroke_width(
    field = "v", type = "quantitative"
  )
)

# Create third track ----
track_3_data <- track_data(
  type = "json",
  values = json_list(
    json_list(c = "chr2", p = 100000, v = 0.0001),
    json_list(c = "chr5", p = 100000, v = 0.0004),
    json_list(c = "chr10", p = 100000, v = 0.0009)
  ),
  chromosomeField = "c",
  genomicFields = list("p")
)

track_3 <- add_single_track(
  data = track_3_data,
  mark = "rule",
  x = visual_channel_x(
    field = "p", type = "genomic"
  ),
  color = visual_channel_color(
    value = "blue"
  ),
  strokeWidth = visual_channel_stroke_width(
    value = 2
  )
)

# Compose the track ----
multi_composed_view <- compose_view(
  multi = TRUE,
  tracks = add_multi_tracks(
    track_1, track_2, track_3
  ),
  alignment = "overlay",
  width = 500,
  height = 200
)

# Arrange the view above ----
multi_composed_views <- arrange_views(
  title = "Basic Marks: Text",
  subtitle = "This is a simple Text Marks Chart",
  views = multi_composed_view,
  style = default_track_styles(
    dashed = list(3, 3)
  )
)

server <- function(input, output, session) {
  observeEvent(input$download_png, {
    export_png(component_id = "sars_cov2")
  })

  observeEvent(input$download_pdf, {
    export_pdf(component_id = "sars_cov2")
  })

  observeEvent(input$zoom_out, {
    zoom_to_extent(
      component_id = "sars_cov2",
      view_id = "view2_track1"
    )
  })

  output$gosling_plot_test <- renderGosling({
    gosling(
      component_id = "sars_cov2",
      multi_composed_views
    )
  })
}

shinyApp(ui, server)
