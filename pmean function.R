
setwd("C:\\Users\\HTCA\\Desktop\\Study")


pmean <- function(dir, x, id = 1:332){
  dir <- paste(getwd(),"/",dir,"/",sep="")
  
  flist <- list.files(dir)
  data <- NA
  
  for (i in id) {
    
    fdir <- paste(dir,flist[i],sep="")
    fdata <- read.csv(fdir)
    
    # accumulate the data
    data <- rbind(data,fdata)
  }
  # Calculate the mean and return it
  mean(data[[x]],na.rm = TRUE)
}



pmean("coursera","sulfate",id=1:10) 
