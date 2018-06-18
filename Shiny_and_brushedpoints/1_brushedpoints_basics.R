## Demo - Brushed points - Basics
## Interactive plots
## how to return rows for the data points under the brush
## We will be using the mtcars dataset for demo sake

# Load required packages
## install the packages if not already before loading them
library(shiny)
library(ggplot2) # used to plot ggplot2 graphs

## ui code starts here ## 
ui <- fluidPage(
  h4("Demo - brushedPoints - Interactive plots - select data points in plot - return the rows of data that are selected by brush"),
  
# brush argument will enable the brush, sends the data point information to the server side
# at the server side the data points under the brush related information can be read through input$BRUSHID
  plotOutput(outputId = "graph", brush = "plot_brush"), # brush ID is plot_brush

  fluidRow(
    # left side actual dataset and right side the rows for datapoints selected by brush
    # defined the width of each column and also some styling (bold & italics) using tags
    column(width = 5, tags$b(tags$i("Actual Dataset")), tableOutput("data")),
    column(width=5, tags$b(tags$i("Rows corresponding to datapoints under brush")),  tableOutput("data_brush"), offset = 2)
    
  )
  
  
)


### server side code begins here ###
server <- function(input, output, session) {

  
  # scatter plot the mtcars dataset - mpg vs hp
  output$graph <- renderPlot({
    ggplot(data = mtcars, aes(x = mpg, y = hp)) +
      geom_point()
  })
  
    
  # To display the mtcars dataset on the left side in the app
  output$data <- renderTable({
    mtcars
  })
  
  
  # brushedPoints returns the row of data under the brush
  # brush information comes from ui to server using brushId and can be accessed using input$brushId

 output$data_brush <-  renderTable({
   n = nrow(brushedPoints(mtcars, brush = input$plot_brush)) # row count will be 0 when no selection made by the brush
   if(n==0)  
     return()
   else
     brushedPoints(mtcars, brush = input$plot_brush) # return rows
   # argument allRows = TRUE can also be used
   ## It will add another column (selected_) to the actual dataset. True indicates that data point 
   # corresponding to that row was under the brush. False means data corresponding to that row wasn't selected by brush

    
  })
}

shinyApp(ui, server)

