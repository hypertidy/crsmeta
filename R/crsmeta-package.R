#' @keywords internal
"_PACKAGE"

# The following block is used by usethis to automatically manage
# roxygen namespace tags. Modify with care!
## usethis namespace: start
## usethis namespace: end
NULL


#' Extract Coordinate System Metadata
#'
#' Obtain coordinate system metadata from various in-memory R formats.
#'
#' There are a few functions to return a character string of length one of each
#' main kind of projection string.
#'\tabular{ll}{
#'  \code{\link{crs_epsg}}         \tab short numeric EPSG lookup \cr
#'  \code{\link{crs_proj}}        \tab short PROJ4 style string  \cr
#'  \code{\link{crs_wkt2}}        \tab the full parameter set as WKT2 string \cr
#' }
#' @name crsmeta-package
#' @aliases crsmeta
#' @docType package
NULL

#' Catch for early users
#' @param x object
#' @param ... ignored
#' @return nothing, an error
crs_wkt <- function(x, ...) {
  .Defunct("crs_wkt2")
stop()
}

