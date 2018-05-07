## Select All/None option for choices using checkboxInput() and updateCheckboxGroupInput()
library(shiny)
# vector with column variable names from mtcars dataset
myChoices = names(mtcars)

########## ui code begins here ###########
ui = fluidPage(
  h5("Demo example - 'Select All/None' option for choices using updateCheckboxGroupInput()"),
  hr(),
  
  # for selectAll/None toggle checkbox
  checkboxInput('all', 'Select All/None', value = TRUE),
  
  # for the variables names from mtcars dataset
  checkboxGroupInput('mtcars', 'mtcars column variables', myChoices),
  
  verbatimTextOutput("selected") # to display the selected choices by user
  
)

####### server code begns here ############
server = function(input, output, session) {
  
  observe({
    
    # if input$all is TRUE (basically a SELECT ALL option), all choices will be selected
    # if input$all is FALSE (basically a NONE option), none of the choices will be selected
    
    updateCheckboxGroupInput(
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