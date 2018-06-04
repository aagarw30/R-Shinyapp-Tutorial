## Demo - change the header color of the box
## box statuses that comes with shinydashboard
## shinydashboard comes with status property that can be used as an argument within the box function to add color to the box

## Load the required packages
library(shiny)
library(shinydashboard)

## ui code starts here
ui <- fluidPage(
  dashboardPage(
                dashboardHeader(title = "Demo - add color to shinydashboard box header (status argument)", titleWidth = 800), 
                dashboardSidebar("This is sidebar",
                                 sidebarMenu(
                                   menuItem("BoxStatus", tabName = "boxstatus", icon = icon("square"))
                                                                    )
                ),
                dashboardBody(
                  tabItems(
                    tabItem(tabName = "boxstatus",
                            # using the status parameter of box function to change the box header color
                            fluidRow(box(title= "danger (red)", status = "danger", width = 2, solidHeader = T),
                                     box(title= "primary (blue)", status = "primary", width = 2, solidHeader = T),
                                     box(title= "success (green)", status = "success", width = 2, solidHeader = T),
                                     box(title= "info (blue)", status = "info", width = 2, solidHeader = T),
                                     box(title= "warning (orange)", status = "warning", width = 2, solidHeader = T)
                                 
                                     # ?validStatuses gives the valid statuses values
                                     
                            )
                            
                    )
 
                            )
                            
                    )
                  ))


server <- function(input, output, session) {
  
  
}

shinyApp(ui, server)
