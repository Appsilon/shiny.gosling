navbarPage(
  title = "shiny.gosling",
  tabPanel(
    "Coordinated Multiple Views: Circular Overview + Linear Detail Views",
    use_gosling(),
    includeCSS("www/styles.css"),
    fluidPage(
      mainPanel(
        width = 8,
        goslingOutput("gosling_plot_circular"),
        br(),
        fluidRow(
          column(
            6,
            selectInput(
              "chromosomes",
              "Chromosome",
              selected = "chr1",
              choices = chromosome_options
            )
          ),
          column(
            1,
            actionButton(
              "download_png",
              "PNG",
              icon = icon("cloud-arrow-down")
            )
          ),
          column(
            1,
            actionButton(
              "download_pdf",
              "PDF",
              icon = icon("cloud-arrow-down")
            )
          )
        ),
        actionButton(
          "go_to_chr",
          "Go to"
        )
      )
    )
  )
)

