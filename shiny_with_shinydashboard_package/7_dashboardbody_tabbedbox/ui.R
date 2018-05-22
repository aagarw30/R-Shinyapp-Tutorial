## Intro shinydashboard package
## Demo shinydashboard tabbox 

# tabBox(), tabPanel()

## Load required packages
library(shiny)
library(shinydashboard)
library(plotly)
library(datasets)

shinyUI(
  dashboardPage(
    dashboardHeader(title = "Demo shinydashboard package - create tab box", titleWidth = 700),
    
    dashboardSidebar(
      sidebarMenu(
        menuItem("tabBox", tabName = "charts", icon=icon("check"))
      )
    ),
    
    
    dashboardBody(
      # within tabitems(), define the pages for sidebar menu items
      tabItems(
        ## Using box to display plots
        tabItem(tabName = "charts",
          fluidRow(
            tabBox(id="tabchart1",
                   tabPanel("Tab1", plotlyOutput("plot1")),
                   tabPanel("Tab2", plotlyOutput("plot2")),
                   tabPanel("Tab3", plotlyOutput("plot3"))),
            
            tabBox(id="tabchart2", side = "right",
                   tabPanel("Tab1", "Tab 1 content"),
                   tabPanel("Tab2", "Tab 2 content"),
                   tabPanel("Tab3", "Tab 3 content"))
          )
            )
          
        )
      )
    )
  )
