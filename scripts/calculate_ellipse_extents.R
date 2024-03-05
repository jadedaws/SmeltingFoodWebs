library(tidyverse)

dat = read.csv("ellipse-data_Mar04.csv") %>%
  filter(TAXON %in% c("SMB", "YPERCH"))

p = ggplot(dat, aes(x = plit_bound, y = tp_2, group = paste(Water, TAXON), colour = paste(Water, TAXON))) +
  geom_point() + 
  stat_ellipse(type = "norm", level = 0.4)
p

# extract ellipse coords
ellipse_data = ggplot_build(p)$data[[2]]

# plot to confirm - BINGO
ggplot(ellipse_data, aes(x = x, y = y, colour = as.factor(group))) +
  geom_point() 

# calculate min and max
plit_tp_ranges =
  ellipse_data %>%
  group_by(group) %>%
  summarise(d13c_min = min(x),
            d13c_max = max(x),
            d15n_min = min(y),
            d15n_max = max(y)
            ) 

# need this to identify the lakes and species
name_df = data.frame(
  lake_species = unique(paste(dat$Water, dat$TAXON))
)
name_df$group = row.names(name_df)

# merge names to d13c and d15n ranges
plit_tp_ranges = merge(plit_tp_ranges, name_df, by = "group")
  