devtools::load_all("../../ggsegExtra/")
devtools::load_all("../../ggseg/")
devtools::load_all(".")


# Make palette ----
yeo7_pal <- make_palette_ggseg(yeo7_3d)
yeo17_pal <- make_palette_ggseg(yeo17_3d)

brain_pals <- c(yeo7_pal, yeo17_pal)
usethis::use_data(brain_pals, internal = TRUE, overwrite = TRUE)
devtools::load_all(".")

# yeo7 ----

yeo7_3d <- make_aparc_2_3datlas(
  annot = "Yeo2011_7Networks_N1000",
  output_dir = "data-raw/yeo7"
) %>%
  tidyr::unnest(ggseg_3d) %>%
  mutate(
    atlas = "yeo7_3d",
    region = case_when(
      grepl("wall", label) ~ NA_character_,
      grepl("_1$", label) ~ "visual",
      grepl("_2$", label) ~ "somatomotor",
      grepl("_3$", label) ~ "dorsal attention",
      grepl("_4$", label) ~ "ventral attention",
      grepl("_5$", label) ~ "limbic",
      grepl("_6$", label) ~ "control",
      grepl("_7$", label) ~ "default",
    )
  ) %>%
  nest_by(atlas, surf, hemi, .key = "ggseg_3d") %>%
  ungroup() %>%
  as_ggseg3d_atlas()


# Not working nicely. some strange polygon stuff happening.
yeo7 <- make_ggseg3d_2_ggseg(yeo7_3d,
                            steps = 1:7,
                            tolerance = 0.4,
                            smoothness = 5,
                            output_dir = "data-raw/")

plot(yeo7)
ggseg(atlas=yeo7, show.legend = FALSE,
      alpha=.6, #position="stacked",
      colour = "black",
      mapping = aes(fill=region)) +
  scale_fill_brain("yeo7", package = "ggsegYeo2011")

usethis::use_data(yeo7, yeo7_3d,
                  internal = FALSE,
                  overwrite = TRUE,
                  compress="xz")



# yeo17 ----
yeo17_3d <- make_aparc_2_3datlas(
  annot = "Yeo2011_17Networks_N1000",
  output_dir = "data-raw/yeo17"
) %>%
  tidyr::unnest(ggseg_3d) %>%
  mutate(
    atlas = "yeo17_3d",
    region = gsub("17Networks", "network", region),
    region = ifelse(grepl("wall", region, ignore.case = TRUE), NA_character_, region),
    region = ifelse(stringr::str_count(region) == 9 , gsub("_", "_0", region), region)
  ) %>%
  nest_by(atlas, surf, hemi, .key = "ggseg_3d") %>%
  ungroup() %>%
  as_ggseg3d_atlas()


yeo17 <- make_ggseg3d_2_ggseg(yeo17_3d,
                               steps = 1:7,
                               tolerance = 0.6,
                               smoothness = 5,
                               output_dir = "data-raw/yeo17")

plot(yeo17)
usethis::use_data(yeo17,yeo17_3d,
                  internal = FALSE,
                  overwrite = TRUE,
                  compress="xz")


