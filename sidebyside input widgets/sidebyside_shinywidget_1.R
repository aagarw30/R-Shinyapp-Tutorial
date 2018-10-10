## Demo side by side slider & select input widget

####### This is a single file R Shiny code #########
library(shiny)

ui <- fluidPage(
  ## Add few widgets
  ### the following widgets will appear as block
  sliderInput(inputId = "var1", label = "Variable A", min = 0, max = 100, step = 10, value = 20),
  sliderInput(inputId = "var2", label = "Variable B", min = 100, max = 500, step = 100, value = 50),
  selectInput(inputId = "var3", label = "Variable C", choices = names(mtcars)),
  hr(),
  
  ### Add few more widgets
  ### Below widgets with inline styling and wrapped within div tag
  ### div(style=" <<style parameters>> ", <<input widget>>)
  ### Adjust the style parameters such as display, padding, width, vertical align
  
  div(style="display:inline-block; vertical-align: top; padding-left: 30px; width:250px;",sliderInput(inputId = "var4", label = "Variable D", min = 0, max = 100, step = 10, value = 20)),
  div(style="display:inline-block; vertical-align: top; padding-left: 30px; width:250px;", sliderInput(inputId = "var5", label = "Variable E", min = 100, max = 500, step = 100, value = 50)),
  div(style="display:inline-block; vertical-align: top; padding-left: 30px; width:250px; padding-top: 5px;", selectInput(inputId = "var6", label = "Variable F", choices = names(mtcars))),
  div(style="display:inline-block; vertical-align: top; padding-left: 30px; width:250px; padding-top: 5px;", textInput("txt", "Enter Text")),
  div(style="display:inline-block; vertical-align: center; padding-left: 2px; padding-top: 30px;", actionButton(inputId = "button", "Go!"))
)


##### server code begins here 
server <- function(input, output, session) {
  
}


shinyApp(ui, server)