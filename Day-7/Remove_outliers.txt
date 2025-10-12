class(airquality)
View(airquality)


data <- datasets::airquality
data


boxplot(data)


remove_outliers <- function(df,cols) {
  for(colname in cols) {
    Q1 <- quantile(df[[colname]], 0.25, na.rm = TRUE)
    Q3 <- quantile(df[[colname]], 0.75, na.rm = TRUE)
    IQR <- Q3-Q1
    upper_bound <- Q3+1.5*IQR
    lower_bound <- Q1-1.5*IQR
    outliers <- df[[colname]][df[[colname]] > upper_bound | df[[colname]] < lower_bound]
    if(length(outliers) > 0) {
      cat("Outliers in ", colname, "\n")
      print(outliers)
    }
    else {
      cat("No outliers in", colname, "\n")
    }
    df <- df[df[[colname]] >= lower_bound & df[[colname]] <= upper_bound,]
  }  
  return(df)  
}


df_clean <- remove_outliers(data,c("Ozone","Wind"))

View(df_clean)

boxplot(df_clean)
