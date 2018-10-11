## A demo example of adding an animated CSS spinner/loader while R plot is re-calculated/re-loaded
## Reproducible example
## Load the required packages
library(shiny) # for shiny components
library(ggplot2) # for plotly chart
library(shinycssloaders)  # for animated CSS loader

## ui component begins here
ui <- fluidPage(
  h5("A demo example of adding an animated CSS spinner/loader while R plot is loading"),
  sliderInput(inputId = "bw", label = "Enter the binwidth", min=50, max=500 , value=100 , step=50),
  withSpinner(plotOutput("plot1")) # withSpinner is used to add spinner
) 

## server component begins here
server <- function(input, output, session) {
  
  ## Rendering a ggplot histogram from diamonds dataset 
  output$plot1 <- renderPlot({
    Sys.sleep(2) # adding intentional delay of 2 seconds for demo sake. 
    ggplot(diamonds) + 
      geom_histogram(binwidth = input$bw, aes(x=diamonds$price)) + 
      ggtitle("Diamond Price Distribution") + 
      xlab(paste("Diamond Price U$ - Binwidth", input$bw, sep = "")) + 
      ylab("Frequency") + 
      theme_minimal()
  })
  
}

shinyApp(ui, server)