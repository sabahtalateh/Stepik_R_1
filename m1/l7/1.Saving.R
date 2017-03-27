setwd("~/Code/Stepik_R_1/m1/l7")

df <- mtcars
str(df)
library(ggplot2)
library(psych)

mean_mpg <- mean(df$mpg)

descr_df <- describe(df[, -c(8,9)])

boxplot <- ggplot(df, aes(x = factor(am), y = disp))+
  geom_boxplot()+
  xlab("Transmission")+
  ylab("Displacement (cu.in.)")+
  ggtitle("Box - plot")

boxplot
getwd()

write.csv(df, "df.csv")
write.csv(descr_df, "df_descr.csv")

my_mean <- mean(10^6:10^9)

save(my_mean, file =  "my_mean.RData")










