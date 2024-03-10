```{r Ellipse area}
library(SIBER)
library(magrittr)
library(nicheROVER)
library(viridis)

####import new SIBER dat, make 2 df, one p_lit, one adjp_lit, rename iso1, iso2, group, community columns for both

siberdat <- read_csv("../data/big-siberdat.csv")
siberdat <- siberdat %>%
  subset(select = c("plit_bound", "tp_2", "TAXON", "Water")) %>%
  rename("iso1" = "plit_bound",
         "iso2" = "tp_2",
         "group" = "TAXON",
         "community" = "Water") %>%
  na.omit()
siberdat <- siberdat %>%
  subset(group %in% c("SMB", "YPERCH"))

#formatting community to integers
siberdat$community[siberdat$community == "Baby Lk."] <- 1
siberdat$community[siberdat$community == "Daisy Lk."] <- 2
siberdat$community[siberdat$community == "Nelson Lk."] <- 3
siberdat$community[siberdat$community == "Mendelssohn"] <- 4
siberdat$community[siberdat$community == "Turtleshell"] <- 5
siberdat$community[siberdat$community == "Manitou"] <- 6
siberdat$community[siberdat$community == "Wawiashkashi"] <- 7
siberdat$community[siberdat$community == "Stormy"] <- 8
siberdat$community <- as.integer(siberdat$community)
#formatting group as integers
siberdat$group[siberdat$group == "SMB"] <- 1
siberdat$group[siberdat$group == "YPERCH"] <- 2
siberdat$group <- as.integer(siberdat$group)
siberdat <- as.data.frame(siberdat)

siber.obj <- createSiberObject(siberdat)

community.hulls.args <- list(col = 1, lty = 1, lwd = 1)
group.ellipses.args <- list(n = 100, p.interval = 0.95, lty = 1, lwd = 2)
group.hulls.args <- list(lty = 2, col = "grey20")

par(mfrow=c(1,1))
plotSiberObject(siber.obj,
                ax.pad = 2,
                hulls = F, community.hulls.args = community.hulls.args,
                ellipses = T, group.ellipses.args = group.ellipses.args,
                group.hulls = F, group.hulls.args = group.hulls.args,
                bty = "L",
                iso.order = c(1,2),
                xlab = "Proportion Littoral",
                ylab = "Trophic Position"
)


#species in each lake
group.ML <- groupMetricsML(siber.obj)
print(group.ML)

#by lake
community.ML <- communityMetricsML(siber.obj) 
print(community.ML)



```