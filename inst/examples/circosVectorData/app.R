require(shiny)
require(shiny.gosling)

circos_data <-
  "https://resgen.io/api/v1/tileset_info/?d=VLFaiSVjTjW6mkbjRjWREA"

track1 <- add_single_track(
  id = "track1",
  title = "Peak",
  data = track_data(
    url = circos_data,
    type = "vector",
    column = "position",
    value = "peak"
  ),
  mark = "bar",
  x = visual_channel_x(field = "position", type = "genomic", axis = "top"),
  y = visual_channel_y(field = "peak", type = "quantitative", axis = "right"),
  color = visual_channel_color(
    value = "#EEEDA1"
  ),
  width = 700,
  height = 60
)

track2 <- add_single_track(
  id = "track2",
  title = "Stain",
  data = track_data(
    url = "https://raw.githubusercontent.com/sehilyi/gemini-datasets/master/data/UCSC.HG38.Human.CytoBandIdeogram.csv",
    type = "csv",
    chromosomeField = "Chromosome",
    genomicFields = c("chromStart", "chromEnd")
  ),
  mark = "rect",
  x = visual_channel_x(field = "chromStart", type = "genomic"),
  xe = visual_channel_x(field = "chromEnd", type = "genomic"),
  color = visual_channel_color(
    field = "Stain",
    type = "nominal",
    domain = c(
      "gneg", "gpos25", "gpos50", "gpos75", "gpos100", "gvar", "acen"
    ),
    range = c(
      "white", "#D9D9D9", "#979797", "#636363", "black", "#F0F0F0", "#8D8D8D"
    )
  ),
  stroke = visual_channel_stroke(
    value = "lightgray"
  ),
  strokeWidth = visual_channel_stroke_width(
    value = 0.5
  ),
  width = 700,
  height = 30
)

track3 <- add_single_track(
  id = "track3",
  title = "Highlight chr 1 to others",
  data = track_data(
    url = "https://raw.githubusercontent.com/vigsterkr/circos/master/data/5/segdup.txt",
    type = "csv",
    headerNames = c("id", "chr", "p1", "p2"),
    chromosomePrefix = "hs",
    chromosomeField = "chr",
    genomicFields = c("p1", "p2"),
    separator = " ",
    longToWideId = "id"
  ),
  alignment = "overlay",
  opacity = visual_channel_opacity(
    value = 0.4
  ),
  tracks = add_multi_tracks(
    add_single_track(
      dataTransform = track_data_transform(
        type = "filter", field = "chr", oneOf = list("hs1"), not = TRUE
      ),
      mark = "withinLink",
      x = visual_channel_x(
        field = "p1", type = "genomic"
      ),
      xe = visual_channel_x(
        field = "p1_2", type = "genomic"
      ),
      x1 = visual_channel_x(
        field = "p2", type = "genomic"
      ),
      x1e = visual_channel_x(
        field = "p2_2", type = "genomic"
      ),
      stroke = visual_channel_stroke(
        value = "lightgray"
      ),
      strokeWidth = visual_channel_stroke_width(
        value = 1
      )
    ),
    add_single_track(
      dataTransform = track_data_transform(
        type = "filter", field = "chr", oneOf = list("hs1")
      ),
      mark = "withinLink",
      x = visual_channel_x(
        field = "p1", type = "genomic"
      ),
      xe = visual_channel_x(
        field = "p1_2", type = "genomic"
      ),
      x1 = visual_channel_x(
        field = "p2", type = "genomic"
      ),
      x1e = visual_channel_x(
        field = "p2_2", type = "genomic"
      ),
      stroke = visual_channel_stroke(
        field = "chr_2",
        type = "nominal",
        range = c(
          "#E79F00", "#029F73", "#0072B2", "#CB7AA7", "#D45E00",
          "#57B4E9", "#EFE441"
        )
      ),
      strokeWidth = visual_channel_stroke_width(
        value = 1.5
      )
    )
  ),
  width = 700,
  height = 300
)

single_composed_track <- compose_view(
  title = "Circos",
  subtitle = "http://circos.ca/intro/genomic_data/",
  layout = "circular", #"linear"
  static = TRUE,
  spacing = 1,
  centerRadius = 0.3,
  alignment = "stack",
  multi = TRUE,
  tracks = add_multi_tracks(track1, track2, track3)
)


ui <- fluidPage(
  use_gosling(),
  fluidRow(
    column(6, goslingOutput("gosling_plot")),
    column(
      1, br(), actionButton(
        "download_pdf",
        "PDF",
        icon = icon("cloud-arrow-down")
      )
    )
  )
)


server <- function(input, output, session) {
  output$gosling_plot <- renderGosling({
    gosling(
      component_id = "component_1",
      single_composed_track
    )
  })

  observeEvent(input$download_pdf, {
    export_pdf(component_id = "component_1")
  })
}

shinyApp(ui, server)
