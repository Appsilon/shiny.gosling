single_track <- add_single_track(
  id = "track1",
  data = track_data(
    url = "https://server.gosling-lang.org/api/v1/tileset_info/?d=cistrome-multivec",
    type = "multivec",
    row = "sample",
    column = "position",
    value = "peak",
    categories = c("sample 1", "sample 2", "sample 3", "sample 4"),
    binSize = 4,
  ),
  mark = "rect",
  x = visual_channel_x(field = "start", type = "genomic", axis = "top"),
  xe = visual_channel_x(field = "end", type = "genomic"),
  row = visual_channel_row(
    field = "sample",
    type = "nominal",
    legend = TRUE
  ),
  color = visual_channel_color(
    field = "peak",
    type = "quantitative",
    legend = TRUE
  ),
  tooltip = visual_channel_tooltips(
    visual_channel_tooltip(
      field = "start", type = "genomic",
      alt = "Start Position"
    ),
    visual_channel_tooltip(
      field = "end", type = "genomic",
      alt = "End Position"
    ),
    visual_channel_tooltip(
      field = "peak",
      type = "quantitative",
      alt = "Value",
      format = "0.2"
    )
  ),
  width = 600,
  height = 130
)

single_composed_track <- compose_view(
  tracks = single_track
)

track1_data <- track_data(
  url = "https://raw.githubusercontent.com/sehilyi/gemini-datasets/master/data/UCSC.HG38.Human.CytoBandIdeogram.csv",
  type = "csv",
  chromosomeField = "Chromosome",
  genomicFields = c("chromStart", "chromEnd")
)

track_1_tracks <- add_multi_tracks(
  add_single_track(
    mark = "rect"
  ),
  add_single_track(
    mark = "brush",
    x = visual_channel_x(linkingId = "mid-scale"),
    strokeWidth = 1.5, stroke = "#0070DC",
    color = "#AFD8FF", opacity = 0.5
  )
)

track1_color <- visual_channel_color(
  field = "Stain", type = "nominal", domain = c(
    "gneg", "gpos25", "gpos50", "gpos75", "gpos100", "gvar", "acen"
  ), range = c(
    "white", "lightgray", "gray", "gray", "black", "#7B9CC8", "#DC4542"
  )
)

track1_x <- visual_channel_x(field = "chromStart", type = "genomic")
track1_xe <- visual_channel_x(field = "chromEnd", type = "genomic")

track1 <- add_single_track(
  id = "track2", title = "Patient Overview (PD35930a)",
  alignment = "overlay", data = track1_data, tracks = track_1_tracks,
  color = track1_color, size = 18, x = track1_x, xe = track1_xe,
  stroke = "gray", strokeWidth = 0.3, width = 500, height = 100
)

track2_data <- track_data(
  url = "https://s3.amazonaws.com/gosling-lang.org/data/SV/driver.df.scanb.complete.csv",
  type = "csv",
  chromosomeField = "Chr",
  genomicFields = c("ChrStart", "ChrEnd")
)

track2_data_transform <- track_data_transform(
  type = "filter", field = "Sample", oneOf = list("PD35930a")
)

track2_tracks <- add_multi_tracks(
  add_single_track(
    mark = "text"
  ),
  add_single_track(
    mark = "triangleBottom", size = 5
  )
)

track2_x <- visual_channel_x(field = "ChrStart", type = "genomic")
track2_xe <- visual_channel_x(field = "ChrEnd", type = "genomic")

track2_text <- visual_channel_text(field = "Gene", type = "nominal")
track2_style <- default_track_styles(
  textFontWeight = "normal", dx = -10, outlineWidth = 0
)
track2 <- add_single_track(
  id = "track3", title = "Putative Driver",
  alignment = "overlay", data = track2_data,
  dataTransform = track2_data_transform, tracks = track2_tracks,
  x = track2_x, xe = track2_xe, text = track2_text,
  color = "black", style = track2_style, width = 500, height = 40
)

track3_styles <- default_track_styles(
  background = "lightgray", backgroundOpacity = 0.2
)
track3_data <- track_data(
  url =
    "https://s3.amazonaws.com/gosling-lang.org/data/cancer/cnv.PD35930a.csv",
  type = "csv",
  headerNames = c(
    "id",
    "chr",
    "start",
    "end",
    "total_cn_normal",
    "minor_cp_normal",
    "total_cn_tumor",
    "minor_cn_tumor"
  ),
  chromosomeField = "chr",
  genomicFields = c("start", "end")
)
track3_data_transform <- track_data_transform(
  type = "filter", field = "minor_cn_tumor", oneOf = list("0")
)
track3_tracks <- add_multi_tracks(
  add_single_track(
    mark = "rect"
  ),
  add_single_track(
    mark = "brush", x = visual_channel_x(linkingId = "mid-scale"),
    strokeWidth = 1, stroke = "#94C2EF",
    color = "#AFD8FF"
  )
)
track3_x <- visual_channel_x(field = "start", type = "genomic")
track3_xe <- visual_channel_x(field = "end", type = "genomic")
track3 <- add_single_track(
  id = "track3", title = "LOH",
  style = track3_styles, alignment = "overlay",
  data = track3_data, dataTransform = track3_data_transform,
  tracks = track3_tracks, x = track3_x, xe = track3_xe,
  color = "#FB6A4B", width = 620, height = 40
)

track4_styles <- default_track_styles(
  background = "lightgray", backgroundOpacity = 0.2
)
track4_data <- track_data(
  url =
    "https://s3.amazonaws.com/gosling-lang.org/data/cancer/cnv.PD35930a.csv",
  type = "csv",
  headerNames = c(
    "id",
    "chr",
    "start",
    "end",
    "total_cn_normal",
    "minor_cp_normal",
    "total_cn_tumor",
    "minor_cn_tumor"
  ),
  chromosomeField = "chr",
  genomicFields = c("start", "end")
)
track4_data_transform <- track_data_transform(
  type = "filter", field = "total_cn_tumor", inRange = c(4.5, 900)
)
track4_tracks <- add_multi_tracks(
  add_single_track(
    mark = "rect"
  ),
  add_single_track(
    mark = "brush", x = visual_channel_x(linkingId = "mid-scale"),
    strokeWidth = 0
  )
)
track4_x <- visual_channel_x(field = "start", type = "genomic")
track4_xe <- visual_channel_x(field = "end", type = "genomic")
track4 <- add_single_track(
  id = "track4", title = "Gain",
  style = track4_styles, alignment = "overlay",
  data = track4_data, dataTransform = track4_data_transform,
  tracks = track4_tracks, x = track4_x, xe = track4_xe,
  color = "#73C475", width = 500, height = 40
)

track5_styles <- default_track_styles(
  legendTitle = "SV Class"
)
track5_data <- track_data(
  url = "https://s3.amazonaws.com/gosling-lang.org/data/cancer/rearrangement.PD35930a.csv",
  type = "csv",
  genomicFieldsToConvert = json_list(
    json_list(
      chromosomeField = "chr1",
      genomicFields = c("start1", "end1")
    ),
    json_list(
      chromosomeField = "chr2",
      genomicFields = c("start2", "end2")
    )
  )
)
track5_tracks <- add_multi_tracks(
  add_single_track(
    mark = "rect"
  ),
  add_single_track(
    mark = "withinLink", x = visual_channel_x(linkingId = "mid-scale"),
    strokeWidth = 0
  )
)
track5_color <- visual_channel_color(
  field = "svclass",
  type = "nominal",
  legend = TRUE,
  domain = json_list(
    "tandem-duplication", "translocation", "deletion", "inversion"
  ),
  range = json_list(
    "#569C4D", "#4C75A2", "#DA5456", "#EA8A2A"
  )
)
track5_stroke <- visual_channel_stroke(
  field = "svclass",
  type = "nominal",
  domain = json_list(
    "tandem-duplication", "translocation", "deletion", "inversion"
  ),
  range = json_list(
    "#569C4D", "#4C75A2", "#DA5456", "#EA8A2A"
  )
)
track5_x <- visual_channel_x(field = "start1", type = "genomic")
track5_xe <- visual_channel_x(field = "end2", type = "genomic")
track5 <- add_single_track(
  id = "track5", title = "Structural Variant",
  data = track5_data, mark = "withinLink",
  x = track5_x, xe = track5_xe,
  color = track5_color, width = 500, height = 80, stroke = track5_stroke,
  strokeWidth = 1, opacity = 0.6, style = track5_styles
)

function(input, output, session) {
  all_reactive_values <- reactiveValues(
    single_composed_views = NULL,
    composed_track = NULL,
    composed_views = NULL
  )

  observeEvent(input$download_png, {
    export_png(component_id = "component_1")
  })

  observeEvent(input$download_pdf, {
    export_pdf(component_id = "component_1")
  })

  observeEvent(input$go_to_chr, {
    zoom_to(
      component_id = "component_1",
      view_id = "track1",
      position = input$chromosomes
    )
  })

  observeEvent(input$reset_rule_mark, {
    zoom_to_extent(
      component_id = "component_1",
      view_id = "track1",
      duration = 2000
    )
  })

  observeEvent(input$layout_single, {
    all_reactive_values$single_composed_views <- arrange_views(
      title = "Single Track",
      subtitle =
        "This is the simplest single track visualization with a linear layout",
      layout = input$layout_single, views = single_composed_track,
      xDomain = list(chromosome = "chr1", interval = c(1, 3000500))
    )
    output$gosling_plot_single <- renderGosling({
      gosling(
        component_id = "component_1",
        all_reactive_values$single_composed_views, clean_braces = TRUE
      )
    })
  })

  observeEvent(input$layout_multi, {
    all_reactive_values$composed_track <- compose_view(
      multi = TRUE,
      tracks = add_multi_tracks(
        track1, track2, track3, track4, track5
      ),
      xOffset = 190, layout = input$layout_multi, spacing = 1
    )
    all_reactive_values$composed_views <- arrange_views(
      views = all_reactive_values$composed_track,
      arrangement = "vertical"
    )
    all_reactive_values$composed_views <- arrange_views(
      title = "Breast Cancer Variant (Staaf et al. 2019)",
      subtitle = "Genetic characteristics of RAD51C- and PALB2-altered TNBCs",
      layout = "linear", views = all_reactive_values$composed_views,
      arrangement = "vertical", centerRadius = 0.5, assembly = "hg19",
      spacing = 40, style = default_track_styles(
        enableSmoothPath = FALSE, outline = "lightgray", outlineWidth = 1
      )
    )
    output$gosling_plot_multi <- renderGosling({
      gosling(
        component_id = "component_2",
        all_reactive_values$composed_views, clean_braces = FALSE
      )
    })
  })
}
