## Intro shinydashboard package
## Demo shinydashboard box 
## box()

# Load the required packages
library(shiny)
library(shinydashboard)
library(plotly)
library(datasets)

shinyUI(
  dashboardPage(
    dashboardHeader(title = "Demo shinydashboard package - styling box", titleWidth = 600),
    
    dashboardSidebar(
      sidebarMenu(
        menuItem("box", tabName = "box", icon=icon("check"))
            )),
    
    
    dashboardBody(
      # within tabitems(), define the pages for sidebar menu items
      tabItems(
        ## Using box to display plots
        tabItem(tabName = "box",
          # First Row
                fluidRow(box(title = "Box with a plot", plotlyOutput("plot1", height = 250)),
                         
        box(title = "Box with a plot", plotlyOutput("plot2", height = 250), 
            status = "danger", solidHeader = T, collapsible = T),
        
        # Valid status options as follows
        # https://rstudio.github.io/shinydashboard/appearance.html#statuses-and-colors
        
        # Second Row
        fluidRow(box(title = "Box with datatable", tableOutput("data"), width = 8,
                     solidHeader = T, status="success", background = "red"),
                 
         box(title = "Box with input widget", uiOutput("inputwidget"), width = 4, 
             background = "black", solidHeader = T))
        )
      )
    )))
  
)