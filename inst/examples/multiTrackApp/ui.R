navbarPage(
  title = "Gosling Plots",
  tabPanel(
    "Single Track Plot",
    use_gosling(),
    shinybusy::busy_start_up(
      loader = shinybusy::spin_epic("orbit"),
      text = "Loading ...", timeout = 3000
    ),
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
          inputId = "layout_multi", label = "Layout",
          choices = c("linear", "circular"),
          selected = "circular"
        )
      ),
      mainPanel(
        width = 8,
        uiOutput("gosling_plot_multi")
      )
    )
  )
)

