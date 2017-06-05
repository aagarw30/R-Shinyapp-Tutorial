library(shiny)
shinyServer((function(input, output) {
  values <- reactiveValues(uno = 0, dos = 0, tres = 0)
  # Definining and initializing the reactiveValues object with 3 reactive values namely, uno, dos, tres.
  # uno would serve for the reactive value for the first button
  # dos as reactive value for second button
  # tres as reactive value for third button
  # Idea is to set one of the reactive values to 1 when corresponding buttons are clicked and rest to zero. Further based on if conditional statement print which button is pressed.
  
  
  observeEvent(input$buttonuno, {
    values$uno <- 1
    values$dos <- 0
    values$tres <- 0
    
  })
  
  observeEvent(input$buttondos, {
    values$uno <- 0
    values$dos <- 1
    values$tres <- 0
    
    
  })
  
  observeEvent(input$buttontres, {
    values$uno <- 0
    values$dos <- 0
    values$tres <- 1
    
    
  })
  
  output$display <- renderText(
    {
      if(values$uno)
        paste("Button # 1 selected")
      else
        if(values$dos)
          paste("Button # 2 selected")
      else
        if(values$tres)
          paste("Button # 3 selected")
      else
        return()
      
    }
    
  )
}))