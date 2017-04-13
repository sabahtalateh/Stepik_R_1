setwd("~/Code/Stepik_R_1/m3/6.logistic_regression")
library(ggplot2)

data <- read.csv('data.csv')
data$admit <- factor(data$admit)
data$rank <- factor(data$rank)
str(data)

data_pred <- subset(data, is.na(data$admit))
data <- subset(data, !is.na(data$admit))
str(data)
ggplot(data = data, aes(x = admit, y = gpa, fill = rank))+
  geom_boxplot()

fit <- glm(data = data, formula = admit ~ rank * gpa, family = 'binomial')
summary(fit)

data$admit_prob <- predict(object = fit, type = 'response')

library(ROCR)
pred_fit <- prediction(data$admit_prob, data$admit)
perf_fit <- performance(pred_fit, "tpr", "fpr")
plot(perf_fit, colorize = T, print.cutoffs.at = seq(0.1, by = 0.1))
auc <- performance(pred_fit, measure = "auc")

perf3 <- performance(pred_fit, x.measure = "cutoff", measure = "spec")
plot(perf3, col = "red", lwd = 2)
perf4 <- performance(pred_fit, x.measure = "cutoff", measure = "sens")
plot(add = T, perf4, col = "green", lwd = 2)
perf5 <- performance(pred_fit, x.measure = "cutoff", measure = "acc")
plot(add = T, perf5, col = "black", lwd = 2)
abline(v = 0.35, lwd = 2)

data_pred$admit <- predict(object = fit, newdata = data_pred, type = 'response')

nrow(data_pred[data_pred$admit >= 0.4,])



