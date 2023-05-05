library(tidyverse)
library(ggseg)
library(ggseg3d)
library(ggsegExtra)
library(here)

annots <- c(
  "lh.Yeo2011_17Networks_N1000.annot",
  "rh.Yeo2011_17Networks_N1000.annot",
  "lh.Yeo2011_7Networks_N1000.annot",
  "rh.Yeo2011_7Networks_N1000.annot"
)

lapply(annots, \(x){
  download.file(sprintf(
    "https://github.com/ThomasYeoLab/CBIG/blob/master/stable_projects/brain_parcellation/Yeo2011_fcMRI_clustering/1000subjects_reference/Yeo_JNeurophysiol11_SplitLabels/fsaverage5/label/%s?raw=true", x),
    destfile = here("data-raw", x))
})


## 17 networks
nnames <- read.csv("https://raw.githubusercontent.com/ThomasYeoLab/CBIG/master/stable_projects/brain_parcellation/Yeo2011_fcMRI_clustering/1000subjects_reference/17NetworksOrderedNames.csv",
                   header = TRUE,
                   col.names = c("number", "region")) |>
  mutate(region = str_trim(region))
yeo17_3d <- ggsegExtra::make_aparc_2_3datlas("Yeo2011_17Networks_N1000",
                                             annot_dir = here("data-raw"),
                                             ncores = 16) |>
  mutate(atlas = "yeo17_3d")


yeo17_3d <- yeo17_3d |>
  unnest("ggseg_3d") |>
  mutate(
    number = str_remove(region, "17Networks_"),
    number = as.integer(number)
  ) |>
  select(-region) |>
  left_join(nnames) |>
  as_ggseg3d_atlas()

ggseg3d(atlas=yeo17_3d)

yeo17 <- ggsegExtra::make_ggseg3d_2_ggseg(yeo17_3d,
                                          ncores = 16,
                                          tolerance = .3 )
plot(yeo17)

## 7 networks
nnames <- read.csv("https://raw.githubusercontent.com/ThomasYeoLab/CBIG/master/stable_projects/brain_parcellation/Yeo2011_fcMRI_clustering/1000subjects_reference/7NetworksOrderedNames.csv",
                   header = TRUE,
                   col.names = c("number", "region")) |>
  mutate(region = str_trim(region))

yeo7_3d <- ggsegExtra::make_aparc_2_3datlas(
  "Yeo2011_7Networks_N1000",
  annot_dir = here("data-raw"),
  ncores = 16) |>
  mutate(atlas = "yeo7_3d")


yeo7_3d <- yeo7_3d |>
  unnest("ggseg_3d") |>
  mutate(
    number = str_remove(region, "7Networks_"),
    number = as.integer(number)
  ) |>
  select(-region) |>
  left_join(nnames) |>
  as_ggseg3d_atlas()

ggseg3d(atlas=yeo7_3d)

yeo7 <- ggsegExtra::make_ggseg3d_2_ggseg(yeo7_3d,
                                          tolerance = .2 )
plot(yeo7)

usethis::use_data(yeo7, yeo7_3d, yeo17, yeo17_3d, overwrite = TRUE)



# Make palette ----
yeo7_pal <- make_palette_ggseg(yeo7_3d)
yeo17_pal <- make_palette_ggseg(yeo17_3d)

brain_pals <- c(yeo7_pal, yeo17_pal)
usethis::use_data(brain_pals, internal = TRUE, overwrite = TRUE)
