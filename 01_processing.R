# 01 - Install libraries ----
install.packages("raster")
if (!"devtools"%in%installed.packages()){install.packages("devtools")}  
devtools::install_github("andrefaa/ENMTML")  
devtools::install_github("biomodhub/biomod2", dependencies = TRUE)
install.packages("biomod2")
install.packages("rgdal")
install.packages("sdmpredictors")
install.packages("maptools")
install.packages("usdm")
install.packages("ecospat")
install.packages("CoordinateCleaner")
install.packages("rgbif")
install.packages("spocc")
install.packages("spThin")
install.packages("dplyr")
install.packages("dismo")
install.packages("gridExtra")
install.packages("tidyr")
install.packages("corrplot")
install.packages("geometry")
install.packages("sp")
install.packages("ggfortify")
install.packages("ggplot2")

# 02 - Call libraries ----
# library(ENMTML)
library(raster)
library(biomod2)
library(rgdal)
library(sdmpredictors)
library(maptools)
library(usdm)
library(ecospat)
library(CoordinateCleaner)
library(rgbif)
library(spocc)
library(spThin)
library(dplyr)
library(dismo)
library(gridExtra)
library(tidyr)
library(corrplot)
library(geometry)
library(sp)
library(ggfortify)
library(ggplot2)

# 03 - Set wd ----
setwd("X:/Shared files/SDM")
getwd()

# Load dataset
# load("./final_model/final_model.RData")

# 04 - Preprocess ----
# Load environmental variables
# WorldClim
bio1 <- raster("./HIGHRES/wc2.1_30s_bio_1.tif")
bio2 <- raster("./HIGHRES/wc2.1_30s_bio_2.tif")
bio3 <- raster("./HIGHRES/wc2.1_30s_bio_3.tif")
bio4 <- raster("./HIGHRES/wc2.1_30s_bio_4.tif")
bio5 <- raster("./HIGHRES/wc2.1_30s_bio_5.tif")
bio6 <- raster("./HIGHRES/wc2.1_30s_bio_6.tif")
bio7 <- raster("./HIGHRES/wc2.1_30s_bio_7.tif")
bio8 <- raster("./HIGHRES/wc2.1_30s_bio_8.tif")
bio9 <- raster("./HIGHRES/wc2.1_30s_bio_9.tif")
bio10 <- raster("./HIGHRES/wc2.1_30s_bio_10.tif")
bio11 <- raster("./HIGHRES/wc2.1_30s_bio_11.tif")
bio12 <- raster("./HIGHRES/wc2.1_30s_bio_12.tif")
bio13 <- raster("./HIGHRES/wc2.1_30s_bio_13.tif")
bio14 <- raster("./HIGHRES/wc2.1_30s_bio_14.tif")
bio15 <- raster("./HIGHRES/wc2.1_30s_bio_15.tif")
bio16 <- raster("./HIGHRES/wc2.1_30s_bio_16.tif")
bio17 <- raster("./HIGHRES/wc2.1_30s_bio_17.tif")
bio18 <- raster("./HIGHRES/wc2.1_30s_bio_18.tif")
bio19 <- raster("./HIGHRES/wc2.1_30s_bio_19.tif")
prec <- raster("./HIGHRES/PREC_MEAN.tif")
srad <- raster("./HIGHRES/SRAD_MEAN.tif")
tavg <- raster("./HIGHRES/TAVG_MEAN.tif")
vapr <- raster("./HIGHRES/VAPR_MEAN.tif")
wind <- raster("./HIGHRES/WIND_MEAN.tif")

# Cloud cover MODCF
cc1 <- raster("./HIGHRES/MODCF_intraannualSD.tif")
cc2 <- raster("./HIGHRES/MODCF_monthlymean_01.tif")
cc3 <- raster("./HIGHRES/MODCF_monthlymean_07.tif")

# NDVI 2003-2007
ndvi1 <- raster("./HIGHRES/NDVI_CUM_2003-2007.tif")
ndvi2 <- raster("./HIGHRES/NDVI_MIN_2003-2007.tif")
ndvi3 <- raster("./HIGHRES/NDVI_SEAS_2003-2007.tif")

# SoilGrids
soil1 <- raster("./HIGHRES/CEC.tif") # Cation Exchange Capacity of the soil
soil2 <- raster("./HIGHRES/CFVO.tif") # Volumetric fraction of coarse fragments (> 2 mm)
soil3 <- raster("./HIGHRES/CLAY.tif")
soil4 <- raster("./HIGHRES/NITROGEN.tif")
soil5 <- raster("./HIGHRES/OCD.tif") # Organic carbon density
soil6 <- raster("./HIGHRES/phh2o.tif")
soil7 <- raster("./HIGHRES/SAND.tif")
soil8 <- raster("./HIGHRES/SILT.tif")
soil9 <- raster("./HIGHRES/SOC.tif") # Soil organic carbon content in the fine earth fraction

# Topography
topo1 <- raster("./HIGHRES/AI.tif")
topo2 <- raster("./HIGHRES/aspectcosine.tif")
topo3 <- raster("./HIGHRES/aspectsine.tif")
topo4 <- raster("./HIGHRES/CTI.tif")
topo5 <- raster("./HIGHRES/elevation.tif")
topo6 <- raster("./HIGHRES/HLI.tif")
topo7 <- raster("./HIGHRES/slope.tif")
topo8 <- raster("./HIGHRES/tpi.tif")
topo9 <- raster("./HIGHRES/vrm.tif")

# 05 - Adjust resolutions -----
new_res <- bio16
bio1_R <- resample(bio1, new_res, method = 'bilinear')
bio2_R <- resample(bio2, new_res, method = 'bilinear')
bio3_R <- resample(bio3, new_res, method = 'bilinear')
bio4_R <- resample(bio4, new_res, method = 'bilinear')
bio5_R <- resample(bio5, new_res, method = 'bilinear')
bio6_R <- resample(bio6, new_res, method = 'bilinear')
bio7_R <- resample(bio7, new_res, method = 'bilinear')
bio8_R <- resample(bio8, new_res, method = 'bilinear')
bio9_R <- resample(bio9, new_res, method = 'bilinear')
bio10_R <- resample(bio10, new_res, method = 'bilinear')
bio11_R <- resample(bio11, new_res, method = 'bilinear')
bio12_R <- resample(bio12, new_res, method = 'bilinear')
bio13_R <- resample(bio13, new_res, method = 'bilinear')
bio14_R <- resample(bio14, new_res, method = 'bilinear')
bio15_R <- resample(bio15, new_res, method = 'bilinear')
bio16_R <- resample(bio16, new_res, method = 'bilinear')
bio17_R <- resample(bio17, new_res, method = 'bilinear')
bio18_R <- resample(bio18, new_res, method = 'bilinear')
bio19_R <- resample(bio19, new_res, method = 'bilinear')

gc()

prec_R <- resample(prec, new_res, method = 'bilinear')
srad_R <- resample(srad, new_res, method = 'bilinear')
tavg_R <- resample(tavg, new_res, method = 'bilinear')
vapr_R <- resample(vapr, new_res, method = 'bilinear')
wind_R <- resample(wind, new_res, method = 'bilinear')
cc1_R <- resample(cc1, new_res, method = 'bilinear')
cc2_R <- resample(cc2, new_res, method = 'bilinear')
cc3_R <- resample(cc3, new_res, method = 'bilinear')
ndvi1_R <- resample(ndvi1, new_res, method = 'bilinear')
ndvi2_R <- resample(ndvi2, new_res, method = 'bilinear')
ndvi3_R <- resample(ndvi3, new_res, method = 'bilinear')

gc()

soil1_R <- resample(soil1, new_res, method = 'bilinear')
soil2_R <- resample(soil2, new_res, method = 'bilinear')
soil3_R <- resample(soil3, new_res, method = 'bilinear')
soil4_R <- resample(soil4, new_res, method = 'bilinear')
soil5_R <- resample(soil5, new_res, method = 'bilinear')
soil6_R <- resample(soil6, new_res, method = 'bilinear')
soil7_R <- resample(soil7, new_res, method = 'bilinear')
soil8_R <- resample(soil8, new_res, method = 'bilinear')
soil9_R <- resample(soil9, new_res, method = 'bilinear')

gc()

topo1_R <- resample(topo1, new_res, method = 'bilinear')
topo2_R <- resample(topo2, new_res, method = 'bilinear')
topo3_R <- resample(topo3, new_res, method = 'bilinear')
topo4_R <- resample(topo4, new_res, method = 'bilinear')
topo5_R <- resample(topo5, new_res, method = 'bilinear')
topo6_R <- resample(topo6, new_res, method = 'bilinear')
topo7_R <- resample(topo7, new_res, method = 'bilinear')
topo8_R <- resample(topo8, new_res, method = 'bilinear')
topo9_R <- resample(topo9, new_res, method = 'bilinear')

gc()

# 06 - Remove unneeded variables -----
remove(bio1)
remove(bio2)
remove(bio3)
remove(bio4)
remove(bio5)
remove(bio6)
remove(bio7)
remove(bio8)
remove(bio9)
remove(bio10)
remove(bio11)
remove(bio12)
remove(bio13)
remove(bio14)
remove(bio15)
remove(bio16)
remove(bio17)
remove(bio18)
remove(bio19)
remove(prec)
remove(srad)
remove(tavg)
remove(vapr)
remove(wind)
remove(cc1)
remove(cc2)
remove(cc3)
remove(ndvi1)
remove(ndvi2)
remove(ndvi3)
remove(soil1)
remove(soil2)
remove(soil3)
remove(soil4)
remove(soil5)
remove(soil6)
remove(soil7)
remove(soil8)
remove(soil9)
remove(topo1)
remove(topo2)
remove(topo3)
remove(topo4)
remove(topo5)
remove(topo6)
remove(topo7)
remove(topo8)
remove(topo9)

# 07 - Crop variables (Brazil extent) -----
Brasil <- getData('GADM', country= 'Brazil', level=1, path = "./VAR")
bio1_R_BR <- mask(crop(bio1_R, Brasil), Brasil)
bio2_R_BR <- mask(crop(bio2_R, Brasil), Brasil)
bio3_R_BR <- mask(crop(bio3_R, Brasil), Brasil)
bio4_R_BR <- mask(crop(bio4_R, Brasil), Brasil)
bio5_R_BR <- mask(crop(bio5_R, Brasil), Brasil)
bio6_R_BR <- mask(crop(bio6_R, Brasil), Brasil)
bio7_R_BR <- mask(crop(bio7_R, Brasil), Brasil)
bio8_R_BR <- mask(crop(bio8_R, Brasil), Brasil)
bio9_R_BR <- mask(crop(bio9_R, Brasil), Brasil)
bio10_R_BR <- mask(crop(bio10_R, Brasil), Brasil)
bio11_R_BR <- mask(crop(bio11_R, Brasil), Brasil)
bio12_R_BR <- mask(crop(bio12_R, Brasil), Brasil)
bio13_R_BR <- mask(crop(bio13_R, Brasil), Brasil)
bio14_R_BR <- mask(crop(bio14_R, Brasil), Brasil)
bio15_R_BR <- mask(crop(bio15_R, Brasil), Brasil)
bio16_R_BR <- mask(crop(bio16_R, Brasil), Brasil)
bio17_R_BR <- mask(crop(bio17_R, Brasil), Brasil)
bio18_R_BR <- mask(crop(bio18_R, Brasil), Brasil)
bio19_R_BR <- mask(crop(bio19_R, Brasil), Brasil)
prec_R_BR <- mask(crop(prec_R, Brasil), Brasil)
srad_R_BR <- mask(crop(srad_R, Brasil), Brasil)
tavg_R_BR <- mask(crop(tavg_R, Brasil), Brasil)
vapr_R_BR <- mask(crop(vapr_R, Brasil), Brasil)
wind_R_BR <- mask(crop(wind_R, Brasil), Brasil)
cc1_R_BR <- mask(crop(cc1_R, Brasil), Brasil)
cc2_R_BR <- mask(crop(cc2_R, Brasil), Brasil)
cc3_R_BR <- mask(crop(cc3_R, Brasil), Brasil)
ndvi1_R_BR <- mask(crop(ndvi1_R, Brasil), Brasil)
ndvi2_R_BR <- mask(crop(ndvi2_R, Brasil), Brasil)
ndvi3_R_BR <- mask(crop(ndvi3_R, Brasil), Brasil)
soil1_R_BR <- mask(crop(soil1_R, Brasil), Brasil)
soil2_R_BR <- mask(crop(soil2_R, Brasil), Brasil)
soil3_R_BR <- mask(crop(soil3_R, Brasil), Brasil)
soil4_R_BR <- mask(crop(soil4_R, Brasil), Brasil)
soil5_R_BR <- mask(crop(soil5_R, Brasil), Brasil)
soil6_R_BR <- mask(crop(soil6_R, Brasil), Brasil)
soil7_R_BR <- mask(crop(soil7_R, Brasil), Brasil)
soil8_R_BR <- mask(crop(soil8_R, Brasil), Brasil)
soil9_R_BR <- mask(crop(soil9_R, Brasil), Brasil)
topo1_R_BR <- mask(crop(topo1_R, Brasil), Brasil)
topo2_R_BR <- mask(crop(topo2_R, Brasil), Brasil)
topo3_R_BR <- mask(crop(topo3_R, Brasil), Brasil)
topo4_R_BR <- mask(crop(topo4_R, Brasil), Brasil)
topo5_R_BR <- mask(crop(topo5_R, Brasil), Brasil)
topo6_R_BR <- mask(crop(topo6_R, Brasil), Brasil)
topo7_R_BR <- mask(crop(topo7_R, Brasil), Brasil)
topo8_R_BR <- mask(crop(topo8_R, Brasil), Brasil)
topo9_R_BR <- mask(crop(topo9_R, Brasil), Brasil)

gc()

# 08 - Save files with cropped raster -----
rasterDir = "./BrasilMask"
writeRaster(bio1_R_BR, filename = file.path(rasterDir, "bio1_R_BR.tif"), format = "GTiff")
writeRaster(bio2_R_BR, filename = file.path(rasterDir, "bio2_R_BR.tif"), format = "GTiff")
writeRaster(bio3_R_BR, filename = file.path(rasterDir, "bio3_R_BR.tif"), format = "GTiff")
writeRaster(bio4_R_BR, filename = file.path(rasterDir, "bio4_R_BR.tif"), format = "GTiff")
writeRaster(bio5_R_BR, filename = file.path(rasterDir, "bio5_R_BR.tif"), format = "GTiff")
writeRaster(bio6_R_BR, filename = file.path(rasterDir, "bio6_R_BR.tif"), format = "GTiff")
writeRaster(bio7_R_BR, filename = file.path(rasterDir, "bio7_R_BR.tif"), format = "GTiff")
writeRaster(bio8_R_BR, filename = file.path(rasterDir, "bio8_R_BR.tif"), format = "GTiff")
writeRaster(bio9_R_BR, filename = file.path(rasterDir, "bio9_R_BR.tif"), format = "GTiff")
writeRaster(bio10_R_BR, filename = file.path(rasterDir, "bio10_R_BR.tif"), format = "GTiff")
writeRaster(bio11_R_BR, filename = file.path(rasterDir, "bio11_R_BR.tif"), format = "GTiff")
writeRaster(bio12_R_BR, filename = file.path(rasterDir, "bio12_R_BR.tif"), format = "GTiff")
writeRaster(bio13_R_BR, filename = file.path(rasterDir, "bio13_R_BR.tif"), format = "GTiff")
writeRaster(bio14_R_BR, filename = file.path(rasterDir, "bio14_R_BR.tif"), format = "GTiff")
writeRaster(bio15_R_BR, filename = file.path(rasterDir, "bio15_R_BR.tif"), format = "GTiff")
writeRaster(bio16_R_BR, filename = file.path(rasterDir, "bio16_R_BR.tif"), format = "GTiff")
writeRaster(bio17_R_BR, filename = file.path(rasterDir, "bio17_R_BR.tif"), format = "GTiff")
writeRaster(bio18_R_BR, filename = file.path(rasterDir, "bio18_R_BR.tif"), format = "GTiff")
writeRaster(bio19_R_BR, filename = file.path(rasterDir, "bio19_R_BR.tif"), format = "GTiff")
writeRaster(prec_R_BR, filename = file.path(rasterDir, "prec_R_BR.tif"), format = "GTiff")
writeRaster(srad_R_BR, filename = file.path(rasterDir, "srad_R_BR.tif"), format = "GTiff")
writeRaster(tavg_R_BR, filename = file.path(rasterDir, "tavg_R_BR.tif"), format = "GTiff")
writeRaster(vapr_R_BR, filename = file.path(rasterDir, "vapr_R_BR.tif"), format = "GTiff")
writeRaster(wind_R_BR, filename = file.path(rasterDir, "wind_R_BR.tif"), format = "GTiff")
writeRaster(cc1_R_BR, filename = file.path(rasterDir, "cc1_R_BR.tif"), format = "GTiff")
writeRaster(cc2_R_BR, filename = file.path(rasterDir, "cc2_R_BR.tif"), format = "GTiff")
writeRaster(cc3_R_BR, filename = file.path(rasterDir, "cc3_R_BR.tif"), format = "GTiff")
writeRaster(ndvi1_R_BR, filename = file.path(rasterDir, "ndvi1_R_BR.tif"), format = "GTiff")
writeRaster(ndvi2_R_BR, filename = file.path(rasterDir, "ndvi2_R_BR.tif"), format = "GTiff")
writeRaster(ndvi3_R_BR, filename = file.path(rasterDir, "ndvi3_R_BR.tif"), format = "GTiff")
writeRaster(soil1_R_BR, filename = file.path(rasterDir, "soil1_R_BR.tif"), format = "GTiff")
writeRaster(soil2_R_BR, filename = file.path(rasterDir, "soil2_R_BR.tif"), format = "GTiff")
writeRaster(soil3_R_BR, filename = file.path(rasterDir, "soil3_R_BR.tif"), format = "GTiff")
writeRaster(soil4_R_BR, filename = file.path(rasterDir, "soil4_R_BR.tif"), format = "GTiff")
writeRaster(soil5_R_BR, filename = file.path(rasterDir, "soil5_R_BR.tif"), format = "GTiff")
writeRaster(soil6_R_BR, filename = file.path(rasterDir, "soil6_R_BR.tif"), format = "GTiff")
writeRaster(soil7_R_BR, filename = file.path(rasterDir, "soil7_R_BR.tif"), format = "GTiff")
writeRaster(soil8_R_BR, filename = file.path(rasterDir, "soil8_R_BR.tif"), format = "GTiff")
writeRaster(soil9_R_BR, filename = file.path(rasterDir, "soil9_R_BR.tif"), format = "GTiff")
writeRaster(topo1_R_BR, filename = file.path(rasterDir, "topo1_R_BR.tif"), format = "GTiff")
writeRaster(topo2_R_BR, filename = file.path(rasterDir, "topo2_R_BR.tif"), format = "GTiff")
writeRaster(topo3_R_BR, filename = file.path(rasterDir, "topo3_R_BR.tif"), format = "GTiff")
writeRaster(topo4_R_BR, filename = file.path(rasterDir, "topo4_R_BR.tif"), format = "GTiff")
writeRaster(topo5_R_BR, filename = file.path(rasterDir, "topo5_R_BR.tif"), format = "GTiff")
writeRaster(topo6_R_BR, filename = file.path(rasterDir, "topo6_R_BR.tif"), format = "GTiff")
writeRaster(topo7_R_BR, filename = file.path(rasterDir, "topo7_R_BR.tif"), format = "GTiff")
writeRaster(topo8_R_BR, filename = file.path(rasterDir, "topo8_R_BR.tif"), format = "GTiff")
writeRaster(topo9_R_BR, filename = file.path(rasterDir, "topo9_R_BR.tif"), format = "GTiff")

# 09 - Reload cropped files ----
bio1_R_BR <- raster("./BrasilMask/bio1_R_BR.tif")
bio2_R_BR <- raster("./BrasilMask/bio2_R_BR.tif")
bio3_R_BR <- raster("./BrasilMask/bio3_R_BR.tif")
bio4_R_BR <- raster("./BrasilMask/bio4_R_BR.tif")
bio5_R_BR <- raster("./BrasilMask/bio5_R_BR.tif")
bio6_R_BR <- raster("./BrasilMask/bio6_R_BR.tif")
bio7_R_BR <- raster("./BrasilMask/bio7_R_BR.tif")
bio8_R_BR <- raster("./BrasilMask/bio8_R_BR.tif")
bio9_R_BR <- raster("./BrasilMask/bio9_R_BR.tif")
bio10_R_BR <- raster("./BrasilMask/bio10_R_BR.tif")
bio11_R_BR <- raster("./BrasilMask/bio11_R_BR.tif")
bio12_R_BR <- raster("./BrasilMask/bio12_R_BR.tif")
bio13_R_BR <- raster("./BrasilMask/bio13_R_BR.tif")
bio14_R_BR <- raster("./BrasilMask/bio14_R_BR.tif")
bio15_R_BR <- raster("./BrasilMask/bio15_R_BR.tif")
bio16_R_BR <- raster("./BrasilMask/bio16_R_BR.tif")
bio17_R_BR <- raster("./BrasilMask/bio17_R_BR.tif")
bio18_R_BR <- raster("./BrasilMask/bio18_R_BR.tif")
bio19_R_BR <- raster("./BrasilMask/bio19_R_BR.tif")
prec_R_BR <- raster("./BrasilMask/prec_R_BR.tif")
srad_R_BR <- raster("./BrasilMask/srad_R_BR.tif")
tavg_R_BR <- raster("./BrasilMask/tavg_R_BR.tif")
vapr_R_BR <- raster("./BrasilMask/vapr_R_BR.tif")
wind_R_BR <- raster("./BrasilMask/wind_R_BR.tif")
prec_R_BR <- raster("./BrasilMask/prec_R_BR.tif")
srad_R_BR <- raster("./BrasilMask/srad_R_BR.tif")
tavg_R_BR <- raster("./BrasilMask/tavg_R_BR.tif")
vapr_R_BR <- raster("./BrasilMask/vapr_R_BR.tif")
wind_R_BR <- raster("./BrasilMask/wind_R_BR.tif")
cc1_R_BR <- raster("./BrasilMask/cc1_R_BR.tif")
cc2_R_BR <- raster("./BrasilMask/cc2_R_BR.tif")
cc3_R_BR <- raster("./BrasilMask/cc3_R_BR.tif")
ndvi1_R_BR <- raster("./BrasilMask/ndvi1_R_BR.tif")
ndvi2_R_BR <- raster("./BrasilMask/ndvi2_R_BR.tif")
ndvi3_R_BR <- raster("./BrasilMask/ndvi3_R_BR.tif")
soil1_R_BR <- raster("./BrasilMask/soil1_R_BR.tif")
soil2_R_BR <- raster("./BrasilMask/soil2_R_BR.tif")
soil3_R_BR <- raster("./BrasilMask/soil3_R_BR.tif")
soil4_R_BR <- raster("./BrasilMask/soil4_R_BR.tif")
soil5_R_BR <- raster("./BrasilMask/soil5_R_BR.tif")
soil6_R_BR <- raster("./BrasilMask/soil6_R_BR.tif")
soil7_R_BR <- raster("./BrasilMask/soil7_R_BR.tif")
soil8_R_BR <- raster("./BrasilMask/soil8_R_BR.tif")
soil9_R_BR <- raster("./BrasilMask/soil9_R_BR.tif")
topo1_R_BR <- raster("./BrasilMask/topo1_R_BR.tif")
topo2_R_BR <- raster("./BrasilMask/topo2_R_BR.tif")
topo3_R_BR <- raster("./BrasilMask/topo3_R_BR.tif")
topo4_R_BR <- raster("./BrasilMask/topo4_R_BR.tif")
topo5_R_BR <- raster("./BrasilMask/topo5_R_BR.tif")
topo6_R_BR <- raster("./BrasilMask/topo6_R_BR.tif")
topo7_R_BR <- raster("./BrasilMask/topo7_R_BR.tif")
topo8_R_BR <- raster("./BrasilMask/topo8_R_BR.tif")
topo9_R_BR <- raster("./BrasilMask/topo9_R_BR.tif")

# 10 - Create biostacks ----
biostack_allvar <- stack(
  bio1_R_BR,
  bio2_R_BR,
  bio3_R_BR,
  bio4_R_BR,
  bio5_R_BR,
  bio6_R_BR,
  bio7_R_BR,
  bio8_R_BR,
  bio9_R_BR,
  bio10_R_BR,
  bio11_R_BR,
  bio12_R_BR,
  bio13_R_BR,
  bio14_R_BR,
  bio15_R_BR,
  bio16_R_BR,
  bio17_R_BR,
  bio18_R_BR,
  bio19_R_BR,
  prec_R_BR,
  srad_R_BR,
  tavg_R_BR,
  vapr_R_BR,
  wind_R_BR,
  topo1_R_BR,
  topo2_R_BR,
  topo3_R_BR,
  topo4_R_BR,
  topo5_R_BR,
  topo6_R_BR,
  topo7_R_BR,
  topo8_R_BR,
  topo9_R_BR,
  soil1_R_BR,
  soil2_R_BR,
  soil3_R_BR,
  soil4_R_BR,
  soil5_R_BR,
  soil6_R_BR,
  soil7_R_BR,
  soil8_R_BR,
  soil9_R_BR,
  cc1_R_BR,
  cc2_R_BR,
  cc3_R_BR,
  ndvi1_R_BR,
  ndvi2_R_BR,
  ndvi3_R_BR
)

# 11 - Get polygons ----
polygonDir <- "./cyrto22/buffer/"
cyrto_polygon <- readOGR(polygonDir, "accessible_area")
# extrap_polygon <- readOGR(polygonDir, "extrap_polygon")
plot(prec_R_BR, main="Prec Brasil")
plot(cyrto_polygon, add = T)
plot(extrap_polygon, add = T)

# 16 - Get and process distribution coordinates ----
cyrtopodium_matrix <- read.csv("./cyrto22/known_distrib/cyrto_distrib_new.csv")
cyrtopodium_matrix <- cyrtopodium_matrix %>% tidyr::drop_na(decimalLongitude, decimalLatitude)

buffer_urban_areas <- vect("./POLYGON/buffer_urban_areas.shp")

flags_spatial <- CoordinateCleaner::clean_coordinates(
  x = cyrtopodium_matrix, 
  species = "species",
  lon = "decimalLongitude", 
  lat = "decimalLatitude",
  tests = c(
            "capitals",
            "centroids",
            "duplicates",
            "equal",
            "gbif",
            "institutions",
            "urban",
            "validity",
            "zeros"
  ),
  urban_ref = buffer_urban_areas,
)

head(flags_spatial)
summary(flags_spatial)
cyrtopodium_matrix <- cyrtopodium_matrix %>% 
  dplyr::filter(flags_spatial$.summary == TRUE)

plot(cc3_cyrto, xlim=c(-20,30),ylim=c(10,60), main="Pontos de ocorrência X Bio13")
data(wrld_simpl)
plot(wrld_simpl, add = TRUE, border = 'darkgray', lwd = 1)
points(cyrtopodium_matrix$decimalLongitude, cyrtopodium_matrix$decimalLatitude, pch = 21, bg = 'blue', cex = 1)

dir.create("./cyrto22/known_distrib/thinned_new")
cyrtopodium_matrix_thin <- 
  thin( 
    loc.data = cyrtopodium_matrix, 
    lat.col = "decimalLatitude", long.col = "decimalLongitude", 
    spec.col = "species", 
    thin.par = 10,
    reps = 10, 
    locs.thinned.list.return = TRUE, 
    write.files = TRUE, 
    max.files = 1, 
    out.dir = "./cyrto22/known_distrib/thinned_new/", out.base = "cyrtopodium", 
    write.log.file = TRUE,
    log.file = "./cyrto22/known_distrib/thinned_new/cyrtopodium_log.txt"
  )

plotThin(cyrtopodium_matrix_thin)
cyrtopodium_matrix_thin = read.csv("./cyrto22/known_distrib/thinned_new/thinned_records.csv", sep=",")
View(cyrtopodium_matrix_thin)

plot(cc3_cyrto, xlim=c(-20,30),ylim=c(10,60), main="Pontos de ocorrência X CC3")
data(wrld_simpl)
plot(wrld_simpl, add = TRUE, border = 'darkgray', lwd = 1)
points(cyrtopodium_matrix$decimalLongitude, cyrtopodium_matrix$decimalLatitude, pch = 21, bg = 'blue', cex = 1)
points(cyrtopodium_matrix_thin$decimalLongitude, cyrtopodium_matrix_thin$decimalLatitude, pch = 21, bg = 'red', cex = 1)

# 12 - Crop variables (cyrto_polygon and extrapolation extents) ----
bio1_cyrto <- mask(crop(bio1_R_BR, cyrto_polygon), cyrto_polygon)
bio2_cyrto <- mask(crop(bio2_R_BR, cyrto_polygon), cyrto_polygon)
bio3_cyrto <- mask(crop(bio3_R_BR, cyrto_polygon), cyrto_polygon)
bio4_cyrto <- mask(crop(bio4_R_BR, cyrto_polygon), cyrto_polygon)
bio5_cyrto <- mask(crop(bio5_R_BR, cyrto_polygon), cyrto_polygon)
bio6_cyrto <- mask(crop(bio6_R_BR, cyrto_polygon), cyrto_polygon)
bio7_cyrto <- mask(crop(bio7_R_BR, cyrto_polygon), cyrto_polygon)
bio8_cyrto <- mask(crop(bio8_R_BR, cyrto_polygon), cyrto_polygon)
bio9_cyrto <- mask(crop(bio9_R_BR, cyrto_polygon), cyrto_polygon)
bio10_cyrto <- mask(crop(bio10_R_BR, cyrto_polygon), cyrto_polygon)
bio11_cyrto <- mask(crop(bio11_R_BR, cyrto_polygon), cyrto_polygon)
bio12_cyrto <- mask(crop(bio12_R_BR, cyrto_polygon), cyrto_polygon)
bio13_cyrto <- mask(crop(bio13_R_BR, cyrto_polygon), cyrto_polygon)
bio14_cyrto <- mask(crop(bio14_R_BR, cyrto_polygon), cyrto_polygon)
bio15_cyrto <- mask(crop(bio15_R_BR, cyrto_polygon), cyrto_polygon)
bio16_cyrto <- mask(crop(bio16_R_BR, cyrto_polygon), cyrto_polygon)
bio17_cyrto <- mask(crop(bio17_R_BR, cyrto_polygon), cyrto_polygon)
bio18_cyrto <- mask(crop(bio18_R_BR, cyrto_polygon), cyrto_polygon)
bio19_cyrto <- mask(crop(bio19_R_BR, cyrto_polygon), cyrto_polygon)
prec_cyrto <- mask(crop(prec_R_BR, cyrto_polygon), cyrto_polygon)
srad_cyrto <- mask(crop(srad_R_BR, cyrto_polygon), cyrto_polygon)
tavg_cyrto <- mask(crop(tavg_R_BR, cyrto_polygon), cyrto_polygon)
vapr_cyrto <- mask(crop(vapr_R_BR, cyrto_polygon), cyrto_polygon)
wind_cyrto <- mask(crop(wind_R_BR, cyrto_polygon), cyrto_polygon)
cc1_cyrto <- mask(crop(cc1_R_BR, cyrto_polygon), cyrto_polygon)
cc2_cyrto <- mask(crop(cc2_R_BR, cyrto_polygon), cyrto_polygon)
cc3_cyrto <- mask(crop(cc3_R_BR, cyrto_polygon), cyrto_polygon)
ndvi1_cyrto <- mask(crop(ndvi1_R_BR, cyrto_polygon), cyrto_polygon)
ndvi2_cyrto <- mask(crop(ndvi2_R_BR, cyrto_polygon), cyrto_polygon)
ndvi3_cyrto <- mask(crop(ndvi3_R_BR, cyrto_polygon), cyrto_polygon)
soil1_cyrto <- mask(crop(soil1_R_BR, cyrto_polygon), cyrto_polygon)
soil2_cyrto <- mask(crop(soil2_R_BR, cyrto_polygon), cyrto_polygon)
soil3_cyrto <- mask(crop(soil3_R_BR, cyrto_polygon), cyrto_polygon)
soil4_cyrto <- mask(crop(soil4_R_BR, cyrto_polygon), cyrto_polygon)
soil5_cyrto <- mask(crop(soil5_R_BR, cyrto_polygon), cyrto_polygon)
soil6_cyrto <- mask(crop(soil6_R_BR, cyrto_polygon), cyrto_polygon)
soil7_cyrto <- mask(crop(soil7_R_BR, cyrto_polygon), cyrto_polygon)
soil8_cyrto <- mask(crop(soil8_R_BR, cyrto_polygon), cyrto_polygon)
soil9_cyrto <- mask(crop(soil9_R_BR, cyrto_polygon), cyrto_polygon)
topo1_cyrto <- mask(crop(topo1_R_BR, cyrto_polygon), cyrto_polygon)
topo2_cyrto <- mask(crop(topo2_R_BR, cyrto_polygon), cyrto_polygon)
topo3_cyrto <- mask(crop(topo3_R_BR, cyrto_polygon), cyrto_polygon)
topo4_cyrto <- mask(crop(topo4_R_BR, cyrto_polygon), cyrto_polygon)
topo5_cyrto <- mask(crop(topo5_R_BR, cyrto_polygon), cyrto_polygon)
topo6_cyrto <- mask(crop(topo6_R_BR, cyrto_polygon), cyrto_polygon)
topo7_cyrto <- mask(crop(topo7_R_BR, cyrto_polygon), cyrto_polygon)
topo8_cyrto <- mask(crop(topo8_R_BR, cyrto_polygon), cyrto_polygon)
topo9_cyrto <- mask(crop(topo9_R_BR, cyrto_polygon), cyrto_polygon)

# plot(cc2_cyrto, add = T)

# bio1_extrap <- mask(crop(bio1_R_BR, extrap_polygon), extrap_polygon)
# bio2_extrap <- mask(crop(bio2_R_BR, extrap_polygon), extrap_polygon)
# bio3_extrap <- mask(crop(bio3_R_BR, extrap_polygon), extrap_polygon)
# bio4_extrap <- mask(crop(bio4_R_BR, extrap_polygon), extrap_polygon)
# bio5_extrap <- mask(crop(bio5_R_BR, extrap_polygon), extrap_polygon)
# bio6_extrap <- mask(crop(bio6_R_BR, extrap_polygon), extrap_polygon)
# bio7_extrap <- mask(crop(bio7_R_BR, extrap_polygon), extrap_polygon)
# bio8_extrap <- mask(crop(bio8_R_BR, extrap_polygon), extrap_polygon)
# bio9_extrap <- mask(crop(bio9_R_BR, extrap_polygon), extrap_polygon)
# bio10_extrap <- mask(crop(bio10_R_BR, extrap_polygon), extrap_polygon)
# bio11_extrap <- mask(crop(bio11_R_BR, extrap_polygon), extrap_polygon)
# bio12_extrap <- mask(crop(bio12_R_BR, extrap_polygon), extrap_polygon)
# bio13_extrap <- mask(crop(bio13_R_BR, extrap_polygon), extrap_polygon)
# bio14_extrap <- mask(crop(bio14_R_BR, extrap_polygon), extrap_polygon)
# bio15_extrap <- mask(crop(bio15_R_BR, extrap_polygon), extrap_polygon)
# bio16_extrap <- mask(crop(bio16_R_BR, extrap_polygon), extrap_polygon)
# bio17_extrap <- mask(crop(bio17_R_BR, extrap_polygon), extrap_polygon)
# bio18_extrap <- mask(crop(bio18_R_BR, extrap_polygon), extrap_polygon)
# bio19_extrap <- mask(crop(bio19_R_BR, extrap_polygon), extrap_polygon)
# prec_extrap <- mask(crop(prec_R_BR, extrap_polygon), extrap_polygon)
# srad_extrap <- mask(crop(srad_R_BR, extrap_polygon), extrap_polygon)
# tavg_extrap <- mask(crop(tavg_R_BR, extrap_polygon), extrap_polygon)
# vapr_extrap <- mask(crop(vapr_R_BR, extrap_polygon), extrap_polygon)
# wind_extrap <- mask(crop(wind_R_BR, extrap_polygon), extrap_polygon)
# cc1_extrap <- mask(crop(cc1_R_BR, extrap_polygon), extrap_polygon)
# cc2_extrap <- mask(crop(cc2_R_BR, extrap_polygon), extrap_polygon)
# cc3_extrap <- mask(crop(cc3_R_BR, extrap_polygon), extrap_polygon)
# ndvi1_extrap <- mask(crop(ndvi1_R_BR, extrap_polygon), extrap_polygon)
# ndvi2_extrap <- mask(crop(ndvi2_R_BR, extrap_polygon), extrap_polygon)
# ndvi3_extrap <- mask(crop(ndvi3_R_BR, extrap_polygon), extrap_polygon)
# soil1_extrap <- mask(crop(soil1_R_BR, extrap_polygon), extrap_polygon)
# soil2_extrap <- mask(crop(soil2_R_BR, extrap_polygon), extrap_polygon)
# soil3_extrap <- mask(crop(soil3_R_BR, extrap_polygon), extrap_polygon)
# soil4_extrap <- mask(crop(soil4_R_BR, extrap_polygon), extrap_polygon)
# soil5_extrap <- mask(crop(soil5_R_BR, extrap_polygon), extrap_polygon)
# soil6_extrap <- mask(crop(soil6_R_BR, extrap_polygon), extrap_polygon)
# soil7_extrap <- mask(crop(soil7_R_BR, extrap_polygon), extrap_polygon)
# soil8_extrap <- mask(crop(soil8_R_BR, extrap_polygon), extrap_polygon)
# soil9_extrap <- mask(crop(soil9_R_BR, extrap_polygon), extrap_polygon)
# topo1_extrap <- mask(crop(topo1_R_BR, extrap_polygon), extrap_polygon)
# topo2_extrap <- mask(crop(topo2_R_BR, extrap_polygon), extrap_polygon)
# topo3_extrap <- mask(crop(topo3_R_BR, extrap_polygon), extrap_polygon)
# topo4_extrap <- mask(crop(topo4_R_BR, extrap_polygon), extrap_polygon)
# topo5_extrap <- mask(crop(topo5_R_BR, extrap_polygon), extrap_polygon)
# topo6_extrap <- mask(crop(topo6_R_BR, extrap_polygon), extrap_polygon)
# topo7_extrap <- mask(crop(topo7_R_BR, extrap_polygon), extrap_polygon)
# topo8_extrap <- mask(crop(topo8_R_BR, extrap_polygon), extrap_polygon)
# topo9_extrap <- mask(crop(topo9_R_BR, extrap_polygon), extrap_polygon)

# 13 - Save rasters: predictors (accessible area) and projection area -----
rasterDir_cyrto = "./cyrto22/raster/accessible_area/"
writeRaster(bio1_cyrto, filename = file.path(rasterDir_cyrto, "bio1_cyrto.tif"), format = "GTiff")
writeRaster(bio2_cyrto, filename = file.path(rasterDir_cyrto, "bio2_cyrto.tif"), format = "GTiff")
writeRaster(bio3_cyrto, filename = file.path(rasterDir_cyrto, "bio3_cyrto.tif"), format = "GTiff")
writeRaster(bio4_cyrto, filename = file.path(rasterDir_cyrto, "bio4_cyrto.tif"), format = "GTiff")
writeRaster(bio5_cyrto, filename = file.path(rasterDir_cyrto, "bio5_cyrto.tif"), format = "GTiff")
writeRaster(bio6_cyrto, filename = file.path(rasterDir_cyrto, "bio6_cyrto.tif"), format = "GTiff")
writeRaster(bio7_cyrto, filename = file.path(rasterDir_cyrto, "bio7_cyrto.tif"), format = "GTiff")
writeRaster(bio8_cyrto, filename = file.path(rasterDir_cyrto, "bio8_cyrto.tif"), format = "GTiff")
writeRaster(bio9_cyrto, filename = file.path(rasterDir_cyrto, "bio9_cyrto.tif"), format = "GTiff")
writeRaster(bio10_cyrto, filename = file.path(rasterDir_cyrto, "bio10_cyrto.tif"), format = "GTiff")
writeRaster(bio11_cyrto, filename = file.path(rasterDir_cyrto, "bio11_cyrto.tif"), format = "GTiff")
writeRaster(bio12_cyrto, filename = file.path(rasterDir_cyrto, "bio12_cyrto.tif"), format = "GTiff")
writeRaster(bio13_cyrto, filename = file.path(rasterDir_cyrto, "bio13_cyrto.tif"), format = "GTiff")
writeRaster(bio14_cyrto, filename = file.path(rasterDir_cyrto, "bio14_cyrto.tif"), format = "GTiff")
writeRaster(bio15_cyrto, filename = file.path(rasterDir_cyrto, "bio15_cyrto.tif"), format = "GTiff")
writeRaster(bio16_cyrto, filename = file.path(rasterDir_cyrto, "bio16_cyrto.tif"), format = "GTiff")
writeRaster(bio17_cyrto, filename = file.path(rasterDir_cyrto, "bio17_cyrto.tif"), format = "GTiff")
writeRaster(bio18_cyrto, filename = file.path(rasterDir_cyrto, "bio18_cyrto.tif"), format = "GTiff")
writeRaster(bio19_cyrto, filename = file.path(rasterDir_cyrto, "bio19_cyrto.tif"), format = "GTiff")
writeRaster(prec_cyrto, filename = file.path(rasterDir_cyrto, "prec_cyrto.tif"), format = "GTiff")
writeRaster(srad_cyrto, filename = file.path(rasterDir_cyrto, "srad_cyrto.tif"), format = "GTiff")
writeRaster(tavg_cyrto, filename = file.path(rasterDir_cyrto, "tavg_cyrto.tif"), format = "GTiff")
writeRaster(vapr_cyrto, filename = file.path(rasterDir_cyrto, "vapr_cyrto.tif"), format = "GTiff")
writeRaster(wind_cyrto, filename = file.path(rasterDir_cyrto, "wind_cyrto.tif"), format = "GTiff")
writeRaster(cc1_cyrto, filename = file.path(rasterDir_cyrto, "cc1_cyrto.tif"), format = "GTiff")
writeRaster(cc2_cyrto, filename = file.path(rasterDir_cyrto, "cc2_cyrto.tif"), format = "GTiff")
writeRaster(cc3_cyrto, filename = file.path(rasterDir_cyrto, "cc3_cyrto.tif"), format = "GTiff")
writeRaster(ndvi1_cyrto, filename = file.path(rasterDir_cyrto, "ndvi1_cyrto.tif"), format = "GTiff")
writeRaster(ndvi2_cyrto, filename = file.path(rasterDir_cyrto, "ndvi2_cyrto.tif"), format = "GTiff")
writeRaster(ndvi3_cyrto, filename = file.path(rasterDir_cyrto, "ndvi3_cyrto.tif"), format = "GTiff")
writeRaster(soil1_cyrto, filename = file.path(rasterDir_cyrto, "soil1_cyrto.tif"), format = "GTiff")
writeRaster(soil2_cyrto, filename = file.path(rasterDir_cyrto, "soil2_cyrto.tif"), format = "GTiff")
writeRaster(soil3_cyrto, filename = file.path(rasterDir_cyrto, "soil3_cyrto.tif"), format = "GTiff")
writeRaster(soil4_cyrto, filename = file.path(rasterDir_cyrto, "soil4_cyrto.tif"), format = "GTiff")
writeRaster(soil5_cyrto, filename = file.path(rasterDir_cyrto, "soil5_cyrto.tif"), format = "GTiff")
writeRaster(soil6_cyrto, filename = file.path(rasterDir_cyrto, "soil6_cyrto.tif"), format = "GTiff")
writeRaster(soil7_cyrto, filename = file.path(rasterDir_cyrto, "soil7_cyrto.tif"), format = "GTiff")
writeRaster(soil8_cyrto, filename = file.path(rasterDir_cyrto, "soil8_cyrto.tif"), format = "GTiff")
writeRaster(soil9_cyrto, filename = file.path(rasterDir_cyrto, "soil9_cyrto.tif"), format = "GTiff")
writeRaster(topo1_cyrto, filename = file.path(rasterDir_cyrto, "topo1_cyrto.tif"), format = "GTiff")
writeRaster(topo2_cyrto, filename = file.path(rasterDir_cyrto, "topo2_cyrto.tif"), format = "GTiff")
writeRaster(topo3_cyrto, filename = file.path(rasterDir_cyrto, "topo3_cyrto.tif"), format = "GTiff")
writeRaster(topo4_cyrto, filename = file.path(rasterDir_cyrto, "topo4_cyrto.tif"), format = "GTiff")
writeRaster(topo5_cyrto, filename = file.path(rasterDir_cyrto, "topo5_cyrto.tif"), format = "GTiff")
writeRaster(topo6_cyrto, filename = file.path(rasterDir_cyrto, "topo6_cyrto.tif"), format = "GTiff")
writeRaster(topo7_cyrto, filename = file.path(rasterDir_cyrto, "topo7_cyrto.tif"), format = "GTiff")
writeRaster(topo8_cyrto, filename = file.path(rasterDir_cyrto, "topo8_cyrto.tif"), format = "GTiff")
writeRaster(topo9_cyrto, filename = file.path(rasterDir_cyrto, "topo9_cyrto.tif"), format = "GTiff")

# rasterDir_projection = "./raster/projection_area/"
# writeRaster(bio1_extrap, filename = file.path(rasterDir_projection, "bio1_extrap.tif"), format = "GTiff")
# writeRaster(bio2_extrap, filename = file.path(rasterDir_projection, "bio2_extrap.tif"), format = "GTiff")
# writeRaster(bio3_extrap, filename = file.path(rasterDir_projection, "bio3_extrap.tif"), format = "GTiff")
# writeRaster(bio4_extrap, filename = file.path(rasterDir_projection, "bio4_extrap.tif"), format = "GTiff")
# writeRaster(bio5_extrap, filename = file.path(rasterDir_projection, "bio5_extrap.tif"), format = "GTiff")
# writeRaster(bio6_extrap, filename = file.path(rasterDir_projection, "bio6_extrap.tif"), format = "GTiff")
# writeRaster(bio7_extrap, filename = file.path(rasterDir_projection, "bio7_extrap.tif"), format = "GTiff")
# writeRaster(bio8_extrap, filename = file.path(rasterDir_projection, "bio8_extrap.tif"), format = "GTiff")
# writeRaster(bio9_extrap, filename = file.path(rasterDir_projection, "bio9_extrap.tif"), format = "GTiff")
# writeRaster(bio10_extrap, filename = file.path(rasterDir_projection, "bio10_extrap.tif"), format = "GTiff")
# writeRaster(bio11_extrap, filename = file.path(rasterDir_projection, "bio11_extrap.tif"), format = "GTiff")
# writeRaster(bio12_extrap, filename = file.path(rasterDir_projection, "bio12_extrap.tif"), format = "GTiff")
# writeRaster(bio13_extrap, filename = file.path(rasterDir_projection, "bio13_extrap.tif"), format = "GTiff")
# writeRaster(bio14_extrap, filename = file.path(rasterDir_projection, "bio14_extrap.tif"), format = "GTiff")
# writeRaster(bio15_extrap, filename = file.path(rasterDir_projection, "bio15_extrap.tif"), format = "GTiff")
# writeRaster(bio16_extrap, filename = file.path(rasterDir_projection, "bio16_extrap.tif"), format = "GTiff")
# writeRaster(bio17_extrap, filename = file.path(rasterDir_projection, "bio17_extrap.tif"), format = "GTiff")
# writeRaster(bio18_extrap, filename = file.path(rasterDir_projection, "bio18_extrap.tif"), format = "GTiff")
# writeRaster(bio19_extrap, filename = file.path(rasterDir_projection, "bio19_extrap.tif"), format = "GTiff")
# writeRaster(prec_extrap, filename = file.path(rasterDir_projection, "prec_extrap.tif"), format = "GTiff")
# writeRaster(srad_extrap, filename = file.path(rasterDir_projection, "srad_extrap.tif"), format = "GTiff")
# writeRaster(tavg_extrap, filename = file.path(rasterDir_projection, "tavg_extrap.tif"), format = "GTiff")
# writeRaster(vapr_extrap, filename = file.path(rasterDir_projection, "vapr_extrap.tif"), format = "GTiff")
# writeRaster(wind_extrap, filename = file.path(rasterDir_projection, "wind_extrap.tif"), format = "GTiff")
# writeRaster(cc1_extrap, filename = file.path(rasterDir_projection, "cc1_extrap.tif"), format = "GTiff")
# writeRaster(cc2_extrap, filename = file.path(rasterDir_projection, "cc2_extrap.tif"), format = "GTiff")
# writeRaster(cc3_extrap, filename = file.path(rasterDir_projection, "cc3_extrap.tif"), format = "GTiff")
# writeRaster(ndvi1_extrap, filename = file.path(rasterDir_projection, "ndvi1_extrap.tif"), format = "GTiff")
# writeRaster(ndvi2_extrap, filename = file.path(rasterDir_projection, "ndvi2_extrap.tif"), format = "GTiff")
# writeRaster(ndvi3_extrap, filename = file.path(rasterDir_projection, "ndvi3_extrap.tif"), format = "GTiff")
# writeRaster(soil1_extrap, filename = file.path(rasterDir_projection, "soil1_extrap.tif"), format = "GTiff")
# writeRaster(soil2_extrap, filename = file.path(rasterDir_projection, "soil2_extrap.tif"), format = "GTiff")
# writeRaster(soil3_extrap, filename = file.path(rasterDir_projection, "soil3_extrap.tif"), format = "GTiff")
# writeRaster(soil4_extrap, filename = file.path(rasterDir_projection, "soil4_extrap.tif"), format = "GTiff")
# writeRaster(soil5_extrap, filename = file.path(rasterDir_projection, "soil5_extrap.tif"), format = "GTiff")
# writeRaster(soil6_extrap, filename = file.path(rasterDir_projection, "soil6_extrap.tif"), format = "GTiff")
# writeRaster(soil7_extrap, filename = file.path(rasterDir_projection, "soil7_extrap.tif"), format = "GTiff")
# writeRaster(soil8_extrap, filename = file.path(rasterDir_projection, "soil8_extrap.tif"), format = "GTiff")
# writeRaster(soil9_extrap, filename = file.path(rasterDir_projection, "soil9_extrap.tif"), format = "GTiff")
# writeRaster(topo1_extrap, filename = file.path(rasterDir_projection, "topo1_extrap.tif"), format = "GTiff")
# writeRaster(topo2_extrap, filename = file.path(rasterDir_projection, "topo2_extrap.tif"), format = "GTiff")
# writeRaster(topo3_extrap, filename = file.path(rasterDir_projection, "topo3_extrap.tif"), format = "GTiff")
# writeRaster(topo4_extrap, filename = file.path(rasterDir_projection, "topo4_extrap.tif"), format = "GTiff")
# writeRaster(topo5_extrap, filename = file.path(rasterDir_projection, "topo5_extrap.tif"), format = "GTiff")
# writeRaster(topo6_extrap, filename = file.path(rasterDir_projection, "topo6_extrap.tif"), format = "GTiff")
# writeRaster(topo7_extrap, filename = file.path(rasterDir_projection, "topo7_extrap.tif"), format = "GTiff")
# writeRaster(topo8_extrap, filename = file.path(rasterDir_projection, "topo8_extrap.tif"), format = "GTiff")
# writeRaster(topo9_extrap, filename = file.path(rasterDir_projection, "topo9_extrap.tif"), format = "GTiff")

# Call for saved cropped files (accessible and extrapolation area)

bio1_cyrto <- raster("./cyrto22/raster/accessible_area/bio1_cyrto.tif")
bio2_cyrto <- raster("./cyrto22/raster/accessible_area/bio2_cyrto.tif")
bio3_cyrto <- raster("./cyrto22/raster/accessible_area/bio3_cyrto.tif")
bio4_cyrto <- raster("./cyrto22/raster/accessible_area/bio4_cyrto.tif")
bio5_cyrto <- raster("./cyrto22/raster/accessible_area/bio5_cyrto.tif")
bio6_cyrto <- raster("./cyrto22/raster/accessible_area/bio6_cyrto.tif")
bio7_cyrto <- raster("./cyrto22/raster/accessible_area/bio7_cyrto.tif")
bio8_cyrto <- raster("./cyrto22/raster/accessible_area/bio8_cyrto.tif")
bio9_cyrto <- raster("./cyrto22/raster/accessible_area/bio9_cyrto.tif")
bio10_cyrto <- raster("./cyrto22/raster/accessible_area/bio10_cyrto.tif")
bio11_cyrto <- raster("./cyrto22/raster/accessible_area/bio11_cyrto.tif")
bio12_cyrto <- raster("./cyrto22/raster/accessible_area/bio12_cyrto.tif")
bio13_cyrto <- raster("./cyrto22/raster/accessible_area/bio13_cyrto.tif")
bio14_cyrto <- raster("./cyrto22/raster/accessible_area/bio14_cyrto.tif")
bio15_cyrto <- raster("./cyrto22/raster/accessible_area/bio15_cyrto.tif")
bio16_cyrto <- raster("./cyrto22/raster/accessible_area/bio16_cyrto.tif")
bio17_cyrto <- raster("./cyrto22/raster/accessible_area/bio17_cyrto.tif")
bio18_cyrto <- raster("./cyrto22/raster/accessible_area/bio18_cyrto.tif")
bio19_cyrto <- raster("./cyrto22/raster/accessible_area/bio19_cyrto.tif")
prec_cyrto <- raster("./cyrto22/raster/accessible_area/prec_cyrto.tif")
srad_cyrto <- raster("./cyrto22/raster/accessible_area/srad_cyrto.tif")
tavg_cyrto <- raster("./cyrto22/raster/accessible_area/tavg_cyrto.tif")
vapr_cyrto <- raster("./cyrto22/raster/accessible_area/vapr_cyrto.tif")
wind_cyrto <- raster("./cyrto22/raster/accessible_area/wind_cyrto.tif")
prec_cyrto <- raster("./cyrto22/raster/accessible_area/prec_cyrto.tif")
srad_cyrto <- raster("./cyrto22/raster/accessible_area/srad_cyrto.tif")
tavg_cyrto <- raster("./cyrto22/raster/accessible_area/tavg_cyrto.tif")
vapr_cyrto <- raster("./cyrto22/raster/accessible_area/vapr_cyrto.tif")
wind_cyrto <- raster("./cyrto22/raster/accessible_area/wind_cyrto.tif")
cc1_cyrto <- raster("./cyrto22/raster/accessible_area/cc1_cyrto.tif")
cc2_cyrto <- raster("./cyrto22/raster/accessible_area/cc2_cyrto.tif")
cc3_cyrto <- raster("./cyrto22/raster/accessible_area/cc3_cyrto.tif")
ndvi1_cyrto <- raster("./cyrto22/raster/accessible_area/ndvi1_cyrto.tif")
ndvi2_cyrto <- raster("./cyrto22/raster/accessible_area/ndvi2_cyrto.tif")
ndvi3_cyrto <- raster("./cyrto22/raster/accessible_area/ndvi3_cyrto.tif")
soil1_cyrto <- raster("./cyrto22/raster/accessible_area/soil1_cyrto.tif")
soil2_cyrto <- raster("./cyrto22/raster/accessible_area/soil2_cyrto.tif")
soil3_cyrto <- raster("./cyrto22/raster/accessible_area/soil3_cyrto.tif")
soil4_cyrto <- raster("./cyrto22/raster/accessible_area/soil4_cyrto.tif")
soil5_cyrto <- raster("./cyrto22/raster/accessible_area/soil5_cyrto.tif")
soil6_cyrto <- raster("./cyrto22/raster/accessible_area/soil6_cyrto.tif")
soil7_cyrto <- raster("./cyrto22/raster/accessible_area/soil7_cyrto.tif")
soil8_cyrto <- raster("./cyrto22/raster/accessible_area/soil8_cyrto.tif")
soil9_cyrto <- raster("./cyrto22/raster/accessible_area/soil9_cyrto.tif")
topo1_cyrto <- raster("./cyrto22/raster/accessible_area/topo1_cyrto.tif")
topo2_cyrto <- raster("./cyrto22/raster/accessible_area/topo2_cyrto.tif")
topo3_cyrto <- raster("./cyrto22/raster/accessible_area/topo3_cyrto.tif")
topo4_cyrto <- raster("./cyrto22/raster/accessible_area/topo4_cyrto.tif")
topo5_cyrto <- raster("./cyrto22/raster/accessible_area/topo5_cyrto.tif")
topo6_cyrto <- raster("./cyrto22/raster/accessible_area/topo6_cyrto.tif")
topo7_cyrto <- raster("./cyrto22/raster/accessible_area/topo7_cyrto.tif")
topo8_cyrto <- raster("./cyrto22/raster/accessible_area/topo8_cyrto.tif")
topo9_cyrto <- raster("./cyrto22/raster/accessible_area/topo9_cyrto.tif")

# Create Buffer Mask Stack -----
biostack_allvar_buffer <- stack(
  bio1_cyrto,
  bio2_cyrto,
  bio3_cyrto,
  bio4_cyrto,
  bio5_cyrto,
  bio6_cyrto,
  bio7_cyrto,
  bio8_cyrto,
  bio9_cyrto,
  bio10_cyrto,
  bio11_cyrto,
  bio12_cyrto,
  bio13_cyrto,
  bio14_cyrto,
  bio15_cyrto,
  bio16_cyrto,
  bio17_cyrto,
  bio18_cyrto,
  bio19_cyrto,
  prec_cyrto,
  srad_cyrto,
  tavg_cyrto,
  vapr_cyrto,
  wind_cyrto,
  cc1_cyrto,
  cc2_cyrto,
  cc3_cyrto,
  ndvi1_cyrto,
  ndvi2_cyrto,
  ndvi3_cyrto,
  soil1_cyrto,
  soil2_cyrto,
  soil3_cyrto,
  soil4_cyrto,
  soil5_cyrto,
  soil6_cyrto,
  soil7_cyrto,
  soil8_cyrto,
  soil9_cyrto,
  topo1_cyrto,
  topo2_cyrto,
  topo3_cyrto,
  topo4_cyrto,
  topo5_cyrto,
  topo6_cyrto,
  topo7_cyrto,
  topo8_cyrto,
  topo9_cyrto
)

names(biostack_allvar_buffer)
names_allvar_buffer_stack <- c("bio1_cyrto", "bio2_cyrto", "bio3_cyrto", "bio4_cyrto", "bio5_cyrto", "bio6_cyrto", "bio7_cyrto", "bio8_cyrto", "bio9_cyrto", "bio10_cyrto", "bio11_cyrto", "bio12_cyrto", "bio13_cyrto", "bio14_cyrto", "bio15_cyrto", "bio16_cyrto", "bio17_cyrto", "bio18_cyrto", "bio19_cyrto", "prec_cyrto", "srad_cyrto", "tavg_cyrto", "vapr_cyrto", "wind_cyrto", "cc1_cyrto", "cc2_cyrto", "cc3_cyrto", "ndvi1_cyrto", "ndvi2_cyrto", "ndvi3_cyrto", "soil1_cyrto", "soil2_cyrto", "soil3_cyrto", "soil4_cyrto", "soil5_cyrto", "soil6_cyrto", "soil7_cyrto", "soil8_cyrto", "soil9_cyrto", "topo1_cyrto", "topo2_cyrto", "topo3_cyrto", "topo4_cyrto", "topo5_cyrto", "topo6_cyrto", "topo7_cyrto", "topo8_cyrto", "topo9_cyrto")
names(biostack_allvar_buffer) <- names_allvar_buffer_stack
names(biostack_allvar_buffer)

plot(biostack_allvar_buffer)

# bio1_extrap <- raster("./raster/projection_area/bio1_extrap.tif")
# bio2_extrap <- raster("./raster/projection_area/bio2_extrap.tif")
# bio3_extrap <- raster("./raster/projection_area/bio3_extrap.tif")
# bio4_extrap <- raster("./raster/projection_area/bio4_extrap.tif")
# bio5_extrap <- raster("./raster/projection_area/bio5_extrap.tif")
# bio6_extrap <- raster("./raster/projection_area/bio6_extrap.tif")
# bio7_extrap <- raster("./raster/projection_area/bio7_extrap.tif")
# bio8_extrap <- raster("./raster/projection_area/bio8_extrap.tif")
# bio9_extrap <- raster("./raster/projection_area/bio9_extrap.tif")
# bio10_extrap <- raster("./raster/projection_area/bio10_extrap.tif")
# bio11_extrap <- raster("./raster/projection_area/bio11_extrap.tif")
# bio12_extrap <- raster("./raster/projection_area/bio12_extrap.tif")
# bio13_extrap <- raster("./raster/projection_area/bio13_extrap.tif")
# bio14_extrap <- raster("./raster/projection_area/bio14_extrap.tif")
# bio15_extrap <- raster("./raster/projection_area/bio15_extrap.tif")
# bio16_extrap <- raster("./raster/projection_area/bio16_extrap.tif")
# bio17_extrap <- raster("./raster/projection_area/bio17_extrap.tif")
# bio18_extrap <- raster("./raster/projection_area/bio18_extrap.tif")
# bio19_extrap <- raster("./raster/projection_area/bio19_extrap.tif")
# prec_extrap <- raster("./raster/projection_area/prec_extrap.tif")
# srad_extrap <- raster("./raster/projection_area/srad_extrap.tif")
# tavg_extrap <- raster("./raster/projection_area/tavg_extrap.tif")
# vapr_extrap <- raster("./raster/projection_area/vapr_extrap.tif")
# wind_extrap <- raster("./raster/projection_area/wind_extrap.tif")
# prec_extrap <- raster("./raster/projection_area/prec_extrap.tif")
# srad_extrap <- raster("./raster/projection_area/srad_extrap.tif")
# tavg_extrap <- raster("./raster/projection_area/tavg_extrap.tif")
# vapr_extrap <- raster("./raster/projection_area/vapr_extrap.tif")
# wind_extrap <- raster("./raster/projection_area/wind_extrap.tif")
# cc1_extrap <- raster("./raster/projection_area/cc1_extrap.tif")
# cc2_extrap <- raster("./raster/projection_area/cc2_extrap.tif")
# cc3_extrap <- raster("./raster/projection_area/cc3_extrap.tif")
# ndvi1_extrap <- raster("./raster/projection_area/ndvi1_extrap.tif")
# ndvi2_extrap <- raster("./raster/projection_area/ndvi2_extrap.tif")
# ndvi3_extrap <- raster("./raster/projection_area/ndvi3_extrap.tif")
# soil1_extrap <- raster("./raster/projection_area/soil1_extrap.tif")
# soil2_extrap <- raster("./raster/projection_area/soil2_extrap.tif")
# soil3_extrap <- raster("./raster/projection_area/soil3_extrap.tif")
# soil4_extrap <- raster("./raster/projection_area/soil4_extrap.tif")
# soil5_extrap <- raster("./raster/projection_area/soil5_extrap.tif")
# soil6_extrap <- raster("./raster/projection_area/soil6_extrap.tif")
# soil7_extrap <- raster("./raster/projection_area/soil7_extrap.tif")
# soil8_extrap <- raster("./raster/projection_area/soil8_extrap.tif")
# soil9_extrap <- raster("./raster/projection_area/soil9_extrap.tif")
# topo1_extrap <- raster("./raster/projection_area/topo1_extrap.tif")
# topo2_extrap <- raster("./raster/projection_area/topo2_extrap.tif")
# topo3_extrap <- raster("./raster/projection_area/topo3_extrap.tif")
# topo4_extrap <- raster("./raster/projection_area/topo4_extrap.tif")
# topo5_extrap <- raster("./raster/projection_area/topo5_extrap.tif")
# topo6_extrap <- raster("./raster/projection_area/topo6_extrap.tif")
# topo7_extrap <- raster("./raster/projection_area/topo7_extrap.tif")
# topo8_extrap <- raster("./raster/projection_area/topo8_extrap.tif")
# topo9_extrap <- raster("./raster/projection_area/topo9_extrap.tif")

# 14 - Variables correlation and importance evaluation -----

set.seed(999)

# Selected from VAR_IMP
backgr_varimpSelected <- randomPoints(biostack_allvar_buffer, 10000)
absclim_varimpSelected <- data.frame(raster::extract(biostack_allvar_buffer, backgr_varimpSelected))
absclim_varimpSelected_std <- data.frame(scale(absclim_varimpSelected))
M_varimpSelected <- cor(absclim_varimpSelected_std)
write.csv(M_varimpSelected, "./cyrto_gluti_final/var_imp_analyses/cor_varimp.csv")

pdf(file = "./cyrto_gluti_final/var_imp_analyses/corrplot.pdf", width = 10, height = 10)
corrplot(M_varimpSelected, upper = "square", lower = "shade", insig = 'blank', number.cex = 0.8)
dev.off()

vCorr <- vifcor(biostack_allvar_buffer, th = 0.7)
vStep <- vifstep(biostack_allvar_buffer, th = 10)

write.table(vCorr@excluded, file = "./cyrto_gluti_final/var_imp_analyses/cor_varimp_vifcor_excluded.txt")
write.table(vCorr@corMatrix, file = "./cyrto_gluti_final/var_imp_analyses/cor_varimp_vifcor_corMatrix.txt")
write.table(vCorr@results, file = "./cyrto_gluti_final/var_imp_analyses/cor_varimp_vifcor_results.txt")

write.table(vStep@excluded, file = "./cyrto_gluti_final/var_imp_analyses/cor_varimp_vifstep_excluded.txt")
write.table(vStep@corMatrix, file = "./cyrto_gluti_final/var_imp_analyses/cor_varimp_vifstep_corMatrix.txt")
write.table(vStep@results, file = "./cyrto_gluti_final/var_imp_analyses/cor_varimp_vifstep_results.txt")

# 15 - Stack non-correlated variables ----
noCorr_stack <- stack(
  bio14_cyrto,
  bio3_cyrto,
  bio7_cyrto,
  bio8_cyrto,
  cc2_cyrto,
  cc3_cyrto,
  ndvi1_cyrto,
  ndvi3_cyrto,
  soil1_cyrto,
  soil2_cyrto,
  soil3_cyrto,
  soil6_cyrto,
  soil7_cyrto,
  soil8_cyrto,
  soil9_cyrto,
  srad_cyrto,
  topo2_cyrto,
  topo3_cyrto,
  topo4_cyrto,
  topo6_cyrto,
  topo7_cyrto,
  topo8_cyrto,
  topo9_cyrto,
  wind_cyrto
)

names(noCorr_stack)
names_allvar_buffer_stack <- c("bio14_cyrto", "bio3_cyrto", "bio7_cyrto", "bio8_cyrto", "cc2_cyrto", "cc3_cyrto", "ndvi1_cyrto", "ndvi3_cyrto", "soil1_cyrto", "soil2_cyrto", "soil3_cyrto", "soil6_cyrto", "soil7_cyrto", "soil8_cyrto", "soil9_cyrto", "srad_cyrto", "topo2_cyrto", "topo3_cyrto", "topo4_cyrto", "topo6_cyrto", "topo7_cyrto", "topo8_cyrto", "topo9_cyrto", "wind_cyrto")
names(noCorr_stack) <- names_allvar_buffer_stack
names(noCorr_stack)

# Principal Component Analysis of selected data (as above)
# backgr_Selected <- randomPoints(noCorr_stack, 10000)
# absclim_Selected <- data.frame(raster::extract(noCorr_stack, backgr_Selected))
# absclim_Selected_std <- data.frame(scale(absclim_Selected))

# write.csv(absclim_Selected_std, "./pca/selected_df_for_PCA.csv")
# selected_df <- read.csv("./pca/selected_df_for_PCA.csv")
# selected_df <- selected_df %>% tidyr::drop_na()
# selected_df <- selected_df[-1]
# selected_df_pca <- princomp(selected_df, cor = TRUE, scores = TRUE)
# write.csv(selected_df_pca[['loadings']], "./pca/selected_df_pcaLoadings_for_PCA.csv")
# write.csv(selected_df_pca[['scores']], "./pca/selected_df_pcaScores_for_PCA.csv")
# write.csv(selected_df_pca[['sdev']], "./pca/selected_df_pcaSdev_for_PCA.csv")
# plot(selected_df_pca)
# biplot(selected_df_pca, pc.biplot = TRUE)

plot(noCorr_stack)
 
# Write thinned records data for modelling
# write.table(cyrtopodium_matrix_thin, "cyrto_ENMTML.txt", sep = "\t", dec = ".", row.names = FALSE, col.names = TRUE)


# 17 - BIOMOD Modelling ----
# Generate pseudo-absences for bioclim2
resp_occ = as.numeric("resp_occ")
str(resp_occ)
cyrtopodium_matrix_thin[,"resp_occ"] = 1
resp_occ = cyrtopodium_matrix_thin$resp_occ
is.numeric(resp_occ)
colnames(cyrtopodium_matrix_thin)
resp_name <- 'cyrto'
is.numeric(cyrtopodium_matrix_thin$resp_occ)
myResp <- as.numeric(cyrtopodium_matrix_thin[,"resp_occ"])
myRespXY <- cyrtopodium_matrix_thin[which(myResp == 1), c("decimalLongitude", "decimalLatitude")]
myResp <- reclassify(subset(noCorr_stack, 1, drop = TRUE), c(-Inf, Inf, 0))
myResp[cellFromXY(myResp, myRespXY)] <- 1

bm_cyrto100disk = BIOMOD_FormatingData(resp.name = resp_name,
                                       resp.var = resp_occ,
                                       expl.var = noCorr_stack,
                                       resp.xy = myRespXY,
                                       PA.nb.rep = 5,
                                       PA.nb.absences = 450, 
                                       PA.strategy = "disk", 
                                       PA.dist.min = 50000)

bm_cyrto100disk
plot(bm_cyrto100disk)

# Model options
modelo_op <- BIOMOD_ModelingOptions(
  GAM = list(
    algo = "GAM_gam"
))

# Unload namespaces due to conflict
unloadNamespace("ecospat")
unloadNamespace("vegan")

# Modeling for var importance selecion
cyrto1model = BIOMOD_Modeling(
  bm.format = bm_cyrto100disk,
  models = c("RF", 
             "GBM", 
             "GAM", 
             "GLM", 
             "MAXENT.Phillips.2"),
  bm.options = modelo_op,
  nb.rep = 5,
  data.split.perc = 70,
  var.import = 5,
  metric.eval = c("TSS", "ROC"),
  save.output = TRUE,
  scale.models = FALSE,
  do.full.models = TRUE,
  modeling.id = "cyrto_noCorrStack_final"
)

cyrto1model

# Summarizing varibles importance
var_import_cyrto1 = get_variables_importance(cyrto1model, as.data.frame = TRUE) 
var_import_cyrto1
var_import_eval_cyrto1 = get_evaluations(cyrto1model, as.data.frame = TRUE)
var_import_eval_cyrto1

# Compute variables importance
# Represent variables importance
pdf(file = "./cyrto_gluti_final/var_imp_analyses/varImp_Eval.pdf", width = 8, height = 6)
var_import_eval_mean_cyrto1 <- bm_PlotEvalMean(bm.out = cyrto1model)
dev.off()

pdf(file = "./cyrto_gluti_final/var_imp_analyses/varImp_boxPlots.pdf", width = 15, height = 10)
var_import_PlotEvalBoxplot_pa_cyrto1 <- bm_PlotEvalBoxplot(bm.out = cyrto1model, group.by = c('algo', 'dataset'))
var_import_PlotEvalBoxplot_run_cyrto1 <- bm_PlotEvalBoxplot(bm.out = cyrto1model, group.by = c('algo', 'run'))
var_import_PlotEvalBoxplot_expVar1_cyrto1 <- bm_PlotVarImpBoxplot(bm.out = cyrto1model, group.by = c('expl.var', 'algo', 'run'))
var_import_PlotEvalBoxplot_expVar2_cyrto1 <- bm_PlotVarImpBoxplot(bm.out = cyrto1model, group.by = c('expl.var', 'algo', 'dataset'))
dev.off()
# bm_PlotVarImpBoxplot(bm.out = cyrto1model, group.by = c('algo', 'expl.var', 'dataset'))

# Represent response curves
pdf(file = "./cyrto_gluti_final/var_imp_analyses/respCurve_noCorr.pdf", width = 15, height = 15)
resp_curve_mean_cyrto_ALL <- bm_PlotResponseCurves(bm.out = cyrto1model, 
                                               models.chosen = get_built_models(cyrto1model)[c(1:300)], 
                                               fixed.var = 'mean')
resp_curve_mean_cyrto_RF <- bm_PlotResponseCurves(bm.out = cyrto1model, 
                                               models.chosen = get_built_models(cyrto1model)[c(1, 6, 11, 16, 21, 26, 31, 36, 41, 46, 51, 56, 61, 66, 71, 76, 81, 86, 91, 96, 101, 106, 111, 116, 121, 126, 131, 136, 141, 146, 151, 156, 161, 166, 171, 176, 181, 186, 191, 196, 201, 206, 211, 216, 221, 226, 231, 236, 241, 246, 251, 256, 261, 266, 271, 276, 281, 286, 291, 296)], 
                                               fixed.var = 'mean')
resp_curve_mean_cyrto_GBM <- bm_PlotResponseCurves(bm.out = cyrto1model, 
                                               models.chosen = get_built_models(cyrto1model)[c(2, 7, 12, 17, 22, 27, 32, 37, 42, 47, 52, 57, 62, 67, 72, 77, 82, 87, 92, 97, 102, 107, 112, 117, 122, 127, 132, 137, 142, 147, 152, 157, 162, 167, 172, 177, 182, 187, 192, 197, 202, 207, 212, 217, 222, 227, 232, 237, 242, 247, 252, 257, 262, 267, 272, 277, 282, 287, 292, 297)], 
                                               fixed.var = 'mean')
resp_curve_mean_cyrto_GAM <- bm_PlotResponseCurves(bm.out = cyrto1model, 
                                               models.chosen = get_built_models(cyrto1model)[c(3, 8, 13, 18, 23, 28, 33, 38, 43, 48, 53, 58, 63, 68, 73, 78, 83, 88, 93, 98, 103, 108, 113, 118, 123, 128, 133, 138, 143, 148, 153, 158, 163, 168, 173, 178, 183, 188, 193, 198, 203, 208, 213, 218, 223, 228, 233, 238, 243, 248, 253, 258, 263, 268, 273, 278, 283, 288, 293, 298)], 
                                               fixed.var = 'mean')
resp_curve_mean_cyrto_GLM <- bm_PlotResponseCurves(bm.out = cyrto1model, 
                                               models.chosen = get_built_models(cyrto1model)[c(4, 9, 14, 19, 24, 29, 34, 39, 44, 49, 54, 59, 64, 69, 74, 79, 84, 89, 94, 99, 104, 109, 114, 119, 124, 129, 134, 139, 144, 149, 154, 159, 164, 169, 174, 179, 184, 189, 194, 199, 204, 209, 214, 219, 224, 229, 234, 239, 244, 249, 254, 259, 264, 269, 274, 279, 284, 289, 294, 299)], 
                                               fixed.var = 'mean')
resp_curve_mean_cyrto_MAXENT <- bm_PlotResponseCurves(bm.out = cyrto1model, 
                                               models.chosen = get_built_models(cyrto1model)[c(5, 10, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60, 65, 70, 75, 80, 85, 90, 95, 100, 105, 110, 115, 120, 125, 130, 135, 140, 145, 150, 155, 160, 165, 170, 175, 180, 185, 190, 195, 200, 205, 210, 215, 220, 225, 230, 235, 240, 245, 250, 255, 260, 265, 270, 275, 280, 285, 290, 295, 300)], 
                                               fixed.var = 'mean')
dev.off()

write.table(var_import_cyrto1, "./cyrto_gluti_final/var_imp_analyses/var_import_cyrto.txt")
write.table(var_import_eval_cyrto1, "./cyrto_gluti_final/var_imp_analyses/var_import_eval_cyrto.txt")
write.table(resp_curve_mean_cyrto_ALL$tab, "./cyrto_gluti_final/var_imp_analyses/resp_curve_cyrto_ALL.txt")

# Stacking final variables selection
varImp_cyrto_stack <- stack(
  bio3_cyrto,
  soil8_cyrto,
  soil7_cyrto,
  topo9_cyrto,
  soil3_cyrto,
  bio14_cyrto
)

names(varImp_cyrto_stack)
names_varImp_cyrto_stack <- c("bio3_cyrto", "soil8_cyrto", "soil7_cyrto", "topo9_cyrto", "soil3_cyrto", "bio14_cyrto")
names(varImp_cyrto_stack) <- names_varImp_cyrto_stack
names(varImp_cyrto_stack)


# Generate pseudo-absences for final model
set.seed(999)
resp_occ = as.numeric("resp_occ")
str(resp_occ)
cyrtopodium_matrix_thin[,"resp_occ"] = 1
resp_occ = cyrtopodium_matrix_thin$resp_occ
is.numeric(resp_occ)
colnames(cyrtopodium_matrix_thin)
model_folder <- "./cyrto_gluti_final_v8/model/"
resp_name <- 'cyrto'
is.numeric(cyrtopodium_matrix_thin$resp_occ)
myResp <- as.numeric(cyrtopodium_matrix_thin[,"resp_occ"])
myRespXY <- cyrtopodium_matrix_thin[which(myResp == 1), c("decimalLongitude", "decimalLatitude")]
myResp <- reclassify(subset(varImp_cyrto_stack, 1, drop = TRUE), c(-Inf, Inf, 0))
myResp[cellFromXY(myResp, myRespXY)] <- 1

bm_cyrto100disk2 = BIOMOD_FormatingData(resp.var = resp_occ,
                                        dir.name = model_folder,
                                        expl.var = varImp_cyrto_stack,
                                        resp.xy = myRespXY,
                                        resp.name = resp_name,
                                        PA.nb.rep = 5,
                                        PA.nb.absences = 450, 
                                        PA.strategy = "disk", 
                                        PA.dist.min = 50000)

# bm_cyrto100disk2
# 
# plot(bm_cyrto100disk2)

# Modeling final model
cyrto1model2 = BIOMOD_Modeling(
  bm.format = bm_cyrto100disk2,
  models = c("RF", 
             "GBM", 
             "GAM", 
             "GLM", 
             "MAXENT.Phillips.2"),
  bm.options = modelo_op,
  nb.rep = 5,
  data.split.perc = 70,
  var.import = 5,
  metric.eval = c("TSS", "ROC"),
  save.output = TRUE,
  scale.models = FALSE,
  do.full.models = TRUE,
  modeling.id = "cyrto_final_model",
  seed.val = 999
)

# cyrto1model2

# Projecting final model
projection_cyrto_final <- BIOMOD_Projection(
  bm.mod = cyrto1model2, 
  new.env = varImp_cyrto_stack,
  proj.name = "cyrto_final_model",
  models.chosen = "all",
  metric.binary = c("TSS", "ROC"),
  output.format = ".img", 
  compress = TRUE,
  build.clamping.mask = TRUE,
)
 
# plot(projection_cyrto_final, str.grep = "RF")
# plot(projection_cyrto_final, str.grep = "GLM")
# plot(projection_cyrto_final, str.grep = "GAM")
# plot(projection_cyrto_final, str.grep = "GBM")
# plot(projection_cyrto_final, str.grep = "MAXENT.Phillips.2")

# Saving individual models rasters
cyrto1_rf <- get_predictions(
  projection_cyrto_final,
  model = "RF",
)

cyrto1_glm = get_predictions(
  projection_cyrto_final,
  model = "GLM",
)

cyrto1_gam = get_predictions(
  projection_cyrto_final,
  model = "GAM",
)

cyrto1_gbm = get_predictions(
  projection_cyrto_final,
  model = "GBM",
)

cyrto1_maxEnt = get_predictions(
  projection_cyrto_final,
  model = "MAXENT.Phillips.2",
)

writeRaster(cyrto1_rf, filename = "./cyrto_gluti_final_v8/projections/rf.tif", format = "GTiff")
writeRaster(cyrto1_glm, filename = "./cyrto_gluti_final_v8/projections/glm.tif", format = "GTiff")
writeRaster(cyrto1_gam, filename = "./cyrto_gluti_final_v8/projections/gam.tif", format = "GTiff")
writeRaster(cyrto1_gbm, filename = "./cyrto_gluti_final_v8/projections/gbm.tif", format = "GTiff")
writeRaster(cyrto1_maxEnt, filename = "./cyrto_gluti_final_v8/projections/maxEnt.tif", format = "GTiff")

# Models evaluations

pdf(file = "./cyrto_gluti_final_v8/model/Algo_Eval.pdf", width = 9.18, height = 4.74)
perform1_cyrto =  bm_PlotEvalMean(cyrto1model2, metric.eval = c("TSS", "ROC"), group.by = "algo", do.plot = TRUE)
perform2_cyrto =  bm_PlotEvalMean(cyrto1model2, metric.eval = c("TSS", "ROC"), group.by = "dataset", do.plot = TRUE)
perform3_cyrto =  bm_PlotEvalMean(cyrto1model2, metric.eval = c("TSS", "ROC"), group.by = "run", do.plot = TRUE)
dev.off()

# Summarizing varibles importance final model
var_import_cyrto2 = get_variables_importance(cyrto1model2, as.data.frame = TRUE) 
var_import_cyrto2
var_import_eval_cyrto2 = get_evaluations(cyrto1model2, as.data.frame = TRUE)
var_import_eval_cyrto2

pdf(file = "./cyrto_gluti_final_v8/model/Algo_Eval_boxPlot_PA-RUNS.pdf", width = 10, height = 8)
var_import_PlotEvalBoxplot_pa_cyrto2 <- bm_PlotEvalBoxplot(bm.out = cyrto1model2, group.by = c('algo', 'dataset'))
var_import_PlotEvalBoxplot_run_cyrto2 <- bm_PlotEvalBoxplot(bm.out = cyrto1model2, group.by = c('algo', 'run'))
var_import_PlotEvalBoxplot_pa1_cyrto2 <- bm_PlotVarImpBoxplot(bm.out = cyrto1model2, group.by = c('expl.var', 'algo', 'dataset'))
var_import_PlotEvalBoxplot_run2_cyrto2 <- bm_PlotVarImpBoxplot(bm.out = cyrto1model2, group.by = c('expl.var', 'algo', 'run'))
dev.off()

write.csv(var_import_cyrto2, "./cyrto_gluti_final_v8/model/eval/var_imp.csv")
write.csv(var_import_eval_cyrto2, "./cyrto_gluti_final_v8/model/eval/var_imp_eval.csv")

# bm_PlotVarImpBoxplot(bm.out = cyrto1model2, group.by = c('algo', 'expl.var', 'dataset'))
# bm_PlotVarImpBoxplot(bm.out = cyrto1model2, group.by = c("run", "expl.var", "algo"))

# Drawing response curves
pdf(file = "./cyrto_gluti_final_v8/model/resp_curve/all_resp_curve.pdf", width = 15, height = 10)
resp_curve_mean_cyrto_RF_FINAL <- bm_PlotResponseCurves(bm.out = cyrto1model2, 
                                                  models.chosen = get_built_models(cyrto1model2)[c(1, 6, 11, 16, 21, 31, 36, 41, 46, 51, 61, 66, 71, 76, 81, 91, 96, 101, 106, 111, 121, 126, 131, 136, 141, 151, 156, 161, 166, 171, 181, 186, 191, 196, 201, 211, 216, 221, 226, 231, 241, 246, 251, 256, 261, 271, 276, 281, 286, 291)])
resp_curve_mean_cyrto_RF_FINAL_FULL <- bm_PlotResponseCurves(bm.out = cyrto1model2, 
                                                  models.chosen = get_built_models(cyrto1model2)[c(26, 56, 86, 116, 146, 176, 206, 236, 266, 296)])
resp_curve_mean_cyrto_GBM_FINAL <- bm_PlotResponseCurves(bm.out = cyrto1model2, 
                                                  models.chosen = get_built_models(cyrto1model2)[c(2, 7, 12, 17, 22, 32, 37, 42, 47, 52, 62, 67, 72, 77, 82, 92, 97, 102, 107, 112, 122, 127, 132, 137, 142, 152, 157, 162, 167, 172, 182, 187, 192, 197, 202, 212, 217, 222, 227, 232, 242, 247, 252, 257, 262, 272, 277, 282, 287, 292)])
resp_curve_mean_cyrto_GBM_FINAL_FULL <- bm_PlotResponseCurves(bm.out = cyrto1model2, 
                                                  models.chosen = get_built_models(cyrto1model2)[c(27, 57, 87, 117, 147, 177, 207, 237, 267, 297)])
resp_curve_mean_cyrto_GAM_FINAL <- bm_PlotResponseCurves(bm.out = cyrto1model2, 
                                                  models.chosen = get_built_models(cyrto1model2)[c(3, 8, 13, 18, 23, 33, 38, 43, 48, 53, 63, 68, 73, 78, 83, 93, 98, 103, 108, 113, 123, 128, 133, 138, 143, 153, 158, 163, 168, 173, 183, 188, 193, 198, 203, 213, 218, 223, 228, 233, 243, 248, 253, 258, 263, 273, 278, 283, 288, 293)])
resp_curve_mean_cyrto_GAM_FINAL_FULL <- bm_PlotResponseCurves(bm.out = cyrto1model2, 
                                                  models.chosen = get_built_models(cyrto1model2)[c(28, 58, 88, 118, 148, 178, 208, 238, 268, 298)])
resp_curve_mean_cyrto_GLM_FINAL <- bm_PlotResponseCurves(bm.out = cyrto1model2, 
                                                  models.chosen = get_built_models(cyrto1model2)[c(4, 9, 14, 19, 24, 34, 39, 44, 49, 54, 64, 69, 74, 79, 84, 94, 99, 104, 109, 114, 124, 129, 134, 139, 144, 154, 159, 164, 169, 174, 184, 189, 194, 199, 204, 214, 219, 224, 229, 234, 244, 249, 254, 259, 264, 274, 279, 284, 289, 294)])
resp_curve_mean_cyrto_GLM_FINAL_FULL <- bm_PlotResponseCurves(bm.out = cyrto1model2, 
                                                  models.chosen = get_built_models(cyrto1model2)[c(29, 59, 89, 119, 149, 179, 209, 239, 269, 299, 329)])
resp_curve_mean_cyrto_MAXENT_FINAL <- bm_PlotResponseCurves(bm.out = cyrto1model2, 
                                                  models.chosen = get_built_models(cyrto1model2)[c(5, 10, 15, 20, 25, 35, 40, 45, 50, 55, 65, 70, 75, 80, 85, 95, 100, 105, 110, 115, 125, 130, 135, 140, 145, 155, 160, 165, 170, 175, 185, 190, 195, 200, 205, 215, 220, 225, 230, 235, 245, 250, 255, 260, 265, 275, 280, 285, 290, 295)])
resp_curve_mean_cyrto_MAXENT_FINAL_FULL <- bm_PlotResponseCurves(bm.out = cyrto1model2, 
                                                  models.chosen = get_built_models(cyrto1model2)[c(30, 60, 90, 120, 150, 180, 210, 240, 270, 300)])
dev.off()

# Ensemble model
cyrto_ensemble_DA <- BIOMOD_EnsembleModeling(
  bm.mod = cyrto1model2, 
  models.chosen  = "all",
  em.by = "all" , 
  metric.select = c("TSS", "ROC"),
  metric.select.thresh = c(0.7, 0.9), 
  metric.eval = c("TSS", "ROC"),
  prob.mean = TRUE, 
  prob.cv = TRUE,
  prob.ci = FALSE,
  prob.ci.alpha = 0.05,
  prob.median = FALSE, 
  committee.averaging = TRUE, 
  prob.mean.weight = TRUE,
  nb.cpu = 6,
  prob.mean.weight.decay = "proportional")

# Retrieving ensemble information
ens_formal_data <- get_formal_data(cyrto_ensemble_DA)
ens_formal_data

ens_built_models <- get_built_models(cyrto_ensemble_DA)
ens_built_models

ens_needed_models <- get_needed_models(cyrto_ensemble_DA, selected.models = "cyrto_EMwmeanByTSS_mergedAlgo_mergedRun_mergedData")
ens_needed_models
write.csv(ens_needed_models, "./cyrto_gluti_final_v8/model/ensemble/needed_models_EMwmeanByTSS.csv")

ens_kept_models <- get_kept_models(cyrto_ensemble_DA, model = cyrto1model2)
ens_kept_models[4]
write.csv(ens_kept_models[4], "./cyrto_gluti_final_v8/model/ensemble/kept_models_WMean.csv")

cyrto1_ens <- get_predictions(
  cyrto_ensemble_DA,
  as.data.frame = TRUE
)
write.csv(cyrto1_ens, "./cyrto_gluti_final_v8/model/ensemble/cyrto_ens_predictions.csv")


# Ensemble model evaluations
var_import_eval_cyrto3 = get_evaluations(cyrto_ensemble_DA, as.data.frame = TRUE)
var_import_eval_cyrto3

pdf(file = "./cyrto_gluti_final_v8/model/ensemble/Ensemble_Eval_boxPlot_PA-RUNS.pdf", width = 10, height = 8)
var_import_eval_mean_cyrto3 <- bm_PlotEvalMean(bm.out = cyrto_ensemble_DA)
var_import_PlotEvalBoxplot_pa_cyrto3 <- bm_PlotEvalBoxplot(bm.out = cyrto_ensemble_DA, group.by = c('algo', 'dataset'))
var_import_PlotEvalBoxplot_run_cyrto3 <- bm_PlotEvalBoxplot(bm.out = cyrto_ensemble_DA, group.by = c('algo', 'run'))
perform_ens_cyrto =  bm_PlotEvalMean(cyrto_ensemble_DA, metric.eval = c("TSS", "ROC"), group.by = "model", do.plot = TRUE)
dev.off()

write.csv(var_import_eval_cyrto3, "./cyrto_gluti_final_v8/model/ensemble/eval_cyrto_ensemble_DA.csv")
# write.table(eval_cyrto_ensemble_DA, paste0("./02-01-22_ALL ALGO/", "eval_ensemble.csv"))

projection_cyrto_ensemble_DA <- BIOMOD_EnsembleForecasting(
  bm.em = cyrto_ensemble_DA,
  bm.proj = projection_cyrto_final,
  metric.binary = "all",
  metric.filter = 'all',
  output.format = ".img"
)

pdf(file = "./cyrto_gluti_final_v8/model/ensemble/ensemble_resp_curve.pdf", width = 15, height = 10)
resp_curve_ENSEMBLE_FINAL_WMeanTSS <- bm_PlotResponseCurves(bm.out = cyrto_ensemble_DA, 
                                                                 models.chosen = get_built_models(cyrto_ensemble_DA)[4])
resp_curve_ENSEMBLE_FINAL_CATSS <- bm_PlotResponseCurves(bm.out = cyrto_ensemble_DA, 
                                                                 models.chosen = get_built_models(cyrto_ensemble_DA)[3])
dev.off()

write.table(resp_curve_ENSEMBLE_FINAL_WMeanTSS$tab, "./cyrto_gluti_final_v8/model/ensemble/ensemble_rcurve_data.csv")

# 18 - Extrapolation ----
# Stack variables in extrapolation area
# varImp_extrap_stack <- stack(
#   bio14_extrap,
#   bio3_extrap,
#   bio7_extrap,
#   cc3_extrap,
#   soil1_extrap,
#   soil3_extrap,
#   srad_extrap,
#   topo7_extrap
# )
# 
# projection_cyrto_extrap <- BIOMOD_Projection(
#   bm.mod = cyrto1model2, 
#   new.env = varImp_extrap_stack,
#   proj.name = "RF_GBM_MAXENT_extrap-26-12-22",
#   models.chosen = "all",
#   metric.binary = c("TSS", "ROC"),
#   output.format = ".img", 
#   compress = "xz",
#   build.clamping.mask = F, 
#   do.stack = T
# )
# 
# plot(projection_cyrto_extrap, str.grep = "RF")
# # plot(projection_cyrto_extrap, str.grep = "GLM")
# # plot(projection_cyrto_extrap, str.grep = "GAM")
# plot(projection_cyrto_extrap, str.grep = "GBM")
# plot(projection_cyrto_extrap, str.grep = "MAXENT.Phillips.2")
# 
# eval_final_model <- get_evaluations(cyrto1model2)
# eval_final_model
# 
# write.table(eval_final_model, paste0("./extrapolation/", "eval_extrap.csv"))
# 
# # Ensemble extrapolation
# 
# eval_cyrto_ensemble <- get_evaluations(cyrto_ensemble_extrap)
# write.table(eval_cyrto_ensemble, paste0("./exp/extrapolation/", "eval_cyrto_ensemble_modelproj.csv"))
# 
# projection_cyrto_ensemble <- BIOMOD_EnsembleForecasting(
#   projection.output = projection_cyrto_extrap, 
#   EM.output = cyrto_ensemble_extrap,
#   binary.meth = "TSS",
#   output.format = ".img"
# )

# 19 - Ploting and exporting results ----
result_DA_Dir = "./cyrto_gluti_final_v8/projections/ensemble/"
# result_PROJ_Dir = "./exp/extrapolation/"

# Mean
# plot(projection_cyrto_ensemble_DA, str.grep = "cyrto_EMmeanByTSS_mergedAlgo_mergedRun_mergedData")
# plot(projection_cyrto_ensemble, str.grep = "cyrto_EMmeanByTSS_mergedAlgo_mergedRun_mergedData")

# Weighted Mean
# plot(projection_cyrto_ensemble_DA, str.grep = "cyrto_EMwmeanByTSS_mergedAlgo_mergedRun_mergedData")
ensemble_model_final_TSS <- raster("./cyrto_gluti_final_v8/model/cyrto/proj_cyrto_final_model/individual_projections/cyrto_EMwmeanByTSS_mergedAlgo_mergedRun_mergedData.img")
ensemble_model_final_ROC <- raster("./cyrto_gluti_final_v8/model/cyrto/proj_cyrto_final_model/individual_projections/cyrto_EMwmeanByROC_mergedAlgo_mergedRun_mergedData.img")

# plot(projection_cyrto_ensemble, str.grep = "cyrto_EMwmeanByTSS_mergedAlgo_mergedRun_mergedData")# plot(projection_cyrto_ensemble, str.grep = "cyrto_EMwmeanByTSS_mergedAlgo_mergedRun_mergedData")# plot(projection_cyrto_ensemble, str.grep = "cyrto_EMwmeanByTSS_mergedAlgo_mergedRun_mergedData")# plot(projection_cyrto_ensemble, str.grep = "cyrto_EMwmeanByTSS_mergedAlgo_mergedRun_mergedData")
# ensemble_cyrto_Proj <- raster("./cyrto/proj_RF_GLM_GBM_MAXENT/individual_projections/cyrto_EMwmeanByTSS_mergedAlgo_mergedRun_mergedData.img")# ensemble_cyrto_Proj <- raster("./cyrto/proj_RF_GLM_GBM_MAXENT/individual_projections/cyrto_EMwmeanByTSS_mergedAlgo_mergedRun_mergedData.img")

writeRaster(ensemble_model_final_TSS, filename = file.path(result_DA_Dir, "ensemble_model_final_TSS.tif"), format = "GTiff", overwrite = TRUE)
writeRaster(ensemble_model_final_ROC, filename = file.path(result_DA_Dir, "ensemble_model_final_ROC.tif"), format = "GTiff", overwrite = TRUE)
# writeRaster(ensemble_cyrto_Proj, filename = file.path(result_PROJ_Dir, "ensemble_cyrto_Proj.tif"), format = "GTiff")

# CV
# plot(projection_cyrto_ensemble_DA, str.grep = "cyrto_EMcvByTSS_mergedAlgo_mergedRun_mergedData")
ensemble_model_final_CV_TSS <- raster("./cyrto_gluti_final_v8/model/cyrto/proj_cyrto_final_model/individual_projections/cyrto_EMcvByTSS_mergedAlgo_mergedRun_mergedData.img")
ensemble_model_final_CV_ROC <- raster("./cyrto_gluti_final_v8/model/cyrto/proj_cyrto_final_model/individual_projections/cyrto_EMcvByTSS_mergedAlgo_mergedRun_mergedData.img")
# plot(projection_cyrto_ensemble, str.grep = "cyrto_EMcvByTSS_mergedAlgo_mergedRun_mergedData")

# Committee averaging
# plot(projection_cyrto_ensemble_DA, str.grep = "cyrto_EMcaByTSS_mergedAlgo_mergedRun_mergedData")
ensemble_model_final_CA_TSS <- raster("./cyrto_gluti_final_v8/model/cyrto/proj_cyrto_final_model/individual_projections/cyrto_EMcaByTSS_mergedAlgo_mergedRun_mergedData.img")
ensemble_model_final_CA_ROC <- raster("./cyrto_gluti_final_v8/model/cyrto/proj_cyrto_final_model/individual_projections/cyrto_EMcaByTSS_mergedAlgo_mergedRun_mergedData.img")
# plot(projection_cyrto_ensemble, str.grep = "cyrto_EMcaByTSS_mergedAlgo_mergedRun_mergedData")

# Binaries
cyrto_ensemble_bin_DA_TSS <- raster("./cyrto_gluti_final_v8/model/cyrto/proj_cyrto_final_model/proj_cyrto_final_model_cyrto_TSSbin.img")
cyrto_ensemble_bin_DA_ROC <- raster("./cyrto_gluti_final_v8/model/cyrto/proj_cyrto_final_model/proj_cyrto_final_model_cyrto_ROCbin.img")
# cyrto_ensemble_bin <- raster("./cyrto/proj_cyrto_RF_GLM_GBM_MAXENT/proj_cyrto_RF_GLM_GBM_MAXENT_cyrto_ensemble_TSSbin.img")
# plot(cyrto_ensemble_bin_DA)
# plot(cyrto_ensemble_bin)

writeRaster(cyrto_ensemble_bin_DA_TSS, filename = file.path(result_DA_Dir, "cyrto_ensemble_bin_DA_TSS.tif"), format = "GTiff")
writeRaster(cyrto_ensemble_bin_DA_ROC, filename = file.path(result_DA_Dir, "cyrto_ensemble_bin_DA_ROC.tif"), format = "GTiff")
writeRaster(ensemble_model_final_CV_TSS, filename = file.path(result_DA_Dir, "cyrto_ensemble_CV_TSS.tif"), format = "GTiff")
writeRaster(ensemble_model_final_CV_ROC, filename = file.path(result_DA_Dir, "cyrto_ensemble_CV_ROC.tif"), format = "GTiff")
writeRaster(ensemble_model_final_CA_TSS, filename = file.path(result_DA_Dir, "cyrto_ensemble_CA_TSS.tif"), format = "GTiff")
writeRaster(ensemble_model_final_CA_ROC, filename = file.path(result_DA_Dir, "cyrto_ensemble_CA_ROC.tif"), format = "GTiff")
# writeRaster(cyrto_ensemble_bin, filename = file.path(result_PROJ_Dir, "cyrto_ensemble_bin"), format = "GTiff")

# 20 - SAVE/LOAD SAVED RDATA -----
save.image(file = "./cyrto22/model/model.RData")
load("./cyrto22/model/model.RData")

ensemble_model_out <- get(load("./cyrto22/model/cyrto/cyrto.cyrto_final_model.ensemble.models.out"))

ensemble_model_final <- BIOMOD_LoadModels(
  bm.out = ensemble_model_out
)

# NOT USED - Load ENMTML ----

# if (!"devtools"%in%installed.packages()) {
#   install.packages("devtools")
# }
# if (!"andrefaa/ENMTML"%in%installed.packages()) {
#   devtools::install_github("andrefaa/ENMTML")
# }
# 
# require(ENMTML)
# require(raster)
# 
# occ <- "./cyrto22/known_distrib/thinned/cyrtopodium_thin1_FdB_taxon_Filter.txt"
# predVar <- "./raster/ENMTML_proj/selected_accArea/"
# projVar <- "./raster/ENMTML_proj/"
# ENMTML_results <- "./ENMTML_results/"
# mask <- "./POLYGON/buffer_cyrto.shp"

# Call ENMTML for modelling
# memory.limit(80040)
# memory.limit()

# ENMTML(
#   pred_dir = predVar,
#   proj_dir = projVar,
#   result_dir = ENMTML_results,
#   occ_file = occ,
#   sp = 'sp',
#   x = 'x',
#   y = 'y',
#   min_occ = 0,
#   thin_occ = NULL,
#   eval_occ = NULL,
#   colin_var = NULL,
#   imp_var = TRUE,
#   sp_accessible_area = c(method = 'MASK', filepath = mask),
#   pseudoabs_method = c(method='GEO_CONST', width='50'),
#   pres_abs_ratio = 0.15,
#   part = c(method='BOOT', replicates='5', proportion='0.7'),
#   save_part = FALSE,
#   save_final = TRUE,
#   algorithm = c('GLM', 'MXD', 'BRT', 'RDF'),
#   thr = c(type ='MAX_TSS'),
#   msdm = NULL,
#   ensemble = c(method='W_MEAN', metric='TSS'),
#   extrapolation = TRUE,
#   cores = 1
# )
