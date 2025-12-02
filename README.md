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

**重要：安装Julia和所需包**

在运行此包之前，您需要先安装Julia，并在Julia中安装必要的包：

1. **安装Julia**
   - 从 [Julia官网](https://julialang.org/downloads/) 下载并安装Julia
   - 确保Julia可执行文件在系统PATH中

2. **在Julia中安装所需包**
   打开Julia REPL并运行：
   ```julia
   using Pkg
   Pkg.add("FIGlet")
   Pkg.add("RCall")
   ```

3. **验证安装**
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

