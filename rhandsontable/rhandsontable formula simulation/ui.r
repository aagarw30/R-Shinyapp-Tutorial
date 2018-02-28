# Demostration of rhandsontable()
# Load the shiny, plotly and rhandsontable packages.

library(shiny)
library(plotly)
library(rhandsontable)

shinyUI(fluidPage(h2("Demo -  'rhandsontable' package and a simple example app with Shiny"),
                  h4("# simulate formula in editable rhandson data table"),
               
fluidRow(column(4, rHandsontableOutput('table'), actionButton("saveBtn", "Save"), offset = 2),
column(4,plotlyOutput("plot") , offset = 2))
  
  ))

