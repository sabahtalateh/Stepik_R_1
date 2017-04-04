setwd("~/Code/Stepik_R_1/m2/l3_dipersion_analysis")
library(ggplot2)

mydata <- read.csv('shops.csv')
str(mydata)

boxplot(price ~ origin, data = mydata)

ggplot(data = mydata, aes(x = origin, y = price))+
  geom_boxplot()

# ANOVA
fit <- aov(formula = price ~ origin, data = mydata)
summary(fit)

# ANOVA - 2 Factor
fit1 <- aov(formula = price ~ origin + store, data = mydata)
summary(fit1)

model.tables(fit1, "means")

# Interraction

pd = position_dodge(0.1)
ggplot(mydata, aes(x = store, y = price, color = origin, group = origin)) + 
  stat_summary(fun.data = mean_cl_boot, geom = 'errorbar', width = 0.2, lwd = 0.8, position = pd)+  
  stat_summary(fun.data = mean_cl_boot, geom = 'line', size = 1.5, position = pd) +
  stat_summary(fun.data = mean_cl_boot, geom = 'point', size = 5, position = pd, pch=15) +
  theme_bw()

fit3 <- aov(formula = price ~ origin + store + origin:store, data = mydata)
summary(fit3)

fit4 <- aov(formula = price ~ origin * store, data = mydata)
summary(fit4)

n <- npk
str(n)
naov <- aov(formula = yield ~ N + P + K, data = n)
summary(naov)


# Pairwise comaprations
ggplot(mydata, aes(x = food, y = price))+
  geom_boxplot()

fit5 <- aov(price ~ food, data = mydata)
summary(fit5)

TukeyHSD(fit5)

i <- iris
str(i)
ff1 <- aov(Sepal.Width ~ Species, data = i)
summary(ff1)

TukeyHSD(ff1)


# Повторный анализ
therapy <- read.csv('therapy_data.csv')
str(therapy)

therapy$subject <- as.factor(therapy$subject)
tfit1 <- aov(well_being ~ therapy, data = therapy)
summary(tfit1)
tfit1b <- aov(well_being ~ therapy + Error(subject/therapy), data = therapy)
summary(tfit1b)

tfit2 <- aov(well_being ~ therapy*price, data = therapy)
summary(tfit2)

ggplot(data = therapy, aes(x = price, y = well_being))+
  geom_boxplot()

tfit2b <- aov(formula = well_being ~ therapy*price + Error(subject/(therapy*price)), data = therapy)
summary(tfit2b)

ggplot(data = therapy, aes(x = price, y = well_being))+
  geom_boxplot()+
  facet_grid(~subject)

str(therapy)

tfit3 <- aov(formula = well_being ~ therapy*price*sex, data = therapy)
summary(tfit3)

tfit3b <- aov(formula = well_being ~ therapy*price*sex + Error(subject/(therapy*price)), data = therapy)
summary(tfit3b)

pill <- read.csv('pill1.csv')
pill$patient <- as.factor(pill$patient)
str(pill)

tpill <- aov(formula = temperature ~ pill*doctor + Error(patient/(pill*doctor)), data = pill)
summary(tpill)

tg <- ToothGrowth
tg$dose <- as.factor(tg$dose)
str(tg)

ggplot(ToothGrowth, aes(x = dose, y = len, col = supp, group = supp))+
  stat_summary(fun.data = mean_cl_boot, geom = 'errorbar', width = 0.1, position = position_dodge(0.2))+
  stat_summary(fun.data = mean_cl_boot, geom = 'point', size = 3, position = position_dodge(0.2))+
  stat_summary(fun.data = mean_cl_boot, geom = 'line', position = position_dodge(0.2))



