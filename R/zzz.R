#' @import JuliaCall
.onAttach <- function(libname, pkgname) {
  load_figlet()
}

.onUnload <- function(libpath) {
  # Cleanup if needed
}

#' @importFrom yulab.utils yulab_msg
load_figlet <- function() {
  # Initialize JuliaCall and ensure FIGlet.jl is installed
  JuliaCall::julia_setup()
  # Check if FIGlet.jl is installed; if not, install it
  if (!JuliaCall::julia_eval("Base.find_package(\"FIGlet\") !== nothing")) {
    yulab.utils::yulab_msg("Installing FIGlet.jl via Pkg...")
    JuliaCall::julia_eval("using Pkg; Pkg.add(\"FIGlet\")")
  }
  # Load FIGlet.jl
  JuliaCall::julia_eval("using FIGlet")
}
