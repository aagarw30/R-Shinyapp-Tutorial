shinyServer(function(input, output){
  
  colm = reactive({
    as.numeric(input$var)
  }) 
  output$myhist = renderPlot(
    {
      hist(iris[,colm()], breaks = seq(0,max(iris[,colm()], l= input$bins+1)),col =input$color, main ="Histogram of irish dataset", xlab = names(iris[colm()]))
    }
  )
  
  output$down <- downloadHandler(
    filename =  function() {
      paste("iris", input$type, sep=".") # replace input$var3 by input$type ty Abi
    },
    # content is a function with argument file. content writes the plot to the device
    content = function(file) {
      if(input$type == "png") # replace input$var3 by input$type ty Abi
        png(file) # open the png device
      else
        pdf(file) # open the pdf device
      hist(colm()) # draw the plot
      dev.off()  # turn the device off
      
    } 
  )
  
  
  
}) 