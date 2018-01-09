library(shiny)

shinyUI(fluidPage(
  titlePanel("Demostration of the selectInput UI widget in shiny"),
  sidebarLayout(
    sidebarPanel(
      selectInput("statenames", "Select the state", c("California", "Florida", "Texas","New York", "Arizona"), selected = "Texas")
      ),
    mainPanel(
      textOutput("state")
      )
  )))