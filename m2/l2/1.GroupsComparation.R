?iris
df <- iris
str(df)

df1 <- subset(df, Species != "setosa")
str(df1)
table(df1$Species)

hist(df1$Sepal.Length)

library(ggplot2)

ggplot(df1, aes(x = Sepal.Length))+
  geom_histogram(fill = "white", col = "black", binwidth = 0.4)+
  facet_grid(Species ~ .)

ggplot(df1, aes(x = Sepal.Length, fill = Species))+
  geom_density(alpha = 0.4)

ggplot(df1, aes(x = Species, y = Sepal.Length))+
  geom_boxplot()
