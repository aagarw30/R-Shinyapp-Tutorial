library(shiny)
library(datasets)
shinyServer(function(input, output) {
  # to print the heading in the main panel for structure of the data set. Dependency on the update button.
  output$dataname <- renderText({
    paste("Structure of the dataset", input$dataset)
    
  })
  
  # to print the heading in the main panel for observation of the data set. Dependency on the update button.
  output$observation <- renderText({
    paste("First", input$obs, "observations of the dataset", input$dataset)
    
  })
  
  # Return  the dataset structure. We have used the str() function to get the structure of the dataset. # this reactive function would show its effect only after the update button is pressed
  
  output$structure <- renderPrint({
    str(get(input$dataset)) 
  })
  
  # for dataset observations -  "n" observations as defined by user's input. The value of number of observation will come from the input$obs
  output$view <- renderTable({
    head(get(input$dataset), n = input$obs)
    
  })
})