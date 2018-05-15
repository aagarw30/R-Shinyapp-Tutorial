## Demo example - Save the plotly plot to local machine

## Save the code file to working directory

library(shiny)
library(ggplot2) # for ggplot
library(plotly) # for plotly graphs
library(webshot) # for plot export
shinyUI(fluidPage(
  titlePanel("Demo - Save plotly & ggplotly graphs to local machine in Shiny"),
  tags$li("We will use the export function "),
  tags$li("Webshot package along with shiny and plotly will be needed"),
  
  # choices for file download format
  radioButtons("format", "Download file format", choices = c("jpeg", "png", "pdf"), selected = "jpeg", inline = TRUE ),
  
  uiOutput("selects1"), # selectinput for variable 1
  uiOutput("selects2"), # selectinput for variable 2
  
  br(),
  # Action button to save the plotly plot
  actionButton("savea", "Save the plotly plot"),
  
  # Action button to save the ggplotly plot
  actionButton("saveb", "Save the ggplotly plot"),
  hr(),
  ## Plot outputs
  column(5, plotlyOutput("plot1", width = 600 , height = 350)),
  column(5, plotlyOutput("plot2", width = 600 , height = 350))
  

))