#' Setup gosling dependencies
#'
#' @return list of dependencies for Gosling
goslingDependency <- function() {
  htmltools::htmlDependency(
    name = "gosling",
    version = "0.1.0",
    package = "shiny.gosling",
    src = "www",
    script = "gosling.js"
  )
}

#' Create react component
#'
#' @param name name of the react component
#'
#' @return function to create react element
component <- function(name) {
  function(...) shiny.react::reactElement(
    module = "gosling.js",
    name = name,
    props = shiny.react::asProps(...),
    deps = goslingDependency()
  )
}

#' @export
GoslingComponent <- component("customGosling")
