## How to use the skin argument to change the background color of header in shinydashboard

## Load the required packages
library(shiny)
library(shinydashboard)

# Available Colors for skin - to be used with skin argument
# "black", "purple", "green", "red", "yellow", "blue"

## ui code starts here
ui <- fluidPage(
  dashboardPage(skin ="blue", # change the header background color
    dashboardHeader(title = "Demo - skin in shinydashboard (blue skin - default theme)", titleWidth = 600), 
    dashboardSidebar("This is sidebar"),
    dashboardBody("This is dashboard body")
  )
)
server <- function(input, output, session) {

  
}

shinyApp(ui, server)

