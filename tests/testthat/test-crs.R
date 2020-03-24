# test_that("sf works, before sf loaded", {
#   expect_true(!any(grepl("^package:sf$", search())))
#   ## only before sf is loaded, because https://github.com/hypertidy/anglr/issues/92
#   expect_true(!grepl("+proj=lcc.*",
#                      crs_input(silicate::inlandwaters[1, ])))
#
# })
#
# test_that("raster works", {
#
#
#   skip_on_cran()  ## no raster, sp on CRAN
#   r <- raster::raster()
#   expect_true(is.character(crs_proj(r)))
#   expect_true(!is.na(crs_proj(r)))
# })
#
# test_that("sf works", {
#   skip_on_cran()  ## no raster, sp on CRAN
#   x <- sf::read_sf(system.file("gpkg/nc.gpkg", package = "sf"))
#
#   expect_s3_class(sf_core(x), "crs")
#   expect_true(is.character(crs_proj(x)))
#   if (utils::packageVersion("sf") < "0.8-1") {
#
#   expect_true(!is.na(crs_proj(x)))
# }
#   expect_true(is.character(crs_proj(x$geom)))
#   if (utils::packageVersion("sf") < "0.8-1") {
#     expect_true(!is.na(crs_proj(x$geom)))
#   }
#
#   expect_true(is.numeric(crs_epsg(x)))
#   if (utils::packageVersion("sf") < "0.8-1") {
#     expect_true(!is.na(crs_epsg(x)))
#   }
#
#   expect_true(is.numeric(crs_epsg(x$geom)))
#   if (utils::packageVersion("sf") < "0.8-1") {
#     expect_true(!is.na(crs_epsg(x$geom)))
#   }
#   expect_true(is.numeric(crs_epsg(x)))
#   if (utils::packageVersion("sf") < "0.8-1") {
#    expect_true(!is.na(crs_epsg(x)))
#  }
#
#   expect_true(expect_warning(is.numeric(crs_epsg(x$geom[[1]]))))
#   expect_true(expect_warning(is.na(crs_epsg(x$geom[[1]]))))
#
#   expect_equal(crs_input(silicate::inlandwaters), NA_character_)
#   if (utils::packageVersion("sf") > "0.8-1") {
#     expect_true(is.character(crs_wkt2(x)))
#     expect_true(!is.na(crs_wkt2(x)))
#    library(sf)
#     expect_true(grepl("+proj=lcc.*",
#               crs_input(silicate::inlandwaters[1, ])))
#
#   }
#
# })
#
#
# test_that("sp works", {
#   skip_on_cran()  ## no raster, sp on CRAN
#
#   x <- rgdal::readOGR(system.file("gpkg/nc.gpkg", package = "sf"))
#   expect_true(is.character(crs_proj(x)))
#   expect_true(!is.na(crs_proj(x)))
#   if (utils::packageVersion("rgdal") >= "1.5-3") {
#     expect_true(is.character(crs_wkt2(x)))
#     expect_true(!is.na(crs_wkt2(x)))
#   }
# })
#
# test_that("silicate works", {
#   skip_on_cran()
#   library(silicate)
#   x <- SC0(rgdal::readOGR(system.file("gpkg/nc.gpkg", package = "sf")))
#   expect_true(is.character(crs_proj(x)))
#   expect_true(!is.na(crs_proj(x)))
# })
