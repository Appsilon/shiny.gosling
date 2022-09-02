fluidPage(
  fluidRow(
    column(
      width = 5,
      GoslingComponent(
        spec = shiny.react::JS(
          build_json(
            composed_views, single_track = TRUE
          )
        )
      )
    ),
    column(
      width = 7,
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
