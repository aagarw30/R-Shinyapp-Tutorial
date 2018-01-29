library(shiny)
library(ggplot2)

dataset <- diamonds

shinyUI(fluidPage(
  
  titlePanel(title = "Diamond Explorer"),
  h4("Demo Grid layout in R Shiny. Widgets into different rows and columns. Introducing fluidRow() & column() functions "),
  h5("The first parameter to the column() function is it's width (out of a total of 12 columns).
It's also possible to offset the position of columns to achieve more precise control
over the location of UI elements. You can move columns to the right by adding the offset parameter
to the column() function.
Each unit of offset increases the left-margin of a column by a whole column."),
  h5("To create rows within the grid you use the fluidRow() function; to create columns within rows you use the column() function."),
  hr(),
  ## Start of the grid
  ## Initializing the row
  fluidRow(
    # column allocation for widgets
    column(4,
           
           sliderInput('sampleSize', 'Sample Size', 
                       min=1, max=nrow(dataset), value=min(1000, nrow(dataset)), 
                       step=500, round=0),
           br(),
           checkboxInput('jitter', 'Jitter'),
           checkboxInput('smooth', 'Smooth')
    ),
    column(4,
           selectInput('x', 'X', names(dataset)),
           selectInput('y', 'Y', names(dataset), names(dataset)[[2]]),
           selectInput('color', 'Color', c('None', names(dataset)))
    ),
    column(4,
           selectInput('facet_row', 'Facet Row', c(None='.', names(dataset))),
           selectInput('facet_col', 'Facet Column', c(None='.', names(dataset)))
    )
  ), ## End of the fluidRow and grid
  hr(),
plotOutput("plot")
))