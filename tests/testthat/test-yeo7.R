# ggseg ----
test_that("check new palettes work", {
  expect_equal(length(brain_pal("yeo7", package = "ggsegYeo2011")), 7)

  expect_error(brain_pal("yeo7"), "not a valid")

  expect_true(all(names(brain_pal("yeo7", package = "ggsegYeo2011")) %in% brain_regions(yeo7)))
})

context("test-yeo7-ggseg-atlas")
test_that("atlases are true ggseg atlases", {

  expect_true(is_brain_atlas(yeo7))

})

test_that("Check that polygon atlases are working", {
  expect_is(ggseg(atlas = yeo7),c("gg","ggplot"))

  expect_is(ggseg(atlas = yeo7, mapping = aes(fill = region)),
            c("gg","ggplot"))

  expect_is(ggseg(atlas = yeo7, mapping = aes(fill = region)) +
              scale_fill_brain("yeo7", package = "ggsegYeo2011"),
            c("gg","ggplot"))

  expect_is(ggseg(atlas = yeo7, mapping = aes(fill = region)) +
              scale_fill_brain("yeo7", package = "ggsegYeo2011"),
            c("gg","ggplot"))

  expect_is(ggseg(atlas = yeo7, mapping=aes(fill=region),
                  position="stacked"), c("gg","ggplot"))

  expect_is(ggseg(atlas = yeo7, mapping=aes(fill=region), adapt_scales = F ),c("gg","ggplot"))

})


# ggseg3d ----
test_that("Check that mesh atlases are working", {
  expect_is(
    ggseg3d(atlas=yeo7_3d),
    c("plotly", "htmlwidget")
  )
})



test_that("atlases are true ggseg3d atlases", {

  expect_true(is_ggseg3d_atlas(yeo7_3d))

})

