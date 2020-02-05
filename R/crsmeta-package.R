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
#' Coordinate reference systems (CRS) are described at
#' \url{https://en.wikipedia.org/wiki/Spatial_reference_system}. The
#' European Petroleum Survey Group (EPSG) codes are maintained at
#' \url{http:/epsg.org/}. The old 'PROJ4' forms (along with newer systems) are
#' described with the 'PROJ' library  \url{https://proj.org/}. The  Well-Known
#' Text system 'WKT2' is documented at
#' \url{http://docs.opengeospatial.org/is/12-063r5/12-063r5.html}.
#'
#' There are a few functions to return a character string of length one of each
#' main kind of projection string.
#' \tabular{ll}{
#'  \code{\link{crs_epsg}}         \tab short numeric EPSG lookup \cr
#'  \code{\link{crs_proj}}        \tab short PROJ4 style string  \cr
#'  \code{\link{crs_wkt2}}        \tab the full parameter set as WKT2 string \cr
#' }
#'
#' @name crsmeta-package
#' @aliases crsmeta
#' @docType package
NULL

#' Simple features example data
#'
#' A copy of the 'minimal_mesh' data set from the
#' [silicate](https://CRAN.r-project.org/package=silicate/) package, with
#' coordinate reference system information added.
#'
#' @section Warning: do not use this data in real situations, or as examplary
#' of the 'sf' format. It was created purely to add examples to this package.
#' @docType data
#' @name sfx
#' @examples
#' ## three equivalent representations, of increasing richness
#' crs_epsg(sfx)
#'
#' crs_wkt2(sfx)
#'
#' crs_proj(sfx)
NULL





