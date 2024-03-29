
<!-- README.md is generated from README.Rmd. Please edit that file -->

# ggsegYeo2011 <img src='man/figures/logo.png' align="right" height="138.5" />

<!-- badges: start -->

[![R build
status](https://github.com/LCBC-UiO/ggsegYeo2011/workflows/R-CMD-check/badge.svg)](https://github.com/LCBC-UiO/ggsegYeo2011/actions)
[![DOI](https://zenodo.org/badge/250192046.svg)](https://zenodo.org/badge/latestdoi/250192046)
[![CRAN
status](https://www.r-pkg.org/badges/version/ggsegYeo2011)](https://CRAN.R-project.org/package=ggsegYeo2011)
[![R-CMD-check](https://github.com/ggseg/ggsegYeo2011/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/ggseg/ggsegYeo2011/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

This package contains dataset for plotting the Yeo2011 cortical atlas
ggseg and ggseg3d.

Yeo et al. (2011) J. Neurophysiology 16(3):1125-1165
[pubmed](https://www.ncbi.nlm.nih.gov/pubmed/21653723)

## Installation

We recommend installing the ggseg-atlases through the ggseg
[r-universe](https://ggseg.r-universe.dev/ui#builds):

``` r
# Enable this universe
options(repos = c(
    ggseg = 'https://ggseg.r-universe.dev',
    CRAN = 'https://cloud.r-project.org'))

# Install some packages
install.packages('ggsegYeo2011')
```

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
library(ggplot2)
library(ggseg)

plot(yeo7) +
  theme(legend.position = "bottom",
        legend.text = element_text(size = 9)) +
  guides(fill = guide_legend(ncol = 3))
```

<img src="man/figures/README-unnamed-chunk-5-1.png" width="100%" />

``` r


plot(yeo17) +
  theme(legend.position = "bottom",
        legend.text = element_text(size = 9)) +
  guides(fill = guide_legend(ncol = 3))
```

<img src="man/figures/README-unnamed-chunk-5-2.png" width="100%" />

``` r
library(ggseg3d)
library(dplyr)

ggseg3d(atlas = yeo7_3d) %>% 
  pan_camera("right lateral")
``
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
