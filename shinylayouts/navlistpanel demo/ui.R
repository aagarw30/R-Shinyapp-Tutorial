library(shiny)
library(datasets)

shinyUI(fluidPage(
  
  ## Title and headings
  titlePanel("Demo navlist panel navigation layout in shiny"),
  h5(
"'navlistPanel' gives ability to have tab like pages. 
It is kind of sidebar Panel but with tab like navigation through tab links on left and corresponding pages on right side. 
Helpful in cases when the tabsets at top of page gets cluttered with multiple pages.
    "
  ),
  
## Beginning of navlistPanel
  navlistPanel(
    widths = c(2, 10),
    "Data", 
    tabPanel("About", h3("This is the first tab or page")),
    tabPanel("Data Table",
             tableOutput("table1"),
             h3("This is the first tab or page")),
    tabPanel("Data Summary", verbatimTextOutput("summary1"))
    ,
    "Plots",
    tabPanel(title = "Scatter Plot", h3("Can have widgets and plots")), 
    tabPanel(title = "Histogram",
             sliderInput(
               "n",
               "Breaks",
               min = 5,
               value = 15,
               max = 25
             ),
             plotOutput("plot"))


    )))