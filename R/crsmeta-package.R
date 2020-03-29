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
#' \url{http://www.epsg.org/}. The old 'PROJ4' forms (along with newer systems) are
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
#' Note, this help page has a weird name because for some reason
#' 'crsmeta-package' prevents the page showing up in pkgdown docs.
#'
#' @name crsmeta-package
NULL

#' Simple features example data
#'
#' A copy of the 'minimal_mesh' data set from the
#' [silicate](https://CRAN.r-project.org/package=silicate/) package, with
#' coordinate reference system information added.
#'
#' `sfx` is the old-style PROJ.4 and EPSG code CRS (prior to sf 0.8-1).
#'
#' `sfx_new` is the new-style WKT2, with user input.
#'
#' @section Warning: do not use this data in real situations, or as exemplary
#' of the 'sf' format. It was created purely to add examples to this package.
#' @docType data
#' @name sfx
#' @aliases sfx_new
#' @examples
#' ## three equivalent representations, of increasing richness
#' crs_epsg(sfx)
#'
#' crs_proj(sfx)
#'
#' crs_wkt2(sfx)  ## did not exist in earlier sf
#'
#' ## new style
#' crs_epsg(sfx_new) ## NA!
#' crs_proj(sfx_new) ## NA!
#'
#' crs_input(sfx_new)
#' crs_wkt(sfx_new)
NULL





