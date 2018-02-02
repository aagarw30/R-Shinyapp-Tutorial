library(shiny)
shinyServer(function(input, output, session) {
  
  output$table1 <- renderTable({
    mtcars
  })
  
  output$summary1 <- renderPrint({
    summary(mtcars)
  })
  
  output$plot <- renderPlot({
    hist(mtcars$mpg, breaks = input$n)
  })
  
  
})
