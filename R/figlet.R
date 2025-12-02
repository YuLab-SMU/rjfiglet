#' Generate ASCII art text using FIGlet.jl
#'
#' @param text Character string to convert to ASCII art.
#' @param font Font name (default: "standard"). Use `figlet_list_fonts()` to see available fonts.
#' @return primarily prints the output.
#' @export
#' @examples
#' if (interactive()) {
#'   figlet("Hello R!")
#' }
figlet <- function(text, font = "standard") {
  # Ensure Julia is set up and FIGlet.jl loaded (handled by .onLoad)
  # Use JuliaCall::julia_eval with proper string escaping
  # Build the Julia expression
  expr <- sprintf('FIGlet.render("%s", "%s")', text, font)
  invisible(JuliaCall::julia_eval(expr))
}

#' List available fonts in FIGlet.jl
#'
#' @return Character vector of font names.
#' @export
#' @examples
#' if (interactive()) {
#'   figlet_list_fonts()
#' }
figlet_list_fonts <- function() {
  fonts <- JuliaCall::julia_eval("FIGlet.availablefonts()")
  return(fonts)
}

#' Get version of FIGlet.jl
#'
#' @return Character string of version.
#' @export
figlet_version <- function() {
  ver <- JuliaCall::julia_eval("string(FIGlet.VERSION)")
  return(ver)
}
