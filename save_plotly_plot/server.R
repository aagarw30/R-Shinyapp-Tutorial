## Save the code file to working directory

## Load the required packages
library(shiny)
library(ggplot2)
library(plotly) # for plotly graphs
library(webshot) # for export function to work. If not installed, will throw an error saying webshot package needed
# webshot package can be installed as follows
# install.packages("webshot", dependencies = TRUE)
# Set your working directory before running the code

# Supress the warning you might see in the console. Those can be safely ignored.
# options(warn =-1)

# Read the data 
# data.csv is in the working directory
data = read.csv("data.csv")

shinyServer(function(input,output, session)({
  # first select input
  output$selects1 <- renderUI({
    selectInput("select1", "select variable1", choices=names(data), selected = "x")
    
  })
  
  # second select input
  output$selects2 <- renderUI({
    selectInput("select2", "select variable2", choices=names(data), selected = "y")
    
  })
  
 ## reactive function for plotly plot
  plot_p <- reactive({
    if(is.null(input$select1) || is.null(input$select2))
      return()
    else
    {
      p = plot_ly(data, x = ~get(input$select1), y = ~get(input$select2), mode = 'markers', type = 'scatter') %>%
        layout(title = "Plotly Scatter")
      return(p)
      
    }


  })

  ## reactive function for ggplotly
  plot_gg <- reactive({
    if(is.null(input$select1) || is.null(input$select2))
      return()
    else
    {
      g <- ggplot(data, aes(x = get(input$select1), y = get(input$select2))) + geom_point() + ggtitle("ggplotly Scatter")
      gg <- ggplotly(g) # ggplot can be converted yo plotly object using ggplotly function
      return(gg)
    }

  })

   ## Render plotly plot for output
  output$plot1 <- renderPlotly({
      if(is.null(plot_p())) return()
    plot_p()
  })

  ## Render ggplotly for output
  output$plot2 <- renderPlotly({
      if(is.null(plot_gg())) return()
    plot_gg()
    
    
  })

  # Event Handler for save button - Plotly. Save on click of button
  observeEvent(input$savea, {
    filename = paste("imagep", input$format, sep=".")
    export(plot_p(), file.path(getwd(), filename))
  })

  # Event Handler for save button - gglotly. Save on click of button
  observeEvent(input$saveb, {
    filename = paste("imagegg", input$format, sep=".")
    export(plot_gg(), file.path(getwd(), filename))
  })
  
  
  ################################### Alternate method ########################################
  #################### using observe within the render function itself #########################
  ####### With this no need to use the reactive functions in addition to render function ########
  
  
  # ## Render plotly plot for output
  # output$plot1 <- renderPlotly({
  #   p = plot_ly(data, x = ~get(input$select1), y = ~get(input$select2), mode = 'markers', type = 'scatter') %>% 
  #     layout(title = "Plotly Scatter")
  #   
  #   observeEvent(input$savea, {
  #     filename = paste("imagep1", input$format, sep=".")
  #     export(p, file.path(getwd(), filename))
  #   })
  #   
  #   return(p)
  # })
  # 
  # ## Render ggplotly for output
  # output$plot2 <- renderPlotly({
  #   g <- ggplot(data, aes(x = get(input$select1), y = get(input$select2))) + geom_point() + ggtitle("ggplotly Scatter")
  #   gg <- ggplotly(g) # ggplot can be converted yo plotly object using ggplotly function
  #   
  #   observeEvent(input$saveb, {
  #     filename = paste("imagegg2", input$format, sep=".")
  #     export(gg, file.path(getwd(), filename))
  #   })
  #   
  #   return(gg)
  #   
  #   
  # })
  
  
}))