my_na_rm <- function(v) {
  if (is.numeric(v)) {
    norm_test <- shapiro.test(v) 
    if (norm_test$p > 0.05) {
      v[is.na(v)] <- mean(v, na.rm = T)
      print("NA were replaced with mean")
    } else {
      v[is.na(v)] <- median(v, na.rm = T)
      print("NA were replaced with median")
    }
    return(v)  
  } else {
    print("Argument is not numeric")
  }
}