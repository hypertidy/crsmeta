
<!-- README.md is generated from README.Rmd. Please edit that file -->

# crs

<!-- badges: start -->

<!-- badges: end -->

The goal of crs is to extract *map projection* metadata from objects.
The map projection is a set of parameters that describe a *coordinate
reference system* (‘crs’) and there are various systems that do so with
different sets of aliases and assumptions.

## Installation

You can install the released version of crs from
[CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("crs")
```

Install the development version of crs from
[Github](https://github.com/hypertidy/crs).

``` r
## install.packages("remotes")
remotes::install_github("hypertidy/crs")
```

## Example

This is a basic example which shows you how to obtain the PROJ string
from spatial objects (raster, or silicate):

``` r
library(crs)
library(raster)
#> Loading required package: sp

## a spatial object
r <- raster::raster()
r[50:51] <- 10

crs_proj(r)
#> [1] "+proj=longlat +datum=WGS84 +no_defs"

crs_proj(silicate::SC0(silicate::inlandwaters))
#> [1] "+proj=lcc +lat_1=-47 +lat_2=-17 +lat_0=-32 +lon_0=136 +x_0=0 +y_0=0 +ellps=WGS84 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs"
```

This also works for sp, and sf. The function `crs_epsg()` also works for
sf objects, and `crs_wkt()` for sf and sp objects for later system-level
versions of the PROJ library.

An sf
object:

``` r
sfx <- sf::read_sf(system.file("gpkg/nc.gpkg", package = "sf", mustWork = TRUE))
crs_wkt(as(sfx, "Spatial"))
#> [1] "GEOGCRS[\"unknown\",DATUM[\"North American Datum 1927\",ELLIPSOID[\"Clarke 1866\",6378206.4,294.978698213898,LENGTHUNIT[\"metre\",1]],ID[\"EPSG\",6267]],PRIMEM[\"Greenwich\",0,ANGLEUNIT[\"degree\",0.0174532925199433],ID[\"EPSG\",8901]],CS[ellipsoidal,2],AXIS[\"longitude\",east,ORDER[1],ANGLEUNIT[\"degree\",0.0174532925199433,ID[\"EPSG\",9122]]],AXIS[\"latitude\",north,ORDER[2],ANGLEUNIT[\"degree\",0.0174532925199433,ID[\"EPSG\",9122]]]]"
crs_epsg(sfx)
#> [1] 4267
```

## Code of Conduct

Please note that the crs project is released with a [Contributor Code of
Conduct](https://contributor-covenant.org/version/1/0/0/CODE_OF_CONDUCT.html).
By contributing to this project, you agree to abide by its terms.
