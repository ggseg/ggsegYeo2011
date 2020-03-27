
<!-- README.md is generated from README.Rmd. Please edit that file -->

# ggsegYeo2011

<!-- badges: start -->

[![Travis build
status](https://travis-ci.org/LCBC-UiO/ggsegYeo2011.svg?branch=master)](https://travis-ci.org/LCBC-UiO/ggsegYeo2011)
[![AppVeyor build
status](https://ci.appveyor.com/api/projects/status/github/LCBC-UiO/ggsegYeo2011?branch=master&svg=true)](https://ci.appveyor.com/project/LCBC-UiO/ggsegYeo2011)
[![Codecov test
coverage](https://codecov.io/gh/LCBC-UiO/ggsegYeo2011/branch/master/graph/badge.svg)](https://codecov.io/gh/LCBC-UiO/ggsegYeo2011?branch=master)
<!-- badges: end -->

This package contains dataset for plotting the Yeo2011 cortical atlas
ggseg and ggseg3d.

Yeo et al. (2011) J. Neurophysiology 16(3):1125-1165
[pubmed](https://www.ncbi.nlm.nih.gov/pubmed/21653723)

## Installation

You can install the released version version from
[GitHub](https://github.com/) with:

``` r
# install.packages("remotes")
remotes::install_github("LCBC-UiO/ggsegYeo2011")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(ggsegYeo2011)
```

``` r
library(ggseg)

ggseg(atlas = yeo7, mapping = aes(fill = region)) +
  scale_fill_brain("yeo7", package = "ggsegYeo2011") +
  theme(legend.position = "bottom",
        legend.text = element_text(size = 9)) +
  guides(fill = guide_legend(ncol = 3))
```

<img src="man/figures/README-unnamed-chunk-4-1.png" width="100%" />

``` r


ggseg(atlas = yeo17, mapping = aes(fill = region)) +
  scale_fill_brain("yeo17", package = "ggsegYeo2011") +
  theme(legend.position = "bottom",
        legend.text = element_text(size = 9)) +
  guides(fill = guide_legend(ncol = 3))
```

<img src="man/figures/README-unnamed-chunk-4-2.png" width="100%" />

``` r
library(ggseg3d)

ggseg3d(atlas = yeo7_3d) %>% 
  pan_camera("right lateral")
```

<img src="man/figures/README-yeo7-3d-plot.png" width="100%" />

``` r
ggseg3d(atlas = yeo17_3d) %>% 
  pan_camera("right lateral")
```

<img src="man/figures/README-yeo17-3d-plot.png" width="100%" />

Please note that the ‘ggsegYeo2011’ project is released with a
[Contributor Code of Conduct](CODE_OF_CONDUCT.md). By contributing to
this project, you agree to abide by its terms.
