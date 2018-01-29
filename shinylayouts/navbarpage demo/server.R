library(shiny)
shinyServer(function(input, output, session) {
  
  
  # for display of mtcars dataset in the "Data Page"
  output$data <- renderTable({
    mtcars
  })
  
  # for display of histogram in the "Widget & Sidepar page"
  output$plot <- renderPlot({
    hist(mtcars$mpg, col ="blue", breaks=input$b )
  })
  
  # for display of mtcars dataset summary statistics in the "Menu item A page"
  output$summary <- renderPrint({
    summary(mtcars)
  })
  
})
