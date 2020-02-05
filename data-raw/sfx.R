## code to prepare `DATASET` dataset goes here
sfx <- silicate::minimal_mesh
crs <- attr(sfx$geom, "crs")
crs$epsg <- 4326
crs$proj4string <- sf::st_crs(4326)$proj4string
## this only works in dev-sf, so this in-built data set should possibly change
crs$wkt2 <- sf::st_crs(4326)$wkt2
attr(sfx$geom, "crs") <- crs

usethis::use_data(sfx, overwrite = TRUE)
