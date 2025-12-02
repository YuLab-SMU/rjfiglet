# Advanced examples of rjfiglet
# Shows how to integrate with other R packages and create visual outputs

library(rjfiglet)
library(ggplot2)  # for plotting

# 1. Generate multiple figlet outputs and combine
cat("Generating multiple figlet artworks...\n\n")
texts <- c("R", "Julia", "Figlet")
fonts <- c("standard", "slant", "block")

for (i in seq_along(texts)) {
  cat(sprintf("Text: %s, Font: %s\n", texts[i], fonts[i]))
  figlet(texts[i], font = fonts[i])
  cat("\n")
}

# 2. Save figlet output to a text file
cat("Saving figlet output to file...\n")
figlet("Saved", font = "standard")
# Note: To save output, you would need to capture it first
# For now, this example is simplified
cat("Example of saving would require capturing output\n\n")

# 3. Create a simple plot with figlet as annotation (conceptual)
cat("Creating a plot with figlet annotation (requires manual adjustment)...\n")
# This is a conceptual example; actual placement would need manual tweaking
df <- data.frame(x = 1:10, y = rnorm(10))
plt <- ggplot(df, aes(x, y)) + 
  geom_point() + 
  ggtitle("Figlet Integration Demo") +
  theme_minimal()

# Print the plot (figlet not embedded automatically)
print(plt)

# 4. Batch processing
cat("\nBatch processing example:\n")
results <- list()
for (font in c("standard", "banner", "digital")) {
  cat(sprintf("Font: %s:\n", font))
  figlet("Batch", font = font)
  cat("\n")
  # Note: To store results, you would need to capture output
}

# 5. Error handling example
cat("\nError handling (trying non-existent font):\n")
tryCatch({
  figlet("Test", font = "nonexistentfont123")
}, error = function(e) {
  cat("Error caught:", e$message, "\n")
})

cat("\nAdvanced examples completed.\n")
