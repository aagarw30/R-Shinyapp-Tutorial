## Date Range Input minimal reproducible example
## Display the dateRangeInput widget & subset data based on the date range selected
library(shiny)

# create sample data frame with dates
set.seed(121)
mydate = seq(Sys.Date(), by = "day", length.out = 30)
mystatus = sample(c("Completed", "Cancelled"),30, replace=TRUE)
mydf = data.frame(Date=mydate, Status=mystatus)
# str(mydf)
# head(mydf)
# summary(mydf)

# UI code begins here
ui <- fluidPage(
  h5("R Shiny demo - dateRangeInput"),
  hr(),
  # Styling the dateRangeInput
  #  tags$style('.input-sm {font-size: 15px; } label {font-weight: 500; margin-bottom: 1px; }'),
  # margin-bottom for spacing between widget and the label. Other parameters are self explanatory
  
  dateRangeInput(
    inputId = "daterange",
    label = "Select the date range",
    start = min(mydf$Date), # The initial start date. Either a Date object, or a string in yyyy-mm-dd format
    end = max(mydf$Date), # The initial end date. Either a Date object, or a string in yyyy-mm-dd format 
    min = min(mydf$Date), # The minimum allowed date. Either a Date object, or a string in yyyy-mm-dd format.
    max = max(mydf$Date), # The maximum allowed date. Either a Date object, or a string in yyyy-mm-dd format.
    format = "yyyy/mm/dd",  # The format of the date to display in the browser. try "mm/dd/yy"  
    separator = "to" # String to display between the start and end input boxes. try "to"
  ),
  textOutput("startdate"), # display the start date
  textOutput("enddate"), # display the end date
  textOutput("range"), # display the range
  tableOutput("subdata") # display the table of status from subset data
  
)

server <- function(input, output, session) {
  
  # returns the start date selected by the user
  output$startdate <- renderText({
    as.character(input$daterange[1]) # start date selected by user
  })
  
  # returns the end date selected by the user
  output$enddate <- renderText({
    as.character(input$daterange[2]) # End date selected by the user
  })
  
  
  # returns the text showing the date range selected by the user
  output$range <- renderText({
    paste("Selected date range is ", input$daterange[1], "to", input$daterange[2]) 
  })
  
  
  # returns the status count information based on selected date
  output$subdata <- renderTable({
   # subsetting using the dates selected by the user
   s = subset(mydf, mydf$Date>= input$daterange[1] & mydf$Date<= input$daterange[2])
   table(s$Status) # to get the counts on status for selected date range
    
  })
  
}

shinyApp(ui, server)
