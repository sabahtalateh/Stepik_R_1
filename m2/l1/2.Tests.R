setwd("~/Code/Stepik_R_1/m2/l1")

df <- read.csv("grants.csv")
df$status <- as.factor(df$status)
levels(df$status) <- c("Not funded", "Funded")

t1 <- table(df$status)
t1

# Binomial Test

binom.test(x = 5, n = 20, p = 0.5)
binom.test(t1)

# Chi-Square

chisq.test(t1)

chi <- chisq.test(t1)
chi$expected
chi$observed

t2 <- table(status = df$status, field = df$field)
chisq.test(t2)

# Fisher's test (конгда мало наблюдений)
fisher.test(t2)

tab <- HairEyeColor["Brown",,"Female"]
chisq.test(tab)

dia <- diamonds
dia2 <- table(diamonds$cut, diamonds$color)
main_stat <- chisq.test(dia2)$stat
main_stat
str(main_stat)

dd <- diamonds
dd$factor_price <- factor(ifelse(dd$price >= mean(dd$price), 1, 0))
dd$factor_carat <- factor(ifelse(dd$carat >= mean(dd$carat), 1, 0))
main_stat <- chisq.test(table(dd$factor_price, dd$factor_carat))$stat
main_stat

cars <- mtcars

fisher_test <- fisher.test(table(mtcars$am, mtcars$vs))$p






