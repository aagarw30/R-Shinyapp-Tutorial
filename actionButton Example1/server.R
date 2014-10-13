library(shiny)
shinyServer(function(input, output) {
  output$txt1 <- renderText({
    paste("My first name is: ", input$text1)
    
  })
  output$txt2 <- renderText({
    # input from the action button from ui.R
    # initial value of action is zero but when clicked the value increments each time it is clicked
    input$action
    # isolate function is used to create dependency on the action button
    # if isolate is not used, text will be displayed reactively as soon as user inputs the text
    # isolate(paste("My last name is :", input$text2))
    paste("My last name is :", input$text2)
  })
  
})

