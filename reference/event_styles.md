# Mouse event styles

The styles defined here will be applied to the targets of mouse events,
such as a point mark after user click mouse.

## Usage

``` r
event_styles(
  strokeWidth = NULL,
  strokeOpacity = NULL,
  stroke = NULL,
  opacity = NULL,
  color = NULL,
  arrange = NULL
)
```

## Arguments

- strokeWidth:

  A number. stroke width of the marks when mouse events are triggered.

- strokeOpacity:

  A number.

- stroke:

  A character. Stroke color of the marks when mouse events are
  triggered.

- opacity:

  A number. Opacity of the marks when mouse events are triggered.

- color:

  A character. Color of the marks when mouse events are triggered.

- arrange:

  A character. One of "behind", "front". Show event effects behind or in
  front of marks.

## Value

List object with event styles.

## Details

For more info visit
http://gosling-lang.org/docs/visual-channel/#type-eventstyle
