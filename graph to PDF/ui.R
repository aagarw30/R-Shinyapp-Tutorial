library(shiny)
shinyUI(fluidPage(
  titlePanel("Download PDF with multi plots in Shiny - an example"),
  sidebarLayout(
    sidebarPanel(
      downloadButton(outputId = "down", label = "Download the plot")
      ),
    mainPanel()
  )
  
))