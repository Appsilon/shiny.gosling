fluidPage(
  GoslingComponent(
    spec = shiny.react::JS(
      build_json(
        composed_views1, single_track = TRUE
      )
    )
  ),
  br(),
  GoslingComponent(
    spec = shiny.react::JS(
      build_json(
        composed_views2, single_track = FALSE
      )
    )
  )
)
