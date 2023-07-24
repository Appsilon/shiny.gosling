# Based on https://gosling.js.org/?example=doc_line

library(shiny)
library(shiny.gosling)

ui <- navbarPage(
  title = "shiny.gosling",
  tabPanel(
    "Line Chart",
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

# Create data object ----
view1_data <- track_data(
  url = "https://resgen.io/api/v1/tileset_info/?d=UvVPeLHuRDiYA3qwFlm7xQ",
  type = "multivec",
  row = "sample",
  column = "position",
  value = "peak",
  categories = list("sample 1")
)

# Create visual channels ----
view1_x <- visual_channel_x(
  field = "position", type = "genomic", axis = "bottom"
)

view1_y <- visual_channel_y(
  field = "peak", type = "quantitative", axis = "right"
)

# Create single track ----
single_track <- add_single_track(
  width = 800,
  height = 180,
  data = view1_data,
  mark = "line",
  x = view1_x,
  y = view1_y,
  size = visual_channel_size(
    value = 2
  )
)

# Compose the track ----
single_composed_view <- compose_view(
  tracks = single_track,
  layout = "linear"
)

# Arrange the view above ----
single_composed_views <- arrange_views(
  title = "Basic Marks: line",
  subtitle = "This is a simple line chart.",
  views = single_composed_view
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
      single_composed_views,
      clean_braces = TRUE
    )
  })
}

shinyApp(ui, server, options = list(port = 8888))
