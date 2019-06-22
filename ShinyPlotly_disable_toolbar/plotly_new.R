## How to disable the plotly tool bar from right top corner
## We will be using the pressure dataset for sake of demo

## Single file shiny app

## install the packages if not already
## Load the required libraries

library(shiny) # for shiny functions
library(plotly) # for interactive plot and functions from R plotly

## ui component starts here
ui <- fluidPage(
  h3("R Plotly demo - disabling the Plolty tool bar"), ## heading
  br(), ## just for line break/spacing
  plotlyOutput("myplot") ## Plotly output object
  
)

## server component starts here
server <- function(input, output, session) {
  
  ## Render plotly section
  
  output$myplot <- renderPlotly(
    # plotly plot creation with required styling
    plot_ly(data = pressure, x=~temperature, y=~pressure, type = "scatter", 
            mode=c("line", "points"), marker = list(color = "#737373", size = 10),
            line = list(width = 2, color="red"),
            hoverinfo = "text", 
            text = paste("Temperature ", pressure$temperature, "<br>", "Pressure ", pressure$pressure)) %>% 
      layout(title = "Pressure vs Temperature Plotly",
             xaxis = list(title="Temperature", range=c(0,400), showgrid=F), 
             yaxis=list(title="Pressure", showgrid=F, titlefont=list(family="Arial", size=18, color="brown")),
             annotations =    list(xref = "Temperature", yref = "Pressure", x = 350, y = 100, align = "right",
                                   text = "Temperature vs Pressure <br> Source : Pressure dataset ", 
                                   showarrow = F, ax = 0, ay = 0)
             
      ) 
    ## below code helps disable the tool bar, remove if not needed
      %>%
      config(displayModeBar=FALSE) # disables the tool bar
    
    
  )
  
}

## Shiny App Object
shinyApp(ui, server)