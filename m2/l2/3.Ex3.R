setwd("~/Code/Stepik_R_1/m2/l2")

df <- read.table('dd3-3.txt')
names(df) <- c('v1', 'v2')

df1 <- as.data.frame(df$v1)
df1$grp <- 'grp1'
df2 <- as.data.frame(df$v2)
df2$grp <- 'grp2'
names(df1) <- c('v', 'grp')
names(df2) <- c('v', 'grp')

newdf <- rbind(df1, df2)

wilcox.test(df$v1, df$v2)

library(ggplot2)

ggplot(newdf, aes(x = grp, y = v))+
  geom_boxplot()

t.test(df$v1, df$v2)

