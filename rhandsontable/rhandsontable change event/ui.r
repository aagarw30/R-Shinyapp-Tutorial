# Demostration of rhandsontable() - change event
# Load the shiny and rhandsontable packages.

library(shiny)
library(rhandsontable)

shinyUI(fluidPage(
  titlePanel(title = "Demo rhandsontable & shiny - editable data table - cell change event demo"),
  h4("## cell change event"),
  h4("## how to fetch the row & column indices of the cell whose value is changed"),
  h4("## how to fetch the old and new values of the cell where change is made"),
  hr(),
  fluidRow(column(5, rHandsontableOutput("table"), offset = 1),column(5, verbatimTextOutput("changeinfo"), offset = 1))
  
  ))

