library(shiny)
shinyUI(fluidPage(
  titlePanel("literacy in India"),
  sidebarLayout(
    sidebarPanel(
      selectInput(inputId = "year", label = "Select the year from the below choice", choices = c("X1951" = 3, "X1961" = 4, "X1971"= 5, "X1981"= 6, "X1991" =7, "X2001" =8), selected = 8)
      
      ),
    mainPanel(
      plotOutput("ind")
      )
    
    )
  
  ))