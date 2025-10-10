remove_outliers <- function(df,cols){
  for (col in cols) {
    q1 <- quantile(df[[col]],0.25,na.rm = TRUE)
    q3 <- quantile(df[[col]],0.75,na.rm = TRUE)
    iqr <- q3 - q1
    lower <- q1 - 1.5 * iqr
    upper <- q3 + 1.5 * iqr
    df<-na.omit(df)
    mean_value <- mean(df[[col]],na.rm = TRUE)
    outliets <- df[[col]][df[[col]] < lower | df[[col]] > upper]
    if(length(outliets) > 0){
      cat("Outliers : ",col)
      print(outliets)
    }else{
      print("No Outliers found")
    }
    df <- df[df[[col]] >= lower & df[[col]] <= upper,]
  }
  return(df)
}

df_clean <- remove_outliers(airquality, c("Ozone","Wind"))
View(df_clean)
boxplot(df_clean)


replace_outliers_with_mean <- function(df,cols){
  for (col in cols) {
    Q1 <- quantile(df[[col]], 0.25, na.rm = TRUE) 
    Q3 <- quantile(df[[col]], 0.75, na.rm = TRUE) 
    IQR <- Q3 - Q1 
    lower_bound <- Q1 - 1.5 * IQR 
    upper_bound <- Q3 + 1.5 * IQR
    mean_value <- mean(df[[col]],na.rm=TRUE)
    outliers <- df[[col]][df[[col]] < lower_bound |df[[col]] > upper_bound ]
    df <- na.omit(df)
    if (length(outliers) > 0) {
      cat("Outliers in", col, ":\n")
      print(outliers)
      
      # Replace outliers with mean
      df[[col]][df[[col]] < lower_bound | df[[col]] > upper_bound] <- mean_value
    } else {
      cat("No outliers found in", col, "\n")
    }
    df[[col]][df[[col]] < lower_bound & df[[col]] > upper_bound] <- mean_value
  }
    
  return(df)
  }


df_cleanin <- replace_outliers_with_mean(airquality,c('Ozone','Wind'))
View(df_cleanin)
boxplot(df_cleanin)