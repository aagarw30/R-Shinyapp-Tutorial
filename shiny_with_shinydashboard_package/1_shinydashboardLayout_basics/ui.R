## Intro shinydashboard package
## shinydashboard Basic Layout

# install.packages("shinydashboard")

# Load the required packages
library(shiny)
library(shinydashboard)

shinyUI(
  dashboardPage(
    dashboardHeader(title = "Demo shinydashboard package - This is header", titleWidth = 500),
    # Add a title using the title argument 
    # Change the width of title using the titlewidth argument
    # header can be disabled using the argument disable = TRUE
    
    
    dashboardSidebar("This is sidebar and can have sidebarmenu items", collapsed=TRUE),
    # sidebar can be hidden by using the argument collapsed=TRUE
    
    dashboardBody("This is body. Introducing shinydashboard package and demo of basic layout"
                  
    )
  )
)