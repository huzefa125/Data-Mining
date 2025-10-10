remove_na_rows <- function(df, cols) { 
  before_rows <- nrow(df) 
  df <- na.omit(df[, cols]) 
  after_rows <- nrow(df) 
  cat("Removed", before_rows - after_rows, "rows containing NA or blank values in specified 
columns.\n") 
  return(df) 
}

replace_na_with_mean <- function(df,cols){
  for (col in cols) {
    mean_value <- mean(df[[col]],na.rm=TRUE)
    na_count <- sum(is.na(df[[col]]))
    if(na_count > 0){
      df[[col]][is.na(df[[col]])] <- mean_value
    }else{
      cat("No NA FOund")
    }
  }
  return(df)
}

df_clean <- replace_na_with_mean(airquality,c('Ozone','Solar.R'))
View(df_clean)