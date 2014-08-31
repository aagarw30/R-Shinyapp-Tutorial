library(shiny) # Load shiny package
data(iris) # Load the iris dataset


shinyServer(
  
  
  function(input, output) {
    
    # Creating the reactive function so that the expression inside this function is reactive and also the value of the evaluated expression could be used by other render statements avoiding evaluation of expression multiple times.
    
    colm <- reactive({
      as.numeric(input$var)
      
    })
    
    output$text1 <- renderText({ 
      # colm = as.numeric(input$var) # commented , this expression is actually part of the reactive function
      paste("Data set variable/column name is", names(iris[colm()]))
      
    })
    
    output$text2 <- renderText({ 
      paste("Color of histogram is", input$radio)
    })
    
    output$text3 <- renderText({ 
      paste("Number of histogram BINs is", input$bin)
    })
    
  output$myhist <- renderPlot(
    
    {
    # colm = as.numeric(input$var) # commented , this expression is actually part of the reactive function. 
    hist(iris[,colm()], col =input$colour, xlim = c(0, max(iris[,colm()])), main = "Histogram of Iris dataset", breaks = seq(0, max(iris[,colm()]),l=input$bin+1), xlab = names(iris[colm()]))}
    
    )    
  }
  )
 