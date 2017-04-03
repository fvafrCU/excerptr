library("excerptr")
context("Basic tests")

test_that("paths", {
  expect_equal(construct_path(), file.path(getwd(), "inst/excerpts"))
})

test_that("paths", {
              expect_equal(construct_path(temporary = TRUE),
                           file.path(tempdir(), "inst/excerpts"))
})
