## Select All/None option for choices using updateSelectInput() & checkboxInput()
library(shiny)

# vector with column variable names from mtcars dataset
myChoices = names(mtcars)

########## ui code begins here ###########
ui = fluidPage(
  h5("Demo example - 'Select All/None' option for choices using updateSelectInput() & checkboxInput()"),
  hr(),
  
  selectInput('mtcars', label="mtcars column variables", choices=myChoices, multiple = TRUE),
  checkboxInput('all', 'Select All/None', value = TRUE), # gives user option to select all or none for choices
  verbatimTextOutput("selected") # to display the selected choices by user
)

####### server code begns here ############
server = function(input, output, session) {
  
  observe({
    # if input$all is TRUE (basically a SELECT ALL option), all choices will be selected
    # if input$all is FALSE (basically a NONE option), none of the choices will be selected
    
    updateSelectInput(
      session, 'mtcars', choices = myChoices,
      selected = if(input$all) myChoices
      
      
    )
    
  })
  
  # Display the choices selected by the user
  output$selected <- renderText({
    paste(input$mtcars, collapse = ",")
  })
}

shinyApp(ui=ui, server=server)