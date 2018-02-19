library(shiny)
library(shinyjs)

shinyUI(fluidPage(
  h3("Demo - shinyjs alert(), delay(), hide(), enable() functions together with a simple data read and write use case"),
  h4(" First the data will be read from UCI URL. While the data is being read, a text message will appear telling user that data is being read. "),
  h4("Also, the save button is disabled.  Once data read is completed, the text message shall go away and save button will enable. Data will be written to the working directory locally and once completed an alert message will show up saying file saved."),
  
  
  useShinyjs(), ## initializing for Shiny to be able use the functions that comes with shinyjs package.
  hr(),
  
  # define the ID for heading h4() using div tag
  tags$div(id="p1", h4("Reading the data from web...."), style='color:brown;'),
  
  ## Save button will be disabled on the page load
  disabled(actionButton("save" , "Save Dataset")) # for writing the file to working directory
  # disabled() is shinyjs function
  
))