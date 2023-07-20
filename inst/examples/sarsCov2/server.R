# View 1 ----
view1_data <- track_data(
  url = "https://s3.amazonaws.com/gosling-lang.org/data/COVID/NC_045512.2-Genes.csv",
  type = "csv",
  chromosomeField = "Accession",
  genomicFields = c("Start", "Stop")
)

view1_track1 <- add_single_track(
  mark = "rect",
  color = "#0072B2",
  stroke = "white",
  strokeWidth = 2
)

view1_track2 <- add_single_track(
  mark = "rule",
  color = "white",
  opacity = 0.6,
  strokeWidth = 0,
  style = default_track_styles(
    linePattern = list(
      type = "triangleRight", size = 10
    )
  )
)

view1_track3 <- add_single_track(
  mark = "text",
  text = list(
    field = "Gene symbol", type = "nominal"
  ),
  color = "black", stroke = "white", strokeWidth = 3,
  visibility = list(list(
    target = "mark", measure = "width", threshold = "|xe-x|",
    operation = "LTET", transitionPadding = 30
  ))
)

view1_track4 <- add_single_track(
  mark = "brush",
  x = visual_channel_x(
    linkingId = "detail"
  )
)

view1_x <- visual_channel_x(
  field = "Start", type = "genomic"
)

view1_xe <- visual_channel_x(
  field = "Stop", type = "genomic"
)


view1 <- compose_view(
  multi = TRUE,
  alignment = "overlay",
  title = "NC_045512.2 Genes",
  data = view1_data,
  tracks = add_multi_tracks(
    view1_track1, view1_track2, view1_track3, view1_track4
  ),
  x = view1_x,
  xe = view1_xe,
  width = 800,
  height = 30,
  static = TRUE,
  layout = "linear",
  xDomain = list(interval = c(1, 29903))
)

# View 2 ----
# View 2 Track 1----
view2_track1_data <- track_data(
  url = "https://s3.amazonaws.com/gosling-lang.org/data/COVID/sars-cov-2_Sprot_annot_sorted.bed",
  type = "csv",
  chromosomeField = "Accession",
  genomicFields = c("Start", "Stop")
)

view2_track1a_color <- visual_channel_color(
  field = "Protein",
  type = "nominal",
  domain = c(
    "receptor-binding domain (RBD)", "receptor-binding motif (RBM)",
    "S1/S2 cleavage site", "heptad repeat 1 (HR1)",
    "heptad repeat 2 (HR2)"
  )
)

view2_track1a_xe <- visual_channel_x(
  field = "Stop", type = "genomic"
)

view2_track1a <- add_single_track(
  mark = "rect",
  color = view2_track1a_color,
  xe = view2_track1a_xe
)

view2_track1b_text <- visual_channel_text(
  field = "Protein",
  type = "nominal"
)

view2_track1b_style <- default_track_styles(
  textAnchor = "end"
)

view2_track1b <- add_single_track(
  mark = "text",
  text = view2_track1b_text,
  color = "#333",
  stroke = "white",
  strokeWidth = 3,
  style = view2_track1b_style
)

view2_track1_x <- visual_channel_x(
  field = "Start", type = "genomic"
)

view2_track1_row <- visual_channel_row(
  field = "Protein",
  type = "nominal",
  domain = c(
    "receptor-binding domain (RBD)",
    "receptor-binding motif (RBM)",
    "S1/S2 cleavage site",
    "heptad repeat 1 (HR1)",
    "heptad repeat 2 (HR2)"
  )
)

view2_track1 <- add_single_track(
  id = "view2_track1",
  alignment = "overlay",
  title = "S Protein Annotation",
  data = view2_track1_data,
  tracks = add_multi_tracks(
    view2_track1a, view2_track1b
  ),
  x = view2_track1_x,
  row = view2_track1_row,
  width = 800, height = 80
)

# View 2 Track 2----
view2_track2_data <- track_data(
  url = "https://s3.amazonaws.com/gosling-lang.org/data/COVID/NC_045512.2-Genes.csv",
  type = "csv",
  chromosomeField = "Accession",
  genomicFields = c("Start", "Stop")
)

view2_track2a <- add_single_track(
  mark = "rect",
  color = "#0072B2",
  stroke = "white",
  strokeWidth = 2
)

view2_track2b <- add_single_track(
  mark = "rule",
  color = "white",
  opacity = 0.6,
  strokeWidth = 0,
  style = default_track_styles(
    linePattern = list(
      type = "triangleRight", size = 10
    )
  )
)

view2_track2c <- add_single_track(
  mark = "text",
  text = visual_channel_text(
    field = "Gene symbol", type = "nominal"
  ),
  color = "black",
  stroke = "white",
  strokeWidth = 3,
  visibility = list(list(
    target = "mark",
    measure = "width",
    threshold = "|xe-x|",
    operation = "LTET",
    transitionPadding = 30
  ))
)

view2_track2_x <- visual_channel_x(
  field = "Start", type = "genomic"
)

view2_track2_xe <- visual_channel_x(
  field = "Stop", type = "genomic"
)

view2_track2 <- add_single_track(
  alignment = "overlay",
  title = "NC_045512.2 Genes",
  data = view2_track2_data,
  tracks = add_multi_tracks(
    view2_track2a, view2_track2b, view2_track2c
  ),
  x = view2_track2_x,
  xe = view2_track2_xe,
  width = 800, height = 30
)

# View 2 Track 3----
view2_track3_data <- track_data(
  url = "https://server.gosling-lang.org/api/v1/tileset_info/?d=NC_045512_2-multivec",
  type = "multivec",
  row = "base",
  column = "position",
  value = "count",
  categories = c("A", "T", "G", "C"),
  start = "start",
  end = "end"
)

view2_track3a <- add_single_track(
  mark = "bar",
  y = visual_channel_y(
    field = "count", type = "quantitative", axis = "none"
  )
)

view2_track3b <- add_single_track(
  dataTransform = track_data_transform(
    type = "filter",
    field = "count",
    oneOf = list(0),
    not = TRUE
  ),
  mark = "text",
  x = visual_channel_x(
    field = "start", type = "genomic"
  ),
  xe = visual_channel_x(
    field = "end", type = "genomic"
  ),
  size = 24,
  color = "white",
  visibility = list(list(
    operation = "less-than",
    measure = "width",
    threshold = "|xe-x|",
    transitionPadding = 30,
    target = "mark"
  ),
  list(
    operation = "LT",
    measure = "zoomLevel",
    threshold = 40,
    target = "track"
  ))
)

view2_track3_x <- visual_channel_x(
  field = "position", type = "genomic"
)

view2_track3_color <- visual_channel_color(
  field = "base",
  type = "nominal",
  domain = c("A", "T", "G", "C"),
  legend = TRUE
)

view2_track3_text <- visual_channel_text(
  field = "base", type = "nominal"
)

view2_track3_style <- default_track_styles(
  inlineLegend = TRUE
)

view2_track3 <- add_single_track(
  title = "NC_045512.2 Sequence",
  alignment = "overlay",
  data = view2_track3_data,
  tracks = add_multi_tracks(
    view2_track3a, view2_track3b
  ),
  x = view2_track3_x,
  color = view2_track3_color,
  text = view2_track3_text,
  style = view2_track3_style,
  width = 800, height = 40
)

# View 2 Track 4----
view2_track4_data <- track_data(
  url = "https://s3.amazonaws.com/gosling-lang.org/data/COVID/TRS-L-dependent_recombinationEvents_sorted.bed",
  type = "csv",
  chromosomeField = "Accession",
  genomicFields = c("Start1", "Stop1", "Start2", "Stop2")
)

view2_track4_x <- visual_channel_x(
  field = "Start1", type = "genomic"
)

view2_track4_xe <- visual_channel_x(
  field = "Stop1", type = "genomic"
)

view2_track4_x1 <- visual_channel_x(
  field = "Start2", type = "genomic"
)

view2_track4_x1e <- visual_channel_x(
  field = "Stop2", type = "genomic"
)

view2_track4 <- add_single_track(
  title = "TRS-L-Dependent Recombination Events",
  data = view2_track4_data,
  mark = "withinLink",
  x = view2_track4_x,
  xe = view2_track4_xe,
  x1 = view2_track4_x1,
  x1e = view2_track4_x1e,
  stroke = "#0072B2",
  color = "#0072B2",
  opacity = 0.1,
  width = 800,
  height = 300
)


view2 <- compose_view(
  multi = TRUE,
  centerRadius = 0,
  xDomain = list(interval = c(1, 29903)),
  linkingId = "detail",
  alignment = "stack",
  tracks = add_multi_tracks(
    view2_track1, view2_track2, view2_track3, view2_track4
  )
)


combined_view <- arrange_views(
  title = "SARS-CoV-2",
  subtitle = "Data Source: WashU Virus Genome Browser, NCBI, GISAID",
  assembly = list(list("NC_045512.2", 29903)),
  layout = "linear",
  spacing = 50,
  views = list(view1, view2),
  listify = FALSE
)

function(input, output, session) {

  observeEvent(input$download_png, {
    export_png(component_id = "sars_cov2")
  })

  observeEvent(input$download_pdf, {
    export_pdf(component_id = "sars_cov2")
  })

  observeEvent(input$zoom_out, {
    zoom_to_extent(
      component_id = "sars_cov2",
      view_id = "view2_track1"
    )
  })

  output$gosling_plot_sars_cov2 <- renderGosling({
    gosling(
      component_id = "sars_cov2",
      combined_view
    )
  })
}
