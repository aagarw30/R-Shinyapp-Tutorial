library(shiny)

shinyServer(function(output,input, session){
  
## Creating a dataset with 3 column variables. 

  a = sample(1:10, replace=TRUE)
  b = sample(1:10, replace= TRUE)
  c = a + b
  df = data.frame(a=a, b=b, c=c)
  

  # display the data table 
  output$table <- renderRHandsontable({
   rhandsontable(df)
  
  })
  

  observeEvent(
      input$table$changes$changes, # observe if any changes to the cells of the rhandontable
    {
      
      xi=input$table$changes$changes[[1]][[1]] # fetches the row index of the cell where change is made 
      yi=input$table$changes$changes[[1]][[2]] # fetches the column index of the cell where change is made
      old = input$table$changes$changes[[1]][[3]] # fecthes the old values of the cell
      new = input$table$changes$changes[[1]][[4]] # fecthes the new value of the cell


      # display the change event call back information
      output$changeinfo <- renderPrint({

list(paste("Row index of cell which is changed", xi),
          paste("Column index of cell which is changed", yi),
          paste("Old value of the cell", old),
          paste("New value of the cell", new))
      })
    }
  )
  


  
}
)