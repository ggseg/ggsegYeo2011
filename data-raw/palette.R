library(dplyr)


# Make palette
k <- dplyr::slice(yeo7_3d, 1) %>%
  unnest(ggseg_3d) %>%
  select(region, colour) %>%
  filter(!is.na(region))

j <- dplyr::slice(yeo17_3d, 1) %>%
  unnest(ggseg_3d) %>%
  select(region, colour) %>%
  filter(!is.na(region))

brain_pals = list(
  yeo7 = setNames(k$colour, k$region),
  yeo17 = setNames(j$colour, j$region)
)
usethis::use_data(brain_pals, internal = TRUE, overwrite = TRUE)

devtools::load_all("../../ggsegExtra/")
yeo7_3d <- restruct_old_3datlas(yeo7_3d)
yeo7_3d <- as_ggseg3d_atlas(yeo7_3d)
usethis::use_data(yeo7_3d, internal = FALSE, overwrite = TRUE)


yeo17_3d <- restruct_old_3datlas(yeo17_3d)
yeo17_3d <- as_ggseg3d_atlas(yeo17_3d)
usethis::use_data(yeo17_3d, internal = FALSE, overwrite = TRUE)

