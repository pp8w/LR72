## LR72
Logistic Regression (7.2)

---
#loading data and labels
NH11 <- readRDS("dataSets/NatHealth2011.rds")
labs <- attributes(NH11)$labels
---

#Part 1: Use glm to conduct a logistic regression to predict ever worked (everwrk) using age (agep) and marital status (rmaritl).
Note: given instructions use incorrect names - actual names have "_"
clean-up factors for everwrk and r_maritl

NH11$everwrk <- factor(NH11$everwrk, levels=c("1 Yes", "2 No"))
NH11$r_maritl <- droplevels(NH11$r_maritl)

regression model
mod1 = glm(everwrk~age_p + r_maritl, data=NH11, family=binomial)
print(summary(mod1))

---
#Part 2: Predict the probability of working for each level of marital status.

library(effects)
data.frame(Effect("r_maritl", mod1))
