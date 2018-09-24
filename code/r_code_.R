access_pr_file <- 'data/pr_Amon_ACCESS1-3_historical_r1i1p1_200101-200512.nc'

library(raster)
dset <- brick(access_pr_file, varname = "pr")
clim <- stackApply(dset, indices = rep(1, nlayers(dset)), fun = mean) * 24 * 3600

## the default plotting in python seems to clamp to this range, based on the
## input breaks
clim[clim > 12.5] <- 12.5
plot(raster(list(x = lon, y = lat, z = x)), col = viridis::viridis(11), zlim = c(0, 12.5))
maps::map("world2", add = TRUE)