if (interactive()) {
    devtools::load_all()
}
library("testthat")
library("excerptr")
context("Basic tests")
root <- tryCatch(rprojroot::find_root(rprojroot::is_r_package),
                 error = function(e) return(".")
                 )

test_that("paths", {
              expect_equal(construct_path(temporary = TRUE),
                           file.path(tempdir(), "inst/excerpts"))
})
test_that("md", {
          out_file <- file.path(tempdir(), "some_file.out")
          excerptr(file = file.path(root, "tests/files/some_file.R"),
                   output_path = out_file,
                   pandoc_formats = "md")
          result <- readLines(out_file)
          expectation <- readLines(file.path(root, "tests/files/some_file.md"))
          expect_equal(result, expectation)
})
