
<!-- README.md is generated from README.Rmd. Please edit that file -->

# crsmeta

<!-- badges: start -->

[![Lifecycle:
maturing](https://img.shields.io/badge/lifecycle-maturing-blue.svg)](https://www.tidyverse.org/lifecycle/#maturing)
[![CRAN
status](https://www.r-pkg.org/badges/version/crsmeta)](https://CRAN.R-project.org/package=crsmeta)
[![CRAN\_Download\_Badge](http://cranlogs.r-pkg.org/badges/crsmeta)](https://cran.r-project.org/package=crsmeta)
<!-- badges: end -->

The goal of crsmeta is to extract *map projection* metadata from
in-memory spatial R objects. The map projection is a set of parameters
that describe a *coordinate reference system* (‘crs’) and there are
various systems that do so with different sets of aliases and
assumptions. With crsmeta we are only obtaining the value from various
formats so that we can develop tools that use them rather than concern
ourselves with format-specific plumbing.

We cannot obtain a crsmeta value from out of memory sources like files,
databases, or URLs. Use another tool for that.

## Installation

You can install the released version of crsmeta from
[CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("crsmeta")
```

Install the development version of crsmeta from
[Github](https://github.com/hypertidy/crsmeta).

``` r
## install.packages("remotes")
remotes::install_github("hypertidy/crsmeta")
```

## Example

This is a basic example which shows you how to obtain the PROJ string
from spatial objects (raster, or silicate):

``` r
library(crsmeta)
library(raster)
#> Loading required package: sp

## a spatial object
r <- raster::raster()
r[50:51] <- 10

crs_proj(r)
#> [1] "+proj=longlat +datum=WGS84 +no_defs"

crs_proj(silicate::SC0(silicate::inlandwaters))
#> [1] NA
```

This also works for sp, and sf. The function `crs_epsg()` also works for
sf objects, and `crs_wkt2()` for sf and sp objects for later
system-level versions of the PROJ library.

Now sp or sf
objects:

``` r
sfx <- sf::read_sf(system.file("gpkg/nc.gpkg", package = "sf", mustWork = TRUE))
crs_proj(sfx)
#> [1] "+proj=longlat +datum=NAD27 +no_defs"
crs_proj(as(sfx, "Spatial"))
#> [1] "+proj=longlat +datum=NAD27 +no_defs"
crs_wkt2(as(sfx, "Spatial"))
#> [1] "GEOGCRS[\"NAD27\",\n    DATUM[\"North American Datum 1927\",\n        ELLIPSOID[\"Clarke 1866\",6378206.4,294.978698213898,\n            LENGTHUNIT[\"metre\",1]]],\n    PRIMEM[\"Greenwich\",0,\n        ANGLEUNIT[\"degree\",0.0174532925199433]],\n    CS[ellipsoidal,2],\n        AXIS[\"geodetic latitude (Lat)\",north,\n            ORDER[1],\n            ANGLEUNIT[\"degree\",0.0174532925199433]],\n        AXIS[\"geodetic longitude (Lon)\",east,\n            ORDER[2],\n            ANGLEUNIT[\"degree\",0.0174532925199433]],\n    USAGE[\n        SCOPE[\"unknown\"],\n        AREA[\"North America - NAD27\"],\n        BBOX[7.15,167.65,83.17,-47.74]],\n    ID[\"EPSG\",4267]]"
crs_epsg(sfx)
#> [1] 4267
```

## Code of Conduct

Please note that the crsmeta project is released with a [Contributor
Code of
Conduct](https://contributor-covenant.org/version/1/0/0/CODE_OF_CONDUCT.html).
By contributing to this project, you agree to abide by its terms.
