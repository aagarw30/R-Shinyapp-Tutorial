## Demo - Brushed points - An example use case
## Interactive plots
## how to remove outlier observation based on the datapoint selection by brush
## We will be using the mtcars dataset for demo sake

# Load required packages
## install the packages if not already before loading them
library(shiny)
library(ggplot2) # used to plot ggplot2 graphs

# UI Code begins here
 
ui <- fluidPage(
  h4("Demo - brushedPoints - Interactive plots - select data points in plot - return the rows of data that are selected by brush"),
  
  # brush argument will enable the brush, sends the data point information to the server side
  # at the server side the data points under the brush related information can be read through input$BRUSHID
  plotOutput(outputId = "boxplot", brush = "plot_brush_"), # brush ID is plot_brush, brush argument enables the brush
  
  fixedRow(
    # left side actual dataset and right side the rows for datapoints selected by brush
    # defined the width of each column and also some styling (bold & italics) using tags

    column(width= 5, tags$b(tags$i("Actual Dataset")),  tableOutput("data1")),
    column(width = 5, tags$b(tags$i("Updated Dataset")), tableOutput("data2"), offset = 2)
  )
  
  
  
)

# Server code begins here
server <- function(input, output) {
  
  ## using the mtcars dataset
  mtcars1 = mtcars
  mtcars1$cyl = as.factor(mtcars1$cyl)
  mt <- reactiveValues(data=mtcars1) # making the dataset reactiveValues so that any changes in mt$data later could be reflected throughout

  
  # Create boxplot object plotOutput function is expecting
  output$boxplot <- renderPlot({
    ggplot(mt$data, aes(cyl, mpg)) + geom_boxplot(outlier.colour = "red") + coord_flip()
    # outlier.colour = "red" makes the outlier points red in color
  })
  
  ## Returns the actual dataset
  output$data1 <- renderTable({
    mtcars1
  })
  
  ## Returns the updated state of the dataset
  output$data2 <- renderTable({
    mt$data # using the reactive object
  })

 
  # Observe function
  # listening to brushing event
  # input$plot_brush_ fetches the information (rows) corresponding to data points under the brush
  # using the reactive object mt$data so that any changes done on it reflects to other reactive functions where it is used
    observe({
    df = brushedPoints(mt$data, brush = input$plot_brush_, allRows = TRUE) 
    mt$data = df[df$selected_== FALSE,  ] ## Taking only those data points where the selected_ value is FALSE (alternatively ignoring rows with selected_ = TRUE status)

    
  })
  
}

# Create a Shiny app object
shinyApp(ui = ui, server = server)