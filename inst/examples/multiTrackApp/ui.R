navbarPage(
  title = "Gosling Plots",
  tabPanel(
    "Static Plot",
    fluidRow(
      column(
        width = 12,
        GoslingComponent(
          spec = shiny.react::JS(
            build_json(
              composed_views, single_track = FALSE
            )
          )
        )
      )
    )
  ),
  tabPanel(
    "Dynamic Plot",
    fluidRow(
      column(
        width = 12,
        selectInput(
          inputId = "layout",
          label = "Layout",
          choices = c(
            "linear", "circular"
          )
        ),
        uiOutput("gosling_plot")
      )
    )
  )
)

