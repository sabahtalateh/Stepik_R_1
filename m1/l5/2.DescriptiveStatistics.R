df <- mtcars

df$vs <- factor(df$vs, labels = c("V", "S"))
df$am <- factor(df$am, labels = c("Auto", "Manual"))

library(psych)

descr <- describe(x = df[, -c(8,9)])

dscribe2 <- describeBy(x = df[, -c(8,9)], group = df$vs, mat = TRUE, digits = 1)
# fast - базовые статистики
dscribe3 <- describeBy(x = df[, -c(8,9)], group = df$vs, mat = TRUE, digits = 1, fast = TRUE)

describeBy(x = df$qsec, group = list(df$vs, df$am), mat = T, digits = 2, fast = T)
 