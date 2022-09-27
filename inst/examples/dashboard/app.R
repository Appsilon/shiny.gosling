# ---- libraries ----
library(dplyr)
library(glue)
library(sass)
library(shiny)
library(shiny.fluent)
library(shiny.router)
library(shiny.gosling)

source("specs.R")


# ---- tutorial-part1 ----
shiny.react::enableReactDebugMode()

makeCard <- function(title, content, size = 12, style = "") {
  div(class = glue("card ms-depth-8 ms-sm{size} ms-xl{size}"),
      style = style,
      Stack(
        tokens = list(childrenGap = 5),
        Text(variant = "large", title, block = TRUE),
        content
      ))
}

# ---- make-page ----

makePage <- function (title, subtitle, contents) {
  tagList(div(
    class = "page-title",
    span(title, class = "ms-fontSize-32 ms-fontWeight-semibold", style =
           "color: #323130"),
    span(subtitle, class = "ms-fontSize-14 ms-fontWeight-regular", style =
           "color: #605E5C; margin: 14px;")
  ),
  contents)
}

basic_page <- makePage(
  "Basic Marks",
  "Gosling.js visualisation examples",
  div(
    makeCard(
      "Bar chart example",
      div(
        GoslingComponent(
          component_id = "barchart_example",
          spec=JS(basic1)
        ),
        PrimaryButton.shinyInput(
          "reset_barchart",
          text = "Reset zoom"
        )
      )
    ),
    makeCard(
      "Rule mark example",
      div(
        GoslingComponent(
          component_id = "rule_mark_example",
          spec=JS(basic2)
        ),
        PrimaryButton.shinyInput(
          "reset_rule_mark",
          text = "Reset zoom"
        )
      )
    )
  )
)


composite_page <- makePage(
  "Compositive Visualizations",
  "Gosling.js visualisation examples",
  div(
    makeCard("Gene Annotations", GoslingComponent(spec=JS(composite1))),
    makeCard("Transcript Annotations", GoslingComponent(spec=JS(composite3))),
    makeCard("Ideograms", GoslingComponent(spec=JS(composite4)))
  )
)

interactive_page <- makePage(
  "Interactive Visualizations",
  "Gosling.js visualisation examples",
  div(
    makeCard("Coordinated interactive view", GoslingComponent(spec=JS(interactive1)))
  )
)

multiview_page <- makePage(
  "Multiview Visualizations",
  "Gosling.js visualisation examples",
  div(
    makeCard("Visual Linking", GoslingComponent(spec=JS(multiview1)))
  )
)

# ---- layout ----

header <- "header"
navigation <- "navigation"
footer <- "footer"

layout <- function(mainUI){
  div(class = "grid-container",
      div(class = "header", header),
      div(class = "sidenav", navigation),
      div(class = "main", mainUI),
      div(class = "footer", footer)
  )
}


# ---- header ----
header <- tagList(
  img(src = "appsilon-logo.png", class = "logo"),
  div(Text(variant = "xLarge", "Gosling viz in Shiny"), class = "title"),
 )



# ---- navigation ----

navigation <- Nav(
  groups = list(
    list(links = list(
      list(name = 'Home', url = '#!/', key = 'home', icon = 'Home'),
      list(name = 'Basic', url = '#!/basic', key = 'basic', icon = 'AnalyticsReport'),
      list(name = 'Compositive Visualizations', url = '#!/composite', key = 'composite', icon = 'AnalyticsReport'),
      list(name = 'Interactive Visualizations', url = '#!/interactive', key = 'interactive', icon = 'AnalyticsReport'),
      list(name = 'Multiview Visualizations', url = '#!/multiview', key = 'multiview', icon = 'AnalyticsReport'),
      list(name = 'Appsilon', url = 'http://appsilon.com', key = 'appsilon', icon = 'WebAppBuilderFragment')
    ))
  ),
  initialSelectedKey = 'home',
  styles = list(
    root = list(
      height = '100%',
      boxSizing = 'border-box',
      overflowY = 'auto'
    )
  )
)

# ---- footer ----

footer <- Stack(
  horizontal = TRUE,
  horizontalAlign = 'space-between',
  tokens = list(childrenGap = 20),
  Text(variant = "medium", "Built with ❤ by Appsilon", block=TRUE),
  Text(variant = "medium", nowrap = FALSE, "If you'd like to learn more, reach out to us at hello@appsilon.com"),
  Text(variant = "medium", nowrap = FALSE, "All rights reserved.")
)


layout <- function(mainUI){
  div(class = "grid-container",
      div(class = "header", header),
      div(class = "sidenav", navigation),
      div(class = "main", mainUI),
      div(class = "footer", footer)
  )
}


# ---- home-page ----

card1 <- makeCard(
  "Welcome to Gosling.js in Shiny",
  div(
    Text("Gosling.js is a Grammar-based Toolkit for Scalable and Interactive Genomics Data Visualization"),
    Text("Use the menu on the left to explore live demos.")
  ))

home_page <- makePage(
  "R + Shiny + gosling.js",
  "This is a Gosling.js showcase app built in R and Shiny",
  div(card1)
)

# ----
ui <- fluentPage(
  layout(home_page),
  tags$head(
    tags$link(href = "style.css", rel = "stylesheet", type = "text/css")
  ))

# ---- router ----

router <- make_router(
  route("/", home_page),
  route("basic", basic_page),
  route("composite", composite_page),
  route("interactive", interactive_page),
  route("multiview", multiview_page))

# ---- router-ui ----

# Add shiny.router dependencies manually: they are not picked up because they're added in a non-standard way.
shiny::addResourcePath("shiny.router", system.file("www", package = "shiny.router"))
shiny_router_js_src <- file.path("shiny.router", "shiny.router.js")
shiny_router_script_tag <- shiny::tags$script(type = "text/javascript", src = shiny_router_js_src)


ui <- fluentPage(
  layout(router$ui),
  tags$head(
    tags$link(href = "style.css", rel = "stylesheet", type = "text/css"),
    shiny_router_script_tag
  ))


# ---- server ----

server <- function(input, output, session) {
  router$server(input, output, session)
  
  observeEvent(input$reset_rule_mark, {
    zoom_to_extent(
      component_id = "rule_mark_example",
      view_id = "rulemark_example_1",
      duration = 2000
    )
  })

  observeEvent(input$reset_barchart, {
    zoom_to_extent(
      component_id = "barchart_example",
      view_id = "barchart_example_1"
    )
  })
}

shinyApp(ui, server)
