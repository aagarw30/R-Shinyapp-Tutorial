## Demo - Add social media links in the shinydashboard header
## Add icons on right side of shinydashboard header

# load the required packages
library(shiny)
library(shinydashboard)

## Add icon along with the title in the shinydashboard header
title <- tags$a(href='https://www.google.com',
                 icon("diamond"),
                 'Diamonds Explorer', target="_blank")


## ui code starts here
ui <- fluidPage(
  dashboardPage(
    dashboardHeader(title = title, titleWidth = 600,
                    tags$li(class="dropdown",tags$a(href="https://www.youtube.com/playlist?list=PL6wLL_RojB5xNOhe2OTSd-DPkMLVY9DfB", icon("youtube"), "My Channel", target="_blank")),
                    tags$li(class="dropdown",tags$a(href="https://www.linkedin.com/in/abhinav-agrawal-pmp%C2%AE-itil%C2%AE-5720309/" ,icon("linkedin"), "My Profile", target="_blank")),
                    tags$li(class="dropdown",tags$a(href="https://github.com/aagarw30/R-Shinyapp-Tutorial", icon("github"), "Source Code", target="_blank"))

                    
                    ), 
    dashboardSidebar(),
    dashboardBody(
      # include the reference to CSS file
      # ensure that CSS file is in the www folder of the working directory
      tags$head(
        tags$link(rel = "stylesheet", type = "text/css", href = "custom1.css")
      )
    )
  )
)

shinyApp(ui, server = function(input, output, session) {})