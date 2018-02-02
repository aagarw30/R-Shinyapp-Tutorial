library(shiny)

shinyServer(function(input, output, session){
  
  dat <- reactive({
    switch(input$dataset,
           m = mtcars,
           p = pressure)
    
  })
  
  output$table <- renderTable({
    head(dat(), input$n)
  })
  
  output$summary <- renderPrint({
    summary(dat())
  })
  
})
