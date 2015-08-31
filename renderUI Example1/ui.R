library(shiny)

shinyUI(fluidPage(
  titlePanel("Dynamic user interface - RenderUI"),
  sidebarLayout(
    sidebarPanel(
      
      # select input with the list of datasets
      selectInput(inputId = "data1", label = "Select the Dataset of your choice", choices = c("iris","mtcars","trees")),
      br(),
      helpText("The following selectInput drop down choices are dynamically populated based on the dataset selected by the user above"),
      br(),
      uiOutput("vx"), # vx is coming from renderUI in server.r
      br(),
      br(),
      uiOutput("vy") # vy is coming from renderUI in server.r

      ),
    mainPanel(
      plotOutput("p")
      )
    
    )
 ))
