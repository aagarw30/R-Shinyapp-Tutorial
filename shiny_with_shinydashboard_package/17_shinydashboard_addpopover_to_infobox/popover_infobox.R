# Demo - add popover to infoBox

## load the required packages
library(shiny) 
library(shinydashboard)
# install.packages("shinyBS") # install the package if not already installed
library(shinyBS) # for popover
library(ggplot2) # for diamonds dataset

# ui code begins here
ui <- dashboardPage(
  dashboardHeader(title = "Demo - add popover to infoBox", titleWidth = 400),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Dashboard", tabName = "dashboard", icon = icon("dashboard"))
      
    )
  ),
  dashboardBody(
    ## reference the style CSS sheet
                tags$head(
                  tags$link(rel = "stylesheet", type = "text/css", href = "custom3.css")
                ),
                
                # create popover using shinyBS package - on mouse hover question icon
                bsPopover(id="q1", title = "Mean", 
                          content = "Mean price of diamonds", 
                          trigger = "hover", 
                          placement = "right",
                          options = list(container = "body")),
                
                # create popover using shinyBS package - on hover the infobox
                bsPopover(id="info2", title = "Median", 
                          content = "Median price of diamonds", 
                          trigger = "hover", 
                          placement = "right",
                          options = list(container="body")),
                
                tabItems(
                  # First tab content
                  tabItem(tabName = "dashboard",
                          fluidRow(
                            infoBoxOutput("info1"), # first infoBox
                            infoBoxOutput("info2") # second infoBox
                            
                            
                          )
                  ))))

# server code begins here
server <- function(input, output, session) {
  
  # infoBox for mean value of diamonds price
  output$info1 <- renderInfoBox({
    infoBox("Mean", round(mean(diamonds$price), 2), 
            icon = icon("usd"), 
            # used subtitle argument to create icon to be used to trigger the popover
            subtitle = tags$a(icon("question-circle"), id="q1"))
                               })
  
  
  # infoBox for median value of diamonds price
  output$info2 <- renderInfoBox({
    infoBox("Median", median(diamonds$price), icon = icon("usd"))
    
                                  })
  }

shinyApp(ui, server)