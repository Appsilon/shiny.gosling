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
          inputId = "layout_single",
          label = "Layout",
          choices = c(
            "linear", "circular"
          )
        )
      ),
      mainPanel(
        width = 8,
        uiOutput("gosling_plot_single")
      )
    )
  ),
  tabPanel(
    "Multi Track Plot",
    sidebarLayout(
      sidebarPanel(
        width = 4,
        selectInput(
          inputId = "layout_multi",
          label = "Layout",
          choices = c(
            "linear", "circular"
          )
        )
      ),
      mainPanel(
        width = 8,
        uiOutput("gosling_plot_multi")
      )
    )
  )
)

