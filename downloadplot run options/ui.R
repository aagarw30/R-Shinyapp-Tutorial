library(shiny)


shinyUI(
  fluidPage(
    titlePanel(title = h4('Demonstraion of renderplot', align='center')),
    sidebarLayout(
      sidebarPanel(
        selectInput('var', "Select the Variable", choices = c('Sepal.Length' =1 , 'sepal width' = 2, 'Petal Length' = 3 , 'Petal Width' = 4), selected = 1),
        br(),
        sliderInput('bins', 'Select the number of bins', min = 5, max = 25, value = 15),
        br(),
        radioButtons('color', 'Color of the bins', choices = c('Green', 'Red', 'Blue'), selected = 'Green'),
        br(),
        radioButtons('type', 'Choose the type', choices = list('png', 'pdf'), selected = 'png')
        
      ),
      mainPanel(
        plotOutput("myhist"),
        downloadButton('down', 'Download the Plot')
        
        
      )
    )
  )
)