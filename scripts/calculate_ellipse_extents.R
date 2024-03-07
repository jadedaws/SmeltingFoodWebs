library(tidyverse)

dat = read_csv("//SFP.IDIR.BCGOV/U109/JDAWSON$/GitHub/SmeltingFoodWebs/data/ellipse-data_Mar04.csv")%>%
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
  summarise(plit_min = min(x),
            plit_max = max(x),
            tp_min = min(y),
            tp_max = max(y),
            range_plit = (max(x) - min(x)),
            range_tp = (max(y) - min(y))
            ) 

# need this to identify the lakes and species
name_df = data.frame(
  lake_species = unique(paste(dat$Water, dat$TAXON))
)
name_df$group = row.names(name_df)

# merge names to plit and tp ranges
plit_tp_ranges = merge(plit_tp_ranges, name_df, by = "group")

# ref lake df
ref_ranges = plit_tp_ranges %>%
  filter(!lake_species %in% c("Baby Lk. SMB", "Baby Lk. YPERCH", "Daisy Lk. SMB", "Daisy Lk. YPERCH", "Nelson Lk. SMB", "Nelson Lk. YPERCH"))

ref_yp = ref_ranges %>%
  filter(!group %in% c(5,7,11,13,15)) %>%
  summarise(plit_x_min = mean(plit_min),
            sd_plit_min = sd(plit_min),
            plit_x_max = mean(plit_max),
            sd_plit_max = sd(plit_max),
            plit_x_range = mean(range_plit),
            sd_plit_range = sd(range_plit),
            tp_x_min = mean(tp_min),
            sd_tp_min = sd(tp_min),
            tp_x_max = mean(tp_max),
            sd_tp_max = sd(tp_max),
            tp_x_range = mean(range_tp),
            sd_tp_range = sd(range_tp)
           )

ref_smb = ref_ranges %>%
  filter(group %in% c(5,7,11,13,15)) %>%
  summarise(plit_x_min = mean(plit_min),
            sd_plit_min = sd(plit_min),
            plit_x_max = mean(plit_max),
            sd_plit_max = sd(plit_max),
            plit_x_range = mean(range_plit),
            sd_plit_range = sd(range_plit),
            tp_x_min = mean(tp_min),
            sd_tp_min = sd(tp_min),
            tp_x_max = mean(tp_max),
            sd_tp_max = sd(tp_max),
            tp_x_range = mean(range_tp),
            sd_tp_range = sd(range_tp)
            )
