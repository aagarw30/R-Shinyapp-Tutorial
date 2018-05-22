# Load the required packages
library(shiny)
library(shinydashboard)

##### Introducing the following functions ############
## valueBoxOutput() -> to display the rendered output  in the dashboardbody
## renderValueBox() -> to render the  value box
## valueBox() -> to create the value box

# Generate 50 random numbers
s = sample(100:500, 50)


shinyServer(function(input, output, session){
  
# 1st fluid Row & 1st value box  
 output$min_ <- renderValueBox({
   valueBox(
           value = min(s),
           subtitle = "minimum value in dataset") 

   
 })
 
 # 1st fluid Row & 2nd value box
 output$max_ <- renderValueBox({
   valueBox( 
           value = max(s),
           subtitle = "maximum value in dataset") 
   
 })
 
 # 1st fluid Row & 3rd value box
 output$sd_ <- renderValueBox({
   valueBox( 
           value = round(sd(s), 2),
           subtitle = "Standard Deviation", icon("arrow-up"),
           color = "yellow") 
   
 })
 
 # 1st fluid Row & 4th value box
 output$mean_ <- renderValueBox({
   valueBox(
           value = mean(s),
           subtitle = "Mean of dataset values",
           icon=icon("angle-double-right"),
           color="purple") 
   
 })
 
 # 2nd fluid row, 1st value box
 output$median_ <- renderValueBox({
   valueBox(
           value = median(s),
           subtitle= tags$i("Median of dataset"),
           icon=icon("angle-double-right")) 
   
 })
 
 # 2nd fluid row, 2nd value box
 output$orders_ <- renderValueBox({
   valueBox(10 * 2, "New Orders", icon = icon("credit-card"))
 })
 
 # 2nd fluid row, 3rd value box
 output$approved_ <- renderValueBox({
   valueBox(
     "80%", "Approval", icon = icon("thumbs-up", lib = "glyphicon"),
     color = "yellow"
   )
 })
 
 
 
}
)