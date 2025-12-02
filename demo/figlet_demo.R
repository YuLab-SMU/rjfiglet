# Demo of rjfiglet package
# Run this script after installing the package

library(rjfiglet)

cat("=== rjfiglet Demo ===\n\n")

# 1. Basic figlet
cat("1. Basic figlet with default font:\n")
figlet("Hello R!")
cat("\n")

# 2. Different font
cat("2. Using 'slant' font:\n")
figlet("Figlet", font = "slant")
cat("\n")

# 3. List available fonts
cat("3. Available fonts (first 10):\n")
fonts <- figlet_list_fonts()
print(head(fonts, 10))
cat("\n")

# 4. Version
cat("4. FIGlet.jl version:\n")
cat(figlet_version(), "\n\n")

# 5. Justify and width
cat("5. Centered text with width 40:\n")
figlet("Center", font = "standard", width = 40, justify = "center")
cat("\n")

# 6. Vertical direction
cat("6. Vertical direction:\n")
figlet("Up", font = "standard", direction = "vertical")
cat("\n")

cat("Demo completed!\n")
