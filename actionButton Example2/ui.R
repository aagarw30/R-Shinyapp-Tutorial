library(shiny)

# Define UI for dataset viewer application
shinyUI(fluidPage(
  
  # Application title.
  titlePanel("Demonstration of actionButton() and isolate"),
  
  sidebarPanel(
    # selectInput widget for the selection of dataset
    selectInput("dataset", "Choose a dataset:", 
                choices = c("iris", "pressure", "mtcars")),
    
    # numericInput for selection of the number of observation that user wants to view
    numericInput("obs", "Number of observations:", 6),
    br(),
    

    
    p("In this example, changing the dataset will update the structure in the main panel. However, would not update the observation until the Update button is pressed. Basically by using the actionButton along with isolate(), we can control the reactiveness of user inputs at Server side"),
    br(),
    # actionButton to create dependency of the reactivity on the event of pressing of the button. Works along with isolate() in the server side
    actionButton("act", "Click to update/view the observation of the selected dataset!"),
    br(),
    p("To partially control the reactiveness at the server side and create dependency of reactivity on the event of pressing the button, isolate() is used in the server.r along with actionButton() in the ui.r")
  ),
  
  mainPanel(
    # just a header for the heading
    h4(textOutput("dataname")),
    # display the structure of the selected dataset
    verbatimTextOutput("structure"),
    
    # just a header for the heading
    h4(textOutput("observation")),
    # display the observations of the selected dataset - note that this is driven by the triggering of the button event - check in server.r
    tableOutput("view")
  )
))