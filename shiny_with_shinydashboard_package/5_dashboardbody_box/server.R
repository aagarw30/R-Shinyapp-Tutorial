# Load the required packages
library(shiny)
library(shinydashboard)
library(plotly)
library(datasets)

shinyServer(function(input, output, session){
  
  ## for display of first few observations of mtcars dataset
  output$data <- renderTable({
    head(mtcars)
  })
  
  
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
  
  ## input widget
  output$inputwidget <- renderUI({
    selectInput(inputId = "in", "select a variable", choices = names(mtcars))
  })
  
}
)