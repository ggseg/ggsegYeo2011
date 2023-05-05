library(hexSticker)
library(ggseg)
library(ggplot2)
devtools::load_all(".")

atlas <- yeo7
pkgname <- "ggsegYeo2011"

p <- ggseg(atlas = atlas,
           hemi = "left",
           view = "lateral",
           show.legend = FALSE,
           colour = "grey30",
           size = .2,
           mapping = aes(fill =  region)) +
  scale_fill_brain2(palette = atlas$palette) +
  theme_void() +
  theme_transparent()

mapply(
  sticker,
  filename = c("man/figures/logo.svg",
               "man/figures/logo.png"),
  p_size = c(5, 15),
  MoreArgs = list(
    subplot = p,
    package = "ggsegYeo2011",
    s_y = 1.2,
    s_x = 1,
    s_width = 1.5,
    s_height = 1.5,
    p_family = "mono",
    p_color = "grey30",
    p_y = .6,
    h_fill = "white",
    h_color = "grey30"
  )
)

