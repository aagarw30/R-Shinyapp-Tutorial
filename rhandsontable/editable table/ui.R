library(shiny)
# install.packages("rhandsontable") # install the package
library(rhandsontable) # load the package

shinyUI(fluidPage(
  fluidRow(
    titlePanel(title = "Demo rhandsontable & shiny - example app - editable data table"),
    h4("rhandsontable is an htmlwidget wrapper package based on the handsontable.js library created by Jonathan Owen. It produces a data grid with excel like appearance and features. "),
    h4("# how to create a rhandsontable object and use in shiny"),
    h4("# renderRHandsontable()"),
    h4("# rHandsontableOutput()"),
    hr(),
    column(4,
           helpText("non-editable table"),
           tableOutput("table1")),
    column(4,
           helpText("editable table"),
           rHandsontableOutput("table"),
           br(),
           actionButton("saveBtn","Save")) 
  )
  
))