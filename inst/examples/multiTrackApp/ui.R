fluidPage(
  GoslingComponent(
    spec = shiny.react::JS(
      build_json(
        composed_views, single_track = FALSE
      )
    )
  )
)
