library(shiny)
library(shinyjs)
# install.packages("data.table")
library(data.table) # to use fread function for faster data read from URL


shinyServer(function(input, output, session){

  # reading data from a given UCI URL
  URL = "http://archive.ics.uci.edu/ml/machine-learning-databases/adult/adult.data"
  mydata = fread(URL, sep = ",", showProgress = FALSE) # reading data from URL
  # fread() is from data.table package
  
  ## hide the text message and enable the save button only when data is read from URL
  if(is.null(mydata)) {return()}
  else
    { hide("p1");enable("save")}
  
  # hide() & enable() are shinyjs functions
  
  ## On click on the save button , read dataset from uci URL and write to working directory
  observeEvent(
    input$save,
    
    { 
      
    starttime = Sys.time() 
    write.csv(mydata, "data.csv", row.names = FALSE) # writing the csv
    endtime = Sys.time()
    timelapse = endtime - starttime # calculate time taken in writing the file
    ms = timelapse *1000 # converting to milliseconds
    delay(ms, alert("File saved, thanks for using the app")) # add delay (until file is written) and then throw the alert message
    # delay() is shinyjs function
    }
    
  )
  
})