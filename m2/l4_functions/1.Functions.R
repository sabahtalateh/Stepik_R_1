setwd("~/Code/Stepik_R_1/m2/l4_functions")
source("my_na_rm.R")

d1 <- rnorm(2000)
d1[1:10] <- NA

d2 <- runif(2000)
d2[1:10] <- NA

d1 <- my_na_rm(d1)
d2 <- my_na_rm(d2)


NA.position <- function(x) {
  idxs <- c()
  i <- 1
  for (e in x) {
    if (is.na(e)) {
      idxs <- c(idxs, i)
    }
    i <- i + 1
  }
  return(idxs)
}

NA.counter <- function(x){
  return(sum(is.na(x)))
}

my_vector <- c(1, 2, 3,3, NA, NA)
NA.position(my_vector)
NA.counter(my_vector)



