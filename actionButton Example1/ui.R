library(shiny)
shinyUI(fluidPage(
  titlePanel("A very simple demonstration of actionButton and isolate in shiny"),
  sidebarLayout(
    sidebarPanel(
      textInput("text1", "Enter your first name"),
      textInput("text2", "Enter your last name"),
      actionButton("action", "Update last name!"),
      p("Click on the Update button to update and display the last name. Here the reactiveness of the input widget is controlled by actionButton on the client and isolate on the server side")
      ),
    mainPanel(
      textOutput("txt1"),
      textOutput("txt2")
      )
    )
))