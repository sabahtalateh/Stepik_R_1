#
# Reading data
#

setwd("~/Code/Stepik_R_1")

mydata <- read.csv('m1/l3/evals.csv')

#
# Summaries
#
head(mydata, 3)
tail(mydata, 4)

# Открыть данные в табличке
View(mydata)

# Структура фрэйма
str(mydata)

# Саммари
summary(mydata)

# Названия колонок
names(mydata) # - вектор

# Обращение к переменны в датафрэйме - получаем вектор
b <- mydata$score
mean(b)

summary(b)

mydata$score * 2

# Создание нового столбика
mydata$double_score <- mydata$score * 2

summary(mydata$double_score)

# Весь столбик равен 0
mydata$null <- 0
summary(mydata$null)

# пронумеруе строчки
mydata$index <- 1:nrow(mydata)

nrow(mydata) # к-во строк
ncol(mydata) # к-во столбиков

# Subsetting
mydata$score[1:10]

mydata[1,1]                 # 1-я строка, 1-й столбик
mydata[c(1,22,33), c(1,2)]  # можно и так
mydata[1:100, 1]

mydata[5,]                  # Вся 5-я строка
mydata[,1]                  # Весь первый столбик
mydata[,1] == mydata$score

mydata[,2:5]                # Все строки по 2,3,4,5 наблюдениям
head(mydata[,2:5])

mydata$gender
mydata$gender == 'female'
head(mydata[mydata$gender == 'female', 1:3]) # Все значения 1-го столбика для женщин

head(subset(mydata, gender == 'female'))

subset(mydata, score > 4.8)

#
# rbind, cbind
#
mydata2 <- subset(mydata, gender == 'male')
mydata3 <- subset(mydata, gender == 'female')

# rbin - соединить 2 фрэйма по строкам, нужно чтобы столбцы назывались одинаково
# и их было одинкаовое количество
mydata4 <- rbind(mydata2, mydata3)

mydata5 <- mydata[, 1:10]
mydata6 <- mydata[, 11:24]

# cbind - скливает по столбцам
mydata7 <- cbind(mydata6, mydata5)

library(help = 'datasets')

data("mtcars")
mydata10 <- mtcars
help(mtcars)

mtcars$even_gear <- abs(mtcars$gear %% 2 - 1)
View(mtcars)

mpg_4 <- mtcars[mtcars$cyl == 4, 'mpg']
mpg_4 <- mtcars$mpg[mtcars$cyl == 4]

mini_mtcars <- mtcars[c(3,7,10,12,nrow(mtcars)),]

# Всё кроме 1 и 2 строки
mini_mtcars1 <- mtcars[-c(1,2),]

# удалить столбик
mini_mtcars1$mpg <- NULL



