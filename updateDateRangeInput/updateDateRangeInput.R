# Demo  updateDateRangeInput() - An example

###### Load required packages ##########
library('shiny') #allows for the shiny app to be used


############ Ui code begins here ################
ui<-fluidPage(
  fluidRow(
    h5("Demo example - updateDateRangeInput() - reset dates"),
    hr(),
    actionButton(inputId = "reset", label = "Reset Date"),
    dateRangeInput(inputId = "date", label="Select Date Range", 
                   start = Sys.Date(), # Set the initial Start Date 
                   end = Sys.Date(),  # Set the initial End Date
                   min = Sys.Date()-10, 
                   max = Sys.Date()+10)
  ))


######### server code begins here ##############
server<-function(input,output,session)
{
  ## Observe
  ## Sys.Date was the initial date in the range
  ## Change the logic based on your needs
  observeEvent(input$reset, {
    updateDateRangeInput(session, inputId = "date", start = Sys.Date(), end = Sys.Date())
  })
}

shinyApp(ui=ui, server=server)