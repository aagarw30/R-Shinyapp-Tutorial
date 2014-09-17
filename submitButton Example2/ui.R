library(shiny)
# Define UI for dataset viewer application
shinyUI(fluidPage(
  
  # Application title.
  titlePanel("Demonstration of submitButton()"),
  
  sidebarPanel(
    # selectInput widget for the selection of dataset
    selectInput("dataset", "Choose a dataset:", 
                choices = c("iris", "pressure", "mtcars")),
    
    # numericInput for selection of the number of observation that user wants to view
    numericInput("obs", "Number of observations:", 6),
    # submitButton to create dependency of the reactivity on the event of pressing of the submitbutton. 
    submitButton("Update!"),
    p("In this example, changing the user input (datset or number of observation) will not reflect in the output until the Update button is clicked"),
    p("submitButton is used to control the reactiveness of the change in the user input")
  ),
  mainPanel(
    # just a header for the heading
    h4(textOutput("dataname")),
    # display the structure of the selected dataset is dependent of the submit button
    verbatimTextOutput("structure"),
    
    # just a header for the heading
    h4(textOutput("observation")),
    # display the observations of the selected dataset is dependent of the submit button
    tableOutput("view")
  )
))