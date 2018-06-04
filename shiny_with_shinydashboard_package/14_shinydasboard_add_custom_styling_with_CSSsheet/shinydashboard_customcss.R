## How to custom style shinydashboard using CSS style sheets 
## Load the required packages

library(shiny)
library(shinydashboard)

## ui code starts here
ui <- fluidPage(
  dashboardPage(
                 dashboardHeader(title = "Demo - custom style shinydashboard using CSS style sheets  ", titleWidth = 800), 
                 dashboardSidebar(
                                  sidebarMenu(
                                    menuItem("Dashboard1", tabName = "dashboard"),
                                    menuItem("Dashboard2", tabName = "dashboard2"),
                                    menuItem("Dashboard3", tabName = "dashboard3")
                                    
                                  )),
                 dashboardBody("This is dashboard body",
                               # include the CSS file
                               tags$head(
                                 tags$link(rel = "stylesheet", type = "text/css", href = "custom.css")
                               )
                               
                               )
  )
)

server <- function(input, output, session) {
  
  
}

shinyApp(ui, server)
