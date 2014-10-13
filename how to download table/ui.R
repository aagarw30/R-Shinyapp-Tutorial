library(shiny)
shinyUI(fluidPage(
  titlePanel(h4('Demonstration of file download using downloadbutton() and downloadHandler()', align="center")),
  sidebarLayout(
    sidebarPanel(
      selectInput("dataset", "Select the dataset", choices = c("iris", "mtcars", "trees")),
      br(),
      helpText(" Select the download format"),
      radioButtons("type", "Format type:",
                   choices = c("Excel (CSV)", "Text (TSV)","Text (Space Separated)", "Doc")),
      br(),
      helpText(" Click on the download button to download the dataset observations"),
      downloadButton('downloadData', 'Download')
      
    ),
    mainPanel(
      
      tableOutput('table')
    )
  )
))