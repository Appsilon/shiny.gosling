# Based on https://gosling.js.org/?example=doc_rect

library(shiny)
library(shiny.gosling)

ui <- navbarPage(
  title = "shiny.gosling",
  tabPanel(
    "Ideograms",
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
view1_data <- track_data_csv(
  file = "data/point_plot.csv",
  chromosomeField = "Chromosome",
  genomicFields = list("chromStart", "chromEnd")
)

# Create visual channels ----
view1_x <- visual_channel_x(
  field = "chromStart", type = "genomic", axis = "top",
  domain = list(
    chromosome = "chr1"
  )
)

view1_xe <- visual_channel_x(
  field = "chromEnd", type = "genomic"
)

# Create single track ----
single_track <- add_single_track(
  width = 800,
  height = 50,
  data = view1_data,
  mark = "rect",
  dataTransform = shiny.gosling::track_data_transform(
    type = "filter", field = "Stain", oneOf = list("acen"), not = TRUE
  ),
  color = visual_channel_color(
    field = "Stain", type = "nominal", domain = list(
      "gneg", "gpos25", "gpos50", "gpos75", "gpos100", "gvar"
    ), range = list(
      "white", "#D9D9D9", "#979797", "#636363", "black", "#A0A0F2"
    )
  ),
  x = view1_x,
  xe = view1_xe,
  size = visual_channel_size(
    value = 20
  ),
  stroke = visual_channel_stroke(
    value = "gray"
  ),
  strokeWidth = visual_channel_stroke_width(
    value = 0.5
  ),
  style = default_track_styles(
    outline = "white"
  )
)

# Compose the track ----
single_composed_view <- compose_view(
  tracks = single_track,
  layout = "linear"
)

# Arrange the view above ----
single_composed_views <- arrange_views(
  title = "Basic Marks: Rect",
  subtitle = "This is a simple ideogram.",
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

shinyApp(ui, server)
