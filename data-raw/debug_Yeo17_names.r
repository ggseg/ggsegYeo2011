library(ggseg)
library(tidyverse)
devtools::load_all("../../ggsegExtra/")
devtools::load_all(".")
plot(yeo17)

load("C:/Users/daida/AppData/Local/Temp/yeo17-1.rda")

yeo17$data %>% View()


regions_old <- brain_regions(yeo17)

regions_new <- c("Visual A",
                "Visual B",
                "Somatomotor A",
                "Somatomotor B",
                "Dorsal Attention A",
                "Dorsal Attention B",
                "Salience/VentAttn A",
                "Salience/VentAttn B",
                "Limibic A",
                "Limibic B",
                "Control A",
                "Control B",
                "Control C",
                "Temporal Parietal",
                "Default A",
                "Default B",
                "Default C")


for (i in 1:length(regions_old)) {
  idx = yeo17$data$region == regions_old[i] & !is.na(yeo17$data$region)
  yeo17$data$region[idx]= regions_new[i]
}
yeo17$palette <- setNames(yeo17$palette, regions_new)

yeo17_3d = yeo17_3d

for (j in 1:length(yeo17_3d$ggseg_3d)){
  for (i in 1:length(regions_old)) {
    idx =yeo17_3d$ggseg_3d[[j]]$region == regions_old[i] & !is.na(yeo17_3d$ggseg_3d[[j]]$region)
    yeo17_3d$ggseg_3d[[j]]$region[idx]= regions_new[i]
  }
}

ggseg3d(atlas = yeo17_3d)

usethis::use_data(yeo17, yeo17_3d,
                  internal = FALSE,
                  overwrite = TRUE,
                  compress="xz")


# Make palette ----
yeo7_pal <- make_palette_ggseg(yeo7_3d)
yeo17_pal <- make_palette_ggseg(yeo17_3d)

brain_pals <- c(yeo7_pal, yeo17_pal)
usethis::use_data(brain_pals, internal = TRUE, overwrite = TRUE)
