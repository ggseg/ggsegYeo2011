# ggseg ----
context("test-yeo7-adapt_scales")
test_that("Check that ggseg:::adapt_scales is working", {
  expect_equal(mode(ggseg:::adapt_scales(unnest(yeo7, ggseg))), "list")
})

context("test-yeo7-palettes")
test_that("check new palettes work", {
  expect_equal(length(brain_pal("yeo7", package = "ggsegYeo2011")), 9)

  expect_error(brain_pal("yeo7"), "not a valid")

  expect_true(all(names(brain_pal("yeo7", package = "ggsegYeo2011")) %in% yeo7$region))
})

context("test-yeo7-ggseg-atlas")
test_that("atlases are true ggseg atlases", {

  expect_true(is_ggseg_atlas(yeo7))

})

context("test-yeo7-ggseg")
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

  expect_is(ggseg(atlas = yeo7, mapping=aes(fill=area),
                  position="stacked"), c("gg","ggplot"))

  expect_is(ggseg(atlas = yeo7, mapping=aes(fill=area), adapt_scales = F ),c("gg","ggplot"))

})


# ggseg3d ----
context("test-yeo7-ggseg3d")
test_that("Check that mesh atlases are working", {
  expect_is(
    ggseg3d(atlas=yeo7_3d),
    c("plotly", "htmlwidget")
  )
})



context("test-yeo7-ggseg3d-atlas")
test_that("atlases are true ggseg3d atlases", {

  expect_true(is_ggseg3d_atlas(yeo7_3d))

})
