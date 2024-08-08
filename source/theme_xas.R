theme_xas <- function() {
  theme_classic() +
  theme(
    panel.background = element_rect(color = "black"),
    strip.background = element_rect(color = "#464747", fill = "#464747"),
    strip.text = element_text(color = "white"),
    axis.ticks.x = element_blank(),
    axis.ticks.y = element_blank(),
    axis.text.y = element_blank(),
    axis.title.y = element_blank()
  )
}