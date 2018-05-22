# Load the required packages
library(shiny)
library(shinydashboard)

## Introducing the following functions
## infoBoxOutput() -> to display the rendered output  in the dashboardbody
## renderInfoBox() -> to render the  info box
## infoBox() -> to create the info box

# Generate 50 random numbers
s = sample(100:500, 50)


shinyServer(function(input, output, session){
  
# First fluid row and first infoBox  
 output$min_ <- renderInfoBox({
   infoBox(title = "Minm", 
           value = min(s),
           subtitle = "minimum value in dataset",
           fill = TRUE) 
   
 })
 
# First fluid row and second infoBox
 output$max_ <- renderInfoBox({
   infoBox(title = "Maxm", 
           value = max(s),
           subtitle = "maximum value in dataset", fill = T, color = "yellow") 
   
 })
 
# First fluid row and third infoBox
 output$sd_ <- renderInfoBox({
   infoBox(title = "SD", 
           value = round(sd(s), 2),
           subtitle = "Standard Deviation", icon("arrow-up")) 
   
 })

# First fluid row and fourth infoBox
 output$mean_ <- renderInfoBox({
   infoBox(title = "Mean", 
           value = mean(s),
           subtitle = "Mean of dataset values",
           icon=icon("angle-double-right")) 
   
 })
 
# second fluid row and infoBox
 output$median_ <- renderInfoBox({
   infoBox(title = tags$b("Median"), 
           value = median(s),
           subtitle= tags$i("Median of dataset"),
           icon=icon("angle-double-right")) 
   
 })
 
# 3rd fluid row and infoBox
  output$inline <- renderInfoBox({
    infoBox(title = "Inline CSS", value = "Adjusted width and height")
  })
 
  
}
)