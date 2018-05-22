library(shiny)
library(shinydashboard)

shinyServer(function(input, output, session){
  
  ## for display of mtcars dataset
  output$mydatatable <- renderDataTable({
    mtcars
  })
  
}
)