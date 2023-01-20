navbarPage(
  title = "shiny.gosling",
  tabPanel(
    "SARS-CoV-2",
    use_gosling(),
    includeCSS("www/styles.css"),
    fluidPage(
      width = 12,
      fluidRow(
        column(
          width = 8,
          goslingOutput("gosling_plot_sars_cov2")
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
          ),
          fluidRow(
            column(
              8,
              br(),
              actionButton(
                "zoom_out",
                "Zoom Out"
              )
            )
          )
        )
      )
    )
  )
)
