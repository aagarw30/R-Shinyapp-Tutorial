# Load the required packages
# Demo dateRangeInput with data from CSV file

library(shiny)
# Set the working directory
# Ensure that dates.csv in the working directory
# Read the dates from CSV file
# load the data
dates = read.csv("dates.csv", header = TRUE, stringsAsFactors = FALSE)
# str(dates)
## Expense.Date column variable is read by R as strings with month,date and time

## Convert the Expense.Date column variable from string type to Date format. Also, dropping the time stamp.
dates$Expense.Date = as.Date(dates$Expense.Date, format="%m/%d %M:%S") # convert to date format
# this will also drop the time as we do not need the time component

# str(dates)

# ------------------------->  UI code begins here
ui <- fluidPage(
  h5("R Shiny demo - dateRangeInput() using data from a csv file"),
  hr(),
  
  dateRangeInput(
    inputId = "daterange",
    label = "Select the date range",
    start = min(dates$Expense.Date), # The initial start date. Either a Date object, or a string in yyyy-mm-dd format
    end = max(dates$Expense.Date), # The initial end date. Either a Date object, or a string in yyyy-mm-dd format 
    min = min(dates$Expense.Date), # The minimum allowed date. Either a Date object, or a string in yyyy-mm-dd format.
    max = max(dates$Expense.Date), # The maximum allowed date. Either a Date object, or a string in yyyy-mm-dd format.
    format = "yyyy/mm/dd",  # The format of the date to display in the browser. try "mm/dd/yy"  
    separator = "-" # String to display between the start and end input boxes. try "to"
  ),
  textOutput("startdate"),
  textOutput("enddate"),
  textOutput("range"),
  tableOutput("subdata")
  
)

# -------------------------> Server code begins here
server <- function(input, output, session) {
  
  # returns the start date selected by the user
  output$startdate <- renderText({
    as.character(input$daterange[1])  # convert to character type OR
    # paste("Start Date = ",input$daterange[1])
  })
  
  # returns the end date selected by the user
  output$enddate <- renderText({
    as.character(input$daterange[2]) # End date selected by the user. Converted to character type OR
    # paste("End Date = ",input$daterange[2])
  })
  
  
  # returns the text showing the date range selected by the user
  output$range <- renderText({
    paste("Selected date range is ", input$daterange[1], "to", input$daterange[2]) 
    
  })
  
  
  # returns the status information based on selected date
  output$subdata <- renderTable({
    # subsetting using the dates selected by the user
    s = subset(dates, dates$Expense.Date>=input$daterange[1] &  dates$Expense.Date<= input$daterange[2])
    table(s$status) # to get the counts for status for selected date range
    
     })
  
}

shinyApp(ui, server)
