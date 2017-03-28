setwd("~/Code/Stepik_R_1/m2/l1")

df <- read.csv("grants.csv")

str(df)
df$status <- as.factor(df$status)
levels(df$status) <- c("Not funded", "Funded")

df$status <- factor(df$status, c("Not funded", "Funded"))


# table
t1 <- table(df$status)
t1

# Размерность таблицы
dim(t1)

t2 <- table(df$status, df$field)
t2
t2 <- table(status = df$status, field = df$field)
t2

dim(t2)

# соотношения
prop.table(t2)

# 100% по строке/столбцу
prop.table(t2, 1)
prop.table(t2, 2)

# 3d table
t3 <- table(years = df$years_in_uni, field = df$field, status = df$status)
t3

dim(t3)

prop.table(t3, 1)

dim(HairEyeColor)
dimnames(HairEyeColor)

sum(HairEyeColor[,, "Female"][, 4])


# plots
barplot(t1)
barplot(t2)
barplot(t2, legend.text = T, args.legend = list(x = "topright"))
barplot(t2, legend.text = T, args.legend = list(x = "topright"), beside = T)

mosaicplot(t2)

library(ggplot2)
mydata <- as.data.frame(HairEyeColor)
dd <- 
dd

ggplot(data = mydata[mydata$Sex == 'Female',], aes(x = Hair, y = Freq, fill = Eye))+ 
  geom_bar(stat="identity", position = "dodge")+
  xlab("Hair")+
  ylab("Freq")+
  scale_fill_manual(values=c("Brown", "Blue", "Darkgrey", "Darkgreen"))





