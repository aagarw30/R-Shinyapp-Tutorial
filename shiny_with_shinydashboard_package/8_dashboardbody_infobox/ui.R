## Intro shinydashboard package
## To change the width of the infoBox use the width argument in the ui side or use the style method in ui

## infoBox or valueBox - Nicer way to represent (or highlight) key piece of information about the data in a dashboard.
## Specify values of parameters, attributes, statistics, key performance indicators etc.

## Introducing the following functions
## infoBoxOutput() -> to display the rendered output  in the dashboardbody
## renderInfoBox() -> to render the  info box
## infoBox() -> to create the info box

## Load the required packages
library(shiny)
library(shinydashboard)


shinyUI(
  dashboardPage(
    dashboardHeader(title = "Demo shinydashboard package - create & render infoBox", titleWidth = 800),
    
    dashboardSidebar(
      sidebarMenu(
        menuItem("infoBox", tabName = "IB")
      )
    ),
    
    
    dashboardBody(
      # within tabitems(), define the pages for sidebar menu items
      tabItems(
        tabItem(tabName = "IB",
                #  first fluid row with 4 infoBoxes of width 3 each
                fluidRow(infoBoxOutput("min_", width = 3), infoBoxOutput("max_", width = 3), infoBoxOutput("sd_", width = 3), infoBoxOutput("mean_", width=3)),
                
                # second fluid row with one infoBox
                fluidRow(infoBoxOutput("median_", width = 6)),
                
                # Third fluid row with one infoBox and inline CSS styling to adjust height and width
                fluidRow(infoBoxOutput("inline"), tags$style("#inline {height:75px; line-height:75px; padding-top:0px; padding-bottom:0px; width:400px;}"))
                
                )
          
          
        )
      )
    )
  )







# https://stackoverflow.com/questions/37861234/adjust-the-height-of-infobox-in-shiny-dashboard?rq=1
# https://stackoverflow.com/questions/35990183/how-can-i-control-the-font-size-of-an-infobox-in-a-shiny-dashboard
