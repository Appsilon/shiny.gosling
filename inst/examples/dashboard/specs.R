
basic1 = '{
  "title": "Basic Marks: bar",
  "subtitle": "Tutorial Examples",
  "tracks": [
    {
      "id": "barchart_example_1",
      "layout": "linear",
      "width": 800,
      "height": 180,
      "data": {
        "url": "https://resgen.io/api/v1/tileset_info/?d=UvVPeLHuRDiYA3qwFlm7xQ",
        "type": "multivec",
        "row": "sample",
        "column": "position",
        "value": "peak",
        "categories": ["sample 1"],
        "binSize": 5
      },
      "mark": "bar",
      "x": {"field": "start", "type": "genomic", "axis": "bottom"},
      "xe": {"field": "end", "type": "genomic"},
      "y": {"field": "peak", "type": "quantitative", "axis": "right"},
      "size": {"value": 5}
    }
  ]
}'

basic2 = '{
  "title": "Rule Mark",
  "subtitle": "Annotate visualization with horizontal and vertical lines",
  "style": {"dashed": [3, 3]},
  "views": [
    {
      "alignment": "overlay",
      "tracks": [
        {
          "id": "rulemark_example_1",
          "data": {
            "url": "https://server.gosling-lang.org/api/v1/tileset_info/?d=cistrome-multivec",
            "type": "multivec",
            "row": "sample",
            "column": "position",
            "value": "peak",
            "categories": ["sample 1"],
            "binSize": 4
          },
          "mark": "bar",
          "x": {"field": "start", "type": "genomic"},
          "xe": {"field": "end", "type": "genomic"},
          "y": {"field": "peak", "type": "quantitative", "domain": [0, 0.003]},
          "color": {"value": "lightgray"}
        },
        {
          "data": {
            "type": "json",
            "values": [
              {"c": "chr2", "p": 100000, "v": 0.0001},
              {"c": "chr5", "p": 100000, "v": 0.0004},
              {"c": "chr10", "p": 100000, "v": 0.0009}
            ],
            "chromosomeField": "c",
            "genomicFields": ["p"]
          },
          "mark": "rule",
          "x": {"field": "p", "type": "genomic"},
          "y": {"field": "v", "type": "quantitative", "domain": [0, 0.003]},
          "strokeWidth": {"field": "v", "type": "quantitative"},
          "color": {"value": "red"}
        },
        {
          "data": {
            "type": "json",
            "values": [
              {"c": "chr2", "p": 100000, "v": 0.0001},
              {"c": "chr5", "p": 100000, "v": 0.0004},
              {"c": "chr10", "p": 100000, "v": 0.0009}
            ],
            "chromosomeField": "c",
            "genomicFields": ["p"]
          },
          "mark": "rule",
          "x": {"field": "p", "type": "genomic"},
          "strokeWidth": {"value": 2},
          "color": {"value": "blue"}
        }
      ],
      "width": 500,
      "height": 200
    }
  ]
}'

basic3 = '{
  "layout": "linear",
  "xDomain": {"chromosome": "1", "interval": [103900000, 104100000]},
  "spacing": 0,
  "tracks": [
    {
      "data": {
        "type": "csv",
        "url": "https://raw.githubusercontent.com/sehilyi/gemini-datasets/master/data/circos-segdup-edited.txt",
        "chromosomeField": "c2",
        "genomicFields": ["s1", "e1", "s2", "e2"]
      },
      "mark": "rect",
      "x": {"field": "s1", "type": "genomic"},
      "xe": {"field": "e1", "type": "genomic"},
      "stroke": {"value": "#4C6629"},
      "strokeWidth": {"value": 0.8},
      "tooltip": [
        {
          "field": "s1",
          "type": "genomic",
          "alt": "<b style=\"color:green\">Start Position</b>"
        },
        {
          "field": "e1",
          "type": "genomic",
          "alt": "<b style=\"color:green\">End Position</b>"
        }
      ],
      "opacity": {"value": 0.15},
      "color": {"value": "#85B348"},
      "width": 500,
      "height": 16
    },
    {
      "data": {
        "type": "csv",
        "url": "https://raw.githubusercontent.com/sehilyi/gemini-datasets/master/data/circos-segdup-edited.txt",
        "chromosomeField": "c2",
        "genomicFields": ["s1", "e1", "s2", "e2"]
      },
      "mark": "betweenLink",
      "x": {"field": "s1", "type": "genomic"},
      "xe": {"field": "e1", "type": "genomic"},
      "x1": {"field": "s2", "type": "genomic"},
      "x1e": {"field": "e2", "type": "genomic"},
      "stroke": {"value": "#4C6629"},
      "strokeWidth": {"value": 0.8},
      "opacity": {"value": 0.15},
      "color": {"value": "#85B348"},
      "style": {"outlineWidth": 0},
      "width": 500,
      "height": 100
    },
    {
      "data": {
        "type": "csv",
        "url": "https://raw.githubusercontent.com/sehilyi/gemini-datasets/master/data/circos-segdup-edited.txt",
        "chromosomeField": "c2",
        "genomicFields": ["s1", "e1", "s2", "e2"]
      },
      "mark": "rect",
      "x": {"field": "s2", "type": "genomic"},
      "xe": {"field": "e2", "type": "genomic"},
      "stroke": {"value": "#4C6629"},
      "strokeWidth": {"value": 0.8},
      "tooltip": [
        {
          "field": "s2",
          "type": "genomic",
          "alt": "<b style=\"color:green\">Start Position</b>"
        },
        {
          "field": "e2",
          "type": "genomic",
          "alt": "<b style=\"color:green\">End Position</b>"
        }
      ],
      "opacity": {"value": 0.15},
      "color": {"value": "#85B348"},
      "width": 500,
      "height": 16
    },
    {
      "data": {
        "type": "csv",
        "url": "https://raw.githubusercontent.com/sehilyi/gemini-datasets/master/data/circos-segdup-edited.txt",
        "chromosomeField": "c2",
        "genomicFields": ["s1", "e1", "s2", "e2"]
      },
      "mark": "betweenLink",
      "x": {"field": "s2", "type": "genomic"},
      "xe": {"field": "e2", "type": "genomic"},
      "x1": {"field": "s1", "type": "genomic"},
      "x1e": {"field": "e1", "type": "genomic"},
      "stroke": {"value": "#4C6629"},
      "strokeWidth": {"value": 0.8},
      "opacity": {"value": 0.15},
      "color": {"value": "#85B348"},
      "style": {"outlineWidth": 0},
      "width": 500,
      "height": 100
    },
    {
      "data": {
        "type": "csv",
        "url": "https://raw.githubusercontent.com/sehilyi/gemini-datasets/master/data/circos-segdup-edited.txt",
        "chromosomeField": "c2",
        "genomicFields": ["s1", "e1", "s2", "e2"]
      },
      "mark": "rect",
      "x": {"field": "s1", "type": "genomic"},
      "xe": {"field": "e1", "type": "genomic"},
      "stroke": {"value": "#4C6629"},
      "strokeWidth": {"value": 0.8},
      "tooltip": [
        {
          "field": "s1",
          "type": "genomic",
          "alt": "<b style=\"color:green\">Start Position</b>"
        },
        {
          "field": "e1",
          "type": "genomic",
          "alt": "<b style=\"color:green\">End Position</b>"
        }
      ],
      "opacity": {"value": 0.15},
      "color": {"value": "#85B348"},
      "width": 500,
      "height": 16
    },
    {
      "data": {
        "type": "csv",
        "url": "https://raw.githubusercontent.com/sehilyi/gemini-datasets/master/data/circos-segdup-edited.txt",
        "chromosomeField": "c2",
        "genomicFields": ["s1", "e1", "s2", "e2"]
      },
      "mark": "betweenLink",
      "x": {"field": "s1", "type": "genomic"},
      "xe": {"field": "e1", "type": "genomic"},
      "x1": {"field": "s2", "type": "genomic"},
      "x1e": {"field": "e2", "type": "genomic"},
      "stroke": {"value": "#4C6629"},
      "strokeWidth": {"value": 0.8},
      "opacity": {"value": 0.15},
      "color": {"value": "#85B348"},
      "style": {"outlineWidth": 0},
      "width": 500,
      "height": 100
    },
    {
      "data": {
        "type": "csv",
        "url": "https://raw.githubusercontent.com/sehilyi/gemini-datasets/master/data/circos-segdup-edited.txt",
        "chromosomeField": "c2",
        "genomicFields": ["s1", "e1", "s2", "e2"]
      },
      "mark": "rect",
      "x": {"field": "s2", "type": "genomic"},
      "xe": {"field": "e2", "type": "genomic"},
      "stroke": {"value": "#4C6629"},
      "strokeWidth": {"value": 0.8},
      "tooltip": [
        {
          "field": "s2",
          "type": "genomic",
          "alt": "<b style=\"color:green\">Start Position</b>"
        },
        {
          "field": "e2",
          "type": "genomic",
          "alt": "<b style=\"color:green\">End Position</b>"
        }
      ],
      "opacity": {"value": 0.15},
      "color": {"value": "#85B348"},
      "width": 500,
      "height": 16
    }
  ]
}'

composite1 = '{
  "layout": "linear",
  "xDomain": {"chromosome": "3", "interval": [52168000, 52890000]},
  "arrangement": "horizontal",
  "views": [
    {
      "arrangement": "vertical",
      "views": [
        {
          "alignment": "overlay",
          "title": "HiGlass",
          "data": {
            "url": "https://server.gosling-lang.org/api/v1/tileset_info/?d=gene-annotation",
            "type": "beddb",
            "genomicFields": [
              {"index": 1, "name": "start"},
              {"index": 2, "name": "end"}
            ],
            "valueFields": [
              {"index": 5, "name": "strand", "type": "nominal"},
              {"index": 3, "name": "name", "type": "nominal"}
            ],
            "exonIntervalFields": [
              {"index": 12, "name": "start"},
              {"index": 13, "name": "end"}
            ]
          },
          "tracks": [
            {
              "dataTransform": [
                {"type": "filter", "field": "type", "oneOf": ["gene"]},
                {"type": "filter", "field": "strand", "oneOf": ["+"]}
              ],
              "mark": "triangleRight",
              "x": {"field": "end", "type": "genomic", "axis": "top"},
              "size": {"value": 15}
            },
            {
              "dataTransform": [
                {"type": "filter", "field": "type", "oneOf": ["gene"]}
              ],
              "mark": "text",
              "text": {"field": "name", "type": "nominal"},
              "x": {"field": "start", "type": "genomic"},
              "xe": {"field": "end", "type": "genomic"},
              "style": {"dy": -15}
            },
            {
              "dataTransform": [
                {"type": "filter", "field": "type", "oneOf": ["gene"]},
                {"type": "filter", "field": "strand", "oneOf": ["-"]}
              ],
              "mark": "triangleLeft",
              "x": {"field": "start", "type": "genomic"},
              "size": {"value": 15},
              "style": {"align": "right"}
            },
            {
              "dataTransform": [
                {"type": "filter", "field": "type", "oneOf": ["exon"]}
              ],
              "mark": "rect",
              "x": {"field": "start", "type": "genomic"},
              "size": {"value": 15},
              "xe": {"field": "end", "type": "genomic"}
            },
            {
              "dataTransform": [
                {"type": "filter", "field": "type", "oneOf": ["gene"]},
                {"type": "filter", "field": "strand", "oneOf": ["+"]}
              ],
              "mark": "rule",
              "x": {"field": "start", "type": "genomic"},
              "strokeWidth": {"value": 3},
              "xe": {"field": "end", "type": "genomic"},
              "style": {"linePattern": {"type": "triangleRight", "size": 5}}
            },
            {
              "dataTransform": [
                {"type": "filter", "field": "type", "oneOf": ["gene"]},
                {"type": "filter", "field": "strand", "oneOf": ["-"]}
              ],
              "mark": "rule",
              "x": {"field": "start", "type": "genomic"},
              "strokeWidth": {"value": 3},
              "xe": {"field": "end", "type": "genomic"},
              "style": {"linePattern": {"type": "triangleLeft", "size": 5}}
            }
          ],
          "row": {"field": "strand", "type": "nominal", "domain": ["+", "-"]},
          "color": {
            "field": "strand",
            "type": "nominal",
            "domain": ["+", "-"],
            "range": ["#7585FF", "#FF8A85"]
          },
          "visibility": [
            {
              "operation": "less-than",
              "measure": "width",
              "threshold": "|xe-x|",
              "transitionPadding": 10,
              "target": "mark"
            }
          ],
          "opacity": {"value": 0.8},
          "width": 350,
          "height": 100
        },
        {
          "alignment": "overlay",
          "title": "Corces et al.",
          "data": {
            "url": "https://server.gosling-lang.org/api/v1/tileset_info/?d=gene-annotation",
            "type": "beddb",
            "genomicFields": [
              {"index": 1, "name": "start"},
              {"index": 2, "name": "end"}
            ],
            "valueFields": [
              {"index": 5, "name": "strand", "type": "nominal"},
              {"index": 3, "name": "name", "type": "nominal"}
            ],
            "exonIntervalFields": [
              {"index": 12, "name": "start"},
              {"index": 13, "name": "end"}
            ]
          },
          "tracks": [
            {
              "dataTransform": [
                {"type": "filter", "field": "type", "oneOf": ["gene"]},
                {"type": "filter", "field": "strand", "oneOf": ["+"]}
              ],
              "mark": "text",
              "text": {"field": "name", "type": "nominal"},
              "x": {"field": "start", "type": "genomic"},
              "xe": {"field": "end", "type": "genomic"},
              "size": {"value": 8},
              "style": {"textFontSize": 8, "dy": -12}
            },
            {
              "dataTransform": [
                {"type": "filter", "field": "type", "oneOf": ["gene"]},
                {"type": "filter", "field": "strand", "oneOf": ["-"]}
              ],
              "mark": "text",
              "text": {"field": "name", "type": "nominal"},
              "x": {"field": "start", "type": "genomic"},
              "xe": {"field": "end", "type": "genomic"},
              "size": {"value": 8},
              "style": {"textFontSize": 8, "dy": 10}
            },
            {
              "dataTransform": [
                {"type": "filter", "field": "type", "oneOf": ["gene"]},
                {"type": "filter", "field": "strand", "oneOf": ["+"]}
              ],
              "mark": "rect",
              "x": {"field": "end", "type": "genomic"},
              "size": {"value": 7}
            },
            {
              "dataTransform": [
                {"type": "filter", "field": "type", "oneOf": ["gene"]},
                {"type": "filter", "field": "strand", "oneOf": ["-"]}
              ],
              "mark": "rect",
              "x": {"field": "start", "type": "genomic"},
              "size": {"value": 7}
            },
            {
              "dataTransform": [
                {"type": "filter", "field": "type", "oneOf": ["exon"]}
              ],
              "mark": "rect",
              "x": {"field": "start", "type": "genomic"},
              "xe": {"field": "end", "type": "genomic"},
              "size": {"value": 14}
            },
            {
              "dataTransform": [
                {"type": "filter", "field": "type", "oneOf": ["gene"]}
              ],
              "mark": "rule",
              "x": {"field": "start", "type": "genomic"},
              "xe": {"field": "end", "type": "genomic"},
              "strokeWidth": {"value": 3}
            }
          ],
          "row": {"field": "strand", "type": "nominal", "domain": ["+", "-"]},
          "color": {
            "field": "strand",
            "type": "nominal",
            "domain": ["+", "-"],
            "range": ["#012DB8", "#BE1E2C"]
          },
          "visibility": [
            {
              "operation": "less-than",
              "measure": "width",
              "threshold": "|xe-x|",
              "transitionPadding": 10,
              "target": "mark"
            }
          ],
          "width": 350,
          "height": 100
        },
        {
          "alignment": "overlay",
          "title": "IGV",
          "data": {
            "url": "https://server.gosling-lang.org/api/v1/tileset_info/?d=gene-annotation",
            "type": "beddb",
            "genomicFields": [
              {"index": 1, "name": "start"},
              {"index": 2, "name": "end"}
            ],
            "valueFields": [
              {"index": 5, "name": "strand", "type": "nominal"},
              {"index": 3, "name": "name", "type": "nominal"}
            ],
            "exonIntervalFields": [
              {"index": 12, "name": "start"},
              {"index": 13, "name": "end"}
            ]
          },
          "tracks": [
            {
              "dataTransform": [
                {"type": "filter", "field": "type", "oneOf": ["gene"]}
              ],
              "mark": "text",
              "text": {"field": "name", "type": "nominal"},
              "x": {"field": "start", "type": "genomic", "axis": "top"},
              "xe": {"field": "end", "type": "genomic"}
            },
            {
              "dataTransform": [
                {"type": "filter", "field": "type", "oneOf": ["gene"]}
              ],
              "mark": "rect",
              "x": {"field": "start", "type": "genomic", "axis": "top"},
              "size": {"value": 15},
              "xe": {"field": "end", "type": "genomic"}
            },
            {
              "dataTransform": [
                {"type": "filter", "field": "type", "oneOf": ["gene"]},
                {"type": "filter", "field": "strand", "oneOf": ["-"]}
              ],
              "mark": "rule",
              "x": {"field": "start", "type": "genomic", "axis": "top"},
              "strokeWidth": {"value": 0},
              "xe": {"field": "end", "type": "genomic"},
              "color": {"value": "white"},
              "opacity": {"value": 0.6},
              "style": {"linePattern": {"type": "triangleLeft", "size": 10}}
            },
            {
              "dataTransform": [
                {"type": "filter", "field": "type", "oneOf": ["gene"]},
                {"type": "filter", "field": "strand", "oneOf": ["+"]}
              ],
              "mark": "rule",
              "x": {"field": "start", "type": "genomic", "axis": "top"},
              "strokeWidth": {"value": 0},
              "xe": {"field": "end", "type": "genomic"},
              "color": {"value": "white"},
              "opacity": {"value": 0.6},
              "style": {"linePattern": {"type": "triangleRight", "size": 10}}
            }
          ],
          "row": {"field": "strand", "type": "nominal", "domain": ["+", "-"]},
          "color": {"value": "#0900B1"},
          "visibility": [
            {
              "operation": "less-than",
              "measure": "width",
              "threshold": "|xe-x|",
              "transitionPadding": 10,
              "target": "mark"
            }
          ],
          "width": 350,
          "height": 100
        }
      ]
    },
    {
      "arrangement": "vertical",
      "views": [
        {
          "alignment": "overlay",
          "title": "Cyverse-QUBES",
          "data": {
            "url": "https://server.gosling-lang.org/api/v1/tileset_info/?d=gene-annotation",
            "type": "beddb",
            "genomicFields": [
              {"index": 1, "name": "start"},
              {"index": 2, "name": "end"}
            ],
            "valueFields": [
              {"index": 5, "name": "strand", "type": "nominal"},
              {"index": 3, "name": "name", "type": "nominal"}
            ],
            "exonIntervalFields": [
              {"index": 12, "name": "start"},
              {"index": 13, "name": "end"}
            ]
          },
          "tracks": [
            {
              "dataTransform": [
                {"type": "filter", "field": "type", "oneOf": ["gene"]}
              ],
              "mark": "text",
              "text": {"field": "name", "type": "nominal"},
              "x": {"field": "start", "type": "genomic"},
              "xe": {"field": "end", "type": "genomic"},
              "color": {"value": "black"}
            },
            {
              "dataTransform": [
                {"type": "filter", "field": "type", "oneOf": ["gene"]},
                {"type": "filter", "field": "strand", "oneOf": ["+"]}
              ],
              "mark": "triangleRight",
              "x": {"field": "end", "type": "genomic", "axis": "top"},
              "color": {"value": "#999999"}
            },
            {
              "dataTransform": [
                {"type": "filter", "field": "type", "oneOf": ["gene"]},
                {"type": "filter", "field": "strand", "oneOf": ["-"]}
              ],
              "mark": "triangleLeft",
              "x": {"field": "start", "type": "genomic", "axis": "top"},
              "color": {"value": "#999999"},
              "style": {"align": "right"}
            },
            {
              "dataTransform": [
                {"type": "filter", "field": "type", "oneOf": ["gene"]}
              ],
              "mark": "rect",
              "x": {"field": "start", "type": "genomic", "axis": "top"},
              "xe": {"field": "end", "type": "genomic"},
              "color": {"value": "lightgray"}
            },
            {
              "dataTransform": [
                {"type": "filter", "field": "type", "oneOf": ["gene"]}
              ],
              "mark": "rule",
              "x": {"field": "start", "type": "genomic", "axis": "top"},
              "strokeWidth": {"value": 5},
              "xe": {"field": "end", "type": "genomic"},
              "color": {"value": "gray"}
            },
            {
              "dataTransform": [
                {"type": "filter", "field": "type", "oneOf": ["exon"]}
              ],
              "mark": "rect",
              "x": {"field": "start", "type": "genomic", "axis": "top"},
              "xe": {"field": "end", "type": "genomic"},
              "color": {"value": "#E2A6F5"},
              "stroke": {"value": "#BB57C9"},
              "strokeWidth": {"value": 1}
            }
          ],
          "row": {"field": "strand", "type": "nominal", "domain": ["+", "-"]},
          "visibility": [
            {
              "operation": "less-than",
              "measure": "width",
              "threshold": "|xe-x|",
              "transitionPadding": 10,
              "target": "mark"
            }
          ],
          "size": {"value": 15},
          "width": 350,
          "height": 100
        },
        {
          "alignment": "overlay",
          "title": "GmGDV",
          "data": {
            "url": "https://server.gosling-lang.org/api/v1/tileset_info/?d=gene-annotation",
            "type": "beddb",
            "genomicFields": [
              {"index": 1, "name": "start"},
              {"index": 2, "name": "end"}
            ],
            "valueFields": [
              {"index": 5, "name": "strand", "type": "nominal"},
              {"index": 3, "name": "name", "type": "nominal"}
            ],
            "exonIntervalFields": [
              {"index": 12, "name": "start"},
              {"index": 13, "name": "end"}
            ]
          },
          "tracks": [
            {
              "dataTransform": [
                {"type": "filter", "field": "type", "oneOf": ["gene"]}
              ],
              "mark": "text",
              "text": {"field": "name", "type": "nominal"},
              "x": {"field": "start", "type": "genomic", "axis": "top"},
              "xe": {"field": "end", "type": "genomic"},
              "style": {"dy": -14}
            },
            {
              "dataTransform": [
                {"type": "filter", "field": "type", "oneOf": ["gene"]},
                {"type": "filter", "field": "strand", "oneOf": ["+"]}
              ],
              "mark": "triangleRight",
              "x": {"field": "end", "type": "genomic", "axis": "top"},
              "size": {"value": 15}
            },
            {
              "dataTransform": [
                {"type": "filter", "field": "type", "oneOf": ["gene"]},
                {"type": "filter", "field": "strand", "oneOf": ["-"]}
              ],
              "mark": "triangleLeft",
              "x": {"field": "start", "type": "genomic", "axis": "top"},
              "size": {"value": 15},
              "style": {"align": "right"}
            },
            {
              "dataTransform": [
                {"type": "filter", "field": "type", "oneOf": ["exon"]}
              ],
              "mark": "rect",
              "x": {"field": "start", "type": "genomic", "axis": "top"},
              "size": {"value": 10},
              "xe": {"field": "end", "type": "genomic"}
            },
            {
              "dataTransform": [
                {"type": "filter", "field": "type", "oneOf": ["gene"]}
              ],
              "mark": "rule",
              "x": {"field": "start", "type": "genomic", "axis": "top"},
              "strokeWidth": {"value": 3},
              "xe": {"field": "end", "type": "genomic"}
            }
          ],
          "row": {"field": "strand", "type": "nominal", "domain": ["+", "-"]},
          "color": {
            "field": "strand",
            "type": "nominal",
            "domain": ["+", "-"],
            "range": ["blue", "red"]
          },
          "visibility": [
            {
              "operation": "less-than",
              "measure": "width",
              "threshold": "|xe-x|",
              "transitionPadding": 10,
              "target": "mark"
            }
          ],
          "width": 350,
          "height": 100
        },
        {
          "alignment": "overlay",
          "data": {
            "url": "https://server.gosling-lang.org/api/v1/tileset_info/?d=gene-annotation",
            "type": "beddb",
            "genomicFields": [
              {"index": 1, "name": "start"},
              {"index": 2, "name": "end"}
            ],
            "valueFields": [
              {"index": 5, "name": "strand", "type": "nominal"},
              {"index": 3, "name": "name", "type": "nominal"}
            ],
            "exonIntervalFields": [
              {"index": 12, "name": "start"},
              {"index": 13, "name": "end"}
            ]
          },
          "tracks": [
            {
              "dataTransform": [
                {"type": "filter", "field": "type", "oneOf": ["gene"]}
              ],
              "mark": "text",
              "text": {"field": "name", "type": "nominal"},
              "x": {"field": "start", "type": "genomic", "axis": "top"},
              "color": {"value": "black"},
              "xe": {"field": "end", "type": "genomic"}
            },
            {
              "dataTransform": [
                {"type": "filter", "field": "type", "oneOf": ["gene"]}
              ],
              "mark": "rect",
              "x": {"field": "start", "type": "genomic", "axis": "top"},
              "xe": {"field": "end", "type": "genomic"},
              "color": {"value": "#666666"}
            },
            {
              "dataTransform": [
                {"type": "filter", "field": "type", "oneOf": ["exon"]}
              ],
              "mark": "rect",
              "x": {"field": "start", "type": "genomic", "axis": "top"},
              "xe": {"field": "end", "type": "genomic"},
              "color": {"value": "#FF6666"}
            },
            {
              "dataTransform": [
                {"type": "filter", "field": "type", "oneOf": ["intron"]}
              ],
              "mark": "rect",
              "x": {"field": "start", "type": "genomic", "axis": "top"},
              "xe": {"field": "end", "type": "genomic"},
              "color": {"value": "#99FEFF"}
            }
          ],
          "size": {"value": 30},
          "row": {"field": "strand", "type": "nominal", "domain": ["+", "-"]},
          "stroke": {"value": "#777777"},
          "strokeWidth": {"value": 1},
          "visibility": [
            {
              "operation": "less-than",
              "measure": "width",
              "threshold": "|xe-x|",
              "transitionPadding": 10,
              "target": "mark"
            }
          ],
          "width": 350,
          "height": 100
        }
      ]
    }
  ]
}'

composite2 = '{
  "layout": "linear",
  "xDomain": {"chromosome": "3", "interval": [52168000, 52890000]},
  "arrangement": "horizontal",
  "views": [
    {
      "arrangement": "vertical",
      "views": [
        {
          "alignment": "overlay",
          "title": "HiGlass",
          "data": {
            "url": "https://server.gosling-lang.org/api/v1/tileset_info/?d=gene-annotation",
            "type": "beddb",
            "genomicFields": [
              {"index": 1, "name": "start"},
              {"index": 2, "name": "end"}
            ],
            "valueFields": [
              {"index": 5, "name": "strand", "type": "nominal"},
              {"index": 3, "name": "name", "type": "nominal"}
            ],
            "exonIntervalFields": [
              {"index": 12, "name": "start"},
              {"index": 13, "name": "end"}
            ]
          },
          "tracks": [
            {
              "dataTransform": [
                {"type": "filter", "field": "type", "oneOf": ["gene"]},
                {"type": "filter", "field": "strand", "oneOf": ["+"]}
              ],
              "mark": "triangleRight",
              "x": {"field": "end", "type": "genomic", "axis": "top"},
              "size": {"value": 15}
            },
            {
              "dataTransform": [
                {"type": "filter", "field": "type", "oneOf": ["gene"]}
              ],
              "mark": "text",
              "text": {"field": "name", "type": "nominal"},
              "x": {"field": "start", "type": "genomic"},
              "xe": {"field": "end", "type": "genomic"},
              "style": {"dy": -15}
            },
            {
              "dataTransform": [
                {"type": "filter", "field": "type", "oneOf": ["gene"]},
                {"type": "filter", "field": "strand", "oneOf": ["-"]}
              ],
              "mark": "triangleLeft",
              "x": {"field": "start", "type": "genomic"},
              "size": {"value": 15},
              "style": {"align": "right"}
            },
            {
              "dataTransform": [
                {"type": "filter", "field": "type", "oneOf": ["exon"]}
              ],
              "mark": "rect",
              "x": {"field": "start", "type": "genomic"},
              "size": {"value": 15},
              "xe": {"field": "end", "type": "genomic"}
            },
            {
              "dataTransform": [
                {"type": "filter", "field": "type", "oneOf": ["gene"]},
                {"type": "filter", "field": "strand", "oneOf": ["+"]}
              ],
              "mark": "rule",
              "x": {"field": "start", "type": "genomic"},
              "strokeWidth": {"value": 3},
              "xe": {"field": "end", "type": "genomic"},
              "style": {"linePattern": {"type": "triangleRight", "size": 5}}
            },
            {
              "dataTransform": [
                {"type": "filter", "field": "type", "oneOf": ["gene"]},
                {"type": "filter", "field": "strand", "oneOf": ["-"]}
              ],
              "mark": "rule",
              "x": {"field": "start", "type": "genomic"},
              "strokeWidth": {"value": 3},
              "xe": {"field": "end", "type": "genomic"},
              "style": {"linePattern": {"type": "triangleLeft", "size": 5}}
            }
          ],
          "row": {"field": "strand", "type": "nominal", "domain": ["+", "-"]},
          "color": {
            "field": "strand",
            "type": "nominal",
            "domain": ["+", "-"],
            "range": ["#7585FF", "#FF8A85"]
          },
          "visibility": [
            {
              "operation": "less-than",
              "measure": "width",
              "threshold": "|xe-x|",
              "transitionPadding": 10,
              "target": "mark"
            }
          ],
          "opacity": {"value": 0.8},
          "width": 350,
          "height": 100
        },
        {
          "alignment": "overlay",
          "title": "Corces et al.",
          "data": {
            "url": "https://server.gosling-lang.org/api/v1/tileset_info/?d=gene-annotation",
            "type": "beddb",
            "genomicFields": [
              {"index": 1, "name": "start"},
              {"index": 2, "name": "end"}
            ],
            "valueFields": [
              {"index": 5, "name": "strand", "type": "nominal"},
              {"index": 3, "name": "name", "type": "nominal"}
            ],
            "exonIntervalFields": [
              {"index": 12, "name": "start"},
              {"index": 13, "name": "end"}
            ]
          },
          "tracks": [
            {
              "dataTransform": [
                {"type": "filter", "field": "type", "oneOf": ["gene"]},
                {"type": "filter", "field": "strand", "oneOf": ["+"]}
              ],
              "mark": "text",
              "text": {"field": "name", "type": "nominal"},
              "x": {"field": "start", "type": "genomic"},
              "xe": {"field": "end", "type": "genomic"},
              "size": {"value": 8},
              "style": {"textFontSize": 8, "dy": -12}
            },
            {
              "dataTransform": [
                {"type": "filter", "field": "type", "oneOf": ["gene"]},
                {"type": "filter", "field": "strand", "oneOf": ["-"]}
              ],
              "mark": "text",
              "text": {"field": "name", "type": "nominal"},
              "x": {"field": "start", "type": "genomic"},
              "xe": {"field": "end", "type": "genomic"},
              "size": {"value": 8},
              "style": {"textFontSize": 8, "dy": 10}
            },
            {
              "dataTransform": [
                {"type": "filter", "field": "type", "oneOf": ["gene"]},
                {"type": "filter", "field": "strand", "oneOf": ["+"]}
              ],
              "mark": "rect",
              "x": {"field": "end", "type": "genomic"},
              "size": {"value": 7}
            },
            {
              "dataTransform": [
                {"type": "filter", "field": "type", "oneOf": ["gene"]},
                {"type": "filter", "field": "strand", "oneOf": ["-"]}
              ],
              "mark": "rect",
              "x": {"field": "start", "type": "genomic"},
              "size": {"value": 7}
            },
            {
              "dataTransform": [
                {"type": "filter", "field": "type", "oneOf": ["exon"]}
              ],
              "mark": "rect",
              "x": {"field": "start", "type": "genomic"},
              "xe": {"field": "end", "type": "genomic"},
              "size": {"value": 14}
            },
            {
              "dataTransform": [
                {"type": "filter", "field": "type", "oneOf": ["gene"]}
              ],
              "mark": "rule",
              "x": {"field": "start", "type": "genomic"},
              "xe": {"field": "end", "type": "genomic"},
              "strokeWidth": {"value": 3}
            }
          ],
          "row": {"field": "strand", "type": "nominal", "domain": ["+", "-"]},
          "color": {
            "field": "strand",
            "type": "nominal",
            "domain": ["+", "-"],
            "range": ["#012DB8", "#BE1E2C"]
          },
          "visibility": [
            {
              "operation": "less-than",
              "measure": "width",
              "threshold": "|xe-x|",
              "transitionPadding": 10,
              "target": "mark"
            }
          ],
          "width": 350,
          "height": 100
        },
        {
          "alignment": "overlay",
          "title": "IGV",
          "data": {
            "url": "https://server.gosling-lang.org/api/v1/tileset_info/?d=gene-annotation",
            "type": "beddb",
            "genomicFields": [
              {"index": 1, "name": "start"},
              {"index": 2, "name": "end"}
            ],
            "valueFields": [
              {"index": 5, "name": "strand", "type": "nominal"},
              {"index": 3, "name": "name", "type": "nominal"}
            ],
            "exonIntervalFields": [
              {"index": 12, "name": "start"},
              {"index": 13, "name": "end"}
            ]
          },
          "tracks": [
            {
              "dataTransform": [
                {"type": "filter", "field": "type", "oneOf": ["gene"]}
              ],
              "mark": "text",
              "text": {"field": "name", "type": "nominal"},
              "x": {"field": "start", "type": "genomic", "axis": "top"},
              "xe": {"field": "end", "type": "genomic"}
            },
            {
              "dataTransform": [
                {"type": "filter", "field": "type", "oneOf": ["gene"]}
              ],
              "mark": "rect",
              "x": {"field": "start", "type": "genomic", "axis": "top"},
              "size": {"value": 15},
              "xe": {"field": "end", "type": "genomic"}
            },
            {
              "dataTransform": [
                {"type": "filter", "field": "type", "oneOf": ["gene"]},
                {"type": "filter", "field": "strand", "oneOf": ["-"]}
              ],
              "mark": "rule",
              "x": {"field": "start", "type": "genomic", "axis": "top"},
              "strokeWidth": {"value": 0},
              "xe": {"field": "end", "type": "genomic"},
              "color": {"value": "white"},
              "opacity": {"value": 0.6},
              "style": {"linePattern": {"type": "triangleLeft", "size": 10}}
            },
            {
              "dataTransform": [
                {"type": "filter", "field": "type", "oneOf": ["gene"]},
                {"type": "filter", "field": "strand", "oneOf": ["+"]}
              ],
              "mark": "rule",
              "x": {"field": "start", "type": "genomic", "axis": "top"},
              "strokeWidth": {"value": 0},
              "xe": {"field": "end", "type": "genomic"},
              "color": {"value": "white"},
              "opacity": {"value": 0.6},
              "style": {"linePattern": {"type": "triangleRight", "size": 10}}
            }
          ],
          "row": {"field": "strand", "type": "nominal", "domain": ["+", "-"]},
          "color": {"value": "#0900B1"},
          "visibility": [
            {
              "operation": "less-than",
              "measure": "width",
              "threshold": "|xe-x|",
              "transitionPadding": 10,
              "target": "mark"
            }
          ],
          "width": 350,
          "height": 100
        }
      ]
    },
    {
      "arrangement": "vertical",
      "views": [
        {
          "alignment": "overlay",
          "title": "Cyverse-QUBES",
          "data": {
            "url": "https://server.gosling-lang.org/api/v1/tileset_info/?d=gene-annotation",
            "type": "beddb",
            "genomicFields": [
              {"index": 1, "name": "start"},
              {"index": 2, "name": "end"}
            ],
            "valueFields": [
              {"index": 5, "name": "strand", "type": "nominal"},
              {"index": 3, "name": "name", "type": "nominal"}
            ],
            "exonIntervalFields": [
              {"index": 12, "name": "start"},
              {"index": 13, "name": "end"}
            ]
          },
          "tracks": [
            {
              "dataTransform": [
                {"type": "filter", "field": "type", "oneOf": ["gene"]}
              ],
              "mark": "text",
              "text": {"field": "name", "type": "nominal"},
              "x": {"field": "start", "type": "genomic"},
              "xe": {"field": "end", "type": "genomic"},
              "color": {"value": "black"}
            },
            {
              "dataTransform": [
                {"type": "filter", "field": "type", "oneOf": ["gene"]},
                {"type": "filter", "field": "strand", "oneOf": ["+"]}
              ],
              "mark": "triangleRight",
              "x": {"field": "end", "type": "genomic", "axis": "top"},
              "color": {"value": "#999999"}
            },
            {
              "dataTransform": [
                {"type": "filter", "field": "type", "oneOf": ["gene"]},
                {"type": "filter", "field": "strand", "oneOf": ["-"]}
              ],
              "mark": "triangleLeft",
              "x": {"field": "start", "type": "genomic", "axis": "top"},
              "color": {"value": "#999999"},
              "style": {"align": "right"}
            },
            {
              "dataTransform": [
                {"type": "filter", "field": "type", "oneOf": ["gene"]}
              ],
              "mark": "rect",
              "x": {"field": "start", "type": "genomic", "axis": "top"},
              "xe": {"field": "end", "type": "genomic"},
              "color": {"value": "lightgray"}
            },
            {
              "dataTransform": [
                {"type": "filter", "field": "type", "oneOf": ["gene"]}
              ],
              "mark": "rule",
              "x": {"field": "start", "type": "genomic", "axis": "top"},
              "strokeWidth": {"value": 5},
              "xe": {"field": "end", "type": "genomic"},
              "color": {"value": "gray"}
            },
            {
              "dataTransform": [
                {"type": "filter", "field": "type", "oneOf": ["exon"]}
              ],
              "mark": "rect",
              "x": {"field": "start", "type": "genomic", "axis": "top"},
              "xe": {"field": "end", "type": "genomic"},
              "color": {"value": "#E2A6F5"},
              "stroke": {"value": "#BB57C9"},
              "strokeWidth": {"value": 1}
            }
          ],
          "row": {"field": "strand", "type": "nominal", "domain": ["+", "-"]},
          "visibility": [
            {
              "operation": "less-than",
              "measure": "width",
              "threshold": "|xe-x|",
              "transitionPadding": 10,
              "target": "mark"
            }
          ],
          "size": {"value": 15},
          "width": 350,
          "height": 100
        },
        {
          "alignment": "overlay",
          "title": "GmGDV",
          "data": {
            "url": "https://server.gosling-lang.org/api/v1/tileset_info/?d=gene-annotation",
            "type": "beddb",
            "genomicFields": [
              {"index": 1, "name": "start"},
              {"index": 2, "name": "end"}
            ],
            "valueFields": [
              {"index": 5, "name": "strand", "type": "nominal"},
              {"index": 3, "name": "name", "type": "nominal"}
            ],
            "exonIntervalFields": [
              {"index": 12, "name": "start"},
              {"index": 13, "name": "end"}
            ]
          },
          "tracks": [
            {
              "dataTransform": [
                {"type": "filter", "field": "type", "oneOf": ["gene"]}
              ],
              "mark": "text",
              "text": {"field": "name", "type": "nominal"},
              "x": {"field": "start", "type": "genomic", "axis": "top"},
              "xe": {"field": "end", "type": "genomic"},
              "style": {"dy": -14}
            },
            {
              "dataTransform": [
                {"type": "filter", "field": "type", "oneOf": ["gene"]},
                {"type": "filter", "field": "strand", "oneOf": ["+"]}
              ],
              "mark": "triangleRight",
              "x": {"field": "end", "type": "genomic", "axis": "top"},
              "size": {"value": 15}
            },
            {
              "dataTransform": [
                {"type": "filter", "field": "type", "oneOf": ["gene"]},
                {"type": "filter", "field": "strand", "oneOf": ["-"]}
              ],
              "mark": "triangleLeft",
              "x": {"field": "start", "type": "genomic", "axis": "top"},
              "size": {"value": 15},
              "style": {"align": "right"}
            },
            {
              "dataTransform": [
                {"type": "filter", "field": "type", "oneOf": ["exon"]}
              ],
              "mark": "rect",
              "x": {"field": "start", "type": "genomic", "axis": "top"},
              "size": {"value": 10},
              "xe": {"field": "end", "type": "genomic"}
            },
            {
              "dataTransform": [
                {"type": "filter", "field": "type", "oneOf": ["gene"]}
              ],
              "mark": "rule",
              "x": {"field": "start", "type": "genomic", "axis": "top"},
              "strokeWidth": {"value": 3},
              "xe": {"field": "end", "type": "genomic"}
            }
          ],
          "row": {"field": "strand", "type": "nominal", "domain": ["+", "-"]},
          "color": {
            "field": "strand",
            "type": "nominal",
            "domain": ["+", "-"],
            "range": ["blue", "red"]
          },
          "visibility": [
            {
              "operation": "less-than",
              "measure": "width",
              "threshold": "|xe-x|",
              "transitionPadding": 10,
              "target": "mark"
            }
          ],
          "width": 350,
          "height": 100
        },
        {
          "alignment": "overlay",
          "data": {
            "url": "https://server.gosling-lang.org/api/v1/tileset_info/?d=gene-annotation",
            "type": "beddb",
            "genomicFields": [
              {"index": 1, "name": "start"},
              {"index": 2, "name": "end"}
            ],
            "valueFields": [
              {"index": 5, "name": "strand", "type": "nominal"},
              {"index": 3, "name": "name", "type": "nominal"}
            ],
            "exonIntervalFields": [
              {"index": 12, "name": "start"},
              {"index": 13, "name": "end"}
            ]
          },
          "tracks": [
            {
              "dataTransform": [
                {"type": "filter", "field": "type", "oneOf": ["gene"]}
              ],
              "mark": "text",
              "text": {"field": "name", "type": "nominal"},
              "x": {"field": "start", "type": "genomic", "axis": "top"},
              "color": {"value": "black"},
              "xe": {"field": "end", "type": "genomic"}
            },
            {
              "dataTransform": [
                {"type": "filter", "field": "type", "oneOf": ["gene"]}
              ],
              "mark": "rect",
              "x": {"field": "start", "type": "genomic", "axis": "top"},
              "xe": {"field": "end", "type": "genomic"},
              "color": {"value": "#666666"}
            },
            {
              "dataTransform": [
                {"type": "filter", "field": "type", "oneOf": ["exon"]}
              ],
              "mark": "rect",
              "x": {"field": "start", "type": "genomic", "axis": "top"},
              "xe": {"field": "end", "type": "genomic"},
              "color": {"value": "#FF6666"}
            },
            {
              "dataTransform": [
                {"type": "filter", "field": "type", "oneOf": ["intron"]}
              ],
              "mark": "rect",
              "x": {"field": "start", "type": "genomic", "axis": "top"},
              "xe": {"field": "end", "type": "genomic"},
              "color": {"value": "#99FEFF"}
            }
          ],
          "size": {"value": 30},
          "row": {"field": "strand", "type": "nominal", "domain": ["+", "-"]},
          "stroke": {"value": "#777777"},
          "strokeWidth": {"value": 1},
          "visibility": [
            {
              "operation": "less-than",
              "measure": "width",
              "threshold": "|xe-x|",
              "transitionPadding": 10,
              "target": "mark"
            }
          ],
          "width": 350,
          "height": 100
        }
      ]
    }
  ]
}'

composite3 = '{
  "title": "Mark Displacement",
  "subtitle": "Reposition marks to address visual overlaps using displacement options",
  "spacing": 1,
  "centerRadius": 0.8,
  "xDomain": {"chromosome": "17", "interval": [43080000, 43120000]},
  "views": [
    {
      "alignment": "overlay",
      "xDomain": {"chromosome": "3", "interval": [142500000, 143000000]},
      "data": {
        "url": "https://server.gosling-lang.org/api/v1/tileset_info/?d=transcript-hg38-beddb",
        "type": "beddb",
        "genomicFields": [
          {"index": 1, "name": "start"},
          {"index": 2, "name": "end"}
        ],
        "valueFields": [
          {"index": 0, "name": "chr", "type": "nominal"},
          {"index": 5, "name": "strand", "type": "nominal"},
          {"index": 3, "name": "name", "type": "nominal"},
          {"index": 9, "name": "exon_start", "type": "nominal"},
          {"index": 10, "name": "exon_end", "type": "nominal"}
        ]
      },
      "dataTransform": [
        {"type": "filter", "field": "type", "oneOf": ["gene"]},
        {
          "type": "displace",
          "method": "pile",
          "boundingBox": {"startField": "start", "endField": "end"},
          "newField": "row",
          "maxRows": 15
        }
      ],
      "title": "hg38 | Transcript (Max. 15 Rows)",
      "tracks": [
        {
          "dataTransform": [
            {
              "type": "displace",
              "method": "pile",
              "boundingBox": {"startField": "start", "endField": "end"},
              "newField": "row",
              "maxRows": 15
            },
            {"type": "filter", "field": "type", "oneOf": ["gene"]},
            {"type": "filter", "field": "strand", "oneOf": ["+"]}
          ],
          "mark": "triangleRight",
          "x": {"field": "end", "type": "genomic", "axis": "top"},
          "size": {"value": 15}
        },
        {
          "dataTransform": [
            {
              "type": "displace",
              "method": "pile",
              "boundingBox": {"startField": "start", "endField": "end"},
              "newField": "row",
              "maxRows": 15
            },
            {"type": "filter", "field": "type", "oneOf": ["gene"]}
          ],
          "mark": "text",
          "text": {"field": "name", "type": "nominal"},
          "x": {"field": "start", "type": "genomic"},
          "xe": {"field": "end", "type": "genomic"},
          "style": {"dy": -10}
        },
        {
          "dataTransform": [
            {
              "type": "displace",
              "method": "pile",
              "boundingBox": {"startField": "start", "endField": "end"},
              "newField": "row",
              "maxRows": 15
            },
            {"type": "filter", "field": "type", "oneOf": ["gene"]},
            {"type": "filter", "field": "strand", "oneOf": ["-"]}
          ],
          "mark": "triangleLeft",
          "x": {"field": "start", "type": "genomic"},
          "size": {"value": 15},
          "style": {"align": "right"}
        },
        {
          "dataTransform": [
            {
              "type": "displace",
              "method": "pile",
              "boundingBox": {"startField": "start", "endField": "end"},
              "newField": "row",
              "maxRows": 15
            },
            {
              "type": "exonSplit",
              "separator": ",",
              "flag": {"field": "type", "value": "exon"},
              "fields": [
                {
                  "field": "exon_start",
                  "type": "genomic",
                  "newField": "start",
                  "chrField": "chr"
                },
                {
                  "field": "exon_end",
                  "type": "genomic",
                  "newField": "end",
                  "chrField": "chr"
                }
              ]
            },
            {"type": "filter", "field": "type", "oneOf": ["exon"]}
          ],
          "mark": "rect",
          "size": {"value": 10},
          "x": {"field": "start", "type": "genomic"},
          "xe": {"field": "end", "type": "genomic"}
        },
        {
          "dataTransform": [
            {
              "type": "displace",
              "method": "pile",
              "boundingBox": {"startField": "start", "endField": "end"},
              "newField": "row",
              "maxRows": 15
            },
            {"type": "filter", "field": "type", "oneOf": ["gene"]},
            {"type": "filter", "field": "strand", "oneOf": ["+"]}
          ],
          "mark": "rule",
          "x": {"field": "start", "type": "genomic"},
          "strokeWidth": {"value": 3},
          "xe": {"field": "end", "type": "genomic"},
          "style": {"linePattern": {"type": "triangleRight", "size": 5}}
        },
        {
          "dataTransform": [
            {
              "type": "displace",
              "method": "pile",
              "boundingBox": {"startField": "start", "endField": "end"},
              "newField": "row",
              "maxRows": 15
            },
            {"type": "filter", "field": "type", "oneOf": ["gene"]},
            {"type": "filter", "field": "strand", "oneOf": ["-"]}
          ],
          "mark": "rule",
          "x": {"field": "start", "type": "genomic"},
          "strokeWidth": {"value": 3},
          "xe": {"field": "end", "type": "genomic"},
          "style": {"linePattern": {"type": "triangleRight", "size": 5}}
        }
      ],
      "row": {"field": "row", "type": "nominal"},
      "color": {
        "field": "strand",
        "type": "nominal",
        "domain": ["+", "-"],
        "range": ["#0072B2", "#D45E00"]
      },
      "visibility": [
        {
          "operation": "less-than",
          "measure": "width",
          "threshold": "|xe-x|",
          "transitionPadding": 10,
          "target": "mark"
        }
      ],
      "opacity": {"value": 0.8},
      "style": {"outline": "black"},
      "width": 700,
      "height": 500
    },
    {
      "xDomain": {"chromosome": "2", "interval": [126800000, 127700000]},
      "tracks": [
        {
          "alignment": "overlay",
          "title": "Likely Benign",
          "data": {
            "url": "https://server.gosling-lang.org/api/v1/tileset_info/?d=clinvar-beddb",
            "type": "beddb",
            "genomicFields": [
              {"index": 1, "name": "start"},
              {"index": 2, "name": "end"}
            ],
            "valueFields": [
              {"index": 7, "name": "significance", "type": "nominal"},
              {"type": "nominal", "index": 3, "name": "3"},
              {"type": "nominal", "index": 4, "name": "4"}
            ]
          },
          "dataTransform": [
            {
              "type": "filter",
              "field": "significance",
              "oneOf": ["Likely_benign"]
            },
            {
              "type": "displace",
              "boundingBox": {
                "startField": "start",
                "endField": "end",
                "padding": 5
              },
              "method": "spread",
              "newField": "a"
            }
          ],
          "tracks": [
            {
              "mark": "point",
              "size": {"value": 4},
              "color": {"value": "#029F73"},
              "stroke": {"value": "black"},
              "strokeWidth": {"value": 1}
            },
            {
              "mark": "text",
              "color": {
                "field": "3",
                "type": "nominal",
                "domain": ["A", "T", "G", "C"],
                "legend": true
              },
              "text": {"field": "3", "type": "nominal"},
              "y": {"value": 48}
            },
            {
              "mark": "text",
              "color": {
                "field": "4",
                "type": "nominal",
                "domain": ["A", "T", "G", "C"]
              },
              "text": {"field": "4", "type": "nominal"},
              "y": {"value": 18}
            },
            {
              "mark": "text",
              "color": {"value": "gray"},
              "text": {"value": "↓"},
              "y": {"value": 33}
            }
          ],
          "x": {"field": "aStart", "type": "genomic"},
          "xe": {"field": "aEnd", "type": "genomic"},
          "y": {"value": 5},
          "opacity": {"value": 0.8},
          "style": {"inlineLegend": true},
          "width": 700,
          "height": 60
        },
        {
          "data": {
            "url": "https://server.gosling-lang.org/api/v1/tileset_info/?d=clinvar-beddb",
            "type": "beddb",
            "genomicFields": [
              {"index": 1, "name": "start"},
              {"index": 2, "name": "end"}
            ],
            "valueFields": [
              {"index": 7, "name": "significance", "type": "nominal"}
            ]
          },
          "dataTransform": [
            {
              "type": "filter",
              "field": "significance",
              "oneOf": ["Likely_benign"]
            },
            {
              "type": "displace",
              "boundingBox": {
                "startField": "start",
                "endField": "end",
                "padding": 5
              },
              "method": "spread",
              "newField": "a"
            }
          ],
          "mark": "betweenLink",
          "xe": {"field": "start", "type": "genomic"},
          "x": {"field": "aStart", "type": "genomic"},
          "color": {"value": "#029F73"},
          "stroke": {"value": "lightgrey"},
          "strokeWidth": {"value": 0.5},
          "opacity": {"value": 0.8},
          "width": 700,
          "height": 60
        },
        {
          "alignment": "overlay",
          "tracks": [
            {
              "data": {
                "url": "https://server.gosling-lang.org/api/v1/tileset_info/?d=clinvar-beddb",
                "type": "beddb",
                "genomicFields": [
                  {"index": 1, "name": "start"},
                  {"index": 2, "name": "end"}
                ],
                "valueFields": [
                  {"index": 7, "name": "significance", "type": "nominal"}
                ]
              },
              "dataTransform": [
                {
                  "type": "filter",
                  "field": "significance",
                  "oneOf": ["Likely_benign"]
                }
              ],
              "mark": "rect",
              "color": {"value": "lightgray"},
              "stroke": {"value": "lightgray"},
              "strokeWidth": {"value": 0.5},
              "x": {"field": "start", "type": "genomic"},
              "xe": {"field": "end", "type": "genomic"},
              "opacity": {"value": 0.8}
            },
            {
              "data": {
                "url": "https://server.gosling-lang.org/api/v1/tileset_info/?d=gene-annotation",
                "type": "beddb",
                "genomicFields": [
                  {"index": 1, "name": "start"},
                  {"index": 2, "name": "end"}
                ],
                "valueFields": [
                  {"index": 5, "name": "strand", "type": "nominal"},
                  {"index": 3, "name": "name", "type": "nominal"}
                ],
                "exonIntervalFields": [
                  {"index": 12, "name": "start"},
                  {"index": 13, "name": "end"}
                ]
              },
              "row": {
                "field": "strand",
                "type": "nominal",
                "domain": ["+", "-"]
              },
              "color": {
                "field": "strand",
                "type": "nominal",
                "domain": ["+", "-"],
                "range": ["#7585FF", "#FF8A85"]
              },
              "visibility": [
                {
                  "operation": "less-than",
                  "measure": "width",
                  "threshold": "|xe-x|",
                  "transitionPadding": 10,
                  "target": "mark"
                }
              ],
              "opacity": {"value": 0.8},
              "dataTransform": [
                {"type": "filter", "field": "type", "oneOf": ["gene"]},
                {"type": "filter", "field": "strand", "oneOf": ["+"]}
              ],
              "mark": "triangleRight",
              "x": {"field": "end", "type": "genomic", "axis": "none"},
              "size": {"value": 15}
            },
            {
              "data": {
                "url": "https://server.gosling-lang.org/api/v1/tileset_info/?d=gene-annotation",
                "type": "beddb",
                "genomicFields": [
                  {"index": 1, "name": "start"},
                  {"index": 2, "name": "end"}
                ],
                "valueFields": [
                  {"index": 5, "name": "strand", "type": "nominal"},
                  {"index": 3, "name": "name", "type": "nominal"}
                ],
                "exonIntervalFields": [
                  {"index": 12, "name": "start"},
                  {"index": 13, "name": "end"}
                ]
              },
              "row": {
                "field": "strand",
                "type": "nominal",
                "domain": ["+", "-"]
              },
              "color": {
                "field": "strand",
                "type": "nominal",
                "domain": ["+", "-"],
                "range": ["#7585FF", "#FF8A85"]
              },
              "visibility": [
                {
                  "operation": "less-than",
                  "measure": "width",
                  "threshold": "|xe-x|",
                  "transitionPadding": 10,
                  "target": "mark"
                }
              ],
              "opacity": {"value": 0.8},
              "dataTransform": [
                {"type": "filter", "field": "type", "oneOf": ["gene"]}
              ],
              "mark": "text",
              "text": {"field": "name", "type": "nominal"},
              "x": {"field": "start", "type": "genomic"},
              "xe": {"field": "end", "type": "genomic"},
              "style": {"dy": -15}
            },
            {
              "data": {
                "url": "https://server.gosling-lang.org/api/v1/tileset_info/?d=gene-annotation",
                "type": "beddb",
                "genomicFields": [
                  {"index": 1, "name": "start"},
                  {"index": 2, "name": "end"}
                ],
                "valueFields": [
                  {"index": 5, "name": "strand", "type": "nominal"},
                  {"index": 3, "name": "name", "type": "nominal"}
                ],
                "exonIntervalFields": [
                  {"index": 12, "name": "start"},
                  {"index": 13, "name": "end"}
                ]
              },
              "row": {
                "field": "strand",
                "type": "nominal",
                "domain": ["+", "-"]
              },
              "color": {
                "field": "strand",
                "type": "nominal",
                "domain": ["+", "-"],
                "range": ["#7585FF", "#FF8A85"]
              },
              "visibility": [
                {
                  "operation": "less-than",
                  "measure": "width",
                  "threshold": "|xe-x|",
                  "transitionPadding": 10,
                  "target": "mark"
                }
              ],
              "opacity": {"value": 0.8},
              "dataTransform": [
                {"type": "filter", "field": "type", "oneOf": ["gene"]},
                {"type": "filter", "field": "strand", "oneOf": ["-"]}
              ],
              "mark": "triangleLeft",
              "x": {"field": "start", "type": "genomic"},
              "size": {"value": 15},
              "style": {"align": "right"}
            },
            {
              "data": {
                "url": "https://server.gosling-lang.org/api/v1/tileset_info/?d=gene-annotation",
                "type": "beddb",
                "genomicFields": [
                  {"index": 1, "name": "start"},
                  {"index": 2, "name": "end"}
                ],
                "valueFields": [
                  {"index": 5, "name": "strand", "type": "nominal"},
                  {"index": 3, "name": "name", "type": "nominal"}
                ],
                "exonIntervalFields": [
                  {"index": 12, "name": "start"},
                  {"index": 13, "name": "end"}
                ]
              },
              "row": {
                "field": "strand",
                "type": "nominal",
                "domain": ["+", "-"]
              },
              "color": {
                "field": "strand",
                "type": "nominal",
                "domain": ["+", "-"],
                "range": ["#7585FF", "#FF8A85"]
              },
              "visibility": [
                {
                  "operation": "less-than",
                  "measure": "width",
                  "threshold": "|xe-x|",
                  "transitionPadding": 10,
                  "target": "mark"
                }
              ],
              "opacity": {"value": 0.8},
              "dataTransform": [
                {"type": "filter", "field": "type", "oneOf": ["exon"]}
              ],
              "mark": "rect",
              "x": {"field": "start", "type": "genomic"},
              "size": {"value": 15},
              "xe": {"field": "end", "type": "genomic"}
            },
            {
              "data": {
                "url": "https://server.gosling-lang.org/api/v1/tileset_info/?d=gene-annotation",
                "type": "beddb",
                "genomicFields": [
                  {"index": 1, "name": "start"},
                  {"index": 2, "name": "end"}
                ],
                "valueFields": [
                  {"index": 5, "name": "strand", "type": "nominal"},
                  {"index": 3, "name": "name", "type": "nominal"}
                ],
                "exonIntervalFields": [
                  {"index": 12, "name": "start"},
                  {"index": 13, "name": "end"}
                ]
              },
              "row": {
                "field": "strand",
                "type": "nominal",
                "domain": ["+", "-"]
              },
              "color": {
                "field": "strand",
                "type": "nominal",
                "domain": ["+", "-"],
                "range": ["#7585FF", "#FF8A85"]
              },
              "visibility": [
                {
                  "operation": "less-than",
                  "measure": "width",
                  "threshold": "|xe-x|",
                  "transitionPadding": 10,
                  "target": "mark"
                }
              ],
              "opacity": {"value": 0.8},
              "dataTransform": [
                {"type": "filter", "field": "type", "oneOf": ["gene"]},
                {"type": "filter", "field": "strand", "oneOf": ["+"]}
              ],
              "mark": "rule",
              "x": {"field": "start", "type": "genomic"},
              "strokeWidth": {"value": 3},
              "xe": {"field": "end", "type": "genomic"},
              "style": {"linePattern": {"type": "triangleRight", "size": 5}}
            },
            {
              "data": {
                "url": "https://server.gosling-lang.org/api/v1/tileset_info/?d=gene-annotation",
                "type": "beddb",
                "genomicFields": [
                  {"index": 1, "name": "start"},
                  {"index": 2, "name": "end"}
                ],
                "valueFields": [
                  {"index": 5, "name": "strand", "type": "nominal"},
                  {"index": 3, "name": "name", "type": "nominal"}
                ],
                "exonIntervalFields": [
                  {"index": 12, "name": "start"},
                  {"index": 13, "name": "end"}
                ]
              },
              "row": {
                "field": "strand",
                "type": "nominal",
                "domain": ["+", "-"]
              },
              "color": {
                "field": "strand",
                "type": "nominal",
                "domain": ["+", "-"],
                "range": ["#7585FF", "#FF8A85"]
              },
              "visibility": [
                {
                  "operation": "less-than",
                  "measure": "width",
                  "threshold": "|xe-x|",
                  "transitionPadding": 10,
                  "target": "mark"
                }
              ],
              "opacity": {"value": 0.8},
              "dataTransform": [
                {"type": "filter", "field": "type", "oneOf": ["gene"]},
                {"type": "filter", "field": "strand", "oneOf": ["-"]}
              ],
              "mark": "rule",
              "x": {"field": "start", "type": "genomic"},
              "strokeWidth": {"value": 3},
              "xe": {"field": "end", "type": "genomic"},
              "style": {"linePattern": {"type": "triangleLeft", "size": 5}}
            }
          ],
          "width": 700,
          "height": 100
        }
      ]
    },
    {
      "tracks": [
        {
          "data": {
            "url": "https://server.gosling-lang.org/api/v1/tileset_info/?d=clinvar-beddb",
            "type": "beddb",
            "genomicFields": [
              {"index": 1, "name": "start"},
              {"index": 2, "name": "end"}
            ],
            "valueFields": [
              {"index": 7, "name": "significance", "type": "nominal"}
            ]
          },
          "displacement": {"type": "pile", "padding": 3.5},
          "mark": "point",
          "x": {"field": "start", "type": "genomic"},
          "xe": {"field": "end", "type": "genomic"},
          "size": {"value": 3},
          "color": {
            "field": "significance",
            "type": "nominal",
            "domain": [
              "Pathogenic",
              "Pathogenic/Likely_pathogenic",
              "Likely_pathogenic",
              "Uncertain_significance",
              "Likely_benign",
              "Benign/Likely_benign",
              "Benign"
            ],
            "range": [
              "#CB3B8C",
              "#CB71A3",
              "#CB96B3",
              "gray",
              "#029F73",
              "#5A9F8C",
              "#5A9F8C"
            ],
            "legend": true
          },
          "width": 700,
          "height": 260
        }
      ]
    }
  ],
  "style": {"outlineWidth": 0}
}'

composite4 = '{
  "static": true,
  "layout": "linear",
  "centerRadius": 0.2,
  "arrangement": "parallel",
  "views": [
    {
      "xDomain": {"chromosome": "1"},
      "tracks": [
        {
          "data": {
            "url": "https://server.gosling-lang.org/api/v1/tileset_info/?d=cistrome-multivec",
            "type": "multivec",
            "row": "sample",
            "column": "position",
            "value": "peak",
            "categories": ["sample 1", "sample 2", "sample 3", "sample 4"]
          },
          "mark": "area",
          "x": {"field": "position", "type": "genomic"},
          "y": {"field": "peak", "type": "quantitative"},
          "color": {"field": "sample", "type": "nominal"},
          "width": 1000,
          "height": 30
        },
        {
          "alignment": "overlay",
          "data": {
            "url": "https://raw.githubusercontent.com/sehilyi/gemini-datasets/master/data/cytogenetic_band.csv",
            "type": "csv",
            "chromosomeField": "Chr.",
            "genomicFields": [
              "ISCN_start",
              "ISCN_stop",
              "Basepair_start",
              "Basepair_stop"
            ]
          },
          "tracks": [
            {
              "mark": "text",
              "dataTransform": [
                {
                  "type": "filter",
                  "field": "Stain",
                  "oneOf": ["acen-1", "acen-2"],
                  "not": true
                }
              ],
              "text": {"field": "Band", "type": "nominal"},
              "color": {"value": "black"},
              "visibility": [
                {
                  "operation": "less-than",
                  "measure": "width",
                  "threshold": "|xe-x|",
                  "transitionPadding": 10,
                  "target": "mark"
                }
              ]
            },
            {
              "mark": "rect",
              "dataTransform": [
                {
                  "type": "filter",
                  "field": "Stain",
                  "oneOf": ["acen-1", "acen-2"],
                  "not": true
                }
              ],
              "color": {
                "field": "Density",
                "type": "nominal",
                "domain": ["", "25", "50", "75", "100"],
                "range": ["white", "#D9D9D9", "#979797", "#636363", "black"]
              }
            },
            {
              "mark": "rect",
              "dataTransform": [
                {"type": "filter", "field": "Stain", "oneOf": ["gvar"]}
              ],
              "color": {"value": "#A0A0F2"}
            },
            {
              "mark": "triangleRight",
              "dataTransform": [
                {"type": "filter", "field": "Stain", "oneOf": ["acen-1"]}
              ],
              "color": {"value": "#B40101"}
            },
            {
              "mark": "triangleLeft",
              "dataTransform": [
                {"type": "filter", "field": "Stain", "oneOf": ["acen-2"]}
              ],
              "color": {"value": "#B40101"}
            }
          ],
          "x": {"field": "Basepair_start", "type": "genomic"},
          "xe": {"field": "Basepair_stop", "type": "genomic"},
          "stroke": {"value": "gray"},
          "strokeWidth": {"value": 0.5},
          "width": 1000,
          "height": 20
        }
      ]
    },
    {
      "xDomain": {"chromosome": "2"},
      "tracks": [
        {
          "data": {
            "url": "https://server.gosling-lang.org/api/v1/tileset_info/?d=cistrome-multivec",
            "type": "multivec",
            "row": "sample",
            "column": "position",
            "value": "peak",
            "categories": ["sample 1", "sample 2", "sample 3", "sample 4"]
          },
          "mark": "area",
          "x": {"field": "position", "type": "genomic"},
          "y": {"field": "peak", "type": "quantitative"},
          "color": {"field": "sample", "type": "nominal"},
          "width": 970,
          "height": 30
        },
        {
          "alignment": "overlay",
          "data": {
            "url": "https://raw.githubusercontent.com/sehilyi/gemini-datasets/master/data/cytogenetic_band.csv",
            "type": "csv",
            "chromosomeField": "Chr.",
            "genomicFields": [
              "ISCN_start",
              "ISCN_stop",
              "Basepair_start",
              "Basepair_stop"
            ]
          },
          "tracks": [
            {
              "mark": "text",
              "dataTransform": [
                {
                  "type": "filter",
                  "field": "Stain",
                  "oneOf": ["acen-1", "acen-2"],
                  "not": true
                }
              ],
              "text": {"field": "Band", "type": "nominal"},
              "color": {"value": "black"},
              "visibility": [
                {
                  "operation": "less-than",
                  "measure": "width",
                  "threshold": "|xe-x|",
                  "transitionPadding": 10,
                  "target": "mark"
                }
              ]
            },
            {
              "mark": "rect",
              "dataTransform": [
                {
                  "type": "filter",
                  "field": "Stain",
                  "oneOf": ["acen-1", "acen-2"],
                  "not": true
                }
              ],
              "color": {
                "field": "Density",
                "type": "nominal",
                "domain": ["", "25", "50", "75", "100"],
                "range": ["white", "#D9D9D9", "#979797", "#636363", "black"]
              }
            },
            {
              "mark": "rect",
              "dataTransform": [
                {"type": "filter", "field": "Stain", "oneOf": ["gvar"]}
              ],
              "color": {"value": "#A0A0F2"}
            },
            {
              "mark": "triangleRight",
              "dataTransform": [
                {"type": "filter", "field": "Stain", "oneOf": ["acen-1"]}
              ],
              "color": {"value": "#B40101"}
            },
            {
              "mark": "triangleLeft",
              "dataTransform": [
                {"type": "filter", "field": "Stain", "oneOf": ["acen-2"]}
              ],
              "color": {"value": "#B40101"}
            }
          ],
          "x": {"field": "Basepair_start", "type": "genomic"},
          "xe": {"field": "Basepair_stop", "type": "genomic"},
          "stroke": {"value": "gray"},
          "strokeWidth": {"value": 0.5},
          "width": 970,
          "height": 20
        }
      ]
    },
    {
      "xDomain": {"chromosome": "3"},
      "tracks": [
        {
          "data": {
            "url": "https://server.gosling-lang.org/api/v1/tileset_info/?d=cistrome-multivec",
            "type": "multivec",
            "row": "sample",
            "column": "position",
            "value": "peak",
            "categories": ["sample 1", "sample 2", "sample 3", "sample 4"]
          },
          "mark": "area",
          "x": {"field": "position", "type": "genomic"},
          "y": {"field": "peak", "type": "quantitative"},
          "color": {"field": "sample", "type": "nominal"},
          "width": 800,
          "height": 30
        },
        {
          "alignment": "overlay",
          "data": {
            "url": "https://raw.githubusercontent.com/sehilyi/gemini-datasets/master/data/cytogenetic_band.csv",
            "type": "csv",
            "chromosomeField": "Chr.",
            "genomicFields": [
              "ISCN_start",
              "ISCN_stop",
              "Basepair_start",
              "Basepair_stop"
            ]
          },
          "tracks": [
            {
              "mark": "text",
              "dataTransform": [
                {
                  "type": "filter",
                  "field": "Stain",
                  "oneOf": ["acen-1", "acen-2"],
                  "not": true
                }
              ],
              "text": {"field": "Band", "type": "nominal"},
              "color": {"value": "black"},
              "visibility": [
                {
                  "operation": "less-than",
                  "measure": "width",
                  "threshold": "|xe-x|",
                  "transitionPadding": 10,
                  "target": "mark"
                }
              ]
            },
            {
              "mark": "rect",
              "dataTransform": [
                {
                  "type": "filter",
                  "field": "Stain",
                  "oneOf": ["acen-1", "acen-2"],
                  "not": true
                }
              ],
              "color": {
                "field": "Density",
                "type": "nominal",
                "domain": ["", "25", "50", "75", "100"],
                "range": ["white", "#D9D9D9", "#979797", "#636363", "black"]
              }
            },
            {
              "mark": "rect",
              "dataTransform": [
                {"type": "filter", "field": "Stain", "oneOf": ["gvar"]}
              ],
              "color": {"value": "#A0A0F2"}
            },
            {
              "mark": "triangleRight",
              "dataTransform": [
                {"type": "filter", "field": "Stain", "oneOf": ["acen-1"]}
              ],
              "color": {"value": "#B40101"}
            },
            {
              "mark": "triangleLeft",
              "dataTransform": [
                {"type": "filter", "field": "Stain", "oneOf": ["acen-2"]}
              ],
              "color": {"value": "#B40101"}
            }
          ],
          "x": {"field": "Basepair_start", "type": "genomic"},
          "xe": {"field": "Basepair_stop", "type": "genomic"},
          "stroke": {"value": "gray"},
          "strokeWidth": {"value": 0.5},
          "width": 800,
          "height": 20
        }
      ]
    },
    {
      "xDomain": {"chromosome": "4"},
      "tracks": [
        {
          "data": {
            "url": "https://server.gosling-lang.org/api/v1/tileset_info/?d=cistrome-multivec",
            "type": "multivec",
            "row": "sample",
            "column": "position",
            "value": "peak",
            "categories": ["sample 1", "sample 2", "sample 3", "sample 4"]
          },
          "mark": "area",
          "x": {"field": "position", "type": "genomic"},
          "y": {"field": "peak", "type": "quantitative"},
          "color": {"field": "sample", "type": "nominal"},
          "width": 770,
          "height": 30
        },
        {
          "alignment": "overlay",
          "data": {
            "url": "https://raw.githubusercontent.com/sehilyi/gemini-datasets/master/data/cytogenetic_band.csv",
            "type": "csv",
            "chromosomeField": "Chr.",
            "genomicFields": [
              "ISCN_start",
              "ISCN_stop",
              "Basepair_start",
              "Basepair_stop"
            ]
          },
          "tracks": [
            {
              "mark": "text",
              "dataTransform": [
                {
                  "type": "filter",
                  "field": "Stain",
                  "oneOf": ["acen-1", "acen-2"],
                  "not": true
                }
              ],
              "text": {"field": "Band", "type": "nominal"},
              "color": {"value": "black"},
              "visibility": [
                {
                  "operation": "less-than",
                  "measure": "width",
                  "threshold": "|xe-x|",
                  "transitionPadding": 10,
                  "target": "mark"
                }
              ]
            },
            {
              "mark": "rect",
              "dataTransform": [
                {
                  "type": "filter",
                  "field": "Stain",
                  "oneOf": ["acen-1", "acen-2"],
                  "not": true
                }
              ],
              "color": {
                "field": "Density",
                "type": "nominal",
                "domain": ["", "25", "50", "75", "100"],
                "range": ["white", "#D9D9D9", "#979797", "#636363", "black"]
              }
            },
            {
              "mark": "rect",
              "dataTransform": [
                {"type": "filter", "field": "Stain", "oneOf": ["gvar"]}
              ],
              "color": {"value": "#A0A0F2"}
            },
            {
              "mark": "triangleRight",
              "dataTransform": [
                {"type": "filter", "field": "Stain", "oneOf": ["acen-1"]}
              ],
              "color": {"value": "#B40101"}
            },
            {
              "mark": "triangleLeft",
              "dataTransform": [
                {"type": "filter", "field": "Stain", "oneOf": ["acen-2"]}
              ],
              "color": {"value": "#B40101"}
            }
          ],
          "x": {"field": "Basepair_start", "type": "genomic"},
          "xe": {"field": "Basepair_stop", "type": "genomic"},
          "stroke": {"value": "gray"},
          "strokeWidth": {"value": 0.5},
          "width": 770,
          "height": 20
        }
      ]
    },
    {
      "xDomain": {"chromosome": "5"},
      "tracks": [
        {
          "data": {
            "url": "https://server.gosling-lang.org/api/v1/tileset_info/?d=cistrome-multivec",
            "type": "multivec",
            "row": "sample",
            "column": "position",
            "value": "peak",
            "categories": ["sample 1", "sample 2", "sample 3", "sample 4"]
          },
          "mark": "area",
          "x": {"field": "position", "type": "genomic"},
          "y": {"field": "peak", "type": "quantitative"},
          "color": {"field": "sample", "type": "nominal"},
          "width": 740,
          "height": 30
        },
        {
          "alignment": "overlay",
          "data": {
            "url": "https://raw.githubusercontent.com/sehilyi/gemini-datasets/master/data/cytogenetic_band.csv",
            "type": "csv",
            "chromosomeField": "Chr.",
            "genomicFields": [
              "ISCN_start",
              "ISCN_stop",
              "Basepair_start",
              "Basepair_stop"
            ]
          },
          "tracks": [
            {
              "mark": "text",
              "dataTransform": [
                {
                  "type": "filter",
                  "field": "Stain",
                  "oneOf": ["acen-1", "acen-2"],
                  "not": true
                }
              ],
              "text": {"field": "Band", "type": "nominal"},
              "color": {"value": "black"},
              "visibility": [
                {
                  "operation": "less-than",
                  "measure": "width",
                  "threshold": "|xe-x|",
                  "transitionPadding": 10,
                  "target": "mark"
                }
              ]
            },
            {
              "mark": "rect",
              "dataTransform": [
                {
                  "type": "filter",
                  "field": "Stain",
                  "oneOf": ["acen-1", "acen-2"],
                  "not": true
                }
              ],
              "color": {
                "field": "Density",
                "type": "nominal",
                "domain": ["", "25", "50", "75", "100"],
                "range": ["white", "#D9D9D9", "#979797", "#636363", "black"]
              }
            },
            {
              "mark": "rect",
              "dataTransform": [
                {"type": "filter", "field": "Stain", "oneOf": ["gvar"]}
              ],
              "color": {"value": "#A0A0F2"}
            },
            {
              "mark": "triangleRight",
              "dataTransform": [
                {"type": "filter", "field": "Stain", "oneOf": ["acen-1"]}
              ],
              "color": {"value": "#B40101"}
            },
            {
              "mark": "triangleLeft",
              "dataTransform": [
                {"type": "filter", "field": "Stain", "oneOf": ["acen-2"]}
              ],
              "color": {"value": "#B40101"}
            }
          ],
          "x": {"field": "Basepair_start", "type": "genomic"},
          "xe": {"field": "Basepair_stop", "type": "genomic"},
          "stroke": {"value": "gray"},
          "strokeWidth": {"value": 0.5},
          "width": 740,
          "height": 20
        }
      ]
    }
  ]
}'


interactive1 = '{
  "arrangement": "vertical",
  "views": [
    {
      "static": true,
      "layout": "circular",
      "alignment": "stack",
      "tracks": [
        {
          "alignment": "overlay",
          "data": {
            "url": "https://server.gosling-lang.org/api/v1/tileset_info/?d=cistrome-multivec",
            "type": "multivec",
            "row": "sample",
            "column": "position",
            "value": "peak",
            "categories": ["sample 1", "sample 2", "sample 3", "sample 4"],
            "binSize": 4
          },
          "x": {"field": "start", "type": "genomic"},
          "xe": {"field": "end", "type": "genomic"},
          "y": {"field": "peak", "type": "quantitative"},
          "row": {"field": "sample", "type": "nominal"},
          "color": {"field": "sample", "type": "nominal"},
          "stroke": {"value": "black"},
          "strokeWidth": {"value": 0.3},
          "tracks": [
            {"mark": "bar"},
            {
              "mark": "brush",
              "x": {"linkingId": "detail-1"},
              "color": {"value": "blue"}
            },
            {
              "mark": "brush",
              "x": {"linkingId": "detail-2"},
              "color": {"value": "red"}
            }
          ],
          "style": {"outlineWidth": 0},
          "width": 500,
          "height": 100
        },
        {
          "data": {
            "type": "csv",
            "url": "https://raw.githubusercontent.com/sehilyi/gemini-datasets/master/data/rearrangements.bulk.1639.simple.filtered.pub",
            "headerNames": [
              "chr1",
              "p1s",
              "p1e",
              "chr2",
              "p2s",
              "p2e",
              "type",
              "id",
              "f1",
              "f2",
              "f3",
              "f4",
              "f5",
              "f6"
            ],
            "separator": "\t",
            "genomicFieldsToConvert": [
              {"chromosomeField": "chr1", "genomicFields": ["p1s", "p1e"]},
              {"chromosomeField": "chr2", "genomicFields": ["p2s", "p2e"]}
            ]
          },
          "dataTransform": [
            {
              "type": "filter",
              "field": "chr1",
              "oneOf": ["1", "16", "14", "9", "6", "5", "3"]
            },
            {
              "type": "filter",
              "field": "chr2",
              "oneOf": ["1", "16", "14", "9", "6", "5", "3"]
            }
          ],
          "mark": "withinLink",
          "x": {"field": "p1s", "type": "genomic"},
          "xe": {"field": "p1e", "type": "genomic"},
          "x1": {"field": "p2s", "type": "genomic"},
          "x1e": {"field": "p2e", "type": "genomic"},
          "stroke": {
            "field": "type",
            "type": "nominal",
            "domain": [
              "deletion",
              "inversion",
              "translocation",
              "tandem-duplication"
            ]
          },
          "strokeWidth": {"value": 0.8},
          "opacity": {"value": 0.15},
          "width": 500,
          "height": 100
        }
      ]
    },
    {
      "spacing": 10,
      "arrangement": "horizontal",
      "views": [
        {
          "tracks": [
            {
              "data": {
                "url": "https://server.gosling-lang.org/api/v1/tileset_info/?d=cistrome-multivec",
                "type": "multivec",
                "row": "sample",
                "column": "position",
                "value": "peak",
                "categories": ["sample 1", "sample 2", "sample 3", "sample 4"],
                "binSize": 4
              },
              "mark": "bar",
              "x": {
                "field": "start",
                "type": "genomic",
                "linkingId": "detail-1",
                "domain": {"chromosome": "5"}
              },
              "xe": {"field": "end", "type": "genomic"},
              "y": {"field": "peak", "type": "quantitative"},
              "row": {"field": "sample", "type": "nominal"},
              "color": {"field": "sample", "type": "nominal"},
              "stroke": {"value": "black"},
              "strokeWidth": {"value": 0.3},
              "style": {"background": "blue"},
              "width": 245,
              "height": 150
            }
          ]
        },
        {
          "tracks": [
            {
              "data": {
                "url": "https://server.gosling-lang.org/api/v1/tileset_info/?d=cistrome-multivec",
                "type": "multivec",
                "row": "sample",
                "column": "position",
                "value": "peak",
                "categories": ["sample 1", "sample 2", "sample 3", "sample 4"],
                "binSize": 4
              },
              "mark": "bar",
              "x": {
                "field": "start",
                "type": "genomic",
                "domain": {"chromosome": "16"},
                "linkingId": "detail-2"
              },
              "xe": {"field": "end", "type": "genomic"},
              "y": {"field": "peak", "type": "quantitative"},
              "row": {"field": "sample", "type": "nominal"},
              "color": {"field": "sample", "type": "nominal", "legend": true},
              "stroke": {"value": "black"},
              "strokeWidth": {"value": 0.3},
              "style": {"background": "red"},
              "width": 245,
              "height": 150
            }
          ]
        }
      ],
      "style": {"backgroundOpacity": 0.1}
    }
  ]
}'

multiview1 = '{
  "title": "Visual Linking",
  "subtitle": "Change the position and range of brushes to update the detail view on the bottom",
  "arrangement": "vertical",
  "centerRadius": 0.4,
  "views": [
    {
      "spacing": 40,
      "arrangement": "horizontal",
      "views": [
        {
          "spacing": 5,
          "static": true,
          "layout": "circular",
          "xDomain": {"chromosome": "1"},
          "alignment": "overlay",
          "tracks": [
            {"mark": "bar"},
            {"mark": "brush", "x": {"linkingId": "detail"}}
          ],
          "data": {
            "url": "https://server.gosling-lang.org/api/v1/tileset_info/?d=cistrome-multivec",
            "type": "multivec",
            "row": "sample",
            "column": "position",
            "value": "peak",
            "categories": ["sample 1", "sample 2", "sample 3", "sample 4"]
          },
          "x": {"field": "start", "type": "genomic"},
          "xe": {"field": "end", "type": "genomic"},
          "y": {"field": "peak", "type": "quantitative"},
          "row": {"field": "sample", "type": "nominal"},
          "color": {"field": "sample", "type": "nominal"},
          "width": 250,
          "height": 130
        },
        {
          "layout": "linear",
          "xDomain": {"chromosome": "1"},
          "alignment": "overlay",
          "tracks": [
            {"mark": "bar"},
            {"mark": "brush", "x": {"linkingId": "detail"}}
          ],
          "data": {
            "url": "https://server.gosling-lang.org/api/v1/tileset_info/?d=cistrome-multivec",
            "type": "multivec",
            "row": "sample",
            "column": "position",
            "value": "peak",
            "categories": ["sample 1", "sample 2", "sample 3", "sample 4"]
          },
          "x": {"field": "start", "type": "genomic"},
          "xe": {"field": "end", "type": "genomic"},
          "y": {"field": "peak", "type": "quantitative"},
          "row": {"field": "sample", "type": "nominal"},
          "color": {"field": "sample", "type": "nominal"},
          "width": 400,
          "height": 200
        }
      ]
    },
    {
      "layout": "linear",
      "xDomain": {"chromosome": "1", "interval": [160000000, 200000000]},
      "linkingId": "detail",
      "tracks": [
        {
          "data": {
            "url": "https://server.gosling-lang.org/api/v1/tileset_info/?d=cistrome-multivec",
            "type": "multivec",
            "row": "sample",
            "column": "position",
            "value": "peak",
            "categories": ["sample 1", "sample 2", "sample 3", "sample 4"]
          },
          "mark": "bar",
          "x": {"field": "position", "type": "genomic", "axis": "top"},
          "y": {"field": "peak", "type": "quantitative"},
          "row": {"field": "sample", "type": "nominal"},
          "color": {"field": "sample", "type": "nominal"},
          "width": 690,
          "height": 200
        }
      ]
    }
  ]
}'
