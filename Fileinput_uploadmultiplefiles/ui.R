library(shiny)
shinyUI(fluidPage(
  titlePanel("Demo - File Input - Upload multiple files"),
  sidebarLayout(
    sidebarPanel(
      fileInput("file","Upload the file", multiple = TRUE), # fileinput() function is used to get the file upload contorl option
      helpText("Default max. file size is 5MB"),
      helpText("Select the read.table parameters below"),
      checkboxInput(inputId = 'header', label = 'Header', value = TRUE),
      checkboxInput(inputId = "stringAsFactors", "stringAsFactors", FALSE),
      radioButtons(inputId = 'sep', label = 'Separator', choices = c(Comma=',',Semicolon=';',Tab='\t', Space=''), selected = ','),
      uiOutput("selectfile")
      ),
    mainPanel(
      uiOutput("tb")
      
    )
    
  )
))
