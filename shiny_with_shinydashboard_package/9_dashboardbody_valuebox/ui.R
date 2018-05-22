## Intro shinydashboard package
## Demo shinydashboard value box 
## use the width argument in the ui side to set the width or use the inline style method in ui

## infoBox or valueBox - Nicer way to represent (or highlight) key piece of information about the data in a dashboard.
## Specify values of parameters, attributes, statistics, key performance indicators etc.

##### Introducing the following functions ############
## valueBoxOutput() -> to display the rendered output  in the dashboardbody
## renderValueBox() -> to render the  value box
## valueBox() -> to create the value box

## Load the required 
library(shiny)
library(shinydashboard)

shinyUI(
  dashboardPage(
    dashboardHeader(title = "Demo shinydashboard package - create & render valueBox", titleWidth = 800),
    
    dashboardSidebar(
      sidebarMenu(
        menuItem("valueBox", tabName = "VB")
      )
    ),
    
    
    dashboardBody(
      # within tabitems(), define the pages for sidebar menu items
      tabItems(
        tabItem(tabName = "VB", 
                # 4 value boxes with width 3 each in a row
                fluidRow(valueBoxOutput("min_", width = 3), valueBoxOutput("max_", width = 3), valueBoxOutput("sd_", width = 3), valueBoxOutput("mean_", width=3)),
                
                # 3 value boxes in a row
                fluidRow(valueBoxOutput("median_", width = 6), valueBoxOutput("orders_", width = 3), valueBoxOutput("approved_", width = 3))
                )
          
          
        )
      )
    )
  )








# https://stackoverflow.com/questions/37861234/adjust-the-height-of-infobox-in-shiny-dashboard?rq=1
# https://stackoverflow.com/questions/35990183/how-can-i-control-the-font-size-of-an-infobox-in-a-shiny-dashboard
