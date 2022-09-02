library(shiny.gosling)

track1 <- add_single_track(
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
    visual_channel_tooltip(field = "start", type = "genomic", alt = "Start Position"),
    visual_channel_tooltip(field = "end", type = "genomic", alt = "End Position"),
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

composed_track1 <- compose_single_track_view(tracks = track1)
composed_views1 <- arrange_views(
  title = "Single Track", subtitle = "This is the simplest single track visualization with a linear layout",
  layout = "linear", views = composed_track1,
  xDomain = list(chromosome = "chr1", interval = c(1, 3000500))
)


library(shiny.gosling)

track2 <- add_single_track(
  id = "track2",
  title = "Patient Overview (PD35930a)",
  alignment = "overlay",
  data = track_data(
    url = "https://raw.githubusercontent.com/sehilyi/gemini-datasets/master/data/UCSC.HG38.Human.CytoBandIdeogram.csv",
    type = "csv",
    chromosomeField = "Chromosome",
    genomicFields = c("chromStart", "chromEnd")
  ),
  tracks = c(
    list(list(
      mark = "rect"
    )),
    list(list(
      mark = "brush",
      x = visual_channel_x(linkingId = "mid-scale"),
      strokeWidth = list(value = 1.5), stroke = list(value = "#0070DC"),
      color = list(value = "#AFD8FF"), opacity = list(value = 0.5)
    ))
  ),
  color = visual_channel_color(
    field = "Stain", type = "nominal", domain = c(
      "gneg", "gpos25", "gpos50", "gpos75", "gpos100", "gvar", "acen"
    ), range = c(
      "white", "lightgray", "gray", "gray", "black", "#7B9CC8", "#DC4542"
    )
  ),
  size = list(value = 18),
  x = visual_channel_x(field = "chromStart", type = "genomic"),
  xe = visual_channel_x(field = "chromEnd", type = "genomic"),
  stroke = list(value = "gray"), strokeWidth = list(value = 0.3),
  width = 500, height = 100
)


track3 <- add_single_track(
  id = "track3",
  title = "Putative Driver",
  alignment = "overlay",
  data = track_data(
    url = "https://s3.amazonaws.com/gosling-lang.org/data/SV/driver.df.scanb.complete.csv",
    type = "csv",
    chromosomeField = "Chr",
    genomicFields = c("ChrStart", "ChrEnd")
  ),
  dataTransform = track_data_transform(
    type = "filter", field = "Sample", oneOf = list("PD35930a")
  ),
  tracks = list(
    list(
      mark = "text"
    ),
    list(
      mark = "triangleBottom", size = list(value = 5)
    )
  ),
  x = visual_channel_x(field = "ChrStart", type = "genomic"),
  xe = visual_channel_x(field = "ChrEnd", type = "genomic"),
  text = visual_channel_text(field = "Gene", type = "nominal"),
  color = list(value = "black"),
  style = default_track_styles(
    textFontWeight = "normal", dx = -10, outlineWidth = 0
  ),
  width = 500, height = 40
)


track4 <- add_single_track(
  id = "track3",
  title = "LOH",
  style = default_track_styles(
    background = "lightgray", backgroundOpacity = 0.2
  ),
  alignment = "overlay",
  data = track_data(
    url = "https://s3.amazonaws.com/gosling-lang.org/data/cancer/cnv.PD35930a.csv",
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
  ),
  dataTransform = track_data_transform(
    type = "filter", field = "minor_cn_tumor", oneOf = list("0")
  ),
  tracks = list(
    list(
      mark = "rect"
    ),
    list(
      mark = "brush", x = visual_channel_x(linkingId = "mid-scale"),
      strokeWidth = list(value = 1), stroke = list(value = "#94C2EF"),
      color = list(value = "#AFD8FF")
    )
  ),
  x = visual_channel_x(field = "start", type = "genomic"),
  xe = visual_channel_x(field = "end", type = "genomic"),
  color = list(value = "#FB6A4B"),
  width = 620, height = 40
)

composed_track2 <- compose_single_track_view(
  multi = TRUE,
  tracks = add_multi_tracks(track2, track3, track4),
  xOffset = 190, layout = "circular", spacing = 1
  )
composed_views2 <- arrange_views(
  views = composed_track2,
  arrangement = "vertical"
)
composed_views2 <- arrange_views(
  title = "Breast Cancer Variant (Staaf et al. 2019)",
  subtitle = "Genetic characteristics of RAD51C- and PALB2-altered TNBCs",
  layout = "linear", views = composed_views2,
  arrangement = "vertical", centerRadius = 0.5, assembly = "hg19",
  spacing = 40, style = default_track_styles(
    enableSmoothPath = FALSE, outline = "lightgray", outlineWidth = 1
  )
)
