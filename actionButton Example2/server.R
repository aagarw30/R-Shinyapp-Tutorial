library(shiny)
library(datasets)
shinyServer(function(input, output) {
  
  # to print the heading in the main panel for structure of the data set
  output$dataname <- renderText({
    paste("Structure of the dataset", input$dataset)
    
  })
  
  
  # Return  the dataset structure. We have used the str() function to get the structure of the dataset
  output$structure <- renderPrint({
    # str(datasetInput()) # this reactive function would show its effect only after the action button is pressed
  str(get(input$dataset))
    })

  # to print the heading in the main panel for observation of the data set
  output$observation <- renderText({
    input$act
    # Uncomment the below conditional statement if you do not want to display the observation relatd statement when the page loads the first time
    
#         if(input$act==0)
#           return()
#         else
    isolate(paste("First", input$obs, "observations of the dataset", input$dataset))
    
    
  })
  
  
  
  # for dataset observations -  "n" observations as defined by user's input. The value of number of observation will come from the input$obs
  output$view <- renderTable({
    input$act
#     # act contains the initial value as zero and increments as the button is pressed
   # uncomment the below conditional statements if you wish not to display the dataset observations when the page loads first time

#      if(input$act==0)
#        return()
#      else
       isolate(head(get(input$dataset), n = input$obs))
#     
#     # isolate is used along with the action button as an event handler to create dependency of the reactivity on the action button pressing event

    
  })
})