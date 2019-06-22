## Demo on how to add a modal (pop-up windows) using the shinyBS package created by Eric Bailey
## Single file shiny app
## Load the required packages
## If above packages are not already installed, install them before loading
library(shiny) # basic shiny related functions and features
library(shinydashboard) # for dashboard related functions and features
library(shinyBS) # for modal 
library(shinyjs) # easy javascript functionalities with shiny
library(DT) # for interactive data tables
library(ggplot2) # for ggplot plot
library(shinycssloaders) # for spinner while data / plot loads 

### ui code begins below with a dashboard page
## In the sidebar having a menu item for data input and dataset/plot view

ui <- dashboardPage(
  
  # DashboardHeader
  dashboardHeader(title = "Diamonds Explorer - Modal demo using shinyBS package" , titleWidth = 600),
  
  # Dashboard Sidebar section
  dashboardSidebar(
    sidebarMenu(
      menuItem("Data", tabName = "tab1", icon = icon("th"))
    )
  ),
  
  ## Dasboard body section
  dashboardBody(
    # add a call to useshinyjs
    shinyjs::useShinyjs(),
    
    ## add the tab page corresponding to the menu item in sidebar
    tabItems(
      tabItem(
        tabName = "tab1", 
        
        ## Box 
        box(
          width = 5,
          title = "Input Data", status = "primary", solidHeader = TRUE, 
          fileInput("file", "Upload Data"),
          
          ## View data action button hidden initially until the dataset is loaded
          shinyjs::hidden(
            div(id = "data_b",style="display:inline-block",
                actionButton("data",  "View Data", icon=icon('table'))
            )),
          
          ## View plot action button hidden initially until the dataset is loaded
          shinyjs::hidden(
            div(id = "plot_b", style="display:inline-block",
                actionButton("plot",  "View Plot", icon=icon("bar-chart"))
            ))
          
          ))),
    
    ## Shiny BS Modal to display the dataset inside a modal
    ## A spinner is also added
    bsModal(id="dataset", title = "Diamonds Dataset", trigger = "data", size="large",
            withSpinner(dataTableOutput("data_set"))),
    
    ## Shiny BS Modal to display the plot inside a modal
    ## A spinner is also added
    bsModal(id= "Plot", title = "Plot", trigger = "plot", size="large",
            sliderInput(inputId = "b", label = "Select the bin width value" , min = 50  , max = 500, value = 100),
            br(),
            withSpinner(plotOutput("plot_gg"))
            
            
    )))

### server code begins below
server <- function(input, output) {
  
  ## Show the controls (action button for data) only when file is uploaded
  observeEvent(input$file,
               shinyjs::show("data_b"))
  
  ## Show the controls (action button for plots) only when file is uploaded
  observeEvent(input$file,
               shinyjs::show("plot_b"))
  
  
  
  ## Reactive function to read data from uploaded CSV file
  ## Below code can be customized based on the app / user needs and layout/type of the file
  data_uploaded <- reactive({
    file1 <- input$file
    if(is.null(file1)){return()} 
    read.table(file=file1$datapath, sep=",", header = T, stringsAsFactors = T)
    
  })
  
  ## Rendering uploaded data to a datatable
  output$data_set <- renderDataTable(
    data_uploaded(),options=list(scrollX = TRUE))
  
  ## Create and render ggplot
  ## Below code can be customized based on the app / user needs for plot
  output$plot_gg <- renderPlot(
    ## plotting histogram of diamonds price
    ggplot(data=data_uploaded()) + 
      geom_histogram(binwidth=input$b, aes(x=price)) + 
      ggtitle("Diamond Price Distribution") + 
      xlab(paste("Diamond Price & binwidth as ", input$b)) + 
      ylab("Frequency") + 
      theme_minimal() + xlim(0,2500)
  )
  
}

## creating the shinyApp object
shinyApp(ui=ui, server = server)