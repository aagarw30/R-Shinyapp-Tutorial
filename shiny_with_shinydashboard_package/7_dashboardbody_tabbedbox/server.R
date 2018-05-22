## Load required packages
library(shiny)
library(shinydashboard)
library(plotly)
library(datasets)

shinyServer(function(input, output, session){
  

  ## Plotly Scatter Plot
  output$plot1 <- renderPlotly({
    plot_ly(data=mtcars, 
            x=~wt, 
            y=~mpg,
            type = "scatter",
            mode = "markers")
    
  })
  
  
  ## Plotly Histogram
  output$plot2 <- renderPlotly({
    plot_ly(data=mtcars, x=~mpg, type="histogram")
    
    
  })
  
  
  output$plot3 <- renderPlotly({
    plot_ly(data=mtcars, 
            x=~hp, 
            y=~mpg,
            type = "scatter",
            mode = "markers")
    
  })
  
  
}
)