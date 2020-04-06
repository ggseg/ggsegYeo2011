devtools::load_all("../../ggsegExtra/")
devtools::load_all("../../ggseg/")
devtools::load_all(".")


# Make palette ----
yeo7_pal <- make_palette_ggseg(yeo7_3d)
yeo17_pal <- make_palette_ggseg(yeo17_3d)

brain_pals <- c(yeo7_pal, yeo17_pal)
usethis::use_data(brain_pals, internal = TRUE, overwrite = TRUE)
devtools::load_all(".")

# make atlas ----
# Not working nicely. some strange polygon stuff hannening.
yeo7 <- ggsegExtra::make_ggseg3d_2_ggseg(yeo7_3d,
                                         steps = 6:7,
                                         tolerance = 0.2,
                                         output_dir = "~/Desktop/test/")
yeo7$geometry <- NULL
yeo7 <- as_ggseg_atlas(yeo7)
ggseg(atlas=yeo7, show.legend = FALSE,
      alpha=.6, #position="stacked",
      colour = "black",
      mapping = aes(fill=region)) +
  scale_fill_brain("yeo7", package = "ggsegYeo2011")

usethis::use_data(yeo7,
                  internal = FALSE,
                  overwrite = TRUE,
                  compress="xz")

yeo17 <- ggsegExtra::make_ggseg3d_2_ggseg(yeo17_3d,
                                          steps = 6:7,
                                         tolerance = .1,
                                          output_dir = "~/Desktop/test/")

yeo17$geometry <- NULL
yeo17 <- as_ggseg_atlas(yeo17)

ggseg(atlas=yeo17, #show.legend = FALSE,
      colour = "black", position="stacked",
      alpha=.6,
      mapping = aes(fill=region)) +
  scale_fill_brain("yeo17", package = "ggsegYeo2011")


usethis::use_data(yeo17,
                  internal = FALSE,
                  overwrite = TRUE,
                  compress="xz")


