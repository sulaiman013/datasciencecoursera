
complete <- function(directory, id = 1:332) {
  
  directory <- paste(getwd(),"/","coursera","/",sep="")
  
 
  file_list <- list.files(directory)
  ids <- vector()
  nobs <- vector()
  
  
  for (i in id) {
    
    file_dir <- paste(directory,file_list[i],sep="")
    file_data <- read.csv(file_dir)
    
       
    ids = c(ids,i)
    nobs = c(nobs,sum(complete.cases(file_data))     )
  }
  
  data.frame(id = ids, nobs = nobs)
}

complete("coursera", c(1:5))


cc <- complete("coursera", 54)
print(cc$nobs)

RNGversion("3.5.1")
set.seed(42)
cc <- complete("coursera", 332:1)
use <- sample(332, 10)
print(cc[use, "nobs"])
