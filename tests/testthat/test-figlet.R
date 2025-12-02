# Test file for rjfiglet package

# Skip tests if Julia is not available
skip_if_no_julia <- function() {
  if (!requireNamespace("JuliaCall", quietly = TRUE)) {
    skip("JuliaCall not installed")
  }
  # Try to check if Julia is set up
  julia_ok <- tryCatch({
    JuliaCall::julia_eval("1+1")
    TRUE
  }, error = function(e) FALSE)
  if (!julia_ok) {
    skip("Julia not set up")
  }
}

# Test basic figlet functionality
test_that("figlet function works", {
  skip_if_no_julia()
  
  # Basic call - returns NULL (invisible)
  expect_null(figlet("test"))
  
  # Different font - also returns NULL
  expect_null(figlet("test", font = "slant"))

  # Non-character text should works
  expect_null(figlet(123))

})

test_that("figlet_list_fonts works", {
  skip_if_no_julia()
  
  fonts <- figlet_list_fonts()
  expect_type(fonts, "character")
  expect_gt(length(fonts), 0)
  
  # Check some common fonts exist
  common_fonts <- c("standard", "slant", "block", "banner")
  expect_true(any(common_fonts %in% fonts))
})

test_that("figlet_version works", {
  skip_if_no_julia()
  
  version <- figlet_version()
  expect_type(version, "character")
  expect_true(grepl("^\\d+\\.\\d+\\.\\d+$", version))
})

test_that("error handling works", {
  skip_if_no_julia()
  
  # Invalid font should error
  expect_error(figlet("test", font = "nonexistentfont123"))  
  expect_error(figlet(NULL))
})

test_that("check_julia_setup internal function works", {
  skip_if_no_julia()
  
  # Should not error when Julia is set up
  expect_silent(rjfiglet:::check_julia_setup())
  
  # Mock test for error case (hard to test without breaking Julia)
  # This is conceptual
})
