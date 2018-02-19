library(shiny)
library(shinyjs)

shinyServer(function(input, output, session){
  
  
  delay(60000, hide("t")) # this will hide the text after given delay period in ms
  # hide is shinyjs function that hides the element, pass the element/widget ID as the argument
  
  observeEvent(input$alert,
               alert("This is an alert message. Thanks for watching this video"))
  # alert is shiny js function to throw an alert message
  
  observeEvent(input$showh,
               show("txt")) # show() is shiny js function, pass the element/widget ID as the argument
  
  observeEvent(input$hideh,
               hide("txt")) # hide() is shiny js function, pass the element/widget ID as the argument
  
  observeEvent(input$shows,
               show("slider")) # show() is a shinyjs function, pass the element/widget ID as the argument
  
  observeEvent(input$hides,
               hide("slider")) # hide() is a shinyjs function, pass the element/widget ID as the argument
  
  observeEvent(input$disable, disable("able")) # disable is shinyjs function, pass the element/widget ID as the argument
  
  observeEvent(input$enable, enable("able")) # enable is shinjs function, pass the element/widget ID as the argument
  
  # rendering the plot
  output$plot <- renderPlot({
    plot(mtcars$mpg)
  })
  
  observeEvent(input$button, {
    toggle("plot")  # toggle is a shinyjs function, pass the widget or input ID as the argument
  # this changes the state of the widget
    # if showing initially, after click toggle will hide the plot and vice-versa
    })
  

  
  
  
  
})