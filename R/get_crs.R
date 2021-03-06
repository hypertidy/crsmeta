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
#' @seealso [crs_epsg()] [crs_wkt2()] [crs_input()]
#' @examples
#' crs_proj(sfx)
#'
#' crs_proj(sfx$geom)
#'
#' crs_proj(sfx_new) ## NA
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
    out <- xx[["proj4string"]]
    if (is.null(out)) out <- x_na
    return(out)
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
#' The functions [crs_wkt()] and [crs_wkt2()] are aliased, they do the same
#' thing.
#' @section Warning: For WKT2 only, PROJ6 and beyond
#' @param x object with 'WKT2' string
#' @param ... ignored
#' @return character string (or `NA`)
#' @references [WKT2 specification](http://docs.opengeospatial.org/is/12-063r5/12-063r5.html)
#' @export
#' @aliases crs_wkt
#' @seealso [crs_epsg()] [crs_proj()] [crs_wkt()] [crs_input()]
#' @examples
#' crs_wkt2(sfx) # NA
#' crs_wkt2(sfx$geom) # NA
#'
#' crs_wkt2(sfx_new)
#' crs_wkt2(sfx_new$geom)
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
    out <- x[["wkt"]]
    if (is.null(out)) out <- x_na
    return(out)
  }
  x_na
}
#' @name crs_wkt2
#' @export
crs_wkt <- function(x, ...) {
  crs_wkt2(x, ...)
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
#' @references [EPSG website](http://www.epsg.org/)
#' @seealso [crs_wkt2()] [crs_proj()] [crs_input()]
#' @examples
#' crs_epsg(sfx)
#' x <- sfx
#' attr(x$geom, "crs")$epsg <- NA ## oh no we lost it
#' crs_epsg(x)
#'
#' crs_epsg(sfx_new) ## NA, doesn't exist now
crs_epsg <- function(x, ...) {
  x_na <- NA_integer_
  x <- sf_core(x)
  if (!is.null(x) && !all(is.na(unlist(x)))) {
    out <- x[["epsg"]]
    if (is.null(out)) out <- x_na
    return(out)
  }
  x_na
}

#' Extract 'input' value
#'
#' Obtain the 'input' string from an object, if it has one. Supported inputs
#' include sf (>= 0.8-1 - probably).
#'
#' @section Warning:
#'
#' Note that the 'input' value could be almost anything, there is a
#' huge variety of inputs that can work such as `4326`, projstrings,
#' WKT2 strings, EPSG declarations `'EPSG:4326'`, or common strings like
#' `'WGS84'` or `'NAD27'`.
#'
#' Strings like `'+init=epsg:4326'` have been deprecated but still
#' can work, so beware.
#' @param x object with 'input' value
#' @param ... ignored
#' @return character (or NA)
#' @export
#' @references [sf](http://r-spatial.github.io/sf/)
#' @seealso [crs_wkt2()] [crs_proj()] [crs_epsg()]
#' @examples
#' crs_input(sfx) ## doesn't have one
#'
#' crs_input(sfx_new)  ## a proj4string
crs_input <- function(x, ...) {
  x_na <- NA_character_
  x <- sf_core(x)
  if (!is.null(x) && !all(is.na(unlist(x)))) {
    out <- x[["input"]]
    if (is.null(out)) out <- x_na
    return(out)
  }
  x_na
}
