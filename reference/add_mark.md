# Visual marks

Visual marks (e.g., points, lines, and bars) are the basic graphical
elements of a visualization.

## Usage

``` r
add_mark(
  x = NULL,
  xe = NULL,
  x1 = NULL,
  x1e = NULL,
  y = NULL,
  strokeWidth = NULL,
  opacity = NULL,
  row = NULL,
  size = NULL,
  color = NULL,
  stroke = NULL
)
```

## Arguments

- x:

  An object returned by visual_channel_x().

- xe:

  An object returned by visual_channel_x().

- x1:

  An object returned by visual_channel_x().

- x1e:

  An object returned by visual_channel_x().

- y:

  An object returned by visual_channel_y().

- strokeWidth:

  A number or an object returned by visual_channel_stroke_width().

- opacity:

  A number or an object returned by visual_channel_opacity().

- row:

  A factor data column Channel row is used with channel y to stratify a
  visualization with categorical values.

- size:

  A number or an object returned by visual_channel_size().

- color:

  A character or an object returned by visual_channel_color().

- stroke:

  A number or an object returned by visual_channel_stroke().

## Value

list of mark specifications

## Details

For info visit http://gosling-lang.org/docs/mark
