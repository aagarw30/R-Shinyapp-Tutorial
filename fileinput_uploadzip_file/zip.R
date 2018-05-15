# Demo example - upload a zip file using fileInput and then unzip

# load required packages
library(shiny)

##### ui code starts here #########
ui <- fluidPage(
  # Upload zip files
  fileInput("file", "Upload Zip file", accept = ".zip"),
  # action button to unzip the file
  actionButton("unzip", "Unzip Files"),
  
  # to display the metadata of the zipped file
  tableOutput("filedf"),
  
  # to display the list of unzipped files
  tableOutput("unzipped")
  
)

#### server code starts here
server <- function(input, output, session) {
  
  
  # uploaded file meta data
  output$filedf <- renderTable({
    if(is.null(input$file)){return ()}
    input$file # the file input data frame object that contains the file attributes
  })
  

  # Unzipping files on click of button and then rendering the result to dataframe
  # file gets unzipped to the location where zip file was located in the local system
  observeEvent(input$unzip,
               output$unzipped <- renderTable({
                 unzip(input$file$datapath) # path to extracted files can be defined using exdir argument
               })
           )
 

}

shinyApp(ui, server)