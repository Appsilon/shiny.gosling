require(StructuralVariantAnnotation)
require(ggbio)
require(shiny)
require(shiny.gosling)

# StructuralVariantAnnotation is built on top of the Bioconductor
# package VariantAnnotation. VCF files are loaded using
# VariantAnnotation::readVcf, and converted to breakpoint GRanges
# notation using breakpointRanges Any non-structural variants such
# as single nucleotide variants in a VCF will be silently ignored
# by StructuralVariantAnnotation. More information about VCF objects
# can be found by consulting the vignettes in the VariantAnnotation
# package with browseVignettes("VariantAnnotation").

# Colo829, is a human cell line primarily derived from skin tissue
# affected by melanoma, a type of malignant skin cancer. The cell
# line is maintained and distributed by the American Type Culture
# Collection (ATCC) under the product name "COLO 829." Its unique
# identifier is Catalog Number CRL-1974.

# The Colo829 cell line was established from a 45-year-old male patient
# with melanoma, making it an important resource for research and study
# of this particular disease. The cells are preserved in a frozen state,
# allowing for long-term storage and viability.

# These cells are classified as fibroblast-like, which indicates their
# morphological and functional characteristics are similar to fibroblasts,
# a type of connective tissue cell involved in wound healing and
# extracellular matrix production.

# With a Biosafety Level of 1, Colo829 is considered safe to handle and
# work with under standard laboratory conditions. This makes it accessible
# to a wider range of researchers and laboratories.

# The primary application of Colo829 is in 3D cell culture experiments,
# where it can be used to model melanoma or study interactions between
# cancer cells and their surrounding environment in a more physiologically
# relevant setting.

# Being a human cell line of Homo sapiens origin, Colo829 is a valuable
# tool for studying human-specific processes and responses. Its tissue
# origin from the skin makes it particularly relevant for melanoma research,
# as the disease primarily affects skin cells.

# Overall, Colo829 is a well-characterized cell line that holds
# significance in the field of melanoma research and offers a versatile
# platform for investigating various aspects of cancer biology and
# therapeutic development.

# See more info about this cell line at https://www.cellosaurus.org/CVCL_1137

colo829_vcf <- VariantAnnotation::readVcf(
  system.file(
    "extdata",
    "COLO829T.purple.sv.ann.vcf.gz",
    package = "StructuralVariantAnnotation"
  )
)
colo829_bpgr <- breakpointRanges(colo829_vcf)

# In this line, a subset of genomic ranges is extracted from the object
# colo829_bpgr. The subset is obtained by filtering based on the sequence
# names (seqnames) present in colo829_bpgr that are also found in the
# sequence levels (seqlevels) of the hg19sub reference genome from the
# biovizBase package. colo829_bpgr is assumed to be a GenomicRanges object
# containing genomic regions.
gr_circos <- colo829_bpgr[seqnames(colo829_bpgr) %in% seqlevels(biovizBase::hg19sub)]

# This line updates the sequence levels of the gr_circos object to match
# those of the hg19sub reference genome. It ensures that the genomic ranges
# in gr_circos align properly with the reference genome.
seqlevels(gr_circos) <- seqlevels(biovizBase::hg19sub)

# Here, the metadata columns (mcols) of the gr_circos object are updated
# with additional information. Specifically, a new column called "to.gr" is
# added, and its values are assigned using the granges function on the
# partner genomic ranges of gr_circos.
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
