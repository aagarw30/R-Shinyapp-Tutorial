# Demo - operations on multiple files uploaded
# row bind dataset with multiple file uploaded
# assumption that the column variables are same

library(shiny)
shinyUI(fluidPage(
  titlePanel("Demo - File Input - Upload, access and perform operation on multiple files"),
  sidebarLayout(
    sidebarPanel(
      fileInput("file","Upload the file", multiple = T), # fileinput() function is used to get the file upload contorl option
      helpText("Default max. file size is 5MB"),
      helpText("Select the read.table parameters below"),
      checkboxInput(inputId = 'header', label = 'Header', value = TRUE),
      checkboxInput(inputId = "stringAsFactors", "stringAsFactors", FALSE),
      radioButtons(inputId = 'sep', label = 'Separator', choices = c("Comma" = "," , "Semicolon" = ";", "Tab"= "\t", "Space"= " "), selected = ','),
      uiOutput("selectfile")
      ),
    mainPanel(
      uiOutput("tb") # tab panel display
      
    )
    
  )
))
