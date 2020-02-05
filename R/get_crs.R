#' Extract PROJ4 string
#'
#' Obtain the PROJ4 string from an object, if it has one. Supported inputs
#' include raster, sf, sp, and silicate.
#'
#' @param x object with PROJ4 string
#' @param ... ignored
#' @return character string (or NA)
#' @export
#' @seealso crs_epsg crs_wkt
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
    ## 3. get string
    return(x[["proj4string"]])
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
#' include sp (and sf soon).
#'
#' @section Warning: For sp WKT2 only, PROJ6 and beyond
#' @param x object with 'WKT2' string
#' @param ... ignored
#' @return character string (or NA)
#' @export
#' @seealso crs_epsg crs_proj
crs_wkt <- function(x, ...) {
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
  if (isS4(x) && methods::.hasSlot(x, "projargs")) {
    return(as.character(x@projargs))
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
#' @seealso crs_wkt crs_proj
crs_epsg <- function(x, ...) {
  x_na <- NA_integer_
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
    ## 3. get number
    return(x[["epsg"]])
  }
  x_na
}
