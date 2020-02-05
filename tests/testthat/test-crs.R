test_that("raster works", {
  skip_on_cran()  ## no raster, sp on CRAN
  r <- raster::raster()
  expect_true(is.character(crs_proj(r)))
  expect_true(!is.na(crs_proj(r)))
})

test_that("sf works", {
  skip_on_cran()  ## no raster, sp on CRAN
  x <- sf::read_sf(system.file("gpkg/nc.gpkg", package = "sf"))
  expect_true(is.character(crs_proj(x)))
  expect_true(!is.na(crs_proj(x)))

  expect_true(is.character(crs_proj(x$geom)))
  expect_true(!is.na(crs_proj(x$geom)))


  expect_true(is.numeric(crs_epsg(x)))
  expect_true(!is.na(crs_epsg(x)))


  expect_true(is.numeric(crs_epsg(x$geom)))
  expect_true(!is.na(crs_epsg(x$geom)))

  expect_true(is.numeric(crs_epsg(x)))
  expect_true(!is.na(crs_epsg(x)))


  expect_true(is.numeric(crs_epsg(x$geom[[1]])))
  expect_true(is.na(crs_epsg(x$geom[[1]])))

})


test_that("sp works", {
  skip_on_cran()  ## no raster, sp on CRAN

  x <- rgdal::readOGR(system.file("gpkg/nc.gpkg", package = "sf"))
  expect_true(is.character(crs_proj(x)))
  expect_true(!is.na(crs_proj(x)))
  if (utils::packageVersion("rgdal") >= "1.5-3") {
    expect_true(is.character(crs_wkt(x)))
    expect_true(!is.na(crs_wkt(x)))
  }
})
