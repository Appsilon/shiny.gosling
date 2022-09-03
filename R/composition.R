#' Add a single track to the plot of a mark type ( plot type )
#'
#' This function constructs a single track from the inputs. The inputs
#' can be id, data, mark etc. Please check gosling.js documentation for
#' advabced usage.
#'
#' @param id Optional argument to assign an id to the track.
#' @param data An object of from track_data() function.
#' @param mark Type of plot. One of c("point", "line", "rect", "bar", "area",
#' "link", "triangle", "text"). Each mark type has some supported visual channel.
#'
#' Different marks support different visual channels:
#' - point:	x, y, row, size, color, strokeWidth, opacity
#' - line:	x, y, row, color, strokeWidth
#' - rect:	x, xe, row, color, strokeWidth, opacity
#' - bar:	x, y, row, color, strokeWidth, opacity
#' - area:	x, y, row, color, strokeWidth
#' - link:	x, xe, x1, x1e, color, opacity
#' - triangle:	x, xe, row, size, color, opacity
#' - text:	x, xe, row, color, opacity
#'
#' @param assembly Currently support "hg38", "hg19", "hg18",
#'  "hg17", "hg16", "mm10", "mm9". Defaults to "hg38".
#' @param row An object of from visual_channel_row().
#' @param size An object of from visual_channel_size() OR an atomic number.
#' @param color An object of from visual_channel_color() OR and atomic
#' character hex code of the form "#123456".
#' @param strokeWidth An object of from visual_channel_stroke_width() OR an
#' atomic number.
#' @param opacity An object of from visual_channel_opacity() OR and atomic
#' ratio from 0 to 1.
#' @param x An object of from visual_channel_x() OR an atomic value.
#' @param xe An object of from visual_channel_x() OR an atomic value.
#' @param x1 An object of from visual_channel_x() OR an atomic value.
#' @param x1e An object of from visual_channel_x() OR an atomic value.
#' @param y An object of from visual_channel_y() OR an atomic value.
#' @param stroke An object of from visual_channel_stroke() function OR a
#' character of hex color code like "#123456".
#' @param width A number interpreted in units of pixel.
#' @param height A number interpreted in units of pixel.
#' @param dataTransform An object of from track_data_transform() function.
#' @param ... Any other arguments to be passed onto gosling.js.
#' @export
add_single_track <- function(
    id = NULL, data = NULL, mark = NULL, assembly = NULL, row = NULL,
    size = NULL, color = NULL,
    strokeWidth = NULL, opacity = NULL,
    x = NULL, xe = NULL, x1 = NULL, x1e = NULL, y = NULL,
    stroke = NULL, width = NULL, height = NULL, dataTransform = NULL, ...
) {
  visual_channels = add_mark(
    x, xe, x1, x1e, y,
    strokeWidth, opacity, row, size,
    color, stroke
  )
  defaults <- list(
    id = id, data = data, dataTransform = dataTransform, mark = mark,
    assembly = assembly, width = width, height = height
  )
  options <- list(...)
  visual_channels <- atomic_values_to_list(visual_channels)
  defaults <- atomic_values_to_list(defaults)
  options <- atomic_values_to_list(options)
  list_rm_null(
    c(
      defaults, options, visual_channels
    )
  )
}

#' Compose views from add_single_track() and add_multi_tracks() functions.
#' @param multi Whether multiple tracks in the view.
#' @param layout One of "linear" or "circular".
#' @param width A number interpreted in units of pixel.
#' @param height A number interpreted in units of pixel.
#' @param centerRadius Specify the proportion of the radius of
#'  the center white space. A number between [0,1], default=0.3
#' @param tracks The tracks with add_multi_tracks() function.
#' @param ... More arguments passed along with view to gosling.js.
#'
#' @export
compose_view <- function(
    multi = FALSE,
    layout = NULL, width = NULL, height = NULL,
    centerRadius = NULL, tracks, ...
) {
  list_rm_null(
    list(
      ..., layout = layout, width = width, height = height,
      centerRadius = centerRadius,
      tracks = ifelse(
        multi, list(tracks),
        list(tracks)
      )
    )
  )
}

#' Arrange views from compose_view() function.
#' @param layout One of "linear" or "circular".
#' @param views An object from compose_view() function.
#' @param ... More options passed to gosling.js.
#'
#' @export
arrange_views <- function(
    layout = NULL, views = NULL, ...
) {
  list_rm_null(
    list(
      ..., layout = layout, views = list(views)
    )
  )
}

#' Generic list
#' @param ... Multiple tracks from add_single_track() function.
#'
#' @export
add_multi_tracks <- function(...) {
  json_list(...)
}
