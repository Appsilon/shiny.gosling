navbarPage(
  title = "Gosling Plots",
  tabPanel(
    "Single Track Plot",
    use_gosling(),
    includeCSS("www/styles.css"),
    sidebarLayout(
      sidebarPanel(
        width = 4,
        selectInput(
          inputId = "layout_single", label = "Layout",
          choices = c("linear", "circular")
        )
      ),
      mainPanel(
        width = 8,
        goslingOutput("gosling_plot_single"),
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
        PrimaryButton.shinyInput(
          "go_to_chr",
          text = "Go to"
        ),
        br(),
        PrimaryButton.shinyInput(
          "reset_rule_mark",
          text = "Reset zoom"
        )
      )
    )
  ),
  tabPanel(
    "Multi Track Plot",
    sidebarLayout(
      sidebarPanel(
        width = 4,
        selectInput(
          inputId = "layout_multi", label = "Layout",
          choices = c("linear", "circular"),
          selected = "circular"
        )
      ),
      mainPanel(
        width = 8,
        goslingOutput("gosling_plot_multi")
      )
    )
  )
)

