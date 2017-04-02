setwd("~/Code/Stepik_R_1/m2/l2")

dd <- read.table('dd9.txt')

dd1 <- subset(dd, dd$V2 == 1)
dd2 <- subset(dd, dd$V2 == 2)

bartlett.test(V1 ~ V2, dd)

t.test(V1 ~ V2, dd)
t.test(dd1, dd2, var.equal = TRUE)

wilcox.test(V1 ~ V2, dd)
wilcox.test(dd$V1, dd$V2)
