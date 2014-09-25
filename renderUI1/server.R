library(shiny) # load the shiny package
library(ggplot2) # load the gglpot2 package if ploting using ggplot

# beginning of the shiny server function
shinyServer(function(output, input)({
  
  # The following reactive function would return the column variable names corresponding to the dataset selected by the user.
  var <- reactive({
    switch(input$data1,
           "iris" = names(iris),
           "mtcars" = names(mtcars),
           "trees" = names(trees)
           )
  })
  
  # vx and vy are the output variable from renderUI containing the list of variable names in a drop down/selectInput UI widget
  # renderUI is used in server side and is used along with uiOutput in the ui.r
  # uiOuput is used in ui.R to display the selectInput widget dynamically using the output variable vx & vy
  # using vx and vy in the ui.R we will dynamically create the drop down with the column names based on the dataset selected by the user

  output$vx <- renderUI({
selectInput("variablex", "Select the First (X) variable", choices = var())
  })
  
  output$vy <- renderUI({
selectInput("variabley", "Select the Second (Y) variable", choices = var())
  })

# renderPlot is used to plot the ggplot and the plot output will be stored in the output variable p which could be used in ui.r to display the plot
  output$p <- renderPlot({

    attach(get(input$data1))
    plot(x= get(input$variablex), y= get(input$variabley), xlab=input$variablex, ylab=input$variabley)
    
    
    
    # If ggplot needs to de drawn the following could also be used instead of the plot () function
    # ggplot(get(input$data1), aes_string(input$variablex,input$variabley)) + geom_point() 
    # OR alternatively the following could also be used
    # ggplot(get(input$data1), aes(x=get(input$variablex), y=get(input$variabley)), environment = environment()) + geom_point() 

  })
  
}))
