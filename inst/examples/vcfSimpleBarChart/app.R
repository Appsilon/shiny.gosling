require(StructuralVariantAnnotation)
require(ggbio)
require(shiny)
require(shiny.gosling)

colo829_vcf <- VariantAnnotation::readVcf(
  system.file(
    "extdata",
    "COLO829T.purple.sv.ann.vcf.gz",
    package = "StructuralVariantAnnotation"
  )
)
colo829_bpgr <- breakpointRanges(colo829_vcf)

gr_circos <- colo829_bpgr[seqnames(colo829_bpgr) %in% seqlevels(biovizBase::hg19sub)]
seqlevels(gr_circos) <- seqlevels(biovizBase::hg19sub)
mcols(gr_circos)$to.gr <- granges(partner(gr_circos))

ui <- fluidPage(
  use_gosling(clear_files = FALSE),
  goslingOutput("gosling_plot")
)

track_1 <- add_single_track(
  width = 800,
  height = 180,
  data = track_data_gr(
    gr_circos, chromosomeField = "seqnames",
    genomicFields = c("start", "end")
  ),
  mark = "bar",
  x = visual_channel_x(
    field = "start", type = "genomic", axis = "bottom"
  ),
  xe = visual_channel_x(field = "end", type = "genomic"),
  y = visual_channel_y(
    field = "width", type = "quantitative", axis = "right"
  ),
  size = list(value = 5)
)

composed_view <- compose_view(
  layout = "linear",
  tracks = track_1
)

arranged_view <- arrange_views(
  title = "Basic Marks: bar",
  subtitle = "Tutorial Examples",
  views = composed_view
)

server <- function(input, output, session) {
  output$gosling_plot <- renderGosling({
    gosling(
      component_id = "component_1",
      arranged_view
    )
  })
}

shiny::shinyApp(ui, server)
