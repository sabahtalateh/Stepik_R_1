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

