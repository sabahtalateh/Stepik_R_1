setwd("~/Code/Stepik_R_1/m3/3.multiple_linear_regression")

swiss <- data.frame(swiss)

fit_full <- lm(data = swiss, formula = Fertility ~ .)
summary(fit_full)

str(swiss)

fit_reduced1 <- lm(data = swiss, formula = Fertility ~ Examination + Education + Catholic + Infant.Mortality)
summary(fit_reduced1)

anova(fit_full, fit_reduced1)

fit_reduced2 <- lm(data = swiss, formula = Fertility ~ Agriculture + Education + Catholic + Infant.Mortality)
anova(fit_full, fit_reduced2)

#
# model auto-selection
#

optimal_fit <- step(fit_full, direction = 'backward')
summary(optimal_fit)

attitude <- data.frame(attitude)
str(attitude)
model_full <- lm(data = attitude, formula = rating ~ .)
model_null <- lm(data = attitude, formula = rating ~ 1)

ideal_model <- step(object = model_null, scope = list(lower = model_null, upper = model_full), direction = 'forward')
summary(ideal_model)
anova(model_full, ideal_model)

LifeCycleSavings <- LifeCycleSavings
str(LifeCycleSavings)
model <- lm(data = LifeCycleSavings, formula = sr ~ (.) ^ 2)



