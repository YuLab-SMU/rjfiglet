# rjfiglet: R Interface to Julia's FIGlet.jl


`rjfiglet` is an R package that provides an interface to the Julia package `FIGlet.jl`, allowing R users to generate ASCII art text banners directly from R. This package uses `JuliaCall` to bridge R and Julia, demonstrating how to wrap Julia functionality in an R package.

## Features

- Generate ASCII art from text using various figlet fonts
- List available fonts in FIGlet.jl
- Control text width, justification, and direction
- Seamless integration with R workflows
- Educational example of R-Julia interoperability

## Installation

### Prerequisites

1. **R** (>= 4.0.0)
2. **Julia** (>= 1.6) installed and accessible in PATH
3. **JuliaCall** R package (will be installed automatically)

**Important: Installing Julia and Required Packages**

Before running this package, you need to install Julia and the necessary packages in Julia:

1. **Install Julia**
   - Download and install Julia from [Julia official website](https://julialang.org/downloads/)
   - Ensure the Julia executable is in your system PATH

2. **Install Required Packages in Julia**
   Open Julia REPL and run:
   ```julia
   using Pkg
   Pkg.add("FIGlet")
   Pkg.add("RCall")
   ```

3. **Verify Installation**
   ```julia
   using FIGlet
   using RCall
   ```

### Install rjfiglet

Since this package is not on CRAN, install from source:

```r
# Install devtools if not already installed
install.packages("devtools")
devtools::install_github("YuLab-SMU/rjfiglet")
```

## Quick Start

```r
library(rjfiglet)

# Generate ASCII art (automatically prints)
figlet("Hello R!")

# List available fonts
fonts <- figlet_list_fonts()
head(fonts)

# Use different font
figlet("Awesome", font = "slant")
```


## Documentation

### Main Functions

- `figlet(text, font = "standard", width = NULL, justify = "left", direction = "horizontal")` - Generate ASCII art (automatically prints)
- `figlet_list_fonts()` - List available fonts
- `figlet_version()` - Get FIGlet.jl version

### Examples

See the `demo/` and `examples/` directories for more examples:

```r
# Run demo
demo("figlet_demo", package = "rjfiglet")
```

