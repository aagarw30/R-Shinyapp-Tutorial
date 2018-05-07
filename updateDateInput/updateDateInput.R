# Demo  updateDateInput() - An example

######  Load required packages ###### 
library(shiny) 


############ ui code begins here ############
ui <- fluidPage(
  h5("Demo example - updateDateInput() - Update the date and reset it"),
  hr(),
  
  # Add an action button to update the date
  actionButton(inputId = "button", "Date + 7"),
  
  # Add an action button to reset the date
  actionButton(inputId = "reset", "Reset"),
  
  # add a date input widget
  dateInput("inDate", "Input date", value = Sys.Date())
  
)


####### Server code begins here ##########
server <- function(input, output, session) {
  
  # Event Handler -  Observe the click of update date button
  observeEvent(input$button,
               updateDateInput(session,
                               "inDate",
                               value = input$inDate + 7))
  
  # Event Handler -  Observe the click of reset button
  observeEvent(input$reset,
               updateDateInput(session,
                               "inDate",
                               value = Sys.Date()))
}

shinyApp(ui, server)
  