ms <- ToothGrowth
j05 <- ToothGrowth$len[ToothGrowth$supp == 'OJ' & ToothGrowth$dose == 0.5]
vc1 <- ToothGrowth$len[ToothGrowth$supp == 'VC' & ToothGrowth$dose == 1.0]

ms1 <- subset(ms, ms$supp == 'OJ' & ms$dose == 0.5)
ms2 <- subset(ms, ms$supp == 'VC' & ms$dose == 1.0)
ms3 <- subset(ms, (ms$supp == 'OJ' & ms$dose == 0.5) | (ms$supp == 'VC' & ms$dose == 1.0))

ggplot(ms1, aes(x = len))+
  geom_histogram(fill = "white", col = "black", binwidth = 2)

ggplot(ms3, aes(x = supp, y = len, col = dose))+
  geom_boxplot()

t_stat <- t.test(
  subset(ms, ToothGrowth$supp == 'OJ' & ms$dose == 0.5)$len,
  subset(ms, ToothGrowth$supp == 'VC' & ms$dose == 1.0)$len
)$stat

lek <- read.csv('lekarstva.csv')
t.test(lek$Pressure_before, lek$Pressure_after, paired = T)