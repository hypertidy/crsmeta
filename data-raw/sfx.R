## code to prepare `DATASET` dataset goes here
sfx <- silicate::minimal_mesh
crs <- attr(sfx$geom, "crs")
crs$epsg <- 4326
crs$proj4string <- sf::st_crs(4326)$proj4string
## this only works in dev-sf, so this in-built data set should possibly change
attr(sfx$geom, "crs") <- crs
sfx_new <- NULL
sfx_new <- local({
  stopifnot(packageVersion("sf") >= "0.9-0")
  sfx_new <- sfx
  crs_new <- attr(sfx_new$geom, "crs")
  crs_new$input <- crs_new$proj4string
  crs_new$wkt <- sf::st_crs(4326)$wkt

  crs_new$epsg <- crs_new$proj4string <- NULL
  attr(sfx_new$geom, "crs") <- sf::st_crs(crs_new)

  sfx_new
})

usethis::use_data(sfx_new, sfx, overwrite = TRUE)
