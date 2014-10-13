library(shiny)
shinyServer(function(input,output)({
  # x contains all the observations of the x variable selected by the user. X is a reactive function
  x <- reactive({
    iris[,as.numeric(input$var1)]
  })
  # x contains all the observations of the y variable selected by the user. Y is a reactive function
  y <- reactive({
    iris[,as.numeric(input$var2)]
    
  })
  # xl contains the x variable or column name of the iris dataset selected by the user
  xl <- reactive({
    names(iris[as.numeric(input$var1)])
    })
  # yl contains the y variable or column name of the iris dataset selected by the user
  yl <- reactive({
    names(iris[as.numeric(input$var2)])
  })
  
  # render the plot so could be used to display the plot in the mainPanel
  output$plot <- renderPlot({
    plot(x=x(), y=y(), main = "iris dataset plot", xlab = xl(), ylab = yl())
    
  })
  
  # downloadHandler contains 2 arguments as functions, namely filename, content
  output$down <- downloadHandler(
    filename =  function() {
      paste("iris", input$var3, sep=".")
    },
    # content is a function with argument file. content writes the plot to the device
    content = function(file) {
      if(input$var3 == "png")
        png(file) # open the png device
      else
        pdf(file) # open the pdf device
      plot(x=x(), y=y(), main = "iris dataset plot", xlab = xl(), ylab = yl()) # draw the plot
      dev.off()  # turn the device off
    
    } 
)
  
  
  
}))