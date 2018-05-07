# Demo example - Adding 'select All' option to the selectinput using selectInput() and updateSelectInput()

library(shiny) # Load the required package

# vector with choices for select input
choices <- c("Select All", "choice 1", "choice 2", "choice 3")

######## ui code begins here #########
ui = fluidPage(
  h5("Demo example - Adding 'select All' option to the selectinput to select all the choices at once using updateSelectInput(). "),
  hr(),
  selectInput("myselect", "Select box", choices=choices, multiple = TRUE, selected = "choice 1"),
  verbatimTextOutput("selected") # to display the selected choices by user
)

##### server code begins here ##########
server = function (input, output, session) {
  observe({
    if("Select All" %in% input$myselect)
      selected_choices=choices[-1] # choose all the choices _except_ "Select All"
    else
      selected_choices=input$myselect # update the select input with choice selected by user
    updateSelectInput(session, "myselect", selected = selected_choices)
  })
  
  output$selected <- renderText({
    paste(input$myselect, collapse = ",")
  })
}

shinyApp(ui=ui, server=server)


