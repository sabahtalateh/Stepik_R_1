
m <- mtcars

mtcars$new_var <- ifelse((mtcars$carb >= 4) | (mtcars$cyl > 6), 1, 0)

my_vector <- 1:200

if (mean(my_vector) > 20) {
  result <- 'My mean is great'
} else {
  result <- 'My mean is not so great'
}

good_months <- c()
for (i in 2:length(AirPassengers)) {
  if (AirPassengers[i] > AirPassengers[i-1]) {
    good_months <- c(good_months, AirPassengers[i])
  }
}

good_months <- AirPassengers[-1][AirPassengers[-1] > AirPassengers[-144]]
good_months

cumsum(AirPassengers[1:(length(AirPassengers) - 10)])

cumsum(AirPassengers)
cumprod(1:4)

moving_average <- numeric(135)
for(i in 1:(length(AirPassengers) - 9)) {
  moving_average[i] <- mean(AirPassengers[(i):(i+9)])
}

moving_average

mean(AirPassengers[1:10])


n <- 10    
d <- AirPassengers    
cx <- c(0, cumsum(d))    
moving_average <- (cx[(n + 1):length(cx)] - cx[1:(length(cx) - n)]) / n

(cx[11] - cx[1]) / 10
(cx[12] - cx[2]) / 10
(cx[13] - cx[3]) / 10
(cx[14] - cx[4]) / 10




