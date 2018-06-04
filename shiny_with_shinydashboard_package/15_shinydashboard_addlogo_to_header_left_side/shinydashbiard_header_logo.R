## Demo - add logo (icon or image)in the shinydashboard header (left side)

# load the required packages
library(shiny)
library(shinydashboard)

## Add icon along with the title in the shinydashboard header
title <- tags$a(href='https://www.google.com',
                 icon("diamond"),
                 'Diamonds Explorer', target="_blank")

# Adding image or logo along with the title in the header
# title <- tags$a(href='https://www.google.com',
#                 tags$img(src="rstudio.jpg", height = '50', width = '50'),
#                 'Diamonds Explorer', target="_blank")

## ui code starts here
ui <- fluidPage(
  dashboardPage(
                 dashboardHeader(title = title, titleWidth = 600), 
                 dashboardSidebar(),
                 dashboardBody(
                   # add reference to CSS file
                   # ensure that CSS file is in the www folder of the working directory
                   tags$head(
                     tags$link(rel = "stylesheet", type = "text/css", href = "custom1.css")
                   )
                 )
  )
)

shinyApp(ui, server = function(input, output, session) {})