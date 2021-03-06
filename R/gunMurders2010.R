library(tidyverse)
library(dslabs)
library(ggrepel)
library(ggthemes)
data(murders)

r <- murders %>% summarize(rate = sum(total) / sum(population) * 10^6) %>%
  pull(rate)

p <- murders %>% ggplot(aes(x = population/10^6, y = total, label = abb)) + 
  geom_abline(intercept = log10(r), lty = 2, color = "darkgrey") +
  geom_point(aes(col=region), size = 3) +
  geom_text_repel() +
  scale_x_log10() +
  scale_y_log10() +
  xlab("Population (in millions)") +
  ylab("Total Number of Gun Murders") +
  ggtitle("US Gun Murders in 2010") +
  scale_color_discrete(name = "Region") + 
  theme_economist()

p 
