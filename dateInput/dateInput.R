# Demo dateInput()

# Load required packages
library(shiny)

ui <- fluidPage(
  h5("R Shiny Demo - dateInput widget"),
  hr(),
  
  # add a date input widget
  dateInput("date",  # Input ID
            
            label="Date Input", # label
            # use below to show the calendar icon inline
            # label = HTML("<i class='glyphicon glyphicon-calendar'></i> Date Input"),
            
            value = Sys.Date(), # date value that shows up initially
            
            min = Sys.Date() - 10,  # set the minimin date
            
            max = Sys.Date() + 10, # set the maximum date
            
            width = "100px", # set the width of widget
            
            format="mm/dd/yy"), # set the format (default is yyyy-mm-dd)
  textOutput("seldate")
)



server <- function(input, output, session) {

  # Render text function to output the date from server to ui
  output$seldate <- renderText ({
    paste("Selected Date is ", input$date)
    # input$date # this will not output the date in correct format. 
    # Convert to character before using in render function as.character(input$date)
    # as.character(input$date) # to exclusively convert date to character for printing to retain the date format
    # match the date format to the format in input date widget. Use the format() to change the date format
    # paste("Selected Date is ", format(input$date, "%m/%d/%y"))
    

  })
  
}


shinyApp(ui, server)