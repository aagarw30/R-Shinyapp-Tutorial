library(shiny)
shinyUI(fluidPage(
  titlePanel("Download base plot in Shiny - an example"),
  sidebarLayout(
   sidebarPanel(
      selectInput(inputId = "var1", label = "Select the X variable", choices = c("Sepal.Length" = 1, "Sepal.Width" = 2, "Petal.Length" = 3, "Petal.Width" = 4)),
      selectInput(inputId = "var2", label = "Select the Y variable", choices = c("Sepal.Length" = 1, "Sepal.Width" = 2, "Petal.Length" = 3, "Petal.Width" = 4), selected = 2),
      radioButtons(inputId = "var3", label = "Select the file type", choices = list("png", "pdf"))
),
    mainPanel(
      plotOutput("plot"),
      downloadButton(outputId = "down", label = "Download the plot")
      )
    )
  
  ))