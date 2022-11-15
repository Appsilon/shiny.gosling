test_that("add_single_track() returns list", {
  expect_true(is.list(
    add_single_track(
      mark = "brush",
      x = visual_channel_x(linkingId = "detail-1"),
      color = "blue"
    )
  ))
})


test_that("add_single_track() build validated json", {
  # 1
  track1 = add_single_track(
    mark = "brush",
    x = visual_channel_x(linkingId = "detail-1"),
    color = "blue"
  )

  expect_true(
    jsonlite::validate(
      jsonlite::toJSON(
        track1
      )
    )
  )

  # 2
  track2 = add_single_track(
    mark = "brush", x = visual_channel_x(linkingId = "mid-scale"),
    strokeWidth = 1, stroke = "#94C2EF",
    color = "#AFD8FF"
  )

  expect_true(
    jsonlite::validate(
      jsonlite::toJSON(
        track2
      )
    )
  )

  # 3
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
      "tandem-duplication", "translocation", "delection", "inversion"
    ),
    range = json_list(
      "#569C4D", "#4C75A2", "#DA5456", "#EA8A2A"
    )
  )
  track5_stroke <- visual_channel_stroke(
    field = "svclass",
    type = "nominal",
    domain = json_list(
      "tandem-duplication", "translocation", "delection", "inversion"
    ),
    range = json_list(
      "#569C4D", "#4C75A2", "#DA5456", "#EA8A2A"
    )
  )
  track5_x <- visual_channel_x(field = "start1", type = "genomic")
  track5_xe <- visual_channel_x(field = "end2", type = "genomic")
  track3 <- add_single_track(
    id = "track5", title = "Structural Variant",
    data = track5_data, mark = "withinLink",
    x = track5_x, xe = track5_xe,
    color = track5_color, width = 500, height = 80, stroke = track5_stroke,
    strokeWidth = 1, opacity = 0.6, style = track5_styles
  )
  expect_true(
    jsonlite::validate(
      jsonlite::toJSON(
        track3
      )
    )
  )
})
