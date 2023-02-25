library(terra)
library(progress)
library(stringr)

setwd("X:/Shared files/SDM/cyrto_gluti_final_v7/")
getwd()


####### INDIVIDUAL ################

x <- vect("./UCs_model/intersec_all_UCs_model.shp")
x$area_sqkm <- expanse(x) / 1000000
print(paste("Each area: ", x$area_sqkm))
print(paste("Sum of all areas: ", sum(x$area_sqkm)))

write.table(x$area_sqkm, "./UCs_model/area_calc/intersec_all_UCs_model_area.txt")

# calc_area <- read.csv("./UCs_model/unprotected_model_area.csv")
# sum(calc_area$x)


####### FROM DIR ################

dir_path <- "./UCs_MAPBIOMAS_model/"

area_files <- list.files(path = dir_path, pattern = "*.shp", recursive = FALSE, full.names = TRUE)
area_files

char_count <- nchar(dir_path) + 1
print(char_count)

area_list = c()

pb <- progress_bar$new(total = length(area_files), width = 60)
for (x in area_files) {
  pb$tick(0)
  f_name <- str_remove(x, ".shp")
  l <- terra::vect(x)
  l$area_sqkm <- expanse(l) / 1000000
  area_values <- paste(substr(f_name, char_count, 100), " area: ", l$area_sqkm)
  area_sum <- paste(substr(f_name, char_count, 100), "Sum of all areas: ", sum(l$area_sqkm))
  area_final <- c(area_values, area_sum)
  area_list <- c(area_list, area_sum)
  writeLines(area_sum)
  write.table(area_final, file = paste("./UCs_model/area_calc/", substr(f_name, char_count, 100), "area.txt"))
  pb$tick()
  # write.table(area_final, file = paste("./UCs_model/area_calc/", l@ptr$layer, ".txt"))
  # writeLines(paste("\n", l@ptr$layer, " area: ", l$area_sqkm))
  # writeLines(paste("\n", l@ptr$layer, "Sum of all areas: ", sum(l$area_sqkm)))
}

write.table(area_list, file = "./UCs_MAPBIOMAS_model/area_calc/all_area.txt")
