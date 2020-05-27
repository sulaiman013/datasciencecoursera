
corr <- function(directory, threshold = 0) {
  
  directory <- paste(getwd(),"/",directory,"/",sep="")    
  
  
  observations <- complete(directory)
  filtered_observations = subset(observations,observations$nobs > threshold)
  
  # Aux variables
  file_list <- list.files(directory)
  correlation <- vector()
  
  # For each id in filtered observations:
  for (i in filtered_observations$id) {
    # Read the file,
    file_dir <- paste(directory,file_list[i],sep="")
    file_data <- read.csv(file_dir)
    # remove NA,
    file_data <- subset(file_data,complete.cases(file_data))        
    # and calculate the cor and accumulate it in the corellation vector.
    correlation <- c(correlation,cor(file_data$nitrate,file_data$sulfate))    
  }
  #Finally, return the vector
  correlation
}

cr <- corr("coursera")                
cr <- sort(cr)   
RNGversion("3.5.1")
set.seed(868)                
out <- round(cr[sample(length(cr), 5)], 4)
print(out)




cr <- corr("coursera", 129)                
cr <- sort(cr)                
n <- length(cr)    
RNGversion("3.5.1")
set.seed(197)                
out <- c(n, round(cr[sample(n, 5)], 4))
print(out)



cr <- corr("coursera", 2000)                
n <- length(cr)                
cr <- corr("coursera", 1000)                
cr <- sort(cr)
print(c(n, round(cr, 4)))
