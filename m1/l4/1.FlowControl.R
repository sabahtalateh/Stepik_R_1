setwd("~/Code/Stepik_R_1")

mydata <- read.csv('m1/l4/evals.csv')

# if

a <- -10

if (a > 0) {
  print('positive')
} else {
  print('negative')
  print(a + 1)
}

a <- 10
ifelse(a > 0, 'positive', 'negative')

# ifelse может работать с векторами
# if сработает только на 1-ом элементе и выдаст предупреждение
a <- c(1, -1)
ifelse(a > 0, 'positive', 'negative')


# for
for (i in 1:100) {
  print(i)
}

# все оценки из дата-фрэйма
for (i in 1:nrow(mydata)) {
  print(mydata$score[i])
}

for (i in 1:nrow(mydata)) {
  if (mydata$gender[i] == 'male') {
    print(mydata$score[i])
  }  
}

mydata$quality <- rep(NA, nrow(mydata))

for (i in 1:nrow(mydata)) {
  if (mydata$score[i] >= 4) {
    mydata$quality[i] <- 'good'
  } else {
    mydata$quality[i] <- 'bad'
  }
}

# то же самое
mydata$quality <- ifelse(mydata$score >= 4, 'good', 'bad')

# while
i <- -1

while(i < 51) {
  print(mydata$score[i])
  i <- i+1
}









