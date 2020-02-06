## get the sf crs
sf_core <- function(x, ...) {
  x_na <- NA_character_
  if (inherits(x, "sfg")) {
    warning("no crs in a bare sf geometry")
    return(x_na)
  }
  ## 1. get geometry
  if (inherits(x, "sf")) {
    x <- x[[attr(x, "sf_column")]]
  }
  ## 2. get crs
  if (inherits(x, "sfc")) {
    x <- attr(x, "crs")
    return(x)
  }
 x_na
}
#' Extract 'PROJ4' string
#'
#' Obtain the 'PROJ4' string from an object, if it has one. Supported inputs
#' include raster, sf, sp, and silicate.
#'
#' @param x object with 'PROJ4' string
#' @param ... ignored
#' @return character string (or `NA`)
#' @references [PROJ system website](https://proj.org/)
#' @export
#' @seealso [crs_epsg()] [crs_wkt2()]
#' @examples
#' crs_proj(sfx)
#'
#' crs_proj(sfx$geom)
crs_proj <- function(x, ...) {
  x_na <- NA_character_
  ## start with raster, then sp, then sf, then sc, then character, finally return NA
  ## add tests for other formats before character
  if (isS4(x) && methods::.hasSlot(x, "crs")) {
    x <- x@crs
    if (methods::.hasSlot(x, "projargs")) {
      x <- x@projargs
    }
    return(unclass(x))
  }
  if (isS4(x) && methods::.hasSlot(x, "proj4string")) {
    x <- x@proj4string
    if (methods::.hasSlot(x, "projargs")) {
      x <- x@projargs
    }
    return(unclass(x))
  }
  xx <- sf_core(x)
  if (!is.null(xx) && !all(is.na(unlist(xx)))) {
    return(xx[["proj4string"]])
  }

  if (inherits(x, "sc")) {
    return(x[["meta"]][["proj"]][1L])
  }
  if (inherits(x,  'character')) {
    return(as.character(x))
  }
  ## no crs
  x_na
}

#' Extract 'WKT2' string
#'
#' Obtain the 'WKT2' string from an object, if it has one. Supported inputs
#' include sp and sf.
#'
#' @section Warning: For WKT2 only, PROJ6 and beyond
#' @param x object with 'WKT2' string
#' @param ... ignored
#' @return character string (or `NA`)
#' @references [WKT2 specification](http://docs.opengeospatial.org/is/12-063r5/12-063r5.html)
#' @export
#' @seealso [crs_epsg()] [crs_proj()]
#' @examples
#' crs_wkt2(sfx)
#'
#' crs_wkt2(sfx$geom)
crs_wkt2 <- function(x, ...) {
  x_na <- NA_character_
  ## look for a wkt2 equivalent from sf or sp
  if (isS4(x) && methods::.hasSlot(x, "crs")) {
    x <- x@crs
  }
  if (isS4(x) && methods::.hasSlot(x, "proj4string")) {
    ## extra checks
    comm <- comment(x@proj4string)
    if (!is.null(comm)) {
      return(unclass(comm))
    }
  }
  x <- sf_core(x)
  if (!is.null(x) && !all(is.na(unlist(x)))) {
    return(x[["wkt2"]])
  }
  x_na
}
#' Extract 'EPSG' value
#'
#' Obtain the 'EPSG' string from an object, if it has one. Supported inputs
#' include sf.
#'
#' @param x object with 'EPSG' value
#' @param ... ignored
#' @return integer (or NA)
#' @export
#' @references [EPSG website](http:/epsg.org/)
#' @seealso [crs_wkt2()] [crs_proj()]
#' @examples
#' crs_epsg(sfx)
#' x <- sfx
#' attr(x$geom, "crs")$epsg <- NA ## oh no we lost it
#' crs_epsg(x)
crs_epsg <- function(x, ...) {
  x_na <- NA_integer_
  x <- sf_core(x)
  if (!is.null(x) && !all(is.na(unlist(x)))) {
    return(x[["epsg"]])
  }
  x_na
}
