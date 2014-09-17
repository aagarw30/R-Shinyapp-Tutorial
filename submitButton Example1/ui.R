library(shiny)
shinyUI(fluidPage(
  titlePanel("Demonstration of submitButton() in shiny"),
  sidebarLayout(
    sidebarPanel(
      textInput("text1", "Enter your first name"),
      textInput("text2", "Enter your last name"),
      submitButton("Update!"),
      p("Click on the Update button to display the first and last name entered by the user. Here the reactiveness of the input widget is controlled by submitButton")

),

    mainPanel(
      textOutput("txt1"),
      textOutput("txt2")
      )
    )
))