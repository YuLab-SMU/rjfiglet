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

## 开发过程总结

### 项目背景

`rjfiglet` 是一个展示如何将Julia功能封装到R包中的示例项目。通过使用`JuliaCall`包，我们可以在R中调用Julia代码，实现跨语言的功能复用。

### 技术架构

1. **R-Julia桥接**：使用`JuliaCall`包作为桥梁，允许R代码调用Julia函数
2. **包结构**：标准的R包结构，包含`R/`、`src/`、`man/`等目录
3. **函数封装**：将Julia的`FIGlet.jl`包的功能封装为R函数

### 关键实现步骤

1. **环境设置**
   - 确保Julia正确安装并配置
   - 在Julia中安装`FIGlet.jl`和`RCall`包
   - 在R中安装`JuliaCall`包

2. **函数封装**
   - 在`R/figlet.R`中定义R函数
   - 使用`JuliaCall::julia_call()`调用Julia函数
   - 处理数据类型转换（R ↔ Julia）

3. **错误处理**
   - 添加输入验证
   - 处理Julia调用可能出现的错误
   - 提供有意义的错误信息

4. **文档编写**
   - 使用roxygen2编写函数文档
   - 创建示例代码
   - 编写使用说明

### 封装要点

1. **初始化Julia**：在包加载时初始化Julia环境
2. **函数映射**：将Julia函数参数映射到R函数参数
3. **性能考虑**：避免频繁的Julia环境初始化
4. **用户体验**：提供简单的R接口，隐藏复杂的跨语言细节

### 扩展建议

1. 添加更多FIGlet.jl功能的封装
2. 实现缓存机制提高性能
3. 添加图形输出选项
4. 创建Shiny应用演示

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

# Or source the example file
source(system.file("examples", "advanced.R", package = "rjfiglet"))
```

