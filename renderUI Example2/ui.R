library(shiny)
shinyUI(fluidPage(
  titlePanel("Demonstration of renderUI in shiny - Dymanically creating the tabs based on user inputs"),
  sidebarLayout(
    sidebarPanel(
      # Numeric input to enter the number of tabs needed
      numericInput("n", 'Enter the number of tabs needed', 1)
      
      ),
    mainPanel(
      # using the output variable from renderUI in server.r and displaying the tabs
      # uiOutput is used in ui.r to interact with the output variable of the renderUI() function in server.r
      uiOutput('tabs')
      
      
      )
    
    )
  
  
))