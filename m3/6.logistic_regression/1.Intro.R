setwd("~/Code/Stepik_R_1/m3/6.logistic_regression")
library(ggplot2)

my_df <- read.csv('train.csv', sep = ';')
str(my_df)

ggplot(data = my_df, aes(read, math, col = gender))+
  geom_point(size = 3)+
  facet_grid(.~hon)+
  theme(axis.text = element_text(size = 12),
        axis.title = element_text(size = 12, face = 'bold'))

fit <- glm(data = my_df, formula = hon ~ read + math + gender, family = 'binomial')
summary(fit)

print(exp(fit$coefficients))

# - логарифмы odds
head(predict(object = fit))

# - веороятности
head(predict(object = fit, type = 'response'))

my_df$prob <- predict(object = fit, type = 'response')


# ROC кривые
library(ROCR)

pred_fit <- prediction(my_df$prob, my_df$hon)
perf_fit <- performance(pred_fit, "tpr", "fpr")
plot(perf_fit, colorize = T, print.cutoffs.at = seq(0.1, by = 0.1))

auc <- performance(pred_fit, measure = "auc")

# Насколько хорошо мы предсказываем отрицательный исход
perf3 <- performance(pred_fit, x.measure = "cutoff", measure = "spec")
plot(perf3, col = "red", lwd = 2)
# Насколько хорошо мы положительный отрицательный исход
perf4 <- performance(pred_fit, x.measure = "cutoff", measure = "sens")
plot(add = T, perf4, col = "green", lwd = 2)
# Разница между значением порога и общей эффективностью классификатора
perf5 <- performance(pred_fit, x.measure = "cutoff", measure = "acc")
plot(add = T, perf5, col = "black", lwd = 2)

# Отсечение берём там где 3 прямые пересекаются
legend(x = 0.6, y = 0.4, c("spec", "sens", "accur"),
       lty = 1, col = c('red', 'green', 'black'), bty = 'n', cex = 1, lwd = 2)
abline(v = 0.22, lwd = 2)

my_df$pred_resp <- factor(ifelse(my_df$prob > 0.22, 1, 0), labels = c('N', 'Y'))

my_df$correct <- ifelse(my_df$pred_resp == my_df$hon, 1, 0)

ggplot(my_df, aes(prob, fill = factor(correct)))+
  geom_dotplot()

mean(my_df$correct)

test_df <- read.csv('test.csv', sep = ';')
test_df$pred_hon <- predict(fit, newdata = test_df, type = 'response')
View(test_df)

# Ex1
mt <- mtcars
mt$am <- factor(mt$am)
mt$vs <- factor(mt$vs)

mt_fit <- glm(data = mt, formula = am ~ disp + vs + mpg, family = 'binomial')
log_coef <- mt_fit$coefficients
summary(mt_fit)

tg <- ToothGrowth
tg$dose <- factor(tg$dose)
str(tg)
ggplot(data = ToothGrowth, aes(x = supp, y = len, fill = factor(dose)))+
  geom_boxplot()






