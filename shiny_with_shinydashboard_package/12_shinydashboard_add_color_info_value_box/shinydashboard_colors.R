## Demo - shinydashboard - add background colors to infoBox(), valueBox()
## Load the required packages

library(shiny)
library(shinydashboard)

## ui code starts here
ui <- fluidPage(
  dashboardPage(skin = "red", 
                dashboardHeader(title = "Demo - add color to shinydashboard box (color argument)", titleWidth = 600), 
                dashboardSidebar("This is sidebar",
                                 sidebarMenu(
                                   
                                   menuItem("BoxColor (infoBox/valueBox)", tabName = "boxcolor", icon=icon("square", class="mystyle")),
                                   tags$style(".mystyle {color:yellow;}") # add yellow color to the icon
 
                                 )
                ),
                dashboardBody(
                  tabItems(
                    tabItem(tabName = "boxcolor",
                            # using the color argument to give the background color
                            # row with infoBoxes with icon background
                            fluidRow(
                              infoBox(title = "Red", value = "007" , color = "red" , width = 3),
                              infoBox(title = "Yellow", value = "007", color =  "yellow", width = 3),
                              infoBox(title = "Aqua", value = "007", color = "aqua",width = 3),
                              infoBox(title = "Blue", value = "007", color = "blue" ,width = 3)
                              
                              
                            ),
                            # row with infoBoxes with icon background
                            fluidRow(
                              infoBox(title = "Navy", value = "007" , color = "navy" , width = 3),
                              infoBox(title = "Teal", value = "007", color =  "teal", width = 3),
                              infoBox(title = "Olive", value = "007", color = "olive",width = 3),
                              infoBox(title = "Lime", value = "007", color = "lime" ,width = 3)
                              
                              
                              
                            ),
                            # row with infoBoxes with icon and content background
                            fluidRow(
                              infoBox(title = "Purple", value = "007" , color = "purple" , width = 3, fill=T),
                              infoBox(title = "Maroon", value = "007", color =  "maroon", width = 3, fill=T),
                              infoBox(title = "black", value = "007", color = "black",width = 3, fill=T),
                              infoBox(title = "Fuchsia", value = "007", color = "fuchsia", width = 3, fill=T)
                              
                            ),
                            ## row with valueBoxes
                            fluidRow(
                              valueBox(subtitle = "Orange", value = "007", color = "orange", width = 3),
                              valueBox(subtitle = "Light Blue", value = "007", color = "light-blue", width = 3),
                              valueBox(subtitle = "Green", value = "007", color = "green", width = 3)
                              
                            )
                            
                    )
                  ))
  )
)

server <- function(input, output, session) {
  
  
}

shinyApp(ui, server)
