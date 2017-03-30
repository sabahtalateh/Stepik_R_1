setwd("~/Code/Stepik_R_1/m2/l2")

dd <- read.table('dd6.txt')

colnames(dd) <- c('v', 'grp')

bartlett.test(V1 ~ V2, dd)

dd1 <- subset(dd, dd$grp == 1)
dd2 <- subset(dd, dd$grp == 2)

t.test(v ~ grp, dd)
t.test(dd1, dd2, var.equal = T)

wilcox.test(v ~ grp, dd)
wilcox.test(df$v, df$grp)
