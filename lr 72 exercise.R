
#loading data and labels
NH11 <- readRDS("dataSets/NatHealth2011.rds")
labs <- attributes(NH11)$labels

#clean-up factors for everwrk and r_maritl
NH11$everwrk <- factor(NH11$everwrk, levels=c("1 Yes", "2 No"))
NH11$r_maritl <- droplevels(NH11$r_maritl)

#regression model
mod1 = glm(everwrk~age_p + r_maritl, data=NH11, family=binomial)
print(summary(mod1))

#probability of working by level
library(effects)
data.frame(Effect("r_maritl", mod1))

