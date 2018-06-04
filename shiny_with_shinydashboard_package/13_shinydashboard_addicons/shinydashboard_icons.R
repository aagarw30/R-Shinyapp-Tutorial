## Demo - adding icons to menu items in shinydashboard and style them
## Load the required packages

library(shiny)
library(shinydashboard)

## ui code starts here
ui <- fluidPage(
  dashboardPage(
                dashboardHeader(title = "Demo - add icons to menu items in shinydashboard and style them", titleWidth = 800), 
                dashboardSidebar("This is sidebar",
                                 sidebarMenu(
                                   # fontawesome class examples
                                   # https://fontawesome.com/v4.7.0/examples/
                                   # https://fontawesome.com/how-to-use/svg-with-js#additional-styling
                                   
                                   # fontawesome site
                                   # https://fontawesome.com/v4.7.0/icons/
                                   
                                   # glyphicon site
                                   # https://getbootstrap.com/docs/3.3/components/
                                   
                                   # fa-spin class to get any icon to rotate, and use fa-pulse to have it rotate with 8 steps
                                   
                                   # just use the icon name without the fa suffix
                                   
                                   # add tachometer icon from fontawesome library
                                   menuItem("Dashboard", tabName = "dashboard", 
                                            
                                            icon=icon("tachometer")),
                                   
                                   ## Using class to increase the size of the icon
                                   menuItem(" Dashboard2", tabName = "dashboard2", 
                                            
                                            icon=icon("tachometer", class = "fa-lg")),
                                   
                                   ## Using class to rotate the icon by 90 degree
                                   menuItem(" Dashboard3", tabName = "dashboard3", 
                                            
                                            icon=icon("tachometer", class = "fa-rotate-90")),
                                   
                                   
                                   ## using spin class to rotate icon and align center 
                                   menuItem("Settings1", tabName = "settings1", 
                                            
                                            icon=icon("cog", class = "fa-spin")
                                   ),
                                   tags$style(".fa-spin {text-align:center;}"),
                                   
                                   # using pulse class to rotate icon in 8 steps
                                   menuItem("Settings2", tabName = "settings2", 
                                            
                                            icon=icon("cog", class = "fa-pulse")
                                   ),
                                   
                                   # using border class to add a border to icon
                                   menuItem("Settings3", tabName = "settings3", 
                                            icon=icon("cog", class = "fa-border")
                                   ),
                                   
                                   ## Add a icon from glyphicon library
                                   menuItem("HourGlass", tabName = "hourglass", 
                                            
                                            icon=icon("hourglass", lib =  "glyphicon")
                                   ),
                                   
                                   # a square icon from fontawesome library
                                   menuItem("BoxStatus", tabName = "boxstatus", icon = icon("square")),
                                   
                                   # coloured square icon
                                   menuItem("BoxColor", tabName = "boxcolor", icon=icon("square", class="mystyle")),
                                   tags$style(".mystyle {color:yellow;}")

                                 )
                ),
                dashboardBody()
  )
)

server <- function(input, output, session) {
  
  
}

shinyApp(ui, server)

