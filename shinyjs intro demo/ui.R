library(shiny)
# install.packages("shinyjs")
library(shinyjs)


shinyUI(fluidPage(
  
  useShinyjs(), # tells shiny to be able to use the functions that come with shinyjs
  # when using shinyjs package we need to add the useShinyjs() in the beginning of the UI code
  
  
  titlePanel("shinyjs - hide, show, toggle, hidden, alert, delay, enable, disable elements in R Shiny"),
  h4("Add common javascript capabilities to shiny app without knowing javascript"),
  hr(),
  
  # div tag is used so that we can define the ID for heading
  tags$div(id="t", 
           style='color:green;', 
           list(h4("Hello and welcome to this demo! This is a welcome message. I will disappear in 60 seconds"),
                hr())),
  
  fluidRow(
    column(width = 3,            
           list(
             actionButton(inputId = "alert", label = "Click to alert")
             
           )
    ),
    
    column(width=3, style="outline-style: groove; outline-width: thin;",
           list(actionButton(inputId = "hides", label = "Hide Slider"),
                actionButton(inputId = "shows", label = "Show Slider"),
                
                sliderInput(inputId = "slider", label = "Slider", min = 0, max = 10, value = 5))
    ),
    
    column(width=3, 
           list(
             actionButton(inputId = "showh", label = "Show hidden text"),
             actionButton(inputId = "hideh", label = "Hide text"),
             
             br(),
             hidden(tags$div(id="txt", list(helpText("This is a help text.  You can hide me")))))
    # hidden is a shinyjs function
    # we are telling shiny that helpText should be in hidden state when app launches
    # Later we can change the state of helpText based on need in the server.r
           ),
    
    column(width=3, style="outline-style: groove; outline-width: thin;",
           list(actionButton("disable" , "Disable"),
                actionButton("enable" , "Enable"),
                sliderInput("able", "slider", min = 0, max = 10, value = 5))
    )
  ),
  fluidRow(  
    column(width=3, list(hr(), 
                         actionButton("button", "Click and toggle plot"),
                         plotOutput("plot")))
    
    
  )))