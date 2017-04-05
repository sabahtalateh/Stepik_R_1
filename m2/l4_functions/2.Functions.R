setwd("~/Code/Stepik_R_1/m2/l4_functions")

read_data <- function() {
  df <- data.frame()
  # <<- доступно станет снаружи функции
  number <<- 0
  for (filename in dir(path = "./grants_data", pattern = "*.csv")) {
    df <- rbind(df, read.csv(paste("./grants_data/", filename, sep = "")))
    number <<- number + 1
  }
  print(paste(as.character(number), "Files were combined"))
}

grants <- read_data()
number

v <- c(1, -2, 3, NA, NA)
sum(v[v > 0], na.rm = T)

library(ggplot2)
v <- rnorm(20, sd = 1, mean = 0)
v <- c(v, c(5, 4, -5, -4))
v <- as.data.frame(v)
IQR(v$v)
q <- quantile(v$v, probs = c(0.25, 0.75))
ggplot(v, aes(x = "x", y = v))+
  geom_boxplot()

vv <- v$v
vv[(vv > (q[1] - 1.5*IQR(vv))) & (vv < (q[2] + 1.5*IQR(vv)))]

outliers.rm <- function(x){
  q <- quantile(x, probs = c(0.25, 0.75))
  iqr <- IQR(x)
  return(
    x[x > (q[1] - 1.5*iqr) & vv < (q[2] + 1.5*iqr)]
  ) 
}

outliers.rm(v$v)















