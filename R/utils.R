# Utility functions for rjfiglet package

# Check if Julia and FIGlet.jl are ready
#' @importFrom yulab.utils yulab_abort
check_julia_setup <- function() {
  if (!has_julia()) {
    yulab_abort("Julia is not set up. Please run JuliaCall::julia_setup() first.")
  }
  # Ensure FIGlet.jl is loaded
  tryCatch({
    JuliaCall::julia_eval("using FIGlet")
  }, error = function(e) {
    yulab_abort("FIGlet.jl not installed. Please install via: JuliaCall::julia_eval('using Pkg; Pkg.add(\"FIGlet\")')")
  })
}


has_julia <- function() {
  yulab.utils:::has_bin("julia")
}
