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
