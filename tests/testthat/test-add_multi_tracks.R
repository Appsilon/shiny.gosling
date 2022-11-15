test_that("add_multi_tracks() returns list", {
  expect_true(is.list(
    add_multi_tracks(
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
  ))
})

test_that("add_multi_tracks() build validated json", {
  # 1
  track1 <- add_multi_tracks(
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

  expect_true(
    jsonlite::validate(
      jsonlite::toJSON(
        track1
      )
    )
  )

  # 2
  track2 <- add_multi_tracks(
    add_single_track(
      mark = "text"
    ),
    add_single_track(
      mark = "triangleBottom", size = 5
    )
  )

  expect_true(
    jsonlite::validate(
      jsonlite::toJSON(
        track2
      )
    )
  )

  # 3
  track3 <- add_multi_tracks(
    add_single_track(
      mark = "rect"
    ),
    add_single_track(
      mark = "brush", x = visual_channel_x(linkingId = "mid-scale"),
      strokeWidth = 1, stroke = "#94C2EF",
      color = "#AFD8FF"
    )
  )

  expect_true(
    jsonlite::validate(
      jsonlite::toJSON(
        track3
      )
    )
  )
})
