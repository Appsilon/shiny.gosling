function(input, output, session) {
  all_reactive_values <- reactiveValues(
    composed_track = NULL,
    composed_views = NULL
  )
  observeEvent(input$layout, {
    track1 <- add_single_track(
      id = "track2",
      title = "Patient Overview (PD35930a)",
      alignment = "overlay",
      data = track_data(
        url = "https://raw.githubusercontent.com/sehilyi/gemini-datasets/master/data/UCSC.HG38.Human.CytoBandIdeogram.csv",
        type = "csv",
        chromosomeField = "Chromosome",
        genomicFields = c("chromStart", "chromEnd")
      ),
      tracks = add_multi_tracks(
        add_single_track(
          mark = "rect"
        ),
        add_single_track(
          mark = "brush",
          x = visual_channel_x(linkingId = "mid-scale"),
          strokeWidth = 1.5, stroke = "#0070DC",
          color = "#AFD8FF", opacity = 0.5
        )
      ),
      color = visual_channel_color(
        field = "Stain", type = "nominal", domain = c(
          "gneg", "gpos25", "gpos50", "gpos75", "gpos100", "gvar", "acen"
        ), range = c(
          "white", "lightgray", "gray", "gray", "black", "#7B9CC8", "#DC4542"
        )
      ),
      size = 18,
      x = visual_channel_x(field = "chromStart", type = "genomic"),
      xe = visual_channel_x(field = "chromEnd", type = "genomic"),
      stroke = "gray", strokeWidth = 0.3,
      width = 500, height = 100
    )

    track2 <- add_single_track(
      id = "track3",
      title = "Putative Driver",
      alignment = "overlay",
      data = track_data(
        url = "inst/examples/multiTrackApp/data/driver.df.scanb.complete.csv",
        type = "csv",
        chromosomeField = "Chr",
        genomicFields = c("ChrStart", "ChrEnd")
      ),
      dataTransform = track_data_transform(
        type = "filter", field = "Sample", oneOf = list("PD35930a")
      ),
      tracks = add_multi_tracks(
        add_single_track(
          mark = "text"
        ),
        add_single_track(
          mark = "triangleBottom", size = 5
        )
      ),
      x = visual_channel_x(field = "ChrStart", type = "genomic"),
      xe = visual_channel_x(field = "ChrEnd", type = "genomic"),
      text = visual_channel_text(field = "Gene", type = "nominal"),
      color = "black",
      style = default_track_styles(
        textFontWeight = "normal", dx = -10, outlineWidth = 0
      ),
      width = 500, height = 40
    )

    track3 <- add_single_track(
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
      tracks = add_multi_tracks(
        add_single_track(
          mark = "rect"
        ),
        add_single_track(
          mark = "brush", x = visual_channel_x(linkingId = "mid-scale"),
          strokeWidth = 1, stroke = "#94C2EF",
          color = "#AFD8FF"
        )
      ),
      x = visual_channel_x(field = "start", type = "genomic"),
      xe = visual_channel_x(field = "end", type = "genomic"),
      color = "#FB6A4B",
      width = 620, height = 40
    )


    all_reactive_values$composed_track <- compose_single_track_view(
      multi = TRUE,
      tracks = add_multi_tracks(track1, track2, track3),
      xOffset = 190, layout = input$layout, spacing = 1
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
  })
  output$gosling_plot <- renderUI({
    GoslingComponent(
      spec = shiny.react::JS(
        build_json(
          all_reactive_values$composed_views, single_track = FALSE
        )
      )
    )
  })
}
