theme_xas <- function() {
  theme_classic() +
  theme(
    panel.background = element_rect(color = "black"),
    strip.background = element_rect(color = "#464747", fill = "#464747"),
    strip.text = element_text(color = "white"),
    axis.ticks.x = element_blank()
  )
}